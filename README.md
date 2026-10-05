# impact_retail - dbt-Testprojekt fuer Impact Intelligence

Liest das Tutorial-DWH in `BORIS_DEMO_DWH.DEMO_DWH` (dieselben Tabellen wie in
der Oracle-Instanz) und baut daraus 9 Staging-Views, 2 Intermediate-Views und
3 Mart-Tabellen im Schema `BORIS_DEMO_DWH.DBT_IMPACT`.

## Ausfuehren

```bash
cd "/Users/boris/Documents/Development/dbt_Examples/impact_retail"
export DBT_PROFILES_DIR="$PWD"
export SNOWFLAKE_ACCOUNT=...   # Account-Kennung wie im Snowflake-Connector
export SNOWFLAKE_USER=...
export SNOWFLAKE_PASSWORD=...  # nur in der eigenen Shell setzen
.venv/bin/dbt debug            # Verbindung pruefen
.venv/bin/dbt build            # Modelle bauen + Tests
.venv/bin/dbt docs generate    # erzeugt target/catalog.json (Spalten)
```

Fuer den Impact-Intelligence-Connector relevant: `target/manifest.json`
(Modelle, Quellen, Abhaengigkeiten, SQL) und `target/catalog.json` (Spalten).
