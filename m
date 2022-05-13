Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B342F7A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:28 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id r14-20020a25844e000000b00648bdf7491bso8264064ybm.1
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hVI2H0xnZ7RmL/u8CtkGkcPsuty3huMjT1xVoaokMS8=;
        b=ChOWWSpwlZWxcJIQ+SaNXPfO7pMlQzZbg6m7xZvVehWYTAEfesAlK2rfgMl6kKYUJZ
         PC88MEu08ggaydfb7OYECcrn2NOkrMNmn4eblAgc0zmX5VRvl27k7SoIFReIQfZLRN8r
         Xj+i+6O7FRCzR9R40JANUSe2JsNQtPUVmZ6bmpUImk/RWRvp35IAvOEg1QHOncWHWOnk
         XFPQyfBLs72a30aa6J5tmiMLgoA9h+0MOtVMP6BgtZM14sSGVY6sTiFi8Kp9sHcbO8mr
         6JuTiZzANlnMwoHHFhf4NoXoBBK3TW7AygfM2wKUm2o2ehKVgRxQJX1O8ZfSyi07I/GC
         15xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hVI2H0xnZ7RmL/u8CtkGkcPsuty3huMjT1xVoaokMS8=;
        b=5cUVuk/6WbBJPDE8A+lKkL8AXAzR8dyRGz+Q6xy/BuubqQ94ylkst4x6t3Bnty7SyM
         4eegRCy5mKCppspL0edaT//R6RLhXMDuYlEjlggeDlU7+g5Xm5nG0XlK/knQQNErI8y/
         lpPr5Nt9GRtFD0SZassQZckzI7phjW6Xp9MYv40poFQY3qcJ0DdhFMDewcOXYlODHaup
         Kj3IBapZrxNbwl3RonxzvTU1xX2ypseznZdDVbvCTRETXZsgNOmANPYq3qY6UwK8Fs1F
         xsSq/BmSIE5SlkxiHLN2f7/AiF8WHDeBypjL9dqmcgW1CkKypAtclw5rlbxBNgGprmNy
         JHYg==
X-Gm-Message-State: AOAM531DZFYcwRf0RyYwEYLR3OTiXJ0Q/gIAtr+5GLSt+gmKXfe/ym9I
	PDhMMjim/zdAIIYINlS96HlsB7XjDSOsSX2Sf/Y=
X-Google-Smtp-Source: ABdhPJyXOQ8uvyWPL+12fGNZws/BE5YW9i9nX3hNgx2mGOV+806AxTC5RpGIfedu/1NbCFyEdmO58l9WKRQjRyjzaEE=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a25:6407:0:b0:64b:4b88:a3a1 with SMTP
 id y7-20020a256407000000b0064b4b88a3a1mr6935792ybb.320.1652473347761; Fri, 13
 May 2022 13:22:27 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:49 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-12-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335; h=from:subject;
 bh=UQlGPlwtYybM8FEAV0vACm4HLycz0znjf8+xx6gkTx0=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3knoHGJRQ8lklk1VH0eWFsW6jNYP2xh19dScd+
 EuJIIM2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn695AAKCRBMtfaEi7xW7kRSC/
 42vBryC3ccOIXP/usmo03Al21Qca5sIegalwVHuJV+choTcYrlXsVgpXmKEbgvi0MOdXz7P2uXwf6N
 ZMqBuYr2/fS7MiuRb0lv3fUxcWTBSlLokzEKszNO55+3k1A2+OaE1jGDM26vzTk4E6f/ehXixU/lmb
 EPwPWGqa6vrC9QuGN0TOqrJw9h6RZh7EmB5kzUNvXQx0dPN/t0h4qyIufAjODvsE/Umg2MZ+NwqIww
 SXHqyzYZeaEY3pxLTbJ2FC9WvJaK/LnVAtWGuvmNdvdTjHq7ly2b3SVz/5el1sPLp+v5ZoAZ1C6wF/
 HeIsnn2jx/Mk2gb7IcxRwxwtMZjrnTDW9lfq/d0TDHhReaCXOqEWfwE02+h7xRT+xyVP0J2XVbpUK4
 KbUE3kdbMCFdQidVvRFCZlCYl5UbTml8VKUW+GZu1taVIPo5a9jIUwUHJXhrLhxKRfAWWFnz5DnB2g
 vTke5m0gcOVH/HeP/DAQgo3aqLyGnKoS8NlOfBBSnEqmc=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 11/21] arm64: Drop unneeded __nocfi attributes
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

With -fsanitize=kcfi, CONFIG_CFI_CLANG no longer has issues
with address space confusion in functions that switch to linear
mapping. Now that the indirectly called assembly functions have
type annotations, drop the __nocfi attributes.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/include/asm/mmu_context.h | 2 +-
 arch/arm64/kernel/alternative.c      | 2 +-
 arch/arm64/kernel/cpufeature.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 6770667b34a3..ca0140d0b8cf 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -143,7 +143,7 @@ static inline void cpu_install_ttbr0(phys_addr_t ttbr0, unsigned long t0sz)
  * Atomically replaces the active TTBR1_EL1 PGD with a new VA-compatible PGD,
  * avoiding the possibility of conflicting TLB entries being allocated.
  */
-static inline void __nocfi cpu_replace_ttbr1(pgd_t *pgdp)
+static inline void cpu_replace_ttbr1(pgd_t *pgdp)
 {
 	typedef void (ttbr_replace_func)(phys_addr_t);
 	extern ttbr_replace_func idmap_cpu_replace_ttbr1;
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index 7bbf5104b7b7..e98466bab633 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -133,7 +133,7 @@ static void clean_dcache_range_nopatch(u64 start, u64 end)
 	} while (cur += d_size, cur < end);
 }
 
-static void __nocfi __apply_alternatives(struct alt_region *region, bool is_module,
+static void __apply_alternatives(struct alt_region *region, bool is_module,
 				 unsigned long *feature_mask)
 {
 	struct alt_instr *alt;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d72c4b4d389c..af78dcacf9fe 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1596,7 +1596,7 @@ static bool unmap_kernel_at_el0(const struct arm64_cpu_capabilities *entry,
 }
 
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-static void __nocfi
+static void
 kpti_install_ng_mappings(const struct arm64_cpu_capabilities *__unused)
 {
 	typedef void (kpti_remap_fn)(int, int, phys_addr_t);
-- 
2.36.0.550.gb090851708-goog

