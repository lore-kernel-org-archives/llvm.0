Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55162B9B7
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784498104; cv=none; b=EJtjnM8BMlIaCNYyjnK/XjMDiZ7Ad//2kepLWH987QOhmTOvxTm/S3cVvUrwXrfNtMfTFv6pelAu+e61X1RbU/AfiqxTss46saAzo0Tw0kgHFS058ottrzvHAchoPBPYS53T3UTH5JxIT6jLksXwR84Tdgkvwwjo4lPaA5o3eiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784498104; c=relaxed/simple;
	bh=61vvSIKYM+LWKM6oFYcX3eT/sAmIhKSkc4d74ycVjuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMli+q+u3APlKqDFMBwZXnQJasY7ocYJLxI65l/tSsAyCW522rLejSf+PMpE35ODhWY6Afh+IXlEhHv2GT9l+YbdrEqDTI/uM5D962uVx5Xp1B0avt/e8chR8dIfAg3omQvGlzRijIFphUEl1ch8YLWx5ljZWxGtysObh+kJtR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/tZogOe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/tZogOe"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so5719111a91.0
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498102; x=1785102902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqplnvUpyuLn1RyaGhBCqEh9+v5GI4sy/8jnr2JsNU8=;
        b=K/tZogOeFVFJthvV3O2N6/qpQtKm1KEROyV9wbnQMjjFvJrtD4uOdJNOybaZnlNX1f
         E4jpIQQb7QduA++Ypzs0wAZHo0YM/vQnXvxKt1bScg5aLt6Ud4PDz8WICxNXoe0kLkaR
         r9MHrIHvRCY2j+LGCXZGDYtJ4UPXtRxcCp5JTvH6ySFBSjS/qOcvChweBoS12ngnxxDe
         deQb0tdO+AGJ5hRRunvP4d3URrhmwlFoAt3GHx5/hHcVXAAn5HIIa9d6qM1fVLmQM0hq
         Vwr4HWSCkWvLm1XtPVWfhN8JKAEPjOrYGVXYtlufGOb/L7boHQVub5fogM4CB1UXcIlw
         mMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498102; x=1785102902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqplnvUpyuLn1RyaGhBCqEh9+v5GI4sy/8jnr2JsNU8=;
        b=pGZ0qEIqMRkSMb6FO0FzmZwbxOhivb07ABV35f2rRj2henyn7k0WawqBXqfq14mer3
         G0xmHHlleRod1D7Kz0xBtLN/iY0LkRp5iUXwAiJCJWCx1kz5BT0IGnuZZ1POnE7vi9Dv
         S32FSvz+EjLQs7QAfauc8FJt24tL7cp+BCseV5sTEp8mGHcfnp+eGI70nrzcdlacQ1w8
         mPwpxBkhJldMcq2afCrRsY2MDmyT6cbNqHghRGhvktMxVWrLi9DupVIy1BwHRWXX5CTk
         burkDN+FBDHFC8tc2age6OSt4KbvM+ocYmbI6yJBtzFsIEA3eUQdU5mmCucgGE+efrYH
         7X8g==
X-Forwarded-Encrypted: i=1; AHgh+RpG1zWQBQjyt1jEA8zQoBvpHlubGs5dfLzL23uuV/urqYiuq2iKpwpHh/TyoHhrp/xjwrbO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz35pcPzwGRfPSi7+SOBOCyXdZ4sQg0JhzM7rrtVmtkeeFqK/9/
	WKyD5ZjZpr0nfUnjjks+naVEJlvgetUT0uQASD/mSbvlrT2Kt0DPNgI2
X-Gm-Gg: AfdE7ckXCPe1F295vDOgAXo1gD775OXkGYJYBjoj4fywsriI9DcsDqAO1Qdriq5T835
	vSStaUsQSKLU2qwrX+z6LSAvNMLZ3eqQ17AVVoHYj+IpXtW1C8z7VKBmZtLZiiDn6aq8WV0v5Wt
	OIqI3fV2Eta6dgfy4x4c+qEMM96w6Ay9OGQNMfEGnlpKiQTCuwfxV/7hNc/3EoESu8yCkDD9e2d
	cbPET0ZVAtRrLHv8LFL1nLfKCs0qdkjmd7utLGE5iLuMf2kF640ls8S8faK/3yWW2vu7V44OCgb
	yGS5ckZE0g3G7A4XFTUiab4Wt8iwXn1UlWDcCVoa8+xuYRSFZWVwTcIvJoVWfyKpBfIamuR9mip
	ZYVH7wieI8o7kCe/x9ZWXN9UbNaTV72HDFDdSzVhkRu3xHbNiQQ/CALMQldeUMzkGBQefW2Cq5e
	dyddZMJ7l7SakbwxNx/yH2Qph0cuUA24+DZ5nG2lhZM7GybJF56qKpm/r+b04DpHHN5LClHW3ZO
	In6hiZZhanNNdtjwUCLI8fNWmMXgs/hauNLCp7j/ByFZprtUM+exS4=
X-Received: by 2002:a17:90b:2dc1:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-38e4b5166b7mr11097602a91.20.1784498102013;
        Sun, 19 Jul 2026 14:55:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afd2dd6sm4574677a91.4.2026.07.19.14.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:54:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: hisilicon: hi3660-stub: use devm_platform_ioremap_resource
Date: Sun, 19 Jul 2026 14:54:56 -0700
Message-ID: <20260719215456.787188-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with devm_platform_ioremap_resource(), which fetches the
resource, requests the region and maps it in one call. Switch the error
check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
pointer.

The only in-tree user (stub_clock@e896b500 in hi3660.dtsi) has a single
0x100-byte reg region, so the region reservation added by
devm_ioremap_resource() is exclusive and does not introduce overlap
failures.

Built for ARM (drivers/clk/hisilicon/clk-hi3660-stub.o) with LLVM=1.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 7c8b00ee6019..1b81f26670ed 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -124,7 +124,6 @@ static struct clk_hw *hi3660_stub_clk_hw_get(struct of_phandle_args *clkspec,
 static int hi3660_stub_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 
@@ -139,12 +138,9 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(stub_clk_chan.mbox))
 		return PTR_ERR(stub_clk_chan.mbox);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	freq_reg = devm_ioremap(dev, res->start, resource_size(res));
-	if (!freq_reg)
-		return -ENOMEM;
+	freq_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(freq_reg))
+		return PTR_ERR(freq_reg);
 
 	freq_reg += HI3660_STUB_CLOCK_DATA;
 
-- 
2.55.0

