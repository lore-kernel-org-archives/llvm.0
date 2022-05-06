Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B77F
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 15:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A3CC385AA;
	Fri,  6 May 2022 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651849516;
	bh=fhDnj/gHUadlVDzinZrEMzeeuKCFomPvapKUxScb6vI=;
	h=From:To:Cc:Subject:Date:From;
	b=rOcnY6Ej2CD34II/WUkNS091v7OFyebuwqx6UDIxJd+8YzGSBX9rw9nBcF4Fq7Lra
	 QMAJhPxU2LRHFzT5OL8KZ8m/9k+yPY6hmHaSflp34or4toYQ5If/ajNfPqCBzSG6zM
	 GbevKLhbnrWIu96TPEnJzH3djkwNnWsnUtbZO8B9mJ+Igl6/gESqVLBMnsrr9NzVMm
	 BXo79yoW+yZ+NQNhkLuidU1Ib3+SOhjrhpaT7HiAecqcHDULUA7a8R6aRmyL6Mr7g+
	 3FUSaBmjw2QS4d6VDoatUWykXn+b7D70gGVI21hzfeRVVlgm8M3T5xttdmmXP9gk2L
	 mQYfji4aaIMQw==
From: Nathan Chancellor <nathan@kernel.org>
To: Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] nvme: Ensure ret is always initialized in
Date: Fri,  6 May 2022 08:03:58 -0700
Message-Id: <20220506150357.2443040-1-nathan@kernel.org>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

  drivers/nvme/host/ioctl.c:674:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
          if (ns)
              ^~
  drivers/nvme/host/ioctl.c:677:9: note: uninitialized use occurs here
          return ret;
                 ^~~
  drivers/nvme/host/ioctl.c:674:2: note: remove the 'if' if its condition is always true
          if (ns)
          ^~~~~~~
  drivers/nvme/host/ioctl.c:672:9: note: initialize the variable 'ret' to silence this warning
          int ret;
                 ^
                  = 0
  1 error generated.

Initialize ret to zero so that it cannot be used uninitialized.

Fixes: 271ee3df5cca ("nvme: wire-up uring-cmd support for io-passthru on char-device.")
Link: https://github.com/ClangBuiltLinux/linux/issues/1630
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

Or alternatively, remove the 'if (ns)' if ns can never be NULL; I tried
going down the rabbit hole to see if that is possible but I got a little
lost :^)

 drivers/nvme/host/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 9db88f2c15f8..3ad5285c1f96 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -669,7 +669,7 @@ int nvme_ns_head_chr_uring_cmd(struct io_uring_cmd *ioucmd,
 	struct nvme_ns_head *head = container_of(cdev, struct nvme_ns_head, cdev);
 	int srcu_idx = srcu_read_lock(&head->srcu);
 	struct nvme_ns *ns = nvme_find_path(head);
-	int ret;
+	int ret = 0;
 
 	if (ns)
 		ret = nvme_ns_uring_cmd(ns, ioucmd, issue_flags);

base-commit: 002b149a51a53facaf26d7c6f2c1fe718673683c
-- 
2.36.0

