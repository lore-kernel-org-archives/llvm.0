Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E217C
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 03:32:04 +0000 (UTC)
X-UUID: 438f6c0acb9049eeaaae242dc69b407f-20220401
X-UUID: 438f6c0acb9049eeaaae242dc69b407f-20220401
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 936776392; Fri, 01 Apr 2022 11:25:55 +0800
X-ns-mid: postfix-624670F9-8008223520
Received: from localhost.localdomain (unknown [172.30.60.63])
	by cs2c.com.cn (NSMail) with ESMTPSA id BC6DC384867B;
	Fri,  1 Apr 2022 03:26:49 +0000 (UTC)
From: Enze Li <lienze@kylinos.cn>
To: phil@philpotter.co.uk,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] cdrom: remove unused variable
Date: Fri,  1 Apr 2022 11:26:23 +0800
Message-Id: <20220401032623.293666-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clang static analyzer reports the following warning,

File: drivers/cdrom/cdrom.c
Warning: line 1380, column 7
	 Although the value stored to 'status' is used in enclosing
	 expression, the value is never actually read from 'status'

Remove the unused variable to eliminate the warning.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 drivers/cdrom/cdrom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index 7bd10d63ddbe..2dc9da683a13 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -1365,7 +1365,6 @@ static int cdrom_slot_status(struct cdrom_device_info *cdi, int slot)
  */
 int cdrom_number_of_slots(struct cdrom_device_info *cdi) 
 {
-	int status;
 	int nslots = 1;
 	struct cdrom_changer_info *info;
 
@@ -1377,7 +1376,7 @@ int cdrom_number_of_slots(struct cdrom_device_info *cdi)
 	if (!info)
 		return -ENOMEM;
 
-	if ((status = cdrom_read_mech_status(cdi, info)) == 0)
+	if (cdrom_read_mech_status(cdi, info) == 0)
 		nslots = info->hdr.nslots;
 
 	kfree(info);
-- 
2.25.1

