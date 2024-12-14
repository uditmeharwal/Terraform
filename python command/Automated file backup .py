# for automated backup of file into tar.gz format 

import shutil
import datetime
import os
def backup_file(source,dest):
    today = datetime.date.today()
    backup_file_name = os.path.join(dest, f"backup_{today}")
    shutil.make_archive(backup_file_name,'gztar',source)

source='D:/devops/'
dest='D:/devops/GITHUM-DEVOPS'
backup_file(source,dest)
