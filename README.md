# impact_retail - dbt-Testprojekt fuer Impact Intelligence

Realistischer ELT-Fluss (seit 08.10.2026): **Fivetran** repliziert das
Tutorial-DWH `BORIS_DEMO_DWH.DEMO_DWH` (Stand-in fuer ein Betriebssystem) in die
Landing-Zone `FIVETRAN_DB.FIVETRAN_STAGE_DEMO_DWH`; **dbt** liest nur von dort
(Source `raw_retail`, Freshness ueber `_FIVETRAN_SYNCED`, geloeschte Saetze ueber
`_FIVETRAN_DELETED` gefiltert) und baut 9 Staging-Views, 2 Intermediate-Views und
3 Mart-Tabellen im Schema `BORIS_DEMO_DWH.DBT_IMPACT`.

Voraussetzung: die dbt-Rolle darf `FIVETRAN_DB.FIVETRAN_STAGE_DEMO_DWH` lesen.

## Ausfuehren

```bash
cd "/Users/boris/Documents/Development/dbt_Examples/impact_retail"
export DBT_PROFILES_DIR="$PWD"
export SNOWFLAKE_ACCOUNT=...   # Account-Kennung wie im Snowflake-Connector
export SNOWFLAKE_USER=...
export SNOWFLAKE_PASSWORD=...  # nur in der eigenen Shell setzen
.venv/bin/dbt debug            # Verbindung pruefen
.venv/bin/dbt source freshness  # wann hat Fivetran zuletzt geliefert?
.venv/bin/dbt build            # Modelle bauen + Tests
.venv/bin/dbt docs generate    # erzeugt target/catalog.json (Spalten)
```

Fuer den Impact-Intelligence-Connector relevant: `target/manifest.json`
(Modelle, Quellen, Abhaengigkeiten, SQL) und `target/catalog.json` (Spalten).
