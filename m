Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939F51C578B
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563308; cv=none; b=jB7PSSIGzygUotiKmPwY2cYHM3iR/U5jcI8NHcbRUyFjBW68S1H/Lj+xLvROkfgWQzPCo4yx5Y+NwFptVis9ZZzWgj2vfcKBqe7fGXgxh2K6m6lGIrTB/ORUzaKcy4YREDjIuZkSUtbJ+vvZbMwfqBcaAAGrfxlAj/QBHVnG8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563308; c=relaxed/simple;
	bh=/o/yZ4swobCw3VY94GgXQ0C8aM777wTuhgBNMFNnV60=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nqx3npx9wPuKuEB82gxI10qFzHO49HwMCF0S6m95b43G10R9KdMCJMlUGG2PrQV182nH/q5ZPqlBIi06BCFepX/s1WV6pMmkcwsnvXVPxx+NRg5BP57icN1PcwqzugOWkVf4AFc4R3/Yb0Sqos6dMC3MRePWPSatoi3J/uo1YFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MpytAvyB; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MpytAvyB"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e315a5b199so16685727b3.2
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728563305; x=1729168105; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ysiTQYnIFAM+GVpiQPZxea96jDzKFB0S2bf0Q1srz24=;
        b=MpytAvyBceiuFDvcvcLeUq9h4sKr6VTkw6z3C/Rv9OwN0wFWKGtHpOgcIkvig5mDst
         wDf9Ycjis+PzcOhdE2zrSUSq8lL+v8AxXYHeTMqH0jFfn4WLKmy2bE5dSfR4OqrKQK2/
         zWPgQpYR8438JWOErd+At8MzldYPlLu0DKGV5JsaLw5oS/UJ0hKkiyse60KUD56ERmCV
         2dj50t54qaCnQQQ+ogKnPerWEI7GGx+C5MYuwmmyhDn73pvdtTn/C33dNpSaVvHvztUZ
         5gbdNdlyG0h3Qb8Y5FQm3VytKrpO8vsLLDQ8+r7jvp0YJadqxXffE+4607joNlQjXYHm
         Ykjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728563305; x=1729168105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysiTQYnIFAM+GVpiQPZxea96jDzKFB0S2bf0Q1srz24=;
        b=gvovLV/ZOkHEVlo2Zcs3qVOHipJBaeFENQ0dO++hjOoTPZhrGawgG9WAOKHul3LBDY
         HN2/OBH8yGCXBOPLQxzHu1VtflRHJBpnvLgcUSgYsqQQEFAh5YfeL8GdkjrfdrLXXzoY
         g3/N3pEb9Z5gz9Co+Y09iWo2D6WY96hubrKf3Qq03UHsg5YG6b/R8xfJWwBsPfHy7kDh
         /Ga/FLU6vVfKodJjIe/Mb5uHjmBHjCc8lJTeBvzZRz5eVn/r3Y/bMIAcuznAb4ECjqUF
         IGE26ETjeZlWPeUzRCYSE9AuJkAw2iLpHrqc5Y16UTIt74s/xduR532drpBRjSd1SZ0F
         otgQ==
X-Gm-Message-State: AOJu0YwgxgPRsi5/DQ3Z1vflY/IkzVj/9s/vWNC4pyFkHACGXhip+dLN
	YNv4gaO7+wbxfjc35BdDu6lVCdAulK80ClBDi/7FT0jb43ZWg6rvpKOHsYxCks/lG1qOIw==
X-Google-Smtp-Source: AGHT+IGYzCVf/jII8KomABTrMZDoXEXfru199j0RK0tDWPSxK1xkfDqRPfD8R/E6mn2ZF9v6gg5pIreS
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:731:b0:6e3:eab:18b1 with SMTP id
 00721157ae682-6e3221767a6mr203727b3.1.1728563305577; Thu, 10 Oct 2024
 05:28:25 -0700 (PDT)
Date: Thu, 10 Oct 2024 14:28:07 +0200
In-Reply-To: <20241010122801.1321976-7-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010122801.1321976-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2591; i=ardb@kernel.org;
 h=from:subject; bh=RmdquyWiyHUUPxUBLvM2Ygamlf/86/TxkgF8NWyXERA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ39RGTnOvUT3GJzrx1X9JCRfnpo9w2pI/P+f72q8Y5HS
 2VhS1hJRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI/VqGn4yKCg4MbTISnK/Y
 F87etqfSUuC0V+eSGs4vLtH5KVNelDP8M/12ry6phyVirtfhVYVX34UvNvU0q/3pKLY8Kf7HkZk prAA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010122801.1321976-12-ardb+git@google.com>
Subject: [PATCH v2 5/5] crypto: x86/crc32c - Tweak jump table to validate
 objtool logic
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Tweak the jump table so
- the address is taken far way from its use
- its offset from the start of .rodata is != 0x0
- its type is STT_OBJECT and its size is set to the size of the actual
  table
- the indirect jump is annotated with a R_X86_64_NONE relocation
  pointing to the jump table

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/crypto/crc32c-pcl-intel-asm_64.S | 39 +++++++++++---------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
index 45b005935194..ba1cca66875b 100644
--- a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
+++ b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
@@ -93,10 +93,13 @@ SYM_FUNC_START(crc_pcl)
 #define    crc1		%r9
 #define    crc2		%r10
 
+	pushq	%rbp
 	pushq   %rbx
 	pushq   %rdi
 	pushq   %rsi
 
+	leaq	jump_table(%rip), %rbp
+
 	## Move crc_init for Linux to a different
 	mov     crc_init_arg, crc_init
 
@@ -168,9 +171,9 @@ SYM_FUNC_START(crc_pcl)
 	xor     crc2, crc2
 
 	## branch into array
-	leaq	jump_table(%rip), %bufp
-	movslq	(%bufp,%rax,4), len
-	addq	len, %bufp
+	movslq	(%rbp,%rax,4), %bufp
+	addq	%rbp, %bufp
+	.reloc	., R_X86_64_NONE, jump_table
 	JMP_NOSPEC bufp
 
 	################################################################
@@ -310,24 +313,11 @@ LABEL less_than_ %j			# less_than_j: Length should be in
 	popq    %rsi
 	popq    %rdi
 	popq    %rbx
+	popq    %rbp
         RET
 SYM_FUNC_END(crc_pcl)
 
 .section	.rodata, "a", @progbits
-        ################################################################
-        ## jump table        Table is 129 entries x 2 bytes each
-        ################################################################
-.align 4
-jump_table:
-	i=0
-.rept 129
-.altmacro
-JMPTBL_ENTRY %i
-.noaltmacro
-	i=i+1
-.endr
-
-
 	################################################################
 	## PCLMULQDQ tables
 	## Table is 128 entries x 2 words (8 bytes) each
@@ -462,3 +452,18 @@ K_table:
 	.long 0x45cddf4e, 0xe0ac139e
 	.long 0xacfa3103, 0x6c23e841
 	.long 0xa51b6135, 0x170076fa
+
+        ################################################################
+        ## jump table        Table is 129 entries x 2 bytes each
+        ################################################################
+.align 4
+jump_table:
+	i=0
+.rept 129
+.altmacro
+JMPTBL_ENTRY %i
+.noaltmacro
+	i=i+1
+.endr
+.size	jump_table, . - jump_table
+.type	jump_table, @object
-- 
2.47.0.rc0.187.ge670bccf7e-goog

