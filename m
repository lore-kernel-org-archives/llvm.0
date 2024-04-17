Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 3F0B26CDA8
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342460; cv=none; b=jilvL3aQPBNMeYE0z5wWE84SfHe3ZNBrR6aBA0/FvJ9GvMBzqNvUfJyMUvf2rgzQUb144gyQfI/7x6SFW3e8/s6nVmbdS/svPw2mTbrVDqhLcQmi1XSHd2IB4D2+h4OZae3nHJpEY9Ex19QVi0aFlP44afi3tp3duskDWiomd6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342460; c=relaxed/simple;
	bh=CtQMNvV+gUrG6qOniXmLWrED15xV7xKGBBCUUCjRea8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KNPGmVXI1hvIMDCVfbu+43XON3fQcgV2Rge8bydDX639eEmYE0Gw13I5SUVmsXcyFvl53wWGbXjf76iKaq1KGuIFjnbM3tRY2ytQVr9kawfvL6XOJbugownhjGCdgHUCHaa5DnRSj9XthJ2dK2Kgd0IssR8nDJQwMYoxE8EAdPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 8304B6061879B;
	Wed, 17 Apr 2024 16:27:30 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: njavali@marvell.com,
	GR-QLogic-Storage-Upstream@marvell.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	rhicksted@marvell.com,
	hare@suse.de,
	himanshu.madhani@oracle.com,
	qutran@marvell.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: qla2xxx: edif: Fix an error code problem in qla24xx_sadb_update()
Date: Wed, 17 Apr 2024 16:27:01 +0800
Message-Id: <20240417082700.2238557-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang Static Checker (scan-build) Warning:
drivers/scsi/qla2xxx/qla_edif.c:line 1568, column 3
Value stored to 'rval' is never read.

Return the error code rather than zero to dismiss this warning.

Fixes: dd30706e73b7 ("scsi: qla2xxx: edif: Add key update")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/scsi/qla2xxx/qla_edif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_edif.c b/drivers/scsi/qla2xxx/qla_edif.c
index dcde55c8ee5d..6f1aac36a144 100644
--- a/drivers/scsi/qla2xxx/qla_edif.c
+++ b/drivers/scsi/qla2xxx/qla_edif.c
@@ -1836,7 +1836,7 @@ qla24xx_sadb_update(struct bsg_job *bsg_job)
 	bsg_job_done(bsg_job, bsg_reply->result,
 	    bsg_reply->reply_payload_rcv_len);
 
-	return 0;
+	return rval;
 }
 
 static void
-- 
2.30.2

