ScheduleBatchDeleteOpportunity sbdo = new ScheduleBatchDeleteOpportunity();
final String CRON_STRING = '0 0 2 * * SAT'
String jobId = System.schedule('Delete Job', CRON_STRING, sbdo);