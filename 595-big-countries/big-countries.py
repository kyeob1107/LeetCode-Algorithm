import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    result_df = world[(world['area']>=3000000)|(world['population']>=25000000)]
    return result_df[['name','population','area']]
