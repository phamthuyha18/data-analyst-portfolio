import pandas as pd

df = pd.read_csv('D:\DA_project\Project_2\customer_journey.csv')

print(df.head())
print(df.shape)
print(df.columns.tolist())
print(df.dtypes)
print(df.isnull().sum())
print(df.duplicated().sum())
for col in ['PageType', 'DeviceType', 'ReferralSource']:
    print(f"  - Cột '{col}' có: {df[col].nunique()} giá trị duy nhất")
print(df.describe(include='all'))
session_count = df['PageType'].value_counts()

data_framing = pd.DataFrame({
    'Funnel Stage': session_count.index,
    'Session Count': session_count.values
}
)
initial_sessions = data_framing['Session Count'].iloc[0]

data_framing['Conversion Rate (%)'] = (data_framing['Session Count'] / initial_sessions * 100).round(1)
data_framing['Drop-off Rate'] = (100 - data_framing['Conversion Rate (%)']).round(1)

print(data_framing.to_string(index=False))