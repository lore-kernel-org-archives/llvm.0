Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ABA18DB35
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 01:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931871; cv=none; b=NpjUJR4hx4ftND2uQqweokYdorrfEPpTm0def4umOfijNvs2Xwj0mNCf0JrbavMS3ffgnpZ/mZl79FzZeeTKaAT411EydxaVWlB73EyN+JKI3GJSioiCingdBPmgaTbtBIcQatU8+qAnF01dd8WwYxmkjRNyvurp0Qr2E9vQztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931871; c=relaxed/simple;
	bh=Hz4ObJV+aM2uhAt/A/zHmZJqxzUXNUNqj/B6kGUdPI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITailq0q/XSu/L4msZaDR1y6GLk2KlwhvPfzKeIJkn4ta25z12g9pd7JZzABhoyU3DR/j4DyujfGrstprop+IdhSPITAToLkL3In4UvYaNJm186jua87tzvTy6pr4zeXxcLrWc46Omf9D4K1uw4L7wV+Ef7hkpoX+dZ1a2BhcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6Gj0v44; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6Gj0v44"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1857134a91.3
        for <llvm@lists.linux.dev>; Sun, 16 Aug 2026 18:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786931870; x=1787536670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qno0hu8R5c/iO9pOePKA/0ucg9v1/4p0E3krT4EeorE=;
        b=q6Gj0v44hEMfgXAU+cJ2tkFzYPxxTZDB70/OiqnMGLxm/ft4d95QedP/e5Xy+dhFe2
         Pi20Y+jv6V6+4dpsU1/232wRxFoPsscwZP8Oe08yTSDP3pT3v7lZhjqbwc6yZqDtTugJ
         xGgdVZKL01JNatdKuoPdJhcp7iarAN1qiEvKei1nydK+pWnSO1SWRevimtXLWKcO+Dwl
         yd3RVhQTx8i9q5AgqK64GSOV2IPwbskw34KrzlJV5Rjaqrz/sm+iQQzCSuKWG2QhRyL+
         weJxquS/f0Ss4pQ7PJQK0uh1WIAKZ50w6unP2/+dzhioQVDpT5A9ORXKwQb/gCh0p0io
         nZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786931870; x=1787536670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qno0hu8R5c/iO9pOePKA/0ucg9v1/4p0E3krT4EeorE=;
        b=kid33nzQpWhNaXb7Whn1HhMGYTmtuX09CCZ02Ls0CBTp3Xz/jUJ/0L600ErA7yNVBq
         s+a1RUsahONRsJcj/B3BDDKdu1yjuN/J7F+A1keyd7RvmFYmAOFp1KMsjSdvvg68BFGZ
         LD07kOCFSIX8znKz7BZDqgXsBbtNB6grTlv4wxAxoCnL11Xx8xb7OQcgKBBMGHmWktGK
         eBRAnT3g7MWcA1hiaXCWTI734g76yTbGLyvKgSf+FVH/kJyK4beEP8CAMtBLaZeXJQ9H
         9HPKhuRuHAsNE5lcRk4bTM7ziHPag9EsQI6qB4jSFTSlfrBUq+ZTblvAg+CecYwkHOIE
         DpVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2dADhP8DTsu1m74TYF9aYqUNWX2F1sPrhPZD4xkyQmkd6nZuC4U9l/QDW106DsCpbJ36e@lists.linux.dev
X-Gm-Message-State: AOJu0YxxbU3Z9F9xY2LHS4NEVirg2Pi98htTIfa4G4CnKINOLiiLsReb
	0jgoNZCtelSU97KmLiD1aFF18b0CzsGczODk6cMUlvQTRQDdNLBrbbDL
X-Gm-Gg: AR+sD11BQcqDUT79LWo6xgdD3ryqd/ZRH/IZrLZSp4icdVtTgZDegiEPBn+g9j9Sw0m
	knpVhZk+0RcTGt3khiQLnwgiFtkxiTL6Zr8SbwovlZDtLnRXk8rke0mM+WppqxTuPVLQlnl35+R
	G9DbKGCaFZilTEbQortAWOgVnVCeRyM92LH7HXOMohItZfGakhW1VaiJu6SB66OKjSMh29dx3vv
	u01tO+kk3JH2Aprf7wZPpJP8xXmktF8+qloDa9bo2WvrkdyGqQcxntmwxtZsBSQqOIcsqLr2PoF
	RjE3+v0BOaOGf1WjEVfde5bY+4wDpdwZ0YYU9G+PYHHMvCMRWSh9DpCIV5l6hBSJVBX1gfe8od5
	L9fZwJAwm1ZnMu1M5tg9iu2x5w+mWF0QpBKnTEMS6nm1GhkN74gYswppZX4upMqnGyA0o+8l416
	JbdG39kQwNws2yCP2wpFqCPldsPySBwav9OsDyoEFM2PBKTVbGo2s8np/WNBaoTSILdMAS57eHk
	4Kgw8m6eLizs4EGYtE0H/LMjSMazcQVDA6KDSiC0s9SMgcvY2rPwFNTaMFpkO4j7OVNEdXZED/m
	ZmaHZ/6xafBgQPNoIjsZSbiH0TTJ0sDrJ5caBJZhzC08Q3liZg==
X-Received: by 2002:a17:90b:1d45:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3933b7c3b71mr22482431a91.1.1786931869565;
        Sun, 16 Aug 2026 18:57:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b68adefsm4249481a91.3.2026.08.16.18.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:57:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] dmaengine: bestcomm: ata: drop unused inc local
Date: Sun, 16 Aug 2026 18:57:47 -0700
Message-ID: <20260817015747.136689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
was never read, tripping clang -Wunused-but-set-variable:

  drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
  used [-Werror,-Wunused-but-set-variable]
     58 |         struct bcom_ata_inc *inc;
        |                              ^

Drop the declaration and the bcom_task_inc() call that fed it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/ata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
index 502a45d76adc..40126f3f189e 100644
--- a/drivers/dma/bestcomm/ata.c
+++ b/drivers/dma/bestcomm/ata.c
@@ -55,7 +55,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 {
 	struct bcom_task *tsk;
 	struct bcom_ata_var *var;
-	struct bcom_ata_inc *inc;
 
 	/* Prefetch breaks ATA DMA.  Turn it off for ATA DMA */
 	bcom_disable_prefetch();
@@ -69,7 +68,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 	bcom_ata_reset_bd(tsk);
 
 	var = (struct bcom_ata_var *) bcom_task_var(tsk->tasknum);
-	inc = (struct bcom_ata_inc *) bcom_task_inc(tsk->tasknum);
 
 	if (bcom_load_image(tsk->tasknum, bcom_ata_task)) {
 		bcom_task_free(tsk);
-- 
2.55.0

