Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0242C9E
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 21:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E32C00446;
	Fri, 10 Dec 2021 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639172205;
	bh=quqqk2+XKEPZPkqqZjIbW9jY+fM2e8bd5aQy29m8gjI=;
	h=From:To:Cc:Subject:Date:From;
	b=e+8jI0ulgF3nIj2rlV/NtN6BgKJUBy3SytgR+epsAxAYH9wnfBAmJjVokcYnB3w9b
	 j6Hn71q1XbvozO+5lKyFxsiNz8dQqCazBsSxFNylo9ZDoyJ4qp7KuwlV4h1635Ceiu
	 /qzV/9sB7AUju38oMYpqujICHwzUc+e/ocufF7ZyOSht4PE5mXoyTUqdGeCxPlTQk0
	 4LNhQWI3oF9khAl4+E2l/7JftYJJz3X3OOE63J11alFyvlXK1mOMjpb6i5WhMcnTMW
	 1sgKWkxtaOwdLyL6WbaTsYJlw5gFT8X9WLqZK47GFDYSiboESqNQaw3TY+Yat46c+U
	 rgM9fFTT0vrrw==
From: Nathan Chancellor <nathan@kernel.org>
To: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] cxl/core: Remove cxld_const_init in cxl_decoder_alloc()
Date: Fri, 10 Dec 2021 14:36:27 -0700
Message-Id: <20211210213627.2477370-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 48667f676189 ("cxl/core: Split decoder setup into alloc + add")
aimed to fix a large stack frame warning but from v5 to v6, it
introduced a new instance of the warning due to allocating
cxld_const_init on the stack, which was done due to the use of const on
the nr_target member of the cxl_decoder struct. With ARCH=arm
allmodconfig minus CONFIG_KASAN:

GCC 11.2.0:

drivers/cxl/core/bus.c: In function ‘cxl_decoder_alloc’:
drivers/cxl/core/bus.c:523:1: error: the frame size of 1032 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
  523 | }
      | ^
cc1: all warnings being treated as errors

Clang 12.0.1:

drivers/cxl/core/bus.c:486:21: error: stack frame size of 1056 bytes in function 'cxl_decoder_alloc' [-Werror,-Wframe-larger-than=]
struct cxl_decoder *cxl_decoder_alloc(struct cxl_port *port, int nr_targets)
                    ^
1 error generated.

Revert that part of the change, which makes the stack frame of
cxl_decoder_alloc() much more reasonable.

Fixes: 48667f676189 ("cxl/core: Split decoder setup into alloc + add")
Link: https://github.com/ClangBuiltLinux/linux/issues/1539
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/cxl/core/bus.c | 6 ++----
 drivers/cxl/cxl.h      | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/cxl/core/bus.c b/drivers/cxl/core/bus.c
index 17a4fff029f8..3f9b98ecd18b 100644
--- a/drivers/cxl/core/bus.c
+++ b/drivers/cxl/core/bus.c
@@ -485,9 +485,7 @@ static int decoder_populate_targets(struct cxl_decoder *cxld,
 
 struct cxl_decoder *cxl_decoder_alloc(struct cxl_port *port, int nr_targets)
 {
-	struct cxl_decoder *cxld, cxld_const_init = {
-		.nr_targets = nr_targets,
-	};
+	struct cxl_decoder *cxld;
 	struct device *dev;
 	int rc = 0;
 
@@ -497,13 +495,13 @@ struct cxl_decoder *cxl_decoder_alloc(struct cxl_port *port, int nr_targets)
 	cxld = kzalloc(struct_size(cxld, target, nr_targets), GFP_KERNEL);
 	if (!cxld)
 		return ERR_PTR(-ENOMEM);
-	memcpy(cxld, &cxld_const_init, sizeof(cxld_const_init));
 
 	rc = ida_alloc(&port->decoder_ida, GFP_KERNEL);
 	if (rc < 0)
 		goto err;
 
 	cxld->id = rc;
+	cxld->nr_targets = nr_targets;
 	dev = &cxld->dev;
 	device_initialize(dev);
 	device_set_pm_not_required(dev);
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index ab4596f0b751..a5a0be3f088b 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -191,7 +191,7 @@ struct cxl_decoder {
 	int interleave_granularity;
 	enum cxl_decoder_type target_type;
 	unsigned long flags;
-	const int nr_targets;
+	int nr_targets;
 	struct cxl_dport *target[];
 };
 

base-commit: 53989fad1286e652ea3655ae3367ba698da8d2ff
-- 
2.34.1

