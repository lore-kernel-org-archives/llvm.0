Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2263CF7B
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182367; cv=none; b=Wdiq6JiKwDevx8Vc2dBqK9Xetf2SJP8M2O1ElwV5iz8qT8AXMv3UECQ9ZkeriJ9+C9vR7pClyEA04HuGq9YMIcevePaYcmx1eURgpVW6M4AjKxbv/YdamdP/QzV0oV4yY5YUwBP3Dv26EPijDji8ahhryv5NtdObkT3dwtXy/lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182367; c=relaxed/simple;
	bh=mnmwDuuQkke36VfancYNvAaxHSgDhivKxa5loDOkS2c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TlGRlAdhSrSnRKSNtDo+blxjkqx60gk9RC8hoih+2ifYXFWp7+nGO2tinRLX5Oo7QixA+dzgHXa56z1DUrLc87hO/EQwTnAJ2gMW9wmirQLQgZM7cxBQXAiK/tjQgg5v/GjwHDsyyKVu8h6oGqv+M2+vXQ3Sv5UAKe5IABG53/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2XONVgPa; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2XONVgPa"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-40d62d3ae0cso62532735e9.2
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182364; x=1706787164; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0g+jX4epnZI/ommXCdUCoMP4YiUzpooZ3mcs3Px4Jg=;
        b=2XONVgPakgbRyVwZ5YIrfcyMwCXHw77HMUwtAZZWNWcg6pq4MHqLoF5R0iQYu8ISoD
         7bMS9V+qCIbJ5Tn94tEzBZabB598e/OQQpzK2lGdGEJQad7O4KmcyQK6+nBwe7QYxex0
         5sELF8Byyk+U6xsuIH/lBNP8BHk7cFJSWOw2OsZ6NuHU4RQGC1UFDr1BJGFJJQPtV1AO
         +fk3zBfGhbJBZoLQY2OHlU+ex2FCQdOlxDigzjXNfNBDHoafpxykRzO/Nxnq5/P+ytZU
         nicWhndlBoM2MFQa4bRktR/zoiJ13a7ZlvLwqSNZk1KV6nAM6GOLSPUcfbuT4IjPI1nK
         d1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182364; x=1706787164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0g+jX4epnZI/ommXCdUCoMP4YiUzpooZ3mcs3Px4Jg=;
        b=MOCYeCZ/mBgc5mFEmK6E3inZ9W2FX2RrK71PBjWeOStXc4+4teO9Q0Wc5WakFxP2s9
         22ZorK3vS2ga3qB8fqnNXPAyC2yeFEApEdOEO0rztc1KTITGz9nnlMwX2eOeEKz8PD1/
         8f9JssIJiuBsgwPFvPXg1c63YrHV1FIExAeMTB36gCQ38WF5wVFwcGTxQGUdgyjChdG9
         zfgKBYDDvfPnKHZIKIHc0ZmR11ex77jLsWw/2RmLwFff/OCZaVbYMRq9skN/GZToCv7G
         AlkmNfwH07Mbkxg+mTwFQL05g6lskxRdXVFZMhBw75gWYwCP2pGspLgky3GFZQCWEVDY
         4fVA==
X-Gm-Message-State: AOJu0YzOivb5PVRJuAV6UL2K0GxSfxsXgnx+qfs4wANc/Fw5AD5x6GyE
	YBi4yiT7dscR3PSSDBCFLYeSXISsgR/iZx3L57e3VqrKfT9d8UaWbrWCno85XEc0FG2VSg==
X-Google-Smtp-Source: AGHT+IHxHkUOeTSt0Ck1N2rcGF0weh2NwynRQjYw7G2qn2pRshjv8yqjuJbYZCLEIEAF1JGZCZRhGeLn
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:b8e:b0:40e:cee1:a3f1 with SMTP id
 fl14-20020a05600c0b8e00b0040ecee1a3f1mr9662wmb.1.1706182364321; Thu, 25 Jan
 2024 03:32:44 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:22 +0100
In-Reply-To: <20240125112818.2016733-19-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=ardb@kernel.org;
 h=from:subject; bh=PKWmule5OrE2bPivbVWTqIoJwY0uJ2wdrmc5K/+7smk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWT663+0nAxozus5wUbzy1OXrD+cV2V7v20XxsYTc5+k
 f13z29xRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI9L2MDL372TmuvJBbWXus
 /djCrQU5T59Uznngy6q5dE+XJs/UljWMDHfzts/v7rPvUt7NVRC76GbrZakMA56gShW1vI1qEt2 P2AA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-22-ardb+git@google.com>
Subject: [PATCH v2 03/17] x86/startup_64: Simplify CR4 handling in startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When executing in long mode, the CR4.PAE and CR4.LA57 control bits
cannot be updated, and so they can simply be preserved rather than
reason about whether or not they need to be set. CR4.PSE has no effect
in long mode so it can be omitted.

CR4.PGE is used to flush the TLBs, by clearing it if it was set, and
subsequently re-enabling it. So there is no need to set it just to
disable and re-enable it later.

CR4.MCE must be preserved unless the kernel was built without
CONFIG_X86_MCE, in which case it must be cleared.

Reimplement the above logic in a more straight-forward way, by defining
a mask of CR4 bits to preserve, and applying that to CR4 at the point
where it needs to be updated anyway.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head_64.S | 27 ++++++++------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 6d24c2014759..2d361e0ac74e 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -179,6 +179,12 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 
 1:
 
+	/*
+	 * Define a mask of CR4 bits to preserve. PAE and LA57 cannot be
+	 * modified while paging remains enabled. PGE will be toggled below if
+	 * it is already set.
+	 */
+	orl	$(X86_CR4_PAE | X86_CR4_PGE | X86_CR4_LA57), %edx
 #ifdef CONFIG_X86_MCE
 	/*
 	 * Preserve CR4.MCE if the kernel will enable #MC support.
@@ -187,22 +193,9 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	 * configured will crash the system regardless of the CR4.MCE value set
 	 * here.
 	 */
-	movq	%cr4, %rcx
-	andl	$X86_CR4_MCE, %ecx
-#else
-	movl	$0, %ecx
+	orl	$X86_CR4_MCE, %edx
 #endif
 
-	/* Enable PAE mode, PSE, PGE and LA57 */
-	orl	$(X86_CR4_PAE | X86_CR4_PSE | X86_CR4_PGE), %ecx
-#ifdef CONFIG_X86_5LEVEL
-	testb	$1, __pgtable_l5_enabled(%rip)
-	jz	1f
-	orl	$X86_CR4_LA57, %ecx
-1:
-#endif
-	movq	%rcx, %cr4
-
 	/*
 	 * Switch to new page-table
 	 *
@@ -218,10 +211,10 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	 * entries from the identity mapping are flushed.
 	 */
 	movq	%cr4, %rcx
-	movq	%rcx, %rax
-	xorq	$X86_CR4_PGE, %rcx
+	andl	%edx, %ecx
+0:	btcl	$X86_CR4_PGE_BIT, %ecx
 	movq	%rcx, %cr4
-	movq	%rax, %cr4
+	jc	0b
 
 	/* Ensure I am executing from virtual addresses */
 	movq	$1f, %rax
-- 
2.43.0.429.g432eaa2c6b-goog

