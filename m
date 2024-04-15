Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE76E7318A
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188617; cv=none; b=ZK8Gl7iQlyZGyeLCcSRtG1GTumNk5Oh2TTw87pDcU7oeLS1JEseXL7Vg8Bnur3nDEI5CS1EDfxdVzddke/180Xbe6k+RbbtBggtKm7CgA/gO0b61Pu8x8mJBpUkIrJyDr3B8gJVhFk/5QEwwtaQoFORObCkip7NC+cRNTPtbn7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188617; c=relaxed/simple;
	bh=DHod4R95dmfxlATUYg8PEHh9KCB9O2la9voBWAdmE2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajKHcU99YMoRjKAgK/unNmGo6Ht93A99Jk3dWVZScrPFdh3rmf6a+peikyA390jEZkDB7aCAYx4MIYg2FgL6pVa5mP2Fbe76QAoKPA9OUnXQ4Du+UKa82THYZ14cDayGpk3BrQwnsA48XLy+ZADcmHm+sIU7IgxOlq+hIg9qWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXTTM+oo; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXTTM+oo"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so3921768e87.2
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188614; x=1713793414; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8O1l9DG1nr6tC/T09XllcDqc2JZrTHVCm6s1PJNYaY=;
        b=LXTTM+oo1jabuk3Wp8nBJEe19p9Hl2Mnyix8RcXl3Pr/3Ntz8NktMJe/6FJoEEgJhZ
         4PRrcm1n1DummqMBpYEkfTL46sXbhbXGV0wcgrlTjszeRlDCg564AHdchY0ZeK7OMQz2
         7UaUJyMdrhrP1MYJPNE4//lIzzMe+M1zX6IBophxDk5K5IgxWVDH87N61OZ9FfSwwdWu
         uFs8uzIAYw0N3FiwCvpf4UJW1o+WmVwaXroNvtC42bQzhk6fxVQGwpfTePas9hifgNiH
         6LIoTPzOsTY4d1fC97aNcjXb8kiHVuNdtDD3NSG3Zm+g3d3m+X7yKk6ePrYCzEZCr+rY
         RGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188614; x=1713793414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8O1l9DG1nr6tC/T09XllcDqc2JZrTHVCm6s1PJNYaY=;
        b=oILqRehkpNpUgXpuM3Y7+wdcY7M6UrKEss7DyvrUbUTMoQx0TfjFhAJKxYixI1cN/O
         CQjjd3qbqeQuS9LuEYLHdT94qzNtRGpX/BDwvrxHkYxolqUq9MIOrMSivVO9v/vzvvjP
         R+CbAuyQ+2qRLq/6cNQjh+ij1Edfj2oX4eDU809Ew3PMR43OoDAR2UV4d+Hm3Iddwldv
         guP2qqVEU35rAC1g+RcYtTazMfcbV5lbWNqq2F0x4zX1BaD/nxkFsFCCS7ODwyQb4Fei
         TiHJNLOJJ6w338j/e87tiwZLhuZI+PDrYtW8jmxci2bFea6/OBLn0GP9vjmHaAzzYv5C
         OY1g==
X-Forwarded-Encrypted: i=1; AJvYcCUtOE5GLGv+5bo1jyHaunFNOlCBjwImxjQ8lgfnHnnKDN1w0KYG9dlXqDQNyZTxUeaikVHLF2DiH0hr8XH4O1tc4lm6Tw==
X-Gm-Message-State: AOJu0YykVcDc4wrqm7LR5wsbxfHDe6ru4pAi1D4jrnSt50wGbcEYJPbG
	fqJQ26m/Ur22tzgPqVwgojW+J4H3m2IxeLJkkhynV6OR3lVRPTIO/RKbokar2Kc=
X-Google-Smtp-Source: AGHT+IF6TUlz0a11NQHsoRzwI88UyyMC+kUX4EKshRGzPvFLMfF6IpRGswBTL8JMScIUGA1nC8o8zg==
X-Received: by 2002:a2e:a4ce:0:b0:2d6:ff58:179c with SMTP id p14-20020a2ea4ce000000b002d6ff58179cmr5144064ljm.27.1713188613994;
        Mon, 15 Apr 2024 06:43:33 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a2eb98b000000b002d43737e2d7sm1297988ljp.30.2024.04.15.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Apr 2024 15:43:21 +0200
Subject: [PATCH v5 02/10] ARM: ftrace: Define ftrace_stub_graph
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-arm32-cfi-v5-2-ff11093eeccc@linaro.org>
References: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
In-Reply-To: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Several architectures defines this stub for the graph tracer,
and it is needed for CFI, as it needs a separate symbol for it.
The trick from include/asm-generic/vmlinux.lds.h to define
ftrace_stub_graph to ftrace_stub isn't working when using CFI.
Commit 883bbbffa5a4 contains the details.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-ftrace.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
index 3e7bcaca5e07..bc598e3d8dd2 100644
--- a/arch/arm/kernel/entry-ftrace.S
+++ b/arch/arm/kernel/entry-ftrace.S
@@ -271,6 +271,10 @@ ENTRY(ftrace_stub)
 	ret	lr
 ENDPROC(ftrace_stub)
 
+ENTRY(ftrace_stub_graph)
+	ret	lr
+ENDPROC(ftrace_stub_graph)
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 
 	__INIT

-- 
2.44.0

