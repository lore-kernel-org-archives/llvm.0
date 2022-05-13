Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3937A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:07 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2f8bbaa6b16so81055237b3.14
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dq5ya0HLbqhoGaxybMwD+u455UO61ysiO/Cn6SCUV4E=;
        b=QhvLqyQ7SGkhcJcmlPcAMvH4X9HlQFOiCjtBh/sxV7YFuCJ87i5PkY99k8mpn88Z7L
         bAJHA6Yi+ZPZn6RvkqV/eFGCG1px4tIYEl7/NiOpU+6qbrDMEZhC+SRZjcWXz+crVMyB
         k89fvJN/FDgzHnNowBikxn+RDEi5rz5cjkFzu4OdcmLuH5qG5wD0z0VtWR17tHJLAXz6
         D/UCknaW80Q18TX1vss3qORW2jhII4B6rQkGv+V6pGg9zIzJdJU8oSKhfhM1q13nyTu0
         RtKAlKqIMYJgUOayt2WSeBxXLwmjgEC/4qZ7cyJ+5su7ftJjYIt4dwxMI94GP5ohXkvi
         VOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dq5ya0HLbqhoGaxybMwD+u455UO61ysiO/Cn6SCUV4E=;
        b=psfIYoFl6K7/ZYMMd9EynT73vfmaH8TNmeTxD8qe4EOpRMVSmSe/lGulL6/XY6e/m0
         eGctLfWM/C7qZOUKtFooeU7T5+CqmHy7swIzxwBVpDbZ8FY2icxnd2qQuzSTYPiwI6F6
         cKrSLQr9abQoixojHG8OAJkhrR9EznA1tRMCpd7IwJsyw8aaPo+S0ls0xBIVm0/wzNRI
         OMS0cBu40GmML8an8LRbvNCyCWX2QaSDa1R/WoadRK/+gR7duv/Q2CwqgXS5cID85d6Y
         H7is63n8AB3VlIu7iZLSZl5a6rvcGLamwRnEGODp07QJdFgJ/tGY5YmgElgcFprTeZeJ
         EFkQ==
X-Gm-Message-State: AOAM5306zGrTcAulyVxuBJxD/nuv6Z2YPIOdmxHAgoggirpjzvqidHQH
	+Xd69LgIU1BQWkuxQt6MUktrSicsOyhEnf+A/hA=
X-Google-Smtp-Source: ABdhPJx6nPe/UG4ioi9xxrUNrDLMncxESewxC/vESjwPAZ8T0UiRXU3Rn9QJIYSuvrV9TPZrXKmlIeVohGiRmaBJe18=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a25:d1d7:0:b0:64b:6193:cd6d with SMTP
 id i206-20020a25d1d7000000b0064b6193cd6dmr6849614ybg.149.1652473326244; Fri,
 13 May 2022 13:22:06 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:40 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; h=from:subject;
 bh=RNVQHrlEA9fX91aGJUv17nzO52aQ646VsAxq7TYCVmE=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3isUdSjjLVv9wzgpsbojWEfNbcYqclULDOWDcw
 kQXpx/yJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn694gAKCRBMtfaEi7xW7p9EC/
 9JO2MwCu1MjbT8Exc52X4QzT9yYK9ojOtmr6WsnYMtpgxHa2q1EE6j+R5DjIqzA+m2ZWPHkY8SrMeG
 ZrpJnTHJPvFOmOV9L+KDF1UT+Vgo2YVrHJuQqxkraewUIudUDq4Bab1FpnWkPZ4QtwJ9xuzKjcnA12
 rUIsUKiEhUi1G12cNkjH+aGc4Ny0YP4T2rz89dMrdARLVOHhRPupWfkUNfNVLrIlXbnof/ZCCjhJz1
 /gosCtk/66Q2tgY9KlHpacjuBslmTAN6blKpml6eqY1jRO1Hqa6ScjNXsr7+p5muSKkIRmxw1nPydt
 uEjXwjPlU5Ruc4YYTkRQ1SHEvAY/KmfK1bxhTW2zqyS909mhqMUEKaAw+n3DCzcCfosyD9GzAspMLK
 SZA/KsxdlXzjUxfsDSQMVqyc7AOnO30FS+TtKeAMlZU6kbhpl6I1yJyRW4cejjllmWB/ynZIDhDZTJ
 mZiNpwrFr0PQBQTYS1f63TSat1c1BfyDD5IZxeq1F4sM0=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 02/21] arm64/vdso: Filter out CC_FLAGS_CFI
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

Explicitly filter out CC_FLAGS_CFI in preparation for the flags being
removed from CC_FLAGS_LTO.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/kernel/vdso/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 172452f79e46..6c26e0a76a06 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -33,7 +33,8 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 # the CFLAGS of vgettimeofday.c to make possible to build the
 # kernel with CONFIG_WERROR enabled.
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) $(GCC_PLUGINS_CFLAGS) \
-				$(CC_FLAGS_LTO) -Wmissing-prototypes -Wmissing-declarations
+				$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
+				-Wmissing-prototypes -Wmissing-declarations
 KASAN_SANITIZE			:= n
 KCSAN_SANITIZE			:= n
 UBSAN_SANITIZE			:= n
-- 
2.36.0.550.gb090851708-goog

