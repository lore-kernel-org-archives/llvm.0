Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2A358653
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342736; cv=none; b=RdIMBst+LSuIhfPFlQAqrSy2ZDvx/KbL7lVOWsJVTrrSfoGSXsyx7suwKwEY+1q0gPQQV1hpUeiTd8YFRdhtHtECIcHIzve9pi1esIFvKyc15YAnXRWGIkPNhmgUY1Vakh0LH2GGEBNMVzF0wdU4N1oi+xCDyikfRpKwrBYL0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342736; c=relaxed/simple;
	bh=iD9NnLJfAZU8fCgqT+cPRna6Exsx7/eFsEB1T7DYLNw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pjvTyaEizQeH7BiirTKIlytxrNmArpKgYk8qva7eMuCkSNya/tGXOqma+UDccwf4HurjJJJX86YZEI3BiJDOETiSksjzvRJkSIMBy/tgoUa8lO5q1j2tpCQsPmrU2La18/TFli+cUu1qenwLpdkPM2yvaKuWBC0mr5r+6oZ+9II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 398FA6061BF44;
	Wed, 17 Apr 2024 16:32:11 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	hch@tuxera.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs: hfsplus: fix an error code problem in hfsplus_sync_fs()
Date: Wed, 17 Apr 2024 16:31:36 +0800
Message-Id: <20240417083135.2245257-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang Static Checker (scan-build) Warning:
fs/hfsplus/super.c: line 236, column 3
Value stored to 'error2' is never read.

Fix this typo error by assigning 'error2' to 'error'.

Fixes: 52399b171dfa ("hfsplus: use raw bio access for the volume headers")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/hfsplus/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 97920202790f..5ee9cbccdff9 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -233,7 +233,7 @@ static int hfsplus_sync_fs(struct super_block *sb, int wait)
 				  sbi->s_backup_vhdr_buf, NULL, REQ_OP_WRITE |
 				  REQ_SYNC);
 	if (!error)
-		error2 = error;
+		error = error2;
 out:
 	mutex_unlock(&sbi->alloc_mutex);
 	mutex_unlock(&sbi->vh_mutex);
-- 
2.30.2

