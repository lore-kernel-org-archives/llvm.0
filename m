Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4D11B947
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891698; cv=none; b=p5R1FGCihuRBVNNDte+TrYEeI4Ogw1Hykyh3vSdvScyOmtOzTF6NoZo50dnReEi4KmXi1hBfyUDCBaUIiEx8gMU6l8WWcNUeztjNNdcbIEfhBrs1ynDjlAsr+yvFZr+UDbemWGcd3mEqd6Z1/qlKCxG1B+zPUYWqMPlSgdFcX9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891698; c=relaxed/simple;
	bh=6UMk5mSXx4+IV4UQzgRJhE2stZQTf+Eo3MpUZgvR2As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yov77v2790VZQglC0eyFF7ojlFP+lJEBF+WXJuXZ2oCsoI30LusNM1wN0nqC13N+K8GSF7N2N545n6q8RtQd1z5G3aPonHkPNMl3Jerw28zubhKYX0Wt/6GnjY58GSf79sWcgNT01M1yL2sNGLUhG/765UiRKT6MPQBN8Hil/kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zl6gPkVq; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zl6gPkVq"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4348aaa705so34877066b.0
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891694; x=1709496494; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Pxmb+SJtaf6Rq8IgIflwtKkppPo4bfFWLJbSoBsFk=;
        b=Zl6gPkVqbT4angbBm1K6WEpxA9BvbJ3i0i7Te5+dvBGMccEUQQ6zA3GQ5Hb2WHcbJo
         fdmFe7wqo1UCw192/CVLgw1OOEZVFVMAg7TA9Gy9yTDhDPjgda/fAbVfwLip+SnF4G+w
         9sNEW+Bw3xXscLm3BrtIrHhxtWGtCRDC010TcvvqR5FBxWbCpzm3iXiyoFmOPyKp+xEW
         NxDIlt4A1Q74nl40NdBS9F2x4dzIiUSEPHQkRqojYpt5P2/6b4fS4UyPEZVmnr7nkc8P
         s3JM+PqAW0bQaWVB4DczFTiEiybDD8PB3WYTvOxLDp1ijo9AF+T47C6DNioCchKxF1Wf
         nqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891694; x=1709496494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8Pxmb+SJtaf6Rq8IgIflwtKkppPo4bfFWLJbSoBsFk=;
        b=cAByVwXdT85/v5+fLRZvTyobLb4TyNdodO6HgMkXSp4P7QXdqzKhP5V9SMdF2elO4t
         imByvmIswxUJpGURGEOTQO2bIMuBsJ1yZLOpMUNLQTPvXHwf6+/SCvTpRf/Jn/9cy7yW
         6TGkEBnk87svMqcP8dYJ/m/OuQy25Kds/H+IGlLCBTWf1Zkdpo0/1zF/inrVkpEtgFv+
         5QSNHdFpjlM2j1cSJRPv1cx6kNwQP3fUVFD40qIiw9iZE9sImpVzixharQ/ClpMsvGh+
         ynkHlHRsFdjFH4REU4Ap5NtBdUY1OMchzc6N1Py4KoGzGxIAckxesnr6NPupgwMpJ55Z
         ie9g==
X-Forwarded-Encrypted: i=1; AJvYcCX1ehOxsV1awoLQ/hpuBh0CjqES9iYrM6mc2OkBKc869I4kxm8Bumcc9c458rChV8MkkBQX2K5mNF/lnwZj0evBUkJK2w==
X-Gm-Message-State: AOJu0YwB69h38UayNVqRkRxB/qpRQHQMrTaihZl9Ajo4r24vqsBtTL2N
	UsNb64cXK/PJtM6uaCongl0h/di7iXKwUieKVchJrWVlZ51KFA8inCFAUv/II94=
X-Google-Smtp-Source: AGHT+IF9H5P6JRdDN+PJTJcjkkqLAA9eKjemJxWKrfZTcfu2fwQ6Fg4JGDKRQi0oSxCd/8pdja2YVg==
X-Received: by 2002:a17:906:13d2:b0:a43:1ee2:4345 with SMTP id g18-20020a17090613d200b00a431ee24345mr1634442ejc.75.1708891693861;
        Sun, 25 Feb 2024 12:08:13 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 25 Feb 2024 21:08:11 +0100
Subject: [PATCH 2/7] ARM: tlbflush: Make TLB flushes into static inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-arm32-cfi-v1-2-6943306f065b@linaro.org>
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

Instead of just using defines to define the TLB flush functions,
use static inlines.

This has the upside that we can tag those as __nocfi so we can
execute a CFI-enabled kernel.

Move the variables around a bit so the functions can find their
global variable cpu_tlb.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/tlbflush.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/tlbflush.h b/arch/arm/include/asm/tlbflush.h
index 38c6e4a2a0b6..7340518ee0e9 100644
--- a/arch/arm/include/asm/tlbflush.h
+++ b/arch/arm/include/asm/tlbflush.h
@@ -210,13 +210,23 @@ struct cpu_tlb_fns {
 	unsigned long tlb_flags;
 };
 
+extern struct cpu_tlb_fns cpu_tlb;
+
+#define __cpu_tlb_flags			cpu_tlb.tlb_flags
+
 /*
  * Select the calling method
  */
 #ifdef MULTI_TLB
 
-#define __cpu_flush_user_tlb_range	cpu_tlb.flush_user_range
-#define __cpu_flush_kern_tlb_range	cpu_tlb.flush_kern_range
+static inline void __nocfi __cpu_flush_user_tlb_range(unsigned long s, unsigned long e, struct vm_area_struct *vma)
+{
+	cpu_tlb.flush_user_range(s, e, vma);
+}
+static inline void __nocfi __cpu_flush_kern_tlb_range(unsigned long s, unsigned long e)
+{
+	cpu_tlb.flush_kern_range(s, e);
+}
 
 #else
 
@@ -228,10 +238,6 @@ extern void __cpu_flush_kern_tlb_range(unsigned long, unsigned long);
 
 #endif
 
-extern struct cpu_tlb_fns cpu_tlb;
-
-#define __cpu_tlb_flags			cpu_tlb.tlb_flags
-
 /*
  *	TLB Management
  *	==============

-- 
2.34.1

