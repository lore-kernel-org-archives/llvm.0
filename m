Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00A1DF26E
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758205681; cv=none; b=gMJNNiwDMbaZsbPDgDaQ8aygcV49w+18ZVlSaJwQnpHhAN2RBamJBabOYJ7WsI65/FxSmceuotOZ6r7W64AgykEOw/ZjDKzKpAx2cynndt9Tf/qVOaZwZx/oHC1waEWhv0FHR2Prj7WvuQ7Fo6R1RsvOSfO46L2GG2gmTqIEyfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758205681; c=relaxed/simple;
	bh=iaDzhMt30kkO2psD8Qizcph3nBLEmFFYpS976P2x6UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=due/7KwH+CunU2P7yj9kNuSpphMxXQAXhnbfpTfDxD477BdF0seDztkLYgYyhqiOKQ6bS77EBDnH/yn9J23qfWKdr2qUUmpf6RM7Plb3vzBxznIxUqbiivWf5PHrOtEkV6LGNH2OhcjaPUH6dSZxz9IiIIP026jhqTB1FCPfY3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Ojv2C0pO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ojv2C0pO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77615d6af4fso1506080b3a.3
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758205679; x=1758810479; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRxrR61lHi8YfDjlJ2Swbohv7CSI8Q1KLjlvrovFA64=;
        b=Ojv2C0pOo+vFjIo23urzRJO7YLsWNg6C43EPr1UKpLZ/bu7hMI1wsNpcY4ZoExdLYP
         bIM5D7Q9+XJJKVhp/RfQTBAHMd+PQM36GRmZ0D0Y9vjskYFENwuyatgbMwcPJCejw6sm
         f3oQ+UHY8uOEHlZ6Xc4ku7q9jvqccgfB3swJQirVeuPX5khku5UD7JuqRgQw9jMzx1C+
         Tre6CX+Ptac1pA8ieZzqtq8oAtdhtvFfRIeXTkozqdOTO0Y4OT1jbobisECdbl9fsdwC
         U5H/mW1Ay1xgcqrJwIShE8bQjK0Nm8bjQnINgGSmKrQ7Jvmjg0rYVaNeCemV/b5oh1KG
         mAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205679; x=1758810479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRxrR61lHi8YfDjlJ2Swbohv7CSI8Q1KLjlvrovFA64=;
        b=jz3Do+Pkzr299y4D6MsAiNv4XXdsdAapCecZQNQytolrUXObXKUvK3oW9TZYIRw7jC
         JTOE92kzNKfsP0853DpzjEhlYfoAznB5rYBGr6eeS2XjVu7ts5F4grNMutcChq4viNdH
         kINM9GSJwMN6g0i58+m/vI/DQ4bx4O4pIWQ4QXLT93ElRSXPRxG9G2EJeZ6Jay63lIjv
         RhZidzaYv8jvU+Ss7PR+rU66aWuY0AU86/isk8ejtnIcEWS8j9pC/hMz1VKM5LJ4M0UP
         ++UMTKe5bFj/jW1aom45XinjPUnu5g6euigaLr8Dks8fv3Vy2DPoS69Y9GowtZelMdqf
         lDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX38Wct8AukCRleiVI3pYbA6+0VRtkhOvSALiWYes9DNmMpuuLx6n10Og8lo0iC13gPYhpf@lists.linux.dev
X-Gm-Message-State: AOJu0YyEOXFcSGm7E/TxJT2grxG0o4uXDlEw/igR/Jbqeeyw5eN/beVG
	wGfc+yY0lmkyc+RKU/5vRePC0DmBHUKRN9t2MSVUq4vCeKpFHVVxAf84cPVWPzXe1Wk=
X-Gm-Gg: ASbGncthxCRUiJCINoBIjm1kuvI0xYXkzukv9+3NSUWzdj198XBy+BNl8FV+6GRD6Qj
	YiPXfgdhDt+wfAkMV0YLNcaBG2zb3NCzVfK5fEWQ9wc1qxm3EpZN7fRS/6h+hBTtYY/kEjiEBeI
	+gismBxvLHw15UkPFiNod3y/Jlc0ymAhpqgVh7PQOJkr5HI9EbFA8GMtdUNQtjqN8NC8q++LRTO
	4yyMcDaxdvTt8CuNnHw78Btr3YyDvsKCEJ05DfFPg1MFJT1xgce+y1JVlKCaTDOuPXF714FiTOR
	65xyLBrWCbcxCRGWSL06qGCgDCFjVqL1ej7bc8mVkNtlMEHl43Vwfi7mUhx5SfkPgfiwnOZQ7f8
	1ggkVdec0ZgqSzt2V8CR9kB8Sc1O6hiTVGt6rAZeoDX8kK9EkQVIXqSFqbCA9gxgOqSs/uPRa
X-Google-Smtp-Source: AGHT+IGX3ygannk3UQBorLwV5GVyyCXVYSV22MwTihX9JUHF1ySlKjIfi3SugfECASUEvkieA77bUg==
X-Received: by 2002:a05:6a20:7347:b0:262:23dd:2e93 with SMTP id adf61e73a8af0-27a798c703bmr9010621637.0.1758205678719;
        Thu, 18 Sep 2025 07:27:58 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff447060sm2460614a12.53.2025.09.18.07.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:27:58 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 18 Sep 2025 22:27:27 +0800
Subject: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAM4WzGgC/yXNyw7CIBCF4VdpZi0JCqWXVzFdwDDUSaStUI2m6
 buLdvmdxfk3yJSYMvTVBolenHmeCs6nCvBmp5EE+2K4yEstO6lFjItYfLQic1zuHD7iB+t9opx
 5GkUwloJUJBtUUG6WRIHf/8R1OJzo8Syl9RjB2UwC5xh57StE6SxaNJ6axigrVVvXEoNW6Dptl
 Patow49DPv+BbKbtO++AAAA
X-Change-ID: 20250904-mmp-pdma-simplify-dma-addressing-f6aef03e07c3
To: Vinod Koul <vkoul@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, elder@riscstar.com, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
of declaring the hardware's fixed addressing capability. A cleaner and
more correct approach is to define the mask directly based on the hardware
limitations.

The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
all of which are 32-bit systems.

This patch simplifies the driver's logic by replacing the 'u64 dma_mask'
field with a simpler 'u32 dma_width' to store the addressing capability
in bits. The complex if/else block in probe() is then replaced with a
single, clear call to dma_set_mask_and_coherent(). This sets a fixed
32-bit DMA mask for "marvell,pdma-1.0" and a 64-bit mask for
"spacemit,k1-pdma," matching each device's hardware capabilities.

Finally, this change also works around a specific build error encountered
with clang-20 on x86_64 allyesconfig. The shift-count-overflow error is
caused by a known clang compiler issue where the DMA_BIT_MASK(n) macro's
ternary operator is not correctly evaluated in static initializers. By
moving the macro's evaluation into the probe() function, the driver avoids
this compiler bug.

Fixes: 5cfe585d8624 ("dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Hi Vinod, Arnd, and all,

This patch fixes a build failure in the mmp_pdma driver when using
clang-20, as reported by Naresh Kamboju [1]. The error,
a -Wshift-count-overflow warning, is caused by a known issue in the clang
compiler. When the DMA_BIT_MASK(64) macro is used in a static initializer,
it triggers a long-standing bug in how clang evaluates compile-time
constants [2, 3]. Thanks to Nathan Chancellor for providing these links.

While investigating this, Arnd Bergmann pointed out that the driver's
logic for setting the DMA mask was unnecessarily complex. This logic,
which was inherited from the original Marvel PDMA driver when adding
support for SpacemiT K1 DMA, could be simplified. A better solution is to
set each device's DMA mask directly based on its hardware capability.

This patch implements Arnd's suggestion. It refactors the driver to store
the controller's DMA width (either 32 or 64 bits) and generates the mask
at runtime within the probe() function.

This approach also avoids the clang false error reporting.

This patch is based on dmaengine.git next [4].

Thanks,
Guodong Xu

[1] https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com/
[2] https://github.com/ClangBuiltLinux/linux/issues/92
[3] https://github.com/llvm/llvm-project/issues/38137
[4] https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
---
 drivers/dma/mmp_pdma.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index d07229a748868b8115892c63c54c16130d88e326..86661eb3cde1ff6d6d8f02b6f0d4142878b5a890 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -152,8 +152,8 @@ struct mmp_pdma_phy {
  *
  * Controller Configuration:
  * @run_bits:   Control bits in DCSR register for channel start/stop
- * @dma_mask:   DMA addressing capability of controller. 0 to use OF/platform
- *              settings, or explicit mask like DMA_BIT_MASK(32/64)
+ * @dma_width:  DMA addressing width in bits (32 or 64). Determines the
+ *              DMA mask capability of the controller hardware.
  */
 struct mmp_pdma_ops {
 	/* Hardware Register Operations */
@@ -173,7 +173,7 @@ struct mmp_pdma_ops {
 
 	/* Controller Configuration */
 	u32 run_bits;
-	u64 dma_mask;
+	u32 dma_width;
 };
 
 struct mmp_pdma_device {
@@ -1172,7 +1172,7 @@ static const struct mmp_pdma_ops marvell_pdma_v1_ops = {
 	.get_desc_src_addr = get_desc_src_addr_32,
 	.get_desc_dst_addr = get_desc_dst_addr_32,
 	.run_bits = (DCSR_RUN),
-	.dma_mask = 0,			/* let OF/platform set DMA mask */
+	.dma_width = 32,
 };
 
 static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
@@ -1185,7 +1185,7 @@ static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
 	.get_desc_src_addr = get_desc_src_addr_64,
 	.get_desc_dst_addr = get_desc_dst_addr_64,
 	.run_bits = (DCSR_RUN | DCSR_LPAEEN),
-	.dma_mask = DMA_BIT_MASK(64),	/* force 64-bit DMA addr capability */
+	.dma_width = 64,
 };
 
 static const struct of_device_id mmp_pdma_dt_ids[] = {
@@ -1314,13 +1314,9 @@ static int mmp_pdma_probe(struct platform_device *op)
 	pdev->device.directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
 	pdev->device.residue_granularity = DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
 
-	/* Set DMA mask based on ops->dma_mask, or OF/platform */
-	if (pdev->ops->dma_mask)
-		dma_set_mask(pdev->dev, pdev->ops->dma_mask);
-	else if (pdev->dev->coherent_dma_mask)
-		dma_set_mask(pdev->dev, pdev->dev->coherent_dma_mask);
-	else
-		dma_set_mask(pdev->dev, DMA_BIT_MASK(64));
+	/* Set DMA mask based on controller hardware capabilities */
+	dma_set_mask_and_coherent(pdev->dev,
+				  DMA_BIT_MASK(pdev->ops->dma_width));
 
 	ret = dma_async_device_register(&pdev->device);
 	if (ret) {

---
base-commit: cc0bacac6de7763a038550cf43cb94634d8be9cd
change-id: 20250904-mmp-pdma-simplify-dma-addressing-f6aef03e07c3

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

