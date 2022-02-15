Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A07C
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 18:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C250FC340EC;
	Tue, 15 Feb 2022 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644950633;
	bh=jVE2UPwQbGumrX229wqA975K+AttmZ9p0pF/nvpok9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=SRhqgjz47Z9NvbRe3aKfoY+SUjDETfnk4XZJxkkyoh9YYzrgdktOTgRbgfT75inLW
	 Pasx0y++4oWIo5MUdNNH+FbuGbMAFsdDLPHxo+sfO1H2RjX9LQKa4dRZusD6SRDEhq
	 I7xfG4nUoW/Lq2Ge5F08+EwLr6unbd6cFofQ+Lh2o7Aywm0a7JZEdgX84npyygGkTN
	 M3jTDum3/wUjb9BQIGg9EO4TD+io7PxDGaDAmFkTMdjngJjPslzVdfVebCjCD0ytyr
	 ljQ2Q9/cymblwFUceu7qvDG8YxyD2s4XnitPHG5M5d/+/ACa2Fa20hD1ylmRp7VLUf
	 y1LrBtwqrKcoQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	"kernelci.org bot" <bot@kernelci.org>
Subject: [PATCH] mm/page_alloc: Mark pagesets as __maybe_unused
Date: Tue, 15 Feb 2022 11:43:22 -0700
Message-Id: <20220215184322.440969-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9983a9d577db ("locking/local_lock: Make the empty local_lock_*()
function a macro.") in the -tip tree converted the local_lock_*()
functions into macros, which causes a warning with clang with
CONFIG_PREEMPT_RT=n + CONFIG_DEBUG_LOCK_ALLOC=n:

  mm/page_alloc.c:131:40: error: variable 'pagesets' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
  static DEFINE_PER_CPU(struct pagesets, pagesets) = {
                                         ^
  1 error generated.

Prior to that change, clang was not able to tell that pagesets was
unused in this configuration because it does not perform cross function
analysis in the frontend. After that change, it sees that the macros
just do a typecheck on the lock member of pagesets, which is evaluated
at compile time (so the variable is technically "used"), meaning the
variable is not needed in the final assembly, as the warning states.

Mark the variable as __maybe_unused to make it clear to clang that this
is expected in this configuration so there is no more warning.

Link: https://github.com/ClangBuiltLinux/linux/issues/1593
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 7ff1efc84205..406f5d0c610f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -128,7 +128,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
 struct pagesets {
 	local_lock_t lock;
 };
-static DEFINE_PER_CPU(struct pagesets, pagesets) = {
+static DEFINE_PER_CPU(struct pagesets, pagesets) __maybe_unused = {
 	.lock = INIT_LOCAL_LOCK(lock),
 };
 

base-commit: 10a64d66e319e6ea3a19f9d2e7c4f0dee90ce6e0
-- 
2.35.1

