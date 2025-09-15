Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD621C75E2
	for <llvm@lists.linux.dev>; Mon, 15 Sep 2025 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757952155; cv=none; b=Pl7paZD+7fnr+YCGhXLHAdWzN2YphRUWvg+wokGP3llsBVhqymq+1jlA+PG1LM6KjN1lCauGXRpE8kkRMGXTzfg6Uv103R52F5cs3iVF5AEIl8WtDLz8aPzN7sRTTF5WNI3lB0z5yQrjWkmb+8+8j6ApgPY04yAs1d77o1B6qgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757952155; c=relaxed/simple;
	bh=KrdcTcOmvrTnZXWtRS2/iVJmA+q1zLW/5mkZAZj3qVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cB6rGzoC9GTM3NVLuNx4QqSbc0YLhatfX4UFCbRBFLKCl+rBJyi00ddr6JsCKc0DLGRfHXcp/3QdYzsANNEnSdizEWQLh8HwY0uAQiwJeFLywHG+XFFO8FXv+hUlY/xkoyCaCZ9fmkhuEVqhG+znVtjLYjenRiqPhzAfQtHswJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur/PuRRN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur/PuRRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757952150; x=1789488150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KrdcTcOmvrTnZXWtRS2/iVJmA+q1zLW/5mkZAZj3qVg=;
  b=Ur/PuRRNpLmjPGEuXGhGXClFAceaEgf1k3EP6i6jp6jfLM3LOGbwNHf6
   xWuAv5Tu7Awd5RfSrIn+MTlvDeKhNvqZsX//iIlOkzfmM/G/Os/43/O3X
   p2rdPJ9L1X71ycUt431GiGE4xCEtLZxAL4f8KgkiPKUtEElPIu8iI+Nc3
   Gz/9P4Vno31g6SEaQsLqhWHYv11gh1DMOANGgHBAcJ0aKillYNqR+ArTe
   2hQBcAxzgl9fWPcKU9I3+4DpcpyrpXrcuX6qRWiMZGdICRa3jCjTK+khy
   PXnc12de8te8eHHiExFjFCaJVLG7AMU2MKWXEb8X3pRUp4PcfIge2nrrT
   w==;
X-CSE-ConnectionGUID: 8fR3YdART1aIxCB4BNxf1g==
X-CSE-MsgGUID: 0q8z8M6eQDKayS62NRqKeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70462410"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="70462410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 09:02:29 -0700
X-CSE-ConnectionGUID: PY5zR71HRaehcY/K9csPBg==
X-CSE-MsgGUID: s6tF1+90Q9SB6KinGRyPQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="178666903"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2025 09:02:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 45F2A94; Mon, 15 Sep 2025 18:02:25 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jan Kara <jack@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] lock_mount(): Remove unused function
Date: Mon, 15 Sep 2025 18:02:21 +0200
Message-ID: <20250915160221.2916038-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang is not happy about unused function:

/fs/namespace.c:2856:20: error: unused function 'lock_mount' [-Werror,-Wunused-function]
 2856 | static inline void lock_mount(const struct path *path,
      |                    ^~~~~~~~~~
1 error generated.

Fix the compilation breakage (`make W=1` build) by removing unused function.

Fixes: d14b32629541 ("change calling conventions for lock_mount() et.al.")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 fs/namespace.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 14924dd3a21b..ebd61d903a59 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2853,12 +2853,6 @@ static void do_lock_mount(const struct path *path,
 	} while (err == -EAGAIN);
 }
 
-static inline void lock_mount(const struct path *path,
-			      struct pinned_mountpoint *m)
-{
-	do_lock_mount(path, m, false);
-}
-
 static void __unlock_mount(struct pinned_mountpoint *m)
 {
 	inode_unlock(m->mp->m_dentry->d_inode);
-- 
2.50.1

