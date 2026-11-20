Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202706;
	b=VLoMuB77nfYGGm9oe7o4NSAlw2id+jWICUpMP7iRrLLQoRniofTzW8f+Qa1+TJF104UU
	 Q4bNZn2V5SzkDWtxkg0h8tz1vMHe7+m5CXj1FymfPkx6UnzLKBlV1wmc3kSnpFxosCgtp
	 Z6+p0X0OODNuteCmu1PSXfJDdDbbRR68j9Tjt09gdD+zZ/mx7dv9hNsNVibkNf4h72Shn
	 gTEBY4gNnP6VA3uK/HJdtByLGiTSZkP8TJ1+1HvsLr6bbzlzbCpereB+aILvsw35CyWOf
	 HzmEF5IKNDOWEz1UtOVxf02Kiqaijq3rApOyFd/N6jLyjLe09TBDoCZ02V/bH2REhvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
	b=xgTusCLBM6ZZHk47MEyhDEpZ3YQqW6qHTbk7iqRNpzbGGsVvsxjXmxe8j+A5fzC416Fn
	 BANwNCEiWCNaC+j0AFfgGGuf5qHXduGe2qtrYRxE/X7te53pU8Mg2HLRSHqtidhLWJOGK
	 /+KMvqgDcdNAI9z2ZgWH6I7IyRzavl1XP6TqwwxMrJh3hXRrPYrCg5E6gre5xT9NDFr65
	 99prnaRVNFpkYzfqtNrIDbY6/jt78dqLIgaxhMogjhxR6OfxWyNQtJ06rxAG94fuRca7V
	 bi6r8nKnZEsy6WD0s2b/43/oOCjH8UXMkPMIqXNBR+qzaL/Z8thw6xwHFbRnYlRvR0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kcJD0qOH;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911D606A6F7
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6911D606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kcJD0qOH
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso1370565eec.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202702; x=1795807502; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
        b=kcJD0qOHeUq4wfTFzRrVf34FalEGHMyrUpJamFLmpyf1H0Mc3d5oBJ2Uemn5wuwoxY
         Km6lzPLiWOHdWOSb2xWVhg7FvfESUeThhzPJnCMdc5dBCKssBmFmhS2oYbV1cqg4qBPd
         pfU3vdtiAXtdw5ut7QGZ/NxWhSF2k35f07XqAztfu23y8Cr0CzM22P35pRb50gHapXXN
         dlwmtnccyFT/5Rwfi0nPXYKxyzpHqD8lAXKtE2q9Q9qeJufNiP7aNMK9Hzd7ari5/PsL
         S8ZvuZQ76D3XPsnoim8QdkPsPhIC4jZFRCbR47hyn3ix7iQYT+0/Kqj9xGKFNAF57wW0
         Fx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202702; x=1795807502;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
        b=o2wwf69zCVxKymwO3npmtmFd6Ck25q6ePsTS/AlKuRmlQmJq0+elSZ5bWq5Lu0Ssfj
         Zu6ChbphpFH86tGCNRFk3DwozBDedaam1RGhKczvEpUShgvChbS35mDou76Eay8csb8E
         evS0IqDbF7CR68opJslWdr+7PFwoWqhZYEVl3Ds5/qaCHuFgAUmci4sRKVeZt/aELLYK
         SvqutjmjFv/msevUnfhA8tdZ31Zj3Tpb+TRPD4sok/sBZzyz8m1WSs+TXfD2GxYzcv/0
         27eheA5RNKnbww/FCT6LDy9D8UxrQGH4zWdIQg7u5TdDmG6tnvrKo/NjbE4X1SgldQNR
         8NPw==
X-Forwarded-Encrypted: i=1; AL+hErEYhQSv9/YiyUBdbmAAXdXD9qkpcTtbHjDwG7t5D1dut9pwlx4SbbTn1fTEZt1HEMf4XvrM@lists.linux.dev
X-Gm-Message-State: APuU4Z9IrDwPPCYbMb90Qmt/i3rJkCeGLcc9icFQGodVkYjwqEhwWtZI
	a3QxXmKJ5rEA6jMyZf6tUza7aGofTEtfFlu3IKlwCP8w8huZpXCh0vUjCNYGR12HH433pCTW12g
	5WA==
X-Received: from dlx4.prod.google.com ([2002:a05:7022:84:b0:1b2:63d2:5906])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2608:b0:15b:afce:62c2
 with SMTP id a92af1059eb24-1b55691337bmr3351862c88.41.1795202701742; Fri, 20
 Nov 2026 11:25:01 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:46 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192446.2874087-1-elkin@google.com>
Subject: [PATCH] drm/msm/a6xx: fix error unwind in a6xx_gmu_wrapper_init()
From: Elkin Cruz <elkin@google.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

a6xx_gmu_wrapper_init() has three error-unwind bugs when initialization
fails before gmu->initialized = true:
1) When a6xx_gmu_get_mmio() returns an ERR_PTR, goto err_mmio passes
the error pointer directly to iounmap(gmu->mmio). Jump to err_clk
instead.
2) When dev_pm_domain_attach_by_name(gmu->dev, "gx") returns an ERR_PTR
(such as -EPROBE_DEFER), goto err_mmio skips detach_cxpd, leaking the
attached gmu->cxpd domain and its runtime PM device link. Jump to
detach_cxpd instead.
3) err_clk: drops the gmu->dev reference without calling
pm_runtime_disable(gmu->dev) to balance pm_runtime_enable(gmu->dev),
causing an unbalanced pm_runtime_enable() warning on the surviving
GMU platform device across -EPROBE_DEFER retries. Call
pm_runtime_disable(gmu->dev) at err_clk: before put_device(gmu->dev).

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Fixes: 15cc59ac954e ("drm/msm/a6xx: Add support for Adreno 612")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a1561ca41a5b..7f6932d7200a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2290,7 +2290,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
-		goto err_mmio;
+		goto err_clk;
 	}
 
 	res = platform_get_resource_byname(gpu->pdev, IORESOURCE_MEM, "kgsl_3d0_reg_memory");
@@ -2321,7 +2321,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
+		goto detach_cxpd;
 	}
 
 	gmu->initialized = true;
@@ -2335,6 +2335,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	iounmap(gmu->mmio);
 
 err_clk:
+	pm_runtime_disable(gmu->dev);
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
-- 
2.56.1.750.gf70dc682cf-goog

