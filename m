Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B033845DC
	for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 23:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985294; cv=none; b=UV6H3ZmL2JO7KIq5Qpp76UMecl5wQ/Q9eSd7TI+g86+t9YXTxQ2nVl2oGUKDsOoDP0gAKEAoTIGo6Lm8AYD/Zi+1kHLeFJO8qkMC8fBu11mhiaAXrVLhW2+/h2dUPYGX3AYYzquzma6Q2b+EeBsEgFhGMBYu9lB+buGNQSq9Nfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985294; c=relaxed/simple;
	bh=aaIoKxerYazpmbZIApAxA9/aIMa5XXLt9MueI3ppcgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJ9QZfhcw4vYo0CvrcvMHdOHkIulH0I/lAECo3eomI0VUDtv+oj5MuQAUljIol2wQFaWLZgaDbdKc2mMzfHWfdZItyLPqYCtmP65Hz2nK5i6jEBu+1l1suNLhGz6ATskpNsghJK/C8skDxueikQxnamkYM17KPbeO901mQCo9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VifRhdTB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VifRhdTB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caea3f742bso41435685ad.0
        for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 16:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783985292; x=1784590092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z60C7Uy39FpdZ+RfV4gWz/iQ2OV7+l8hzFbxcfqVBdM=;
        b=VifRhdTBm17naCWwoS8nCE5U/1AfyaDUtsaQlq3BqF4yCRWNinQifhiy2yv6SUiPg1
         0IQYALkh8ZEh/IFTG2j0aKLUzWUIAgEIg+tD+HNLH7D+0sZsU4/aAorFSe4MdYRDTCMs
         Lo+fLWIfBbL43QSYa5d5kZvmjzKuVe4Z6Pl3zP29UrxpYUUQ5hMKLUMpmiydA8dKZyBI
         GsXhz/MxfRexyypd/ROIhTbAu27rWibNF2HEDAXVJxaNHaySbcWw4SeO5wGupkturYb+
         YBsKvnNmznHZWzUi++De4bZ8EwPm+SxkaAgo+cFF7hiXriLaN9P+k2blXH6wc4HoYO9a
         3e2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985292; x=1784590092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z60C7Uy39FpdZ+RfV4gWz/iQ2OV7+l8hzFbxcfqVBdM=;
        b=f7F+9PqqwyN/NZJ9pf3k4zuCr+dfaLnhEhMFV4xEt7pzQOvQgo27pzxuT+5NWOjxqf
         l1Vm+voG9BxZaCKOcwg9ZxmU/wh+WNypRst47sCtAn6BPGeVjBVxqBTXh1TqGmCjpgTO
         ViqBAjgNpntdCuCmksGEAOc69D86JL/P2AtE5Eu0nB2pc/OX+ZcdbhyhAi1iR9BEb5Mr
         CypeB5opDH5Ke4+GBnhU1KcRA5CzDeegXU+7mm5jt1VK7RHzklOM3NLF0FWxISRBHN9s
         9GRjlm3GzOMozVGJ6uY7EI4NlvL0xLGfx70grUU3kwxYCM9HBR/coijJF3dzqyEFIYof
         BwaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpClirrYahyuwZTWhg/sD5ZpyAdJ2mAKBYmM9Ad7aPMQX2U3DJrVbI0ckmVMBPJw1yvGzEA@lists.linux.dev
X-Gm-Message-State: AOJu0YzDUm29ZUsoIhBeS5k7c/n4KP8CFbPGuBaHh/fmYyrS6jocirGK
	EUuHAo8jDg9oRSBuplzcoFM9NuzGc0KbGLa/FV7876fw7xTUzhFgFfh+
X-Gm-Gg: AfdE7ckFBp7SkQedMerAMMzH7MWX+I+zMrsjhE5nM2IiPQHR3UzN86/zQPs/wVBnYQf
	tomrkzbQEIbk472WU4iuN5dQzFJGvvT2zpcIM4jrwwGdWB8M6nWFEhGkvg02zNaizU2PB3pacaA
	b0IT3q4pHC3ApbSx2eXQRF3noRo1OYewbUA1Oi3kugqJHaoCztuaDFfodFMgGdD1U4+Y4SBvt7X
	rV06nq6+fzky+THXJ2kUjApFkMCLdFR8TUx0GNvRdH5OGBYiJ3Qf6naZMm4rihiji5SqdTwvZym
	PQkPfLm7GS8yY74E7FMMKgJZMF8QJeh1TkjBfpVX2ld50yGrtFXzO2k7LLYcLLOHStwN1uBTjOr
	pSvcFThF+JZkSiQmcfIte4qXc7oZM8ZSaNWt+pnTLGSZtNtGxqlPBJmmrEQkEuPQftZfVuj+LfY
	DXkr8ZAsq5y9CdyNrtioWPxrZFLqrpeY4R+Ln0yU8VvlO6bwnf1PX3sqHfx3eqadZDeLVmzYmZ5
	HOFOLcK2sBbYEehBfiBwmD62ndEL7jd5/MauBwwCsOY43I8bEi/Q3UBmnZNeVRHqA==
X-Received: by 2002:a17:903:b4f:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2ce9f1867b9mr109279595ad.40.1783985292371;
        Mon, 13 Jul 2026 16:28:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb877sm105340885ad.14.2026.07.13.16.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:28:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Michael Buesch <m@bues.ch>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: bt8xx: use devm_ioremap_resource()
Date: Mon, 13 Jul 2026 16:28:10 -0700
Message-ID: <20260713232810.1144712-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded devm_request_mem_region() plus devm_ioremap()
sequence with a single devm_ioremap_resource() call on the BAR0 resource.
This reserves the region and maps it in one step, and maps the full BAR
length instead of a hardcoded 0x1000 (BAR0 on the bt848/878 is a 4KB
register block, so the mapped size is unchanged).

devm_ioremap_resource() returns an ERR_PTR on failure, so check with
IS_ERR() and propagate PTR_ERR(). Drop the now-redundant error message,
as devm_ioremap_resource() already logs on every failure path. Since it
can return -EPROBE_DEFER, place it early.

Built for ARM (defconfig + CONFIG_GPIO_BT8XX) with LLVM=1;
drivers/gpio/gpio-bt8xx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-bt8xx.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 324eeb77dbd5..f3a2321bc388 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -154,12 +154,18 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 			const struct pci_device_id *pci_id)
 {
 	struct bt8xxgpio *bg;
+	void __iomem *mmio;
 	int err;
 
+	mmio = devm_ioremap_resource(&dev->dev, pci_resource_n(dev, 0));
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
 	bg = devm_kzalloc(&dev->dev, sizeof(struct bt8xxgpio), GFP_KERNEL);
 	if (!bg)
 		return -ENOMEM;
 
+	bg->mmio = mmio;
 	bg->pdev = dev;
 	spin_lock_init(&bg->lock);
 
@@ -168,24 +174,9 @@ static int bt8xxgpio_probe(struct pci_dev *dev,
 		dev_err(&dev->dev, "can't enable device.\n");
 		return err;
 	}
-	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 0),
-				pci_resource_len(dev, 0),
-				"bt8xxgpio")) {
-		dev_warn(&dev->dev, "can't request iomem (0x%llx).\n",
-		       (unsigned long long)pci_resource_start(dev, 0));
-		err = -EBUSY;
-		goto err_disable;
-	}
 	pci_set_master(dev);
 	pci_set_drvdata(dev, bg);
 
-	bg->mmio = devm_ioremap(&dev->dev, pci_resource_start(dev, 0), 0x1000);
-	if (!bg->mmio) {
-		dev_err(&dev->dev, "ioremap() failed\n");
-		err = -EIO;
-		goto err_disable;
-	}
-
 	/* Disable interrupts */
 	bgwrite(0, BT848_INT_MASK);
 
-- 
2.55.0

