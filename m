Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F6A3BB4B
	for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724114; cv=none; b=JKgOgceoAca7BJyQexjHCsEwo7nHUo713pG+3QAr/+bhd+NJw4CPFaUshzz2m+GLWuRPqTmaOIzRnINUkOsN5yuuVYsZLZLm2hgm6p5R0OGfNaUaiaEozJdDyyo6fjY7YbkpcJgfhI87RAnpP8vG+EHAPNcjwhFx5etdIegdQl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724114; c=relaxed/simple;
	bh=DHod4R95dmfxlATUYg8PEHh9KCB9O2la9voBWAdmE2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dofSG0JUXxvMz8FWmeFVTuoZogkgSWpF16/yBcn+Gl5QmrK5yYfVOob3XWxv5eiHGjBLs7XXlguKYlmOHyZQzNdlAPAoHxl7sWSBzOQfYeXa4g0j5GPKW9x1wYlMdRzYYfnyYsMc9gGyP3vx2CzSB9mvVb8Ox0cTLGGDAYIUtcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VETM9nkc; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VETM9nkc"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2dcbcfe117dso29022101fa.1
        for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 11:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724111; x=1714328911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8O1l9DG1nr6tC/T09XllcDqc2JZrTHVCm6s1PJNYaY=;
        b=VETM9nkcpLMRzuSbYe8iIfKwjCqU1NxFejpd1t3hFbG91IdQqf8llnlqFNBKJxmGOb
         CWsuT5NeNrDLjLVhnWG6n/UUc1dKFEw/DF9C6+b7ZvKG3+5EefpUirikZUdsw3F5B79j
         nIKk5nMHnrg/xQpH7alQMV7KCVXaeUug7iHAiqtSJiVXeDnA59hYxeKRkoaPwVqvxbL4
         ESiQUE8zkJU25uYCyj8Z7vYPdBCjdedvieSOcpc61MPvbEj5+oYDiAQa0cc+U4oSdx1U
         YG5+tnZs7RiaFc3MLjwBg9KCuOdQhkX1NILk1tHhJ83R6JuhFP1gtAVrtbit/UiSCQcs
         0b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724111; x=1714328911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8O1l9DG1nr6tC/T09XllcDqc2JZrTHVCm6s1PJNYaY=;
        b=Z3O4Rxhs2oA9S3jskPHE9gSF8805gEGLPn2DLZbEU7U7q/n0yFb4ytiPFngM2B1HLd
         QaRGaiv4Gk06I1sevHpsD1e2FdnBEfb+VXtx2heYISGDtxG2hvtb5Qjp6cmZOaIwcLY5
         vEi+BIXpFZplbcznwbapAUGvznU0xPMT0IJfgQSMncSJ98c2W6Z81CLvgmUKnK2oaa3U
         7J+NOeo4A4HuMgt1JyR18+KbSOVZRFSXN+q/gDPs4gdk6EGdyuurBFM9FNWDpq+vEtR2
         YElwi2JSCL0J5iASGYXoT4ra+8pyr2jwRSXhoUa3CqM/YvRSs2n+Ql+3NrnUfcPNcUwK
         6MMg==
X-Forwarded-Encrypted: i=1; AJvYcCU40Boyn7/iy9USUS7g2EVd1YFVR7xFd37ltuOX/o792gR09Vfauh0HNSHU12AglI+pQAa8j7omBNT97PgvJSzS2cZUQQ==
X-Gm-Message-State: AOJu0YyGkCDRU+4Ly0IBkpp99ANmzlvXkL6Gs3EWiqu4JdqSp62nz6FQ
	Hme2iRgXy/dIhMe3V7ASeYFlYk7DK6muttyWH3Pi7JmmuKattiJsafUFM/KB0ts=
X-Google-Smtp-Source: AGHT+IGUFYUliEnd1IWACpXaMye/ynirYNYqr75NfYKj0gCPLVipXdzKt9Z42rZSYd+VATr2Qtox7Q==
X-Received: by 2002:a05:6512:10c6:b0:51a:c44d:b95f with SMTP id k6-20020a05651210c600b0051ac44db95fmr6479537lfg.28.1713724111153;
        Sun, 21 Apr 2024 11:28:31 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b005188ea5d2b5sm1549641lfc.303.2024.04.21.11.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:28:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:28:28 +0200
Subject: [PATCH v7 02/11] ARM: ftrace: Define ftrace_stub_graph
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240421-arm32-cfi-v7-2-6e132a948cc8@linaro.org>
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

