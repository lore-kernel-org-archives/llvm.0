Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AEF761F5FA
	for <llvm@lists.linux.dev>; Sun, 19 Jan 2025 03:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737255603; cv=none; b=BPUm/lyUNzHuDj1gG8F/mTvpjHESobkwo0+7kylOOHHpzWAKqjXpFu6kXU9VhCdqO0biLZrj4PcHp4RYFVwYiwAnsrgOoNcg95cu/gnJgyoDmfXIyUl61HBl+jvhKYXsM3M41E3RvkZXPv+VlbFEGuZVfGsrEacuMHLmS+8OM5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737255603; c=relaxed/simple;
	bh=KyMUxEzpigFw6/QYlXrdLpbhGCPNQRzhJr0vWnUDxOc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dbRT6cMra+YP3azyiGYVH/uh7G77TAzzPoQ52Ceyfenp0NiZ9qSDkh/PUpSslxHifaeYVNlYbOsCue4ono7X50ZAnsyrFTup1L/Zh3ZoDZEgPo6asmPKRzknEI0Q80mURMo2IDS0ry4XPV3EnscoMm18lVU0w9g126iSZ6A6svs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id DCB5760106CF9;
	Sun, 19 Jan 2025 10:59:56 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/stat.c: avoid harmless garbage value problem in vfs_statx_path()
Date: Sun, 19 Jan 2025 10:59:47 +0800
Message-Id: <20250119025946.1168957-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker(scan-build) warning:
fs/stat.c:287:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  287 |                 stat->result_mask |= STATX_MNT_ID_UNIQUE;
      |                 ~~~~~~~~~~~~~~~~~ ^
fs/stat.c:290:21: warning: The left expression of the compound assignment is
an uninitialized value. The computed value will also be garbage.
  290 |                 stat->result_mask |= STATX_MNT_ID;

When vfs_getattr() failed because of security_inode_getattr(), 'stat' is
uninitialized. In this case, there is a harmless garbage problem in
vfs_statx_path(). It's better to return error directly when
vfs_getattr() failed, avoiding garbage value and more clearly.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/stat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/stat.c b/fs/stat.c
index 0870e969a8a0..14eb3d01d98a 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -281,6 +281,8 @@ static int vfs_statx_path(struct path *path, int flags, struct kstat *stat,
 			  u32 request_mask)
 {
 	int error = vfs_getattr(path, stat, request_mask, flags);
+	if (error)
+		return error;
 
 	if (request_mask & STATX_MNT_ID_UNIQUE) {
 		stat->mnt_id = real_mount(path->mnt)->mnt_id_unique;
@@ -302,7 +304,7 @@ static int vfs_statx_path(struct path *path, int flags, struct kstat *stat,
 	if (S_ISBLK(stat->mode))
 		bdev_statx(path, stat, request_mask);
 
-	return error;
+	return 0;
 }
 
 static int vfs_statx_fd(int fd, int flags, struct kstat *stat,
-- 
2.30.2

