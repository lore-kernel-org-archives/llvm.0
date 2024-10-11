Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B6FDF20B203
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643235; cv=none; b=MGhvvMtbdjWC2PHg7S1tV6JL11yJhcXOIPfFqa3RE1NlqfILA4Xg+XOCEXkXWE3+7BH4ULvqjL/oy3IAtDVC7hoUqtErSj1RZ7hlQeou1Vqesv+4Gs+pvA/ym+6Hjn/51X/j6AFKie/bkjCxpBRm93Ybv4I8PNEZzbBVCCqOGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643235; c=relaxed/simple;
	bh=byh5A6hiW4n3+vZQX3J7Nlw7R0K1ooAOrSpobr1ZczQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JXAZJYJkNbhca+GaHIe8GO4jHEtwR9NJM9qduj7pD7DLOmNAkrEaAX5EKQanXNW/9Ds9NgtwS4uQKX2agXDePhWT81rdnWig/FTXtqA/qYRhsEIUdWvaOpBZt5w7iyTWqhRUXCSSndfzgOqEXzqzuS+qZJRfkXGUpxn/EUAvyBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 24E1660858D49;
	Fri, 11 Oct 2024 18:40:26 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: fix the double free in scmi_debugfs_common_setup()
Date: Fri, 11 Oct 2024 18:40:02 +0800
Message-Id: <20241011104001.1546476-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clang static checker(scan-build) warning：
drivers/firmware/arm_scmi/driver.c:line 2915, column 2
Attempt to free released memory.

When devm_add_action_or_reset() failed , scmi_debugfs_common_cleanup()
will run twice which caused double free of 'dbg->name'.
Remove the redundant scmi_debugfs_common_cleanup() to fix this problem.

Fixes: c3d4aed763ce ("firmware: arm_scmi: Populate a common SCMI debugfs root")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 88c5c4ff4bb6..a477b5ade38d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2976,10 +2976,8 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 	dbg->top_dentry = top_dentry;
 
 	if (devm_add_action_or_reset(info->dev,
-				     scmi_debugfs_common_cleanup, dbg)) {
-		scmi_debugfs_common_cleanup(dbg);
+				     scmi_debugfs_common_cleanup, dbg))
 		return NULL;
-	}
 
 	return dbg;
 }
-- 
2.30.2

