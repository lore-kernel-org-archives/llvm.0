Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CFB1B800
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891696; cv=none; b=FIoiwIokZzwuUyj3yqSA1oKsStcwehJWbRI/Lh0f6HznexcqHXoUyKMY1CAFws6TjsDdSc5GjCotnZgxC71HLVpYGea+UNDs23SVF9JbvBgFtOxJgqV65xLx259MrjNPL/zm+qOBcTXzWuo85IXRVRgkp3lPxhAfFUuE0mFPmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891696; c=relaxed/simple;
	bh=6p+a66UDUSXgEFKwwrNNqxq3Xu7yzN1IQ7D6NZSeuOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uC8vo5grjuTmd5ytlJSwEygGagwS0QX7DpMxMXUaLvbO2eCE02/ceEQFxvEeoL2eCFwZmJbUtDWzSO2O1K4FcY/DbI7f+igb3MjFSdYoofA3pRaIv3yNDk/eLACh7USfzYXBxVo+jZjRRQM5m7okxiyeFQk1Evil5xglHS5i6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5cewWN5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5cewWN5"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3e706f50beso311738466b.0
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891693; x=1709496493; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaHsL9uZaLpUW/gtSno6U8/q3nfzw7ffg7lr4P7gXB0=;
        b=a5cewWN5fXaGnnSGZsndmN/emHBO4CEZCftk3OPYW3JrFJrymK4cvKSF58BS/GlVLB
         KaV/zxvxNrBK2MRmhS/r8rZrSyYnvTTpejD0YfNuQO69mQitAS8+/xCOL04r7XiwZx93
         8EuiFZ9cmRKMKiPVzG7XmQA2NIlc0a/lCjQ5sI+1o1asu1BAP+mWRsIF756d3S4zcfcF
         uI80klvuqZGRMMFAVfqK823fYmLFTGXikEN/ce3xDJpmvcw65C1oSd7PSaFMKzery+Cf
         Wv4r4jOrdrDpAgFhXPhEg5YrxynTWrAMB5Y34BnqdRkWAzk4ru13U5LdyqW5ipgUXRIM
         JaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891693; x=1709496493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaHsL9uZaLpUW/gtSno6U8/q3nfzw7ffg7lr4P7gXB0=;
        b=mrovLX1tRj53r69Z3vbVBS/btnCP9BFoeKa8pBQ9WIHIUaCnSNpGExCe6pM2UCuC5S
         plCBlLzxSXLGuPLCtmNGivsA40lBGAcRR+gVg50ki+JSVp2GbH8P6r2y6qs0mnZSiyh8
         4L8EIpa37yQJUbbmHm5sQmG36PQejn2RVNd1MvKOjlR7MUTVx4MRMGU+jp+RueOqZyPR
         +g8M3Fg0BFcZZMPPq3L8XjQy5txfdg5QBYNJm7eHzdH9lV7+0TtgbbDqORWxdBDS0HU9
         bM0/+rCs2enkGxQlr44AbdSuJeWSBJcmchhsp7kMUIV8m0oxIE1/yaJSFGTPfeUj0nLK
         KsFw==
X-Forwarded-Encrypted: i=1; AJvYcCU1tPnaV5nYEe7ikpANyIOYs0emd5WFQmXNxGPy/HsIncMvKyjN2PkjETquCnRUuc4gJ58Rz3Gof6iMvpp9PL56QQTyZw==
X-Gm-Message-State: AOJu0YzIShzAyeEIMBTN9ZpDbivq7f0EBWhYr8x+eoktNaM+AzaFCoC9
	RQNjWnBxocgNq/0r53QJ+EEsSsspq1DIgm9J8TAYWYkaN7X59kgybb50NgyS4x0=
X-Google-Smtp-Source: AGHT+IGw6bV8g5dpeZCGmITdjJ+P4PQpu5m8y9ThBv8s80WquXr+nyJrO4fnc+MLmGg387rv6mLOGA==
X-Received: by 2002:a17:906:a44d:b0:a3d:9a28:52e6 with SMTP id cb13-20020a170906a44d00b00a3d9a2852e6mr3284540ejb.50.1708891692758;
        Sun, 25 Feb 2024 12:08:12 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 25 Feb 2024 21:08:10 +0100
Subject: [PATCH 1/7] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-arm32-cfi-v1-1-6943306f065b@linaro.org>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
In-Reply-To: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

Support Control Flow Integrity (CFI) when compiling with
CLANG.

In the as-of-writing LLVM CLANG implementation (v17)
the 32-bit ARM platform is supported by the generic CFI
implementation, which isn't tailored specifically for ARM32
but works well enough to enable the feature.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0af6709570d1..1216656a40bc 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -34,6 +34,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP

-- 
2.34.1

