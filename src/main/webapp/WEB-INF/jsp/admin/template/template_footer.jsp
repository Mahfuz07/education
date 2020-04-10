</div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/raphael.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/morris-data.js"></script>

        <!-- DataTables JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/dataTables.bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/dataTables.responsive.js"></script>

        <!-- Flot Charts JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/excanvas.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.flot.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.flot.pie.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.flot.resize.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.flot.time.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/jquery.flot.tooltip.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/flot-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin_resources/js/sb-admin-2.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });
        </script>

        <!-- Page-Level Demo Scripts - Notifications - Use for reference -->
        <script>
            // tooltip demo
            $('.tooltip-demo').tooltip({
                selector: "[data-toggle=tooltip]",
                container: "body"
            });
            // popover demo
            $("[data-toggle=popover]")
                    .popover();
        </script>

    </body>

</html>
