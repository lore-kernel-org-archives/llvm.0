Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015FF194A43
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276567; cv=none; b=TbT7DJHDsnL3nPmoMD+aVQFzK5tP1tsTNYiu9Z0xhEcCC4WYe/hG+zfXNBzf83LTnoqZfJ/nAWGu/zEiQ3eGX4B9HwVWrrQNNpui2WM+VVbpxvrEykNXwg2A0tU1OlShFgldBXAldK0YL1mzGvpGYjSuihR4k/Yg8EEeV1IO8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276567; c=relaxed/simple;
	bh=3JGT0Gp6Mz6RRG9jsRwcVhBESThd+LENzWfNaIpsWgo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rhOFc74mKODSLVsUMKw8PYR7WRtGkTR66ob2ttLfSstGMmVRKrR1c4HD0psqlKhJ/ZphufKoFu7p6IgPEDJQLqE/KH5Lmf2lEDi3J8dp7LVJOQCOj1a3olJHI0nn1R861vLyidUOylR2Z3Up61portQyp1Mx86EJCiyCqN75iLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4hZaeOx6; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4hZaeOx6"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02fff66a83so10698674276.0
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276564; x=1727881364; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvnpcmFQxcsGZvvXdDVNifJH/U/gKUWuX4k9X0rnjWY=;
        b=4hZaeOx65jh5nNSd7fOYHb8DmpeNpyzr5eGym1syBgF0UeOKAnc4+tKJTMOOmq/EF6
         ZWr5UaXsPdc4Ye6EcrYHz1eSVbQXjyHoXR25vYGgxpmp0GIPt4RyQ5BiG8bjQ3FEtDQw
         uDelN4wN74RMWwx9EaeRgarvX1DlfVKqs8JLEC2ar0TQQUWXIt6op5A5gFOoD+SMKwUa
         xpWJ1k9CUN2PqlT5FDagXlaXcAuK62Amya6YCsjSII5Zd2noG1XUIUAEnhAAm5j/+Z1D
         YTwJjfEcucK2Nv81yhQw0Wu4MF/IdCz4CXAB7YYpdtsqGh0TGlor74NJOjBJVRZoBrCM
         hNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276564; x=1727881364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvnpcmFQxcsGZvvXdDVNifJH/U/gKUWuX4k9X0rnjWY=;
        b=rlapW54sT36tXm/PtG17Df81FVqIuY+qtIB6JFAEmWB08gFg22uFuWLjiX5NkgqU1p
         rCdAuev/E0lDjno8LRBsEkkebLNPfGynxGiBD8pedIL7b6F9QkTlIVw0ftgB6Lxu2rdV
         KF/64eB53avFfVt0+Js70Vp22HxwnJnCxS1svpUYM39SCcp00qRa3w6apCpapIUJzkjs
         7DS1BGDqWk2fdjPoZ3EuHTJfxs6Fa6pRF+7VQZE1idgT8QMSevFKMThswibXd72n36ZI
         1ZooVpzBaUayo73dr07/C1i+K0Ndy6UI1f7pBjXp9VchykL8gKBFv+6IqHxMYH0Evmy9
         JFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4YXpk6mByDXoC4WHT6eurdu0XlP40BgbWiwYNQZoaymuM7ChCDiKbm1Zyfuzyo8bOSNrQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwR2dGmTo6dZajqQ6Bz+6S2WggzqFHww14898oUr+A2Kbvz65bj
	Yd4EQTkemMB4F/OA2mPuCpCwOonDAY0734InlJtWM0NWPVZW051D8ohooKgWdNJ4cnKS7g==
X-Google-Smtp-Source: AGHT+IG8l7xPrwiQoCJNQ/ba3EMloi9V99YK0VEhh/KbnKIqVODzSQX4+kTe9p6XHA3xEE581cvXY/7/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:fc20:0:b0:e25:17cb:352e with SMTP id
 3f1490d57ef6-e2517cb37ebmr1573276.9.1727276563646; Wed, 25 Sep 2024 08:02:43
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:21 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665; i=ardb@kernel.org;
 h=from:subject; bh=aFznGPhrIJfcYbFW/zJm7PxtyN4XPqpBJvJpRLs7DOQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6smrOU/sUlwy2LTW237rV4pUONJ8T3XtdLO2DQ3bj
 80/F1nfUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYyyZHhn8LWprti0g+tdKf9
 /bStUjGJXy/+qc4H120n962eP03h1yKG/wHHj7aK75zgynumw7x0V1PPmh2muXNy98WcvvZ74cO kJi4A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-51-ardb+git@google.com>
Subject: [RFC PATCH 21/28] x86/head: Use PIC-compatible symbol references in
 startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Use RIP-relative symbol references to make them compatible with running
the linker in PIE mode.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head_64.S            | 14 +++++++++-----
 arch/x86/kernel/relocate_kernel_64.S |  6 ++++--
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index db71cf64204b..cc2fec3de4b7 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -182,8 +182,9 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	xorl	%r15d, %r15d
 
 	/* Derive the runtime physical address of init_top_pgt[] */
-	movq	phys_base(%rip), %rax
-	addq	$(init_top_pgt - __START_KERNEL_map), %rax
+	leaq	init_top_pgt(%rip), %rax
+	subq	$__START_KERNEL_map, %rax
+	addq	phys_base(%rip), %rax
 
 	/*
 	 * Retrieve the modifier (SME encryption mask if SME is active) to be
@@ -314,7 +315,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 
 .Lsetup_cpu:
 	/* Get the per cpu offset for the given CPU# which is in ECX */
-	movq	__per_cpu_offset(,%rcx,8), %rdx
+	leaq	__per_cpu_offset(%rip), %rdx
+	movq	(%rdx,%rcx,8), %rdx
 #else
 	xorl	%edx, %edx /* zero-extended to clear all of RDX */
 #endif /* CONFIG_SMP */
@@ -325,7 +327,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 *
 	 * RDX contains the per-cpu offset
 	 */
-	movq	pcpu_hot + X86_current_task(%rdx), %rax
+	leaq	pcpu_hot + X86_current_task(%rip), %rax
+	movq	(%rax,%rdx), %rax
 	movq	TASK_threadsp(%rax), %rsp
 
 	/*
@@ -346,7 +349,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 */
 	subq	$16, %rsp
 	movw	$(GDT_SIZE-1), (%rsp)
-	leaq	gdt_page(%rdx), %rax
+	leaq	gdt_page(%rip), %rax
+	addq	%rdx, %rax
 	movq	%rax, 2(%rsp)
 	lgdt	(%rsp)
 	addq	$16, %rsp
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index e9e88c342f75..cbfd0227ea3e 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -106,6 +106,9 @@ SYM_CODE_START_NOALIGN(relocate_kernel)
 	/* setup a new stack at the end of the physical control page */
 	lea	PAGE_SIZE(%r8), %rsp
 
+	/* take the virtual address of virtual_mapped() before jumping */
+	leaq	virtual_mapped(%rip), %r14
+
 	/* jump to identity mapped page */
 	addq	$(identity_mapped - relocate_kernel), %r8
 	pushq	%r8
@@ -225,8 +228,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	movq	%rax, %cr3
 	lea	PAGE_SIZE(%r8), %rsp
 	call	swap_pages
-	movq	$virtual_mapped, %rax
-	pushq	%rax
+	pushq	%r14
 	ANNOTATE_UNRET_SAFE
 	ret
 	int3
-- 
2.46.0.792.g87dc391469-goog

