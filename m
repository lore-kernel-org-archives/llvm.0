Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932627C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:35:21 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-313bc9c54acso6266067b3.4
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=f2ez5GlPiz7LVHLEwJNPKLpo0vJP8RdxLafLiRUk5QE=;
        b=iKH4lvrLXdfTkbOBM3216qeAmFXUVCNZOl9l8BspQJ4rpqELSsOx/dvp5FBCJ61+MK
         Qe7z/u7qUuuWGvcZaS1+jt1dc9SzMwm80qJ0J1VDr3aegKpLxX1ggYXz7fKnk0418CTL
         Hg11Fttm16oJnUgS/diZT5zIRg78gDBu8cEmHV/k6ysToIhnQh8/a5fo2iNXz+i0UOED
         ZrFaKU0CtyasnLmWkqq51A0dCu18cBIr8KaX5AuBMPnp9I2mz6nPDlUFM5Qc9z6ADbKf
         ogKMQTsKq7Acbzw+8xLAP7paiSLqLT2pEIB3orxvzuNNtAd0JIyfUj2YyV+yP6FDGaWt
         j0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=f2ez5GlPiz7LVHLEwJNPKLpo0vJP8RdxLafLiRUk5QE=;
        b=8D8hcKRsL0J6jT8EGbNORKcUp94mjECVAfpk0OklyrU632Tg3qoL3iTJwyXTNn8PRY
         fMnYclyFZU5NZLqOZl+8u4hGPUKbX+mS+TjFxLAwDMxjgFIUr4tSh3I3ancVqhxTT+66
         e1VpeZk9wSigatYr4F8fym0ZYuHpkhWe7+qXm2Oll/mi1NkdYGPWnRB67aQjUNB5MuCI
         +42qBJb1QLJEVy5WEE1fCjngb/Iz8zdwJuPos8wIWlu+T7HUxXPxftsh0utMDBvS4yR4
         GhF1dlWqVOtJzrCmiA5IJB+i1S+LlLT590MhIntCYmoNZE9VAnZfkGdPPUSNnzhGCGhP
         fjRg==
X-Gm-Message-State: AOAM530/ltbkaYsXfkUSQ1AU3VGXhOYSF8aXYy2N3Echx83KmXlR5w8h
	DB2c7oAhvvbCeRs3gD/7OW4S315nO4ImSlciJlM=
X-Google-Smtp-Source: ABdhPJxz2IY87/Xw53sI2vfsQaG1YS1q3LumYXmYWqaHfb2HDYl+aHwo+eKjFDgc7azDGZJL0i2ozWPbeM/MCDDKFTg=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f464:6db6:3d47:ed14])
 (user=samitolvanen job=sendgmr) by 2002:a5b:48a:0:b0:663:7ee1:999c with SMTP
 id n10-20020a5b048a000000b006637ee1999cmr28580272ybp.544.1654904120569; Fri,
 10 Jun 2022 16:35:20 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:34:55 -0700
In-Reply-To: <20220610233513.1798771-1-samitolvanen@google.com>
Message-Id: <20220610233513.1798771-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; h=from:subject;
 bh=RS8kezem6HKmvIC2xkWx+Vimg14ewNmCZ/1rOo726vQ=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBio9Us0Qlk8N5JpvifNY7fxEcru1Y6AbEzteuzzSUX
 A+M8G4CJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYqPVLAAKCRBMtfaEi7xW7mNoC/
 9Hbp8Ou+VWLCKh26fDW3X/l+zpog1gX2cHWcbQLZjUDuBdoBOsMeJFZbAJr7gp6cyArykGxpWXjcmW
 QZbCeNOnrTVHXzY5St0+Ifo/59T9fIcUBwHKC/flaN5RQ7izb8+ogGYfeI0mrYTZepJuoaKaWTyBdf
 AUhLi/p2zg/xr8NCHPVxMqNF9nIItJ6JduJw5Sd+xAtbcd2Mbop0+QpzlZbA3nWRZ9xAFB0r7XV+hR
 mvFqbPwY7b1hFE1FacbEFByAEslu//mJzsZsmdZzd6Q+5sQGaHrELVyHMCjTnIXuj/UInbiKvwg2S2
 km6wMZAsd4FFEv2beTZaMXkrEessphESu0M7O9miUDxCjaG/tqzp3LbULs8sVrgKSm/xM6g8z6Igt8
 WQM7NtLXMg5SQneP0oKyLpzfCIXMiHsKuP37sWAozocaYzsdNSvKjqRAvThxlQoF8NQK+tJXYdKFPZ
 yV5EBSBWBhAlN8S0DBn0q2ESKwRkuy6Hjtig2SpJDvcPE=
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [RFC PATCH v3 02/20] scripts/kallsyms: Ignore __kcfi_typeid_
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

The compiler generates __kcfi_typeid_ symbols for annotating assembly
functions with type information. These are constants that can be
referenced in assembly code and are resolved by the linker. Ignore
them in kallsyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 scripts/kallsyms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f18e6dfc68c5..ccdf0c897f31 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -119,6 +119,7 @@ static bool is_ignored_symbol(const char *name, char type)
 		"__ThumbV7PILongThunk_",
 		"__LA25Thunk_",		/* mips lld */
 		"__microLA25Thunk_",
+		"__kcfi_typeid_",	/* CFI type identifiers */
 		NULL
 	};
 
-- 
2.36.1.476.g0c4daa206d-goog

