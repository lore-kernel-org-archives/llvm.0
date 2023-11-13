Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AA5E4522B
	for <llvm@lists.linux.dev>; Mon, 13 Nov 2023 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 5F51E60511CA1;
	Mon, 13 Nov 2023 15:10:07 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: yanaijie@huawei.com,
	jinpu.wang@cloud.ionos.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	James.Bottomley@suse.de,
	aoqingyun@usish.com,
	tom_peng@usish.com,
	lindar_liu@usish.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] scsi: pm8001: return error code if no attached dev
Date: Mon, 13 Nov 2023 15:09:52 +0800
Message-Id: <20231113070951.122821-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static analyzer complains that value stored to 'res' is never read.
Return the error code when sas_find_attached_phy_id() failed.

Fixes: dbf9bfe61571 ("[SCSI] pm8001: add SAS/SATA HBA driver")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2:
 - correct the problem about Fixes tag.(thanks for Jason's reminder)
 drivers/scsi/pm8001/pm8001_sas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/pm8001/pm8001_sas.c b/drivers/scsi/pm8001/pm8001_sas.c
index a5a31dfa4512..a1f58bfff5c0 100644
--- a/drivers/scsi/pm8001/pm8001_sas.c
+++ b/drivers/scsi/pm8001/pm8001_sas.c
@@ -662,6 +662,8 @@ static int pm8001_dev_found_notify(struct domain_device *dev)
 				   SAS_ADDR(dev->sas_addr),
 				   SAS_ADDR(parent_dev->sas_addr));
 			res = phy_id;
+			pm8001_free_dev(pm8001_device);
+			goto found_out;
 		} else {
 			pm8001_device->attached_phy = phy_id;
 		}
-- 
2.30.2

