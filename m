Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82127274652
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617024; cv=none; b=jdvYJfAG+72K8D8xBN46+ZeaAk4wOMgEgRJUGmAuZyJ5n4yTRklejs/uWthDioaLmQS5IhfzmBFwWSyXNoZHUBSSBtYDrqwFefvS5KAH/dpz2mmRE07iUWu40B3qF9dj3sYqL5+Ex+slydOTe83mYUl8gNEKvZqwog/Nq4G7JQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617024; c=relaxed/simple;
	bh=97qM24lBz73MTGs2Ev7Dn8ABPmphQjfBKXokj6vSwKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eu50OQDZoEnF5mMwahhTjQFrTEidSHXG/tjl7vghM0leZwdoJa1JWON9uGYHGV8XDiDNs1cMOYicZBLJEHwWIwWEjtpEpMNZ4qeLaZ4Ah8rPhU3sTGHYZwNkOJ815rNXAhy+hqQvHNSgOHtqOC1SmBkYUfXIKyPCZQ9EP6z3irQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kubAm3/o; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kubAm3/o"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso1852009a91.2
        for <llvm@lists.linux.dev>; Tue, 12 May 2026 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778617021; x=1779221821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fioO7dt+DtRipfouwWizM+WF82w1PhyP2cJ94Qb6G0o=;
        b=kubAm3/o2LM1ABfEP8iPSkrVM7drD1EQxOo032Ce8bFb6yPUcM31eCYL5gEhEGr8Hy
         zoUo2aDjBpuMdF0MQ/daTGjSkGxlzW799suB17vpZk1OrwoCQpIgMflJYQotuTUPZwgY
         CQAUxtCAXgJSDb0uxnwl6IZtm+F2hDVfXDuN+LURXxgrQQVoq9pyPQTTFoly7Vl/oouO
         vrD0Tw7DwIRx7gxyiDbWaW/1phpMwVO1GnUtDPW3sJOI+g9og4Jxy2kBu50ns1eS7E/r
         9dFSqhv39QR2w1kpgxSbRyPeJtx2QLlA7mhPixUC8BbXTHU4gGfetqZzWNh0uxp2/Dor
         nTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617021; x=1779221821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fioO7dt+DtRipfouwWizM+WF82w1PhyP2cJ94Qb6G0o=;
        b=d4HrCBDzE1myzoB61MMe1YevQmHsH1x+G5+c6G1qPqsH1Y3FSQA1ezU0fkRUVafupW
         P5ZOOya6NfmmiZgQnss5Oi385XoZRu9eTrQ58bsbxppEpeABhIUEtiH/7SvETQwEH4xw
         g/UrMRZ8qRt3fIhcaCTpd+TYhzG2mTyF51u+YtcexCtFSON+XPySc9pMga2nLCkatrsr
         y0Shj+zgiYnFByRff5Kh0+jLS5hvlwx7Xee+YtenRmZyd9MOhSvXUNoNERPOT2Izh5Kt
         TiVHKGRdbcfSlPOSJNYINaiSUVehB6FN0OtwZY531m3UH7ltsq3kCEHXTx5eAUqF61ew
         mCCg==
X-Forwarded-Encrypted: i=1; AFNElJ8gj1XPs14yBJwejVK4idYA7+aSanLNTXE6rgP3NHS2lDCm4urcRMyucB8fn5eWvjaRbHD1@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6jri1Ok0E+59lHDFExAQAWTOeU8jQ+33nUip2Y3Iv+WZ0KIeg
	lmRGZIeG6BzVVQM1WrlTY3SX726iqDxn1bxha4ecFCmHGitx1thQZNvq
X-Gm-Gg: Acq92OHVQmkE2p2I0q/ziD01Snyk7JL3E5ovdQGKr8CkHh/x564hoAGfdb2FdxLjNfz
	qp1Mx1qXAA4EJJXIWrwIIDU1pXZpDvv2mu3b9ab/cB61ZPI66GPvunVCspJs13nfYc9WYJB7CXb
	wPWB0fMirPUWxSc4/LJ8nNhvrib39Y15N3VLatfwvg+zk2b5g/z2+ueXOo341bOX8VoJDAgEgJs
	ll7grzSRl46zCIvLbiVTb44P/9ijqUEqRr7KD+CzYrwsV9/KTbHDTlcDjx5qkG9YfShU3gyk7Qg
	77vyCBTWNvvl/zPCxITlC4UgGV9UxGfACMRkNKHrLxbCM7OgFZ7BBNv7wkQ1ZUfuzu3jNQqX73o
	wXgNYknGC58z65AIV5puLl36jlEfWzQNHF3inJFC0jgUea9+jdFKqeMaPAwqw41UMt7S7NP9ohZ
	j29MP4CzOb49ZpSmz+n39Elt4JHfH9PYe2O/yLQOUcrrtKpTjHEOVxA1KnfxKUqFPYrMxNNXJER
	CwBrTeiHvqGXVsvvosmiByOx/Dj9bS6aaE=
X-Received: by 2002:a17:90b:3149:b0:366:132:fda6 with SMTP id 98e67ed59e1d1-368f3ab6d1dmr530731a91.11.1778617020651;
        Tue, 12 May 2026 13:17:00 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688e2esm12863093a12.8.2026.05.12.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:16:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] gpio: sodaville: allow COMPILE_TEST builds
Date: Tue, 12 May 2026 13:16:43 -0700
Message-ID: <20260512201643.17351-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel Sodaville GPIO driver uses PCI/MMIO and generic GPIO helpers,
and builds outside X86.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-sodaville.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: just add COMPILE_TEST. Moving outside of menuconfig is wrong.
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c9a0d53da6d8..92281c14653b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1912,7 +1912,8 @@ config GPIO_RDC321X

 config GPIO_SODAVILLE
 	bool "Intel Sodaville GPIO support"
-	depends on X86 && OF
+	depends on X86 || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
--
2.54.0

