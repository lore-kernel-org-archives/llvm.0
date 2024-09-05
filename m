Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2B72B2746A
	for <llvm@lists.linux.dev>; Thu,  5 Sep 2024 05:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725512584; cv=none; b=OZVqf5q9YVd8MkVT/+HHIq31qIEcoYn3s9owiO9+pwy6b9g5DsD+mNo11YK5gNGh13IIklld3OwDVqwMZAf3+PjW/3neVjJEEwlWRlKM3bgKikEyc0QAAhSD/E5MiPTYNkjhfbLWVisEiNtFRKw38P//LGApIha0NFpKUMcNmjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725512584; c=relaxed/simple;
	bh=1OVdmWxQnf2gL69JNspl8eWwRpgkMv2erIHv+Q/JQ7A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sp0M5SryBIjdRgUV4u0ipRd0CtxcMRDHFAdIt4y1CnVkvcPeReIk2XViFrO4QbMynhinkuA956s2Bs6wl1bPpJWOMDZF+mT8mDwPZ60H34WyGQ/6ufOZrNenb2sPqVr6/0el1jlG4wBDnT381S4m3V72qpcY1ryPb8wiiVSHD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 03187604FCB3F;
	Thu,  5 Sep 2024 13:02:53 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: njavali@marvell.com,
	GR-QLogic-Storage-Upstream@marvell.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	JBottomley@Parallels.com,
	saurav.kashyap@qlogic.com,
	atul.deshmukh@qlogic.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: qla2xxx: avoid possible garbage in qla8044_rd_reg_indirect()
Date: Thu,  5 Sep 2024 13:02:28 +0800
Message-Id: <20240905050226.1959592-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) warning:
drivers/scsi/qla2xxx/qla_nx2.c:line 2542, column 16:
Assigned value is garbage or undefined.

In qla8044_minidump_process_l1cache(), there is a garbage value
problem as follows.

'r_value' is garbage when qla8044_rd_reg_indirect() failed, so
'*data_ptr++ = r_value' assigned  garbage value to 'data_ptr'.
There are many others examples like this which using
qla8044_rd_reg_indirect() but not checking the return value.
When qla8044_rd_reg_indirect() failed, let 'r_value = 0' to avoid these
garbage values.

Fixes: 7ec0effd30bb ("[SCSI] qla2xxx: Add support for ISP8044.")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/scsi/qla2xxx/qla_nx2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_nx2.c b/drivers/scsi/qla2xxx/qla_nx2.c
index 41ff6fbdb933..97fd1c7833b4 100644
--- a/drivers/scsi/qla2xxx/qla_nx2.c
+++ b/drivers/scsi/qla2xxx/qla_nx2.c
@@ -92,11 +92,13 @@ qla8044_rd_reg_indirect(scsi_qla_host_t *vha, uint32_t addr, uint32_t *data)
 	struct qla_hw_data *ha = vha->hw;
 
 	ret_val = qla8044_set_win_base(vha, addr);
-	if (!ret_val)
+	if (!ret_val) {
 		*data = qla8044_rd_reg(ha, QLA8044_WILDCARD);
-	else
+	} else {
+		*data = 0;
 		ql_log(ql_log_warn, vha, 0xb088,
 		    "%s: failed read of addr 0x%x!\n", __func__, addr);
+	}
 	return ret_val;
 }
 
-- 
2.30.2

