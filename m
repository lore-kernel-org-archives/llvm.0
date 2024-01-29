Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4F976029
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551576; cv=none; b=tsfJtAOQkhGqA+OoPy6h0XGuWFAwtMtIOx/pR08BNU/9yORIMLhEBWas3kLqRLkPvpQJhCr37hqVOKYjXPRfcCWI1CNCe3IntwpuxL1gfQSX2IO/8zW14gyXjNNzE9Sqasx7BLEYlIUO1c1kr2LFSS32GN6qshUJbiBSaXTGGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551576; c=relaxed/simple;
	bh=q9aqq8TxofJ+IbL58aBuKCqKThJaXrgTFJRKYbTq++8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IlwHzdB5nrt1Cst46azIFL0FPN8XFNTWyOTwWN5/ePFYV8Kh9/F0njerUP2cCkY+Eb/KOTbiIBqHjeKI05JSIliVuURRwITFJJ2wPCy+O3GSK4Z5stkG/OVVTKaHZcOdDo8RA1tgGq3J8h7CmspDDXEWWVpsNF+6hub4WnmgK3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0rC+dx9a; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0rC+dx9a"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5f325796097so64133457b3.1
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551574; x=1707156374; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M59gqHs6X4RPZ31jkw+MshCoOf2mD10mD/ghxicfQU0=;
        b=0rC+dx9a91OQOl0OyJRuQTuW9SGKkJszfRHNqUp6OOUX52NEVLXG4BR0aU1Zg+ZS81
         agPBBoo9FBmRioeJRDtP03YSiL0I9jtXyww66cO83RZsRnSWpI4HNROo9et9Px4nsLA4
         8y4q5z3CbRrnzQlA/FIY5v0FgLcvEACMOl0oLhfAl2/9pZ6S2+bw6kKMMiegWtndag8p
         qtQY71woKSBhq8lYE9AXZZ/Y7DJHkijV5wwkqfqjJiADlUXIWarh1MvUrmDFaYLp5JId
         pFNQNLSJnxBQeJ9no8b99pKXtlflXVr/9ut0/U8SJ53wmULcL9W8+xzhE9AdNq/7EHTr
         GbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551574; x=1707156374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M59gqHs6X4RPZ31jkw+MshCoOf2mD10mD/ghxicfQU0=;
        b=M1cxF+bpbZLQ9rpweaYqeAP24xV/JpEDNsjCBdSE/TFMgfcHC9SU5HDaEClc4hbl1K
         9FM58eUGiVm/h9NA3OSV0PcaYCJmVbtx+zBT1zRWnFejVxKV5eU8QRcWK8/3gLz3m2NI
         Cj9gqxNJ5rCvqFp+JgaUSxUQfAB+4mDIkElXto/oVQGDt2FeKVUKeXeareKvBMbD9/Xb
         dXh/W86t1u5XBkqvTiVos4BdQpF7bSVzM8KhSCv/PykfqcUyaX8ixA1b2S2xNnoqTeKk
         EnizWD7N/A3UDn2k7Zb6si/JyMjdcyL9743YBATtja9ttPx3oiPmZt/ZHAutlWGl8aOd
         5Mhg==
X-Gm-Message-State: AOJu0YxHaz5Khfw44YX75EsxUBdK04kUv+8BQYfC80O7ScJZF1soPvHb
	SE6KsUTSA4EGuUvx3/cAW/gwhdA6MJ93nJ/1UA6WvXTY3X6ZAzl8y2B7JadMkIJ3ZL/aCA==
X-Google-Smtp-Source: AGHT+IFKsXEen3EWZg9GhnUEMC4esMp++s/hxM7yTCMDL5+CtA/pBJk6xsNb+SSidJj/K445XegU9it+
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a81:9a88:0:b0:5fb:63fc:fac8 with SMTP id
 r130-20020a819a88000000b005fb63fcfac8mr2074385ywg.8.1706551574143; Mon, 29
 Jan 2024 10:06:14 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:22 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=ardb@kernel.org;
 h=from:subject; bh=ZbpL85fPGajjpfnYR9ri/bu07iizUhPZX6zRx/L0fxw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7iyezZ8/20v2498Hj1helL98vOvzjH/OrvzFPD01z6
 WVvCTv1u6OUhUGMg0FWTJFFYPbfdztPT5SqdZ4lCzOHlQlkCAMXpwBMpDqI4a/I1ZMTrb8Ks7u2
 Rx90kNBJu3H3p+ZT9ir3nhQO89melQIMf0WfiB3aZdCac9RvY2/CzGcL9fXyZjqd61Fv+sBuM7d mGQcA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-40-ardb+git@google.com>
Subject: [PATCH v3 19/19] x86/startup_64: Don't bother setting up GS before
 the kernel is mapped
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The code that executes from the early 1:1 mapping of the kernel should
set up the kernel page tables and nothing else. C code that is linked
into this code path is severely restricted in what it can do, and is
therefore required to remain uninstrumented. It also built with -fPIC
and without stack protector support.

This makes it unnecessary to enable per-CPU variable access this early,
and for the boot CPU, the initialization that occurs in the common CPU
startup path is sufficient.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head_64.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index e671caafd932..ae211cb62a1e 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -76,13 +76,6 @@ SYM_CODE_START_LOCAL(primary_startup_64)
 	/* Set up the stack for verify_cpu() */
 	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
 
-	/* Setup GSBASE to allow stack canary access for C code */
-	movl	$MSR_GS_BASE, %ecx
-	leaq	INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
-	movl	%edx, %eax
-	shrq	$32,  %rdx
-	wrmsr
-
 	call	startup_64_setup_env
 
 	/* Now switch to __KERNEL_CS so IRET works reliably */
-- 
2.43.0.429.g432eaa2c6b-goog

