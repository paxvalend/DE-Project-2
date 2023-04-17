#!python3.9

import os
import connection

import pandas as pd
import numpy as np

if __name__ == "__main__":
    
    #list path
    path = os.getcwd()
    path_query = path + '/sql/'

    #list filename
    file_query_1 = 'dml_query_1.sql'
    file_query_2 = 'dml_query_2.sql'

    #connection
    conn = connection.db_connect()
    cur = conn.cursor()

    #read data
    with open(path_query + file_query_1,'r') as file:
        query = file.read()
    cur.execute(query)
    data = cur.fetchall()
    df = pd.DataFrame(data, columns=['order','customer','city','date'])

    #transformation
    df['date'] = pd.to_datetime(df['date'])
    df = df[df['date'].dt.year == 2016]
    df['date'] = df['date'].dt.strftime('%Y-%m-%d')
    
    df \
        .groupby(['city','date']) \
        .agg({'order':'count'}) \
        .unstack() \
        .to_excel('report_order.xlsx')

    df \
        .groupby(['city','date']) \
        .agg({'customer':'nunique'}) \
        .unstack() \
        .to_excel('report_customer.xlsx')



