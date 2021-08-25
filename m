Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5672
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 17:33:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58CD1610CB;
	Wed, 25 Aug 2021 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629912816;
	bh=StKbEN+KHuyLQXJf+AEBcWvhQNliMxECNYX4oGLIgpo=;
	h=From:To:Cc:Subject:Date:From;
	b=ndplRsWuWqTCLGHZslou+OzvktnNhlT1X8aBpbPPyGCeTfHzNTYaN0lTYNRHiwGNo
	 YTeaIPWjJ6uvm9D0vnbn2Y2i1z2Hg1GLBl+LXCrd3jgLQRkmB+5rO4YUh2eL3ICbKx
	 CkwSP/W4GIz9cFuMJIClVSpLMUJOaaAPzgW2ba1T+OgsGzULrSdy3o8UN1RT6I6nGl
	 BEJTqLffS1AsIlwNXBuABLFoFOYYKScTYzJbrBVQVmm6bylcvmZ+m5TX6YBHvjeE9+
	 JzxSpUND85J/OJeUeGsTiJueEdiiFxm4TJSkbdHU05kisFg1JbB93jGoKbVYnQvfFD
	 hyxnqd1QIYzJw==
From: Nathan Chancellor <nathan@kernel.org>
To: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] cxl/core: Avoid using dev uninitialized in devm_cxl_add_decoder()
Date: Wed, 25 Aug 2021 10:33:01 -0700
Message-Id: <20210825173301.358381-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Clang warns:

drivers/cxl/core/bus.c:527:6: warning: variable 'dev' is used
uninitialized whenever 'if' condition is true
[-Wsometimes-uninitialized]
        if (rc)
            ^~
drivers/cxl/core/bus.c:541:13: note: uninitialized use occurs here
        put_device(dev);
                   ^~~
drivers/cxl/core/bus.c:527:2: note: remove the 'if' if its condition is
always false
        if (rc)
        ^~~~~~~
drivers/cxl/core/bus.c:507:6: warning: variable 'dev' is used
uninitialized whenever 'if' condition is true
[-Wsometimes-uninitialized]
        if (cxld->interleave_ways < 1) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/cxl/core/bus.c:541:13: note: uninitialized use occurs here
        put_device(dev);
                   ^~~
drivers/cxl/core/bus.c:507:2: note: remove the 'if' if its condition is
always false
        if (cxld->interleave_ways < 1) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/cxl/core/bus.c:498:20: note: initialize the variable 'dev' to
silence this warning
        struct device *dev;
                          ^
                           = NULL
2 warnings generated.

Return the error code directly rather than attempting to call
device_put() with an uninitialized pointer.

Fixes: b7ca54b62551 ("cxl/core: Split decoder setup into alloc + add")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/cxl/core/bus.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/cxl/core/bus.c b/drivers/cxl/core/bus.c
index 1320a996220a..f4d5319e29e3 100644
--- a/drivers/cxl/core/bus.c
+++ b/drivers/cxl/core/bus.c
@@ -504,10 +504,8 @@ int devm_cxl_add_decoder(struct device *host, struct cxl_decoder *cxld,
 	if (IS_ERR(cxld))
 		return PTR_ERR(cxld);
 
-	if (cxld->interleave_ways < 1) {
-		rc = -EINVAL;
-		goto err;
-	}
+	if (cxld->interleave_ways < 1)
+		return -EINVAL;
 
 	device_lock(&port->dev);
 	if (list_empty(&port->dports))
@@ -525,7 +523,7 @@ int devm_cxl_add_decoder(struct device *host, struct cxl_decoder *cxld,
 	}
 	device_unlock(&port->dev);
 	if (rc)
-		goto err;
+		return rc;
 
 	dev = &cxld->dev;
 	rc = dev_set_name(dev, "decoder%d.%d", port->id, cxld->id);

base-commit: 036a16a39e2fab9bf7279201d04cf7e90993521f
-- 
2.33.0

