Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F245C2F21
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 16:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A1FC004E1;
	Thu,  3 Mar 2022 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646325541;
	bh=lPZIdwsQWP4Ms3kPLc2NWlJMSgHkLZbSVVfg6uTj2t8=;
	h=From:To:Cc:Subject:Date:From;
	b=vBlcTrMqwITgcgixFeKGIJVNd+QfBd+W+CMDcY3J823vCyevZdebMg/bP50+g8I2t
	 l01BDFCW/1Im8tvI4jqM1CvBcz6v9kNkD/5I9wg1UfEc9koWzJs5AHmCewWrOPMz6a
	 E5m06ezrjDfUMPwemnFZPZDPQGbD3vzNY7zFgzSgcIFJOu7JnFjZfX2lnzUykEdjL9
	 MXBkzH7/d60evcn4ml0IqEMocABCOi4jSFPQShCWkRkx1QVbmQxZapQsCwI23WfrZC
	 xRnf7Smp9Wqlp6+jTdHctWl7XSKqRubThHePVVSh4l7Zlm6AebmKjPHCtkv9UxbRnQ
	 un+euIfN08gAg==
From: Nathan Chancellor <nathan@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] netfs: Ensure ret is always initialized in netfs_begin_read()
Date: Thu,  3 Mar 2022 09:38:26 -0700
Message-Id: <20220303163826.1120936-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

  fs/netfs/io.c:630:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
          if (sync) {
              ^~~~
  fs/netfs/io.c:655:9: note: uninitialized use occurs here
          return ret;
                 ^~~

There is only one instance of netfs_begin_read() where sync is false and
its return value is not checked so just return 0 in this case, as there
is no return code from another function call to propagate.

Fixes: 33e1e5d53058 ("netfs: Add a function to consolidate beginning a read")
Link: https://github.com/ClangBuiltLinux/linux/issues/1607
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/netfs/io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 3db9356eb7c2..4a3b7989cd1c 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -651,6 +651,7 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 		/* If we decrement nr_outstanding to 0, the ref belongs to us. */
 		if (atomic_dec_and_test(&rreq->nr_outstanding))
 			netfs_rreq_assess(rreq, false);
+		ret = 0;
 	}
 	return ret;
 }

base-commit: 2522c1b16116325f69670076d0c82024fbcc4e8d
-- 
2.35.1

