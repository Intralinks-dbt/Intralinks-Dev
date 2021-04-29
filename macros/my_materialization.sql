{% materialization mtc_invited_current, default %}
 -- cross-adapter materialization... assume Redshift is not supported
{% endmaterialization %}


{% materialization mtc_invited_current, adapter='redshift' %}
-- override the materialization for Redshift
{% endmaterialization %}