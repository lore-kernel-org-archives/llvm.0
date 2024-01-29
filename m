Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F56715B2EA
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551575; cv=none; b=o330A+s8B6jwukSywr+NtOUFBHGQNhhnbPh+x6cHMms4REmy0Hq/+efC2AfVFIj4B+SLZT0boB4/LbrvGM/8CdT4Zi18F+9c9uN/QILH0rg9Sv+2XSMNcnghIIhkD9dfom2dIewlPu7f2fmRWPRQ58RUBSVgnu2v+5I17jVIG+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551575; c=relaxed/simple;
	bh=+rYahPmzXDYe/IO3FyUv8LMIVG+yTpD3LpxEPcnxKUw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IVsM7QmjPGaA5OUPo1UwA/R78LciFRoPunB9Hav/5YZsNKpIghwzmWe5sRi7UYrYbLokJm6Ni18SvvkM4+ZtFCoAGup7aLjxdDFlzS5eI2eqLxahj/HMuYrgFLB9TKEDLIXPnF67FQUKxqr9aRIYkG0DjZpecen07RIQEtaMXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UgN+W56g; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UgN+W56g"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-40e530b7596so25216345e9.1
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551571; x=1707156371; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1we6nPeM2Zvq3sHnH1EZ2vSDoW7zEMVGBC8FJkE9Ugc=;
        b=UgN+W56gJ8Mxn7FDTJpcHpIxXn/+jOzNDjYPixLVeKYnPrmkoypB+zHEPVqf4a0wMh
         +sS7rNH+3GAWhwkT1YZ+M9cIXtQCbEmC3P402o9fWJLNiitTVCkr/ansCEam5EDDBBcb
         zym4zsSZOu+WhTe6mbm8boTp68iIRmh7gJY5AikCE68Omr9S7XoQwwRnCOsxtRBWxIVr
         uhfOr2+1fth5Y0Vrz7xyKzBI1rHP1FFEOTsl+Jh/Mo5n+lcxhPjcxbQ5iZO0ysY4L7O+
         qX+zrNz3yWg/af7hXM9NbkH+i3MId1yB6gbGWcxSRZ9bVGqiTYoWS39jxk4ChQ1K4awl
         bdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551571; x=1707156371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1we6nPeM2Zvq3sHnH1EZ2vSDoW7zEMVGBC8FJkE9Ugc=;
        b=GcDzvpmpq7UydOCwNrwCIyYgVttLXymTnVemrrA8LHq7sbU6tbEdNLtR33ARnehiAu
         yQn3qQBIal1BY9K89/8azbdfSAVFNfbAQRzPG/FhQ5umJTVAlFLsJGmRDC0v6dB60rXI
         UtgDA0KHFALGOVXHeNY3MdlAYtlXCI3LOYq9RtmCyvFJxgst7LTBCXHoqB+O29q165Ec
         qRAa7R/gAH7yVpEkeAAAHjwJS8QTXSS5a82jN9+9GP/ZokmD7y1Xq6ynyDL9UDLih3Ub
         vE2I9q5U8b1Egbliqxj2dh0vSEBY3SLOkPmX/lyGb4faZx3h1Wu5KILIznfrRkenkMYu
         wclw==
X-Gm-Message-State: AOJu0Yya2KDhxxXaK+Wz0E8dAfhU+/gpcz6XCeIb0YI3itlgWSl/qNXn
	94fHMq8KUG1EAZiSqE6ZeRCFAXZksovhgYsEPJBWOqanM5WkKOWURr821AeLAP46PO6kgQ==
X-Google-Smtp-Source: AGHT+IHZlPWQchy0J38KpxwD5TmOBCD6HsGG1BLHK/s1BgvvkdecR9aOkvWWPLTFP29XujBFiYmoqpYE
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:6012:b0:40e:fa6b:cda8 with SMTP id
 az18-20020a05600c601200b0040efa6bcda8mr10582wmb.7.1706551571814; Mon, 29 Jan
 2024 10:06:11 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:21 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2648; i=ardb@kernel.org;
 h=from:subject; bh=b16vPiy6Nf2YAluruWpP640zmYr0MIrigfShg9HjlpU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7i0evc6pO7Ltxi++Y3aTSOvsf+18vOOEd7XDs37FJk
 kwxfyOaO0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBENp1nZHho+2iy3+ZYHdd9
 a8y1g98YMW3T67f1jI++f8Ps+2uORbmMDB2/ps69muN/7KifQ8rL5Sl2RxY49nk1iJ1N+VQpkCn mzAsA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-39-ardb+git@google.com>
Subject: [PATCH v3 18/19] x86/sev: Drop inline asm LEA instructions for
 RIP-relative references
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

The SEV code that may run early is now built with -fPIC and so there is
no longer a need for explicit RIP-relative references in inline asm,
given that is what the compiler will emit as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/sev-shared.c       | 14 +-------------
 arch/x86/mm/mem_encrypt_identity.c | 11 +----------
 2 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index 481dbd009ce9..1cfbc6d0df89 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -325,21 +325,9 @@ static int __pitext sev_cpuid_hv(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
 		    : __sev_cpuid_hv_msr(leaf);
 }
 
-/*
- * This may be called early while still running on the initial identity
- * mapping. Use RIP-relative addressing to obtain the correct address
- * while running with the initial identity mapping as well as the
- * switch-over to kernel virtual addresses later.
- */
 static const struct snp_cpuid_table *snp_cpuid_get_table(void)
 {
-	void *ptr;
-
-	asm ("lea cpuid_table_copy(%%rip), %0"
-	     : "=r" (ptr)
-	     : "p" (&cpuid_table_copy));
-
-	return ptr;
+	return &cpuid_table_copy;
 }
 
 /*
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index bc39e04de980..d01e6b1256c6 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -85,7 +85,6 @@ struct sme_populate_pgd_data {
  */
 static char sme_workarea[2 * PMD_SIZE] __section(".init.scratch");
 
-
 static void __pitext sme_clear_pgd(struct sme_populate_pgd_data *ppd)
 {
 	unsigned long pgd_start, pgd_end, pgd_size;
@@ -329,14 +328,6 @@ void __pitext sme_encrypt_kernel(struct boot_params *bp)
 	}
 #endif
 
-	/*
-	 * We're running identity mapped, so we must obtain the address to the
-	 * SME encryption workarea using rip-relative addressing.
-	 */
-	asm ("lea sme_workarea(%%rip), %0"
-	     : "=r" (workarea_start)
-	     : "p" (sme_workarea));
-
 	/*
 	 * Calculate required number of workarea bytes needed:
 	 *   executable encryption area size:
@@ -346,7 +337,7 @@ void __pitext sme_encrypt_kernel(struct boot_params *bp)
 	 *   pagetable structures for the encryption of the kernel
 	 *   pagetable structures for workarea (in case not currently mapped)
 	 */
-	execute_start = workarea_start;
+	execute_start = workarea_start = (unsigned long)sme_workarea;
 	execute_end = execute_start + (PAGE_SIZE * 2) + PMD_SIZE;
 	execute_len = execute_end - execute_start;
 
-- 
2.43.0.429.g432eaa2c6b-goog

