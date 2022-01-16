from scripts.helpful_scripts import get_account
from brownie import SimpleCollectible

sample_token_uri = "https://ipfs.io/ipfs/Qmd9MCGtdVz2miNumBHDbvj8bigSgTwnr4SbyH6DNnpWdt?filename=0-PUG.json"
OPENSEA_URL = "https://testnets.opensea.io/assets/{}/{}"


def deploy_and_create():
    account = get_account()
    simpleCollectible = SimpleCollectible.deploy({"from": account})
    tx = simpleCollectible.createCollectible(sample_token_uri, {"from": account})
    tx.wait(1)
    print(
        f"Awesome! You can see your NFT at {OPENSEA_URL.format(simpleCollectible.address, simpleCollectible.tokenCounter() - 1)} "
    )
    return simpleCollectible


def main():
    deploy_and_create()
