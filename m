Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 017691847
	for <llvm@lists.linux.dev>; Mon, 20 May 2024 02:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716171595; cv=none; b=tTYFX2LLQCJN0Y3Y46O4RtBzvQgT2DWG93UwlEVojAjIOo6eeh2km9xKNP4YZqm+5nTfruaAVv/TMueyHoX5htAE/ecpK1HCjtj1SaL0HbmJ/Uzhmc6TbOJEAzysHxcQyKIhFVDGnkpzKZ1Zyz7X8u5XmbBgIN+/aQwihO+stKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716171595; c=relaxed/simple;
	bh=rB7dD75CY84ry20/0r/cpYaVwib9bJIdMevmIkkR3EE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PyILUosBqqmZsFKqe0lQhH7G8KXgZYPJuSLgYJ2Z6fd0p+4t1tc2dIgNVt5eB5hhdAqf76QUObtxRYa1oq1uGRvXggu8AvPx7Dq5uhQ38Q3MJyUwgGWEIb/owWQH1U/MIQTVj4Gay83lblFP2/pQxG4YnzI46N6zo2/PHm435qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 4F0696026E8D1;
	Mon, 20 May 2024 10:19:44 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: srinivas.pandruvada@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	rui.zhang@intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: ISST: fix use after free problem in tpmi_sst_dev_remove()
Date: Mon, 20 May 2024 10:19:35 +0800
Message-Id: <20240520021934.113877-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang static checker (scan-build) warning:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1614:24:
Use of memory after it is freed.

Using 'tpmi_sst->package_id' after releasing 'tpmi_sst' causes this
problem. Change the order of releasing 'tpmi_sst' to fix this.

Fixes: 9d1d36268f3d ("platform/x86: ISST: Support partitioned systems")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 7bac7841ff0a..7fa360073f6e 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1610,8 +1610,8 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
 	tpmi_sst->partition_mask_current &= ~BIT(plat_info->partition);
 	/* Free the package instance when the all partitions are removed */
 	if (!tpmi_sst->partition_mask_current) {
-		kfree(tpmi_sst);
 		isst_common.sst_inst[tpmi_sst->package_id] = NULL;
+		kfree(tpmi_sst);
 	}
 	mutex_unlock(&isst_tpmi_dev_lock);
 }
-- 
2.30.2

