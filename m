Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782563A8D2
	for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724123; cv=none; b=cuC9ZEn5BsvSRfomPtlANOHE9+Bg7fQ428S8GbzbYks7SPOmfuMS2idlJ4q6N8BmLIUrvt+0X0UOfsAGSXS4vISKEL2xx3IFsUq9TLkDdgSPvJQuvI69C5rNITujc73XH79zIw3aKqkY/h0WTh7EKU9r1EyXVxxa53JEm2BPmRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724123; c=relaxed/simple;
	bh=7O3Om7ips7szRQxRgx+RW7NvKEbAxZva25/bAWcwIds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ly/aUWCfoct1XihNxEV83LGZVK9KtXaNdTnmV8IRRf1L7sHwyGLV2LkFTqiPhbQ2LXR/c0aa6yuozfIsPIchWKwRokHi0duVmrSh6STlVU4ee/uI/Z69LnKRixa5ttTlJoXTlPo9MwZuZvoMEoz7BRqiarVbDzvcR0OuLebRI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ruACXAH8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ruACXAH8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so3153981e87.1
        for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 11:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724120; x=1714328920; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y70OTHVL5ivIan0b4DqgD01dRiya5SKhfRNunxoXdLs=;
        b=ruACXAH8oOAxocslIZI64vJ9Gjz2Jjl/kwiIZ2+K02arzX19rKuQ3eKLhuP49UCPOg
         LzYchtkJtyRwVa3OW7wtgJYdTJKfjhENVkLVrBbTU0jciCQUEJ6/SPJP9hzEuJOtWp/J
         jhGNEKB+SfCXD8BQGlUzAfHQROw9zum+w9TlXhSiw6HO4AnRD3yAtBFs6s1KXLSxlo17
         LNPnewYOgPpnAsWv79/Wtxbhce+ybFAw3peGrMUW3XP1FOuzQ3/FfhdwKDZ2Iqzw6lLv
         hrKyIQIjbB0byjkSCT0cHwK2bhNUP059Xmb/AnVsig6VkS6TTrH67RBzPIVOjBhXeMnl
         JWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724120; x=1714328920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y70OTHVL5ivIan0b4DqgD01dRiya5SKhfRNunxoXdLs=;
        b=xIt+b+yguV0dWRb/5Dv5sD5iIMUC9jgif2E3U+CGPO4aPQup1z4lNpDewlgykDl2zB
         ZD/Ng3q7msNMHV80wCdq39tucRdcwnVjHDlpIhlMWvYljQjs/f5hVsWNwrBcZLsyUFbv
         +Ua2II/eeAYZTk9oqEMMhTOBk+iyV5X+0BACDlIPvmGviT0YOyUlDXufypbdU/XZxJDL
         B8Ds+RvWsZHnsANUKTKFPyF+f+CLyi6cNm80tKjWje3jjlbX+SR9anRDg3LYXXOD6Mp8
         yPj+lPUzU1nCZSmRBDryJHH04HzycYogHVLAzgo7E2oH3mHj0PgC4LpD/BChMxdcxa6E
         +kYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5tJ2mzoaOqojhU6sMD1vokfujbiF/U0xTMNqM18gy30Wrcl5ZR0uXJFlXP/7SLaNioWTgA5LNkFZH+HkRwaA3VhlPwg==
X-Gm-Message-State: AOJu0YztplVjgifOZiucfZ/xYNhdKPBPWJJg8rEJlkPi9prpLVnhMXXk
	bFZWUOZeqCATw/ZJX3nRD8lc5pGs5sZhaqBIjyNNFMtxmQXb+2gJhJ89aoqAhKU=
X-Google-Smtp-Source: AGHT+IH7reJlxAOcCyXD+MSHuuDYG0YRVdcMUSgTIS46/BdvW/4HC0w9owbY9Cg+Mub5s+Jo3qDzbA==
X-Received: by 2002:a05:6512:3054:b0:516:e8b1:177d with SMTP id b20-20020a056512305400b00516e8b1177dmr6437575lfb.65.1713724119734;
        Sun, 21 Apr 2024 11:28:39 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b005188ea5d2b5sm1549641lfc.303.2024.04.21.11.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:28:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:28:37 +0200
Subject: [PATCH v7 11/11] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240421-arm32-cfi-v7-11-6e132a948cc8@linaro.org>
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
In-Reply-To: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Support Control Flow Integrity (CFI) when compiling with
CLANG.

In the as-of-writing LLVM CLANG implementation (v17)
the 32-bit ARM platform is supported by the generic CFI
implementation, which isn't tailored specifically for ARM32
but works well enough to enable the feature.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b14aed3a17ab..df7bd07ad0d4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -35,6 +35,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP

-- 
2.44.0

