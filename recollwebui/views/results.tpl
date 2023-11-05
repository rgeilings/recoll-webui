%include('header', title=": " + query['query']+" ("+str(nres)+")")
%include('search', query=query, dirs=dirs, sorts=sorts, config=config)
<div id="status">
    <div id="found">
        Found <b>{{nres}}</b> matching: <b><i>{{qs}}</i></b>
        <small class="gray">({{time.seconds}}.{{time.microseconds/10000}}s)</small>
    </div>
    %if len(res) > 0 and not config['rclc_nojsoncsv']:
        <div id="downloads">
            <a href="./json?{{query_string}}&page=0">JSON</a>
            <a href="./csv?{{query_string}}&page=0">CSV</a>
        </div>
    %end
    <br style="clear: both">
</div>
%include('pages', query=query, config=config, nres=nres)
<div id="results">
%for i in range(0, len(res)):
    %include('result', d=res[i], i=i, query=query, config=config, query_string=query_string)
%end
</div>
%include('pages', query=query, config=config, nres=nres)
%include('footer')
<!-- vim: fdm=marker:tw=80:ts=4:sw=4:sts=4:et:ai
-->
