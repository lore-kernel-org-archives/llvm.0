Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1EF2F24
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 16:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576DDC004E1;
	Mon,  7 Feb 2022 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644251082;
	bh=wizEBetaRGWa2xd5IXRmfnLE9oVDJtn3/BtteleiDC4=;
	h=From:To:Cc:Subject:Date:From;
	b=PrD+e3xkXH15yxqW3MWnSPrWcDpaDckn1bQQf3urWGrunHqlZq4miFYHCoW2lJF5M
	 wnwqUSZ5pjlTXm3nIDgY8AhFC3dQK4Fq92rIWuMq9mzlXnGsWalP3qTSMrF+XvZAV9
	 sFEVLpgEeftZxEoczh4UhCpZ+1yRo4HRn5fQRUw2hxTrrzTzp41ZxKrNpxvtUp53du
	 zSZ2pOgFJLqT/vEgjrGNt1o/d3MVv4X3obbGu+yG8CAtCjX+ldxOg67atZ9AfIU5kM
	 QZJhPnGjL4VInsqw+GToch6hUanMSRBv2TlltnCIoCdJQb8r20a1qVrdKpkr1mBGnZ
	 y73rN3je0sxJA==
From: Nathan Chancellor <nathan@kernel.org>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Usama Arif <usama.arif@bytedance.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] io_uring: Fix use of uninitialized ret in io_eventfd_register()
Date: Mon,  7 Feb 2022 09:24:11 -0700
Message-Id: <20220207162410.1013466-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

  fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
          return ret;
                 ^~~
  fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence this warning
          int fd, ret;
                     ^
                      = 0
  1 warning generated.

Just return 0 directly and reduce the scope of ret to the if statement,
as that is the only place that it is used, which is how the function was
before the fixes commit.

Fixes: 1a75fac9a0f9 ("io_uring: avoid ring quiesce while registering/unregistering eventfd")
Link: https://github.com/ClangBuiltLinux/linux/issues/1579
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/io_uring.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 5479f0607430..7ef04bb66da1 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -9370,7 +9370,7 @@ static int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
 {
 	struct io_ev_fd *ev_fd;
 	__s32 __user *fds = arg;
-	int fd, ret;
+	int fd;
 
 	ev_fd = rcu_dereference_protected(ctx->io_ev_fd,
 					lockdep_is_held(&ctx->uring_lock));
@@ -9386,14 +9386,14 @@ static int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
 
 	ev_fd->cq_ev_fd = eventfd_ctx_fdget(fd);
 	if (IS_ERR(ev_fd->cq_ev_fd)) {
-		ret = PTR_ERR(ev_fd->cq_ev_fd);
+		int ret = PTR_ERR(ev_fd->cq_ev_fd);
 		kfree(ev_fd);
 		return ret;
 	}
 	ev_fd->eventfd_async = eventfd_async;
 
 	rcu_assign_pointer(ctx->io_ev_fd, ev_fd);
-	return ret;
+	return 0;
 }
 
 static void io_eventfd_put(struct rcu_head *rcu)

base-commit: 88a0394bc27de2dd8a8715970f289c5627052532
-- 
2.35.1

