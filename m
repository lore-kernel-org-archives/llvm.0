Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6D33062
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148546; cv=none; b=HdAfFyF3Lokdla3UapxO/bsKLBJp84GRnoXeTTWogIQLTymF/Yz/CCMbyjrW+W+JXP032Jz5dyms1qXUYE2IKM0goxifD+C45u3CttZxid4nv5MlQZ7f+4sz3EBC4cylp52QWNaWbaWE65gG5ytp8y0/2HnlpaQZynoAeVJM5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148546; c=relaxed/simple;
	bh=6UMk5mSXx4+IV4UQzgRJhE2stZQTf+Eo3MpUZgvR2As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mt697LlFCJdLheBKYebCiH/Cx2Gb1o13RKR88Mi2YNe8/WVzMYHKETTzCxK/AH6zOi1+kSP3n1/uYpmQsx3xxQ5yvZ73aqgOUHUqxBQ2ackO9AmYC4q24rnS1kI/DFgbvNgtFGvSdacAe3pIJxWGsa75OE56caHGt+56OnYO3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WeROtfvX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WeROtfvX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a45606c8444so485495966b.3
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148543; x=1710753343; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Pxmb+SJtaf6Rq8IgIflwtKkppPo4bfFWLJbSoBsFk=;
        b=WeROtfvX+itGTBmWib0WWvkzR8H9N/M+FrOk2k3IkOxbZw3DWeYtovoWGqyARKQfzo
         Vx8gV1oDZ2BdV3SA2kCnjVaCarEJlVAt4l5vwY4ZZOr21MqHBQ1l2BRmok91HQUnuXRe
         pLUHAol3YZiwiQEX8FzoyiA7y0rHI1tON3DJSSwcDZmkA9DiN4olauagAZCiVMiwKMVo
         57pZ+gTb1VLTV4kmF27HZzCOGSmFMV7n0rRVbs+lPsc6P0VD47tu3Kolg3FKNt/zary5
         uriIARpNydsXjPX/t9LmCfTfFbVQ/467r+pxagtD54YJS3WOaPqFTsWYiXTOKN088gLx
         WBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148543; x=1710753343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8Pxmb+SJtaf6Rq8IgIflwtKkppPo4bfFWLJbSoBsFk=;
        b=ZdijPgEF7KWZXqEIaYj7s7+G+UVTEjGrXvS4uWuKMNtfhndla/hfdMFFKga3bMPLgt
         fv3owiPgIpsAFX/V6mDlCB+fA/y2Kc5uSA2bn7O9ZvGyjV8BhWPu3DmUx8DZCOToT8GS
         htqbYOAqgl5bdlAYsiN5mC2QV3dZjGO6wOMaWNOsI/0DcqKt/iIzqGWSKtuK6/nvwUSg
         i1a5W9oHRK9t8CmvL0OVd1aAJJ+9mJjbEfzgSs+mh+36XLJI16zBiZWDk2H5SjOJ+WNh
         UhR27kLMzq1oboH/4oln4vY2EOP0P+OmJhiMfIWS3SZzh+1XR6HkkSHiD+GxHpW6LK0d
         zL0w==
X-Forwarded-Encrypted: i=1; AJvYcCV8qWa5WnInXlrxAlahwCBNqT/SxHiyqoy3+UI1kCHNvb2kC0T1+HsXN0JGnJA1RvtbOF3GCU1HIwr/V4ojv4IsHiYf4g==
X-Gm-Message-State: AOJu0YwBEl10fpKvpts9ahkNwuhSehmIJ1aXs6vGJRQc0Sc476GletP/
	noJGprE+1zNJK7cHSUN9o+yqgEUTCv0IrHsqOH86/1U27+aIjZ5akHR/iMqxZsk=
X-Google-Smtp-Source: AGHT+IEgUpLUiQYBzj6rw7ZfjfkrB+vk/A/4W98MEgaqVFmfJCSsdg3NGfsTATbDZleEH7zdiiDcfw==
X-Received: by 2002:a17:906:f34e:b0:a45:a9da:cc38 with SMTP id hg14-20020a170906f34e00b00a45a9dacc38mr2950488ejb.7.1710148542891;
        Mon, 11 Mar 2024 02:15:42 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:39 +0100
Subject: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
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

