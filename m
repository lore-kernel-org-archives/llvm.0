Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890123;
	b=bkVp4SeWhu2xwvNz/YP3ZlfHFGJWijD08N87X/uaiwu1XLAv8SrFOoGQMky7XNtF3TN3
	 1LalWCR6BtmTU0pchm8RLrM3T4r86H73cGSRiI29ShSrVxeagzYFJWx7UqgZc1oMUlX31
	 n1B1fC0XAFhc7M/v53vVhKncPEZPaF+56ZrQgl0Bdbh7m1lD8dyHKXwccOSASLz4tyckY
	 u4Mffkr3g537jsF1bfiIlVTfuYfDBS89Q6hy4RuDhCEdG+1WjgpJnI+MC0/f4xH0okQni
	 7rL6Qk0YmHseW6QKsLKBc2vLS+OGX8IYAi9wMZQq5RkfAYGcQrhVn3UKUzqDHAbOplA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vDuDdRL8iZneo/phC8IWAHFDoAthrBkjX6kaJXJOz94=;
	b=vTtI7lvm9UM69fdqm92x31IO7iCznGFcR1qq31B6CssOpqRZCvyd3eg76T2NUxYK+Ll1
	 yJ+DglESmWcSfzKk5EOCL2kcFeHdYEkPHtiCj+dgM8mUAODnUcHuAQ7iBjOz7x7fXKTx3
	 /pjpzNnNM9EUcAkahusseZVJOi0CMrR3pkBUbBUfGyqo3FIVAnaflI2QM2JUwRQ6+jZxZ
	 2FPCg/1EBBYU+WrM7DzFypi7kDzZjH4F46cVfJspQQYct9NZnsPFON4hlWpRY+bSIIgrl
	 +TKUDZcrjVrQT003Xi7zvAUT5BIkcyPy7FyqFelBseEl1vzdI6VZmg/GFZzpMRC81aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nOweqfmr;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E7606A880
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768E7606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nOweqfmr
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9501034c4so61655075ad.0
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 20:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890122; x=1795494922; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDuDdRL8iZneo/phC8IWAHFDoAthrBkjX6kaJXJOz94=;
        b=nOweqfmrapmbiKNiUNLPdOudnhp7Y8ABBYA89uVPJ8lPorl/C30UYetoaOsamqA4mO
         1Z55K0TVvJD/2FWXf7MipeSNbLL8Ll6vPY9bsJ4uFNgQ1lbich95GWbT7z7YhgYy14NN
         Wd9PmMcufnSKbg1GYeXlgKgxjQ5k+gEZMhmKRcVBD2qZUewBrK+mKKFFC4G+KgKk0woB
         +Qbo1XYnNaH9LvU64npFz0Ml4WGBkDkS+cQF5Mwk0Zk/5rkf1IcuHMDPDwrhOzBtZiU4
         KlbOru7Yv2Jo0znL7CBypeFyeI9fY2yEc1CxQii7u2cesBeZLPFFtd4qztZoVE5L5YSs
         4ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890122; x=1795494922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDuDdRL8iZneo/phC8IWAHFDoAthrBkjX6kaJXJOz94=;
        b=2v9K5P4gICTuEWwI/ujB/UWXF8hwKjSRpy6jbHUMT53SSfLGLQAiEgPkYHc9cMlDfy
         C1hkDKVReOm5oanC4cX39R1arvwQZOumuYh0TDU1KlCnjbtXqyv83DzElQ+5HRjk6hEM
         +tY8NJAIQQPpH3PLJ16A+tNaUeMOvlwF8B7FthX144gXkjps3rV/Dnk97Yk+4lIs9sxs
         +3YeLCvcZS4FbRsPfFW/kQFTyRPQS5aoOszCA7GQv/95u5TtsNtK00N6k7w2cY2xR7VL
         kAXdgc40j8dwnma5RynoFk6zfI6T0uoKY/zH7mWkuuBq/dlc8KbzPmwyU/naOtVDwJHp
         +9UA==
X-Forwarded-Encrypted: i=1; AL+hErH5rSdr/oLyIQtw4QJVryXt/CFLusaq93Gj1njYiEI5SbrdYVdvEw9OS2Mp9kbJprHyboxI@lists.linux.dev
X-Gm-Message-State: APuU4Z8jeIqb+VT+UTkMaHjkkiZM3pFUTrNl6WweaacgInSrbsuUG4qY
	Gnrb0ofPd57ELi/HLQ+CX6lyLMi5AsvFWzMYzDuiSn2HXd4JMjm6tVRI66elndaY1zbQgH0qB6a
	gJsnrET6dOZeAhxnCxPHTZpkUUw==
X-Received: from plgn9.prod.google.com ([2002:a17:902:f609:b0:2df:4aa4:16d0])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:f8d:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2ee0de03f7dmr125521225ad.34.1794890121819;
 Mon, 16 Nov 2026 20:35:21 -0800 (PST)
Date: Tue, 17 Nov 2026 04:35:02 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-11-dylanbhatch@google.com>
Subject: [RFC PATCH 10/12] arm64: entry: add unwind info for call_on_irq_stack()
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Weinan Liu <wnliu@google.com>

DWARF CFI (Call Frame Information) specifies how to recover the return
address and callee-saved registers at each PC in a given function.
Compilers are able to generate the CFI annotations when they compile
the code to assembly language. For handcrafted assembly, we need to
annotate them by hand.

Frame pointers alone are usually sufficient to recover stack frames
(without CFI), except at the exception boundary, where more information
is needed to determine if the LR is live.

Since an exception can be taken from call_on_irq_stack(), annotate it
with CFI. The actual entry assembly functions are left untouched, since
they are not expected to take exceptions themselves.

Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/entry.S | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 8d17f61d1b5b2..aae27ccc0f2c1 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -30,6 +30,13 @@
 #include <asm/asm-uaccess.h>
 #include <asm/unistd.h>
 
+#ifndef CONFIG_UNWIND_TABLES
+/*
+ * Do not generate .eh_frame unless CONFIG_UNWIND_TABLES is enabled.
+ */
+	.cfi_sections .debug_frame
+#endif
+
 	.macro	clear_gp_regs
 	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
 	mov	x\n, xzr
@@ -880,8 +887,11 @@ NOKPROBE(ret_from_fork)
  * 		          void (*func)(struct pt_regs *));
  *
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
+ * Open-code SYM_FUNC_START() so .cfi_startproc precedes the BTI landing pad.
  */
-SYM_FUNC_START(call_on_irq_stack)
+SYM_START(call_on_irq_stack, SYM_L_GLOBAL, SYM_A_ALIGN)
+	.cfi_startproc
+	bti	c
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -892,6 +902,9 @@ SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -907,9 +920,13 @@ SYM_FUNC_START(call_on_irq_stack)
 	 */
 	mov	sp, x29
 	ldp	x29, x30, [sp], #16
+	.cfi_restore 29
+	.cfi_restore 30
+	.cfi_def_cfa 31, 0
 	scs_load_current
 	restore_irq x9
 	ret
+	.cfi_endproc
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
 
-- 
2.56.0.679.gc527c65306-goog

