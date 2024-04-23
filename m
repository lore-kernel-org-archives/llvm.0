Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF474594A
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856805; cv=none; b=N/hUgXKmmmmhAa4Zt1BAJzZ6p9xvJHIuNEbxZ+B+mOAOqccY4M4TcMenR0/RrqUUQ310qV0nTegEwnFCruvcfHntrL0YkviK3cu/akK6GlIf6GZ+Qi9JFyABCzUEl85b/ha4J0sh1NOz3/ZiL/0M35jI3GmbCC3w7L+87TkK3qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856805; c=relaxed/simple;
	bh=5EFy6cfMwFmHnjgQpm4RBFQE5+gn/Hlic4CiXbZ1D40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sF9VsEG6ND1yJgQUlHlFXDG7GhvbN2sVAvFf+99H2wSj/lwCcNDv82C4rWeXKQvwhHbo7VXw/AxZ8OY9WAHTP3eop7++mpKsl2VYhvNicDfyksgMLH3B5Mm3DZOicO1e8AL/EEgHr28OarSLiXuQItujVnNCjdfnjNyfiV+IH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcNx2OfU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcNx2OfU"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51b2f105829so2597018e87.3
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713856802; x=1714461602; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2+fP+WCYTyDxKS3W+3hZz5PIukWlL21rabu7CTA5No=;
        b=WcNx2OfUAKQ98GcvzUD9mtRev8ml20mBJqfxc5sYABSm3HENcmCTn0bXiIoeCS5TKc
         ICuWDEw6xvtzoctmJXYZ/OKjKAgYSHrWJV3edL0nKXqxSbkfmrl+TgZwDa/AncwhEO7X
         bUrFYT2VG7tHX4RD4XQ183d+n/uERSF5DGGb4v9fgwf5rUzMgfYocmvetL0Omuy/CqWF
         fUpxblGjJXc+/poofWoIu+xBaKJn+3hzkztnF3n60NfSUI/VtQf62RivB4GMt3SxBkRH
         J/BGbGx+C97ScOd7D83oFzEJBzmnEQHQ+fAvZ5UstVCg6EJkbmpiMOSK81VtqLiJMBMD
         J/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856802; x=1714461602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2+fP+WCYTyDxKS3W+3hZz5PIukWlL21rabu7CTA5No=;
        b=bRWYlUz0r3+n4zgeorSqTmWJB7+Yw2Q5PCbVVLKRAOydaUZGoi5fdkzoDhCLg/751v
         fgLmyIe+94Mf4QOsOlwnKxOusfFr7of4zbyuwZnjWM8PGcMpuHyS0YlSiXrzoFf70lqP
         maD2M4v4Sh/KRNPhs5GMTTPSBLAtT6k4FyTRhwbCNjIxSTu4/Vt5j5KGiK8+lc9mlCGe
         0bYA3e3e/ecilWwqXe3iCzLmbgi0fZI95zRWVRydfQHirJRe9v3q0hY3wjM0hbpYyCIi
         08+lQBOtIIvRTtG8Kcny8JyYotdlrJbfcxkmZWxBVeW+q6RJCgYPl1Xq/sIZ7f0AzVPl
         Tlhg==
X-Forwarded-Encrypted: i=1; AJvYcCUZzRfybOdQoRppmP3Oq+6xARcjFUOBM3AhBmp2LxMx7xmIXWHBic7xxUqJ8ImjB0xB/MeehcN+cLaKuly8nwPltZVt2g==
X-Gm-Message-State: AOJu0YxkKE+C7OGmcRdxb9gEGFuUgHm7rzIIsmzJme2j1bTR/KG0yvCQ
	cW3DLektg6VYdjeHIDFddtifwAdWZ5/t4AFTJ8S+l8dZUlKQt9yEQLtA4pooYd8=
X-Google-Smtp-Source: AGHT+IGYz0O62y4kgrI0kWzdSwgcaeiQ4LZsRCR58iHsSexVvxjWUgtSPaI4/EwWyEIORXWgiQ0WFg==
X-Received: by 2002:a05:6512:2203:b0:518:9183:864f with SMTP id h3-20020a056512220300b005189183864fmr12028932lfu.34.1713856802326;
        Tue, 23 Apr 2024 00:20:02 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512360d00b0051ad4552454sm1307588lfs.148.2024.04.23.00.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:20:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 09:19:55 +0200
Subject: [PATCH v8 9/9] ARM: Support CLANG CFI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-arm32-cfi-v8-9-08f10f5d9297@linaro.org>
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
In-Reply-To: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
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
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
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

