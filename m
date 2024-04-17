Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C82097D07A
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341935; cv=none; b=Lmz6s/fg1kg5TW4068UesIUB1u2lTE8AtaTbmWXOKMHdlU2jEyWfjZuIL7T4sBJ0hyT7liaMTYWx1lp6z7N73bygKSBFtpOdfBKmNxZqJ5QE/HUiWDiXzNhGDmv72DRryejgUO2e29Q6ZitgvA47kiSOab1sQjT6yQxqv4eXMbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341935; c=relaxed/simple;
	bh=8L2XQ9HgTbiAkbBWhPJyZLU4dy7T5PQXBLD4gXNSed8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xa9Rnl11okWBuW5A3vkvz82ui9pC8KR/5e3oFsAdXyXfTgcgoghbgcnHe33UriIItd9MjKnzEnfyVgbm7GRlpbkNEJ0f2l0ws/inFt6gp/VXG6X7bZpprHvwvzkssO4N9IX/tP80InI8R1BAsc5c+BwklgU5HIpK29gr7OM7wr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 5BF316061479A;
	Wed, 17 Apr 2024 16:18:46 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	c_mkenna@qti.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless] wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()
Date: Wed, 17 Apr 2024 16:17:37 +0800
Message-Id: <20240417081736.2226586-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang Static Checker (scan-build) Warning:
drivers/net/wireless/ath/ath10k/debugfs_sta.c:line 429, column 3
Value stored to 'ret' is never read.

Return 'ret' rather than 'count' when 'ret' stores an error code.
By the way, remove some useless code.

Fixes: ee8b08a1be82 ("ath10k: add debugfs support to get per peer tids log via tracing")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/ath/ath10k/debugfs_sta.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 394bf3c32abf..5525dabe390a 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -415,7 +415,7 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
 	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
 	struct ath10k *ar = arsta->arvif->ar;
 	u8 peer_debug_trigger;
-	int ret;
+	int ret = 0;
 
 	if (kstrtou8_from_user(user_buf, count, 0, &peer_debug_trigger))
 		return -EINVAL;
@@ -432,14 +432,12 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
 
 	ret = ath10k_wmi_peer_set_param(ar, arsta->arvif->vdev_id, sta->addr,
 					ar->wmi.peer_param->debug, peer_debug_trigger);
-	if (ret) {
+	if (ret)
 		ath10k_warn(ar, "failed to set param to trigger peer tid logs for station ret: %d\n",
 			    ret);
-		goto out;
-	}
 out:
 	mutex_unlock(&ar->conf_mutex);
-	return count;
+	return ret ?: count;
 }
 
 static const struct file_operations fops_peer_debug_trigger = {
-- 
2.30.2

