Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F32C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 15:57:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B82E60230;
	Fri,  5 Nov 2021 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636127834;
	bh=kWFhx70/FEe4Ay6ZeSIn3AZkUcCPD27adLUs5+hkz1E=;
	h=From:To:Cc:Subject:Date:From;
	b=nNeZINJWupDgDvSJvzsreSJXv4KlFuqj6JfQxD98b5jFQZ3WUDpBqYWIiDv/VVmYU
	 OdW/GBhgvg89JDoNiTzmA+s1MpbGqJEWSLQAd31R7BXExp7TZZr6gDbRUx1YVybk/A
	 g3RnphxF8zWNexZKDZeQDflJWFdhCWk+mPShBa7HJCOmxtklpI4P5Q8yqUkr5fJSWA
	 5sSZFT39D3YJD1tetpV5q/AWsPCzckMUx5nXGCcXFQ0yiaHyq/rGXaJ6Gw0R78VTnX
	 7Js2ACYIamH7qQkspZGu1W+ZAPX7divU+Ph7YC8Lg3lioCP2AHIv2IiwvINYrioPCW
	 WASlBTkSk6lTQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] NFS: Avoid using error uninitialized in nfs_lookup()
Date: Fri,  5 Nov 2021 08:57:04 -0700
Message-Id: <20211105155704.3293957-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.0.rc0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Clang warns:

fs/nfs/dir.c:1772:6: error: variable 'error' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (fhandle == NULL || fattr == NULL)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/nfs/dir.c:1801:44: note: uninitialized use occurs here
        trace_nfs_lookup_exit(dir, dentry, flags, error);
                                                  ^~~~~
fs/nfs/dir.c:1772:2: note: remove the 'if' if its condition is always false
        if (fhandle == NULL || fattr == NULL)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/nfs/dir.c:1772:6: error: variable 'error' is used uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninitialized]
        if (fhandle == NULL || fattr == NULL)
            ^~~~~~~~~~~~~~~
fs/nfs/dir.c:1801:44: note: uninitialized use occurs here
        trace_nfs_lookup_exit(dir, dentry, flags, error);
                                                  ^~~~~
fs/nfs/dir.c:1772:6: note: remove the '||' if its condition is always false
        if (fhandle == NULL || fattr == NULL)
            ^~~~~~~~~~~~~~~~~~
fs/nfs/dir.c:1754:11: note: initialize the variable 'error' to silence this warning
        int error;
                 ^
                  = 0
2 errors generated.

Add a label to skip the call to trace_nfs_lookup_exit() when the call to
nfs_alloc_fhandle() or nfs_alloc_fattr_with_label() fails because
trace_nfs_lookup_enter() has not been called at that point so tracing
the exit does not make sense.

Fixes: 8d3df1d0387e ("NFS: Remove the label from the nfs4_lookup_res struct")
Link: https://github.com/ClangBuiltLinux/linux/issues/1498
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/nfs/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 8de99f426183..1c978a7cf730 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1770,7 +1770,7 @@ struct dentry *nfs_lookup(struct inode *dir, struct dentry * dentry, unsigned in
 	fhandle = nfs_alloc_fhandle();
 	fattr = nfs_alloc_fattr_with_label(NFS_SERVER(dir));
 	if (fhandle == NULL || fattr == NULL)
-		goto out;
+		goto out_no_trace;
 
 	dir_verifier = nfs_save_change_attribute(dir);
 	trace_nfs_lookup_enter(dir, dentry, flags);
@@ -1799,6 +1799,7 @@ struct dentry *nfs_lookup(struct inode *dir, struct dentry * dentry, unsigned in
 	nfs_set_verifier(dentry, dir_verifier);
 out:
 	trace_nfs_lookup_exit(dir, dentry, flags, error);
+out_no_trace:
 	nfs_free_fattr(fattr);
 	nfs_free_fhandle(fhandle);
 	return res;

base-commit: cb66e0e973daa668dadd43441f877377a1b7b1ff
-- 
2.34.0.rc0

