Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E892E1CFEB3
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666566; cv=none; b=o32exfDKAkLHdVAp7g8kMnX+nXb5MGkpoFmwt6S3yRJUPu/X20LRYEPgBMZ0HWzMYw7lg2sqtafCjQhXITvgMPYDcFzfDvc6uMeIAmopv+oMUfbcYaBm+oWYpNfokC9UBMWQwBbdf6iG2cn2nfIuBplC5XK9XbwIO6IR6m+sORE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666566; c=relaxed/simple;
	bh=dmzPGrFW6aOYMzz1IH4ndQp0FtWFFlmkgAnMYm8LZsM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iDOrDmC64xKGHWdMCdaZ0z6sBIBb+NNfjp2XKuBtr6L9r4vzYu0ELfx3Wvo6wYhBrGinox6ZEAmVDowfLjz9+YPLDOMuu+ehXFtCJs/XI6qG9p5UdBDl9str2eJPmnrW1burKkX9uF5aIHPTaUs+oMTF25jm2pMRU5eMF3mw9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nYHNjcFJ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nYHNjcFJ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e321d26b38so48339487b3.2
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728666563; x=1729271363; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8u1CNDm2+Bhw3m92z5B6moO+Nki7WTk10wOgvZqSdE=;
        b=nYHNjcFJ72ChZMhgtKAub2JvLkD+ukhm+o8K7UP/dpkAivD5GKmyFrTtpLj+QVDXPo
         l4Kh14Yx9VDF59VGys7lKmE1KGVOlTJyH02vVGhHtER0YOf8VkXogRSxzzIiZWKiUTry
         BLMO0AZCeGyBf7Q4u8TCp7h8nFe/9CTil42aJ2otyxwd1HbQ3tBcmzQG+fcxU0m6Wzro
         xFPNRUegt6J7muwpQfW0Vs32y4oQUIiBDzPwwFDIK3UiaODayDfmlWqED/RWuPnl0WB0
         5ABpMcNavbw32UIYUTophIoePTayNCPULW9n0Mpok9pfB7ySOqTqW4+VdBg+IFNGkr88
         OxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728666563; x=1729271363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8u1CNDm2+Bhw3m92z5B6moO+Nki7WTk10wOgvZqSdE=;
        b=lQEHhZ468kN8CHM3fAhTVTAPuR9N9xbCZrTgR+S2Kr2oHRhBYJsok77GN6f7av/NSr
         wh+XAu9uX8TA+wQylKP/FAiw1tf8/NTxLm/WaFoCkbGfTMKPxOr3+2WbrM6TjILSU+or
         p73hTwCWohbUbHHxv98GGvx7STnti5UhZFE4e4tLRfLT97/Vm6cCgXBRUwZ6XbYmEMbj
         CKhKIBpUzR0aDH0LGYShFXHaWn18WKxcIqN9I5MTVKef4f1r3IG69pyyxKYVDsF2/h8j
         cK7lslld9ZnON9PSHDj8I+z6jxmeaYaMAuWSlN0pjmq3efqlAs3g6TE8dKkm9FfWPIB6
         DJLw==
X-Gm-Message-State: AOJu0YwO2Utyw2Q4Tuq4NdVuxNLvuvO2H6JgUaPZCCx3dOhmDY/grjsb
	3WIIdmSgh9h5tzir4OjK/q3IWrDmnkdy0StYs12gPva8vpPDam86qWwK8De+uZY1UYxvPA==
X-Google-Smtp-Source: AGHT+IELPWPtiT4Q82wAv9kxv2a+A02raZYpuKW6YkhpqdM8qkrH2v2YSZ25ymK9rG/ipEu3ysaoSds0
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:3190:b0:6e2:120b:be57 with SMTP id
 00721157ae682-6e347b4aec8mr83757b3.5.1728666562988; Fri, 11 Oct 2024 10:09:22
 -0700 (PDT)
Date: Fri, 11 Oct 2024 19:08:56 +0200
In-Reply-To: <20241011170847.334429-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011170847.334429-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3351; i=ardb@kernel.org;
 h=from:subject; bh=Hfh910Y5sSnn5hBkeQ8p28eswlQr4LHqPbKbxMAVhc0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ0zenW+ZiGDhuwr6Rk3jm4WtI45MFlvU1xb1zP3k1/yF
 Rq5VdI7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQW9zMyrPey+hV86aRT/v8I
 8defMvfutpU/FbW3Yf+0ugM2qzYLZDH8D5urnSY/RSlbw4UtxHhzheGW9zE9B0xVErOyXG3KbtV xAAA=
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011170847.334429-18-ardb+git@google.com>
Subject: [PATCH v3 8/8] crypto: x86/crc32c-intel - Tweaks to make objtool's
 life harder
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Tweak the asm crc32c asm code so that the jump table is more difficult
to decipher for objtool:

- load the address in the prologue
- move the jump table to the middle of .rodata, so that the section
  offset and the symbol offset differ
- emit an entry following the jump table that is unrelated
- add unconditional ENDBRs so we can test --ibt regardless of the kernel
  config

Test code only. Not intended for merging.
---
 arch/x86/crypto/crc32c-pcl-intel-asm_64.S | 50 +++++++++++---------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
index 7292090e76dd..cbedf5820e30 100644
--- a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
+++ b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
@@ -93,10 +93,14 @@ SYM_FUNC_START(crc_pcl)
 #define    crc1		%r9
 #define    crc2		%r10
 
+	endbr64
+	pushq	%rbp
 	pushq   %rbx
 	pushq   %rdi
 	pushq   %rsi
 
+	leaq	jump_table(%rip), %rbp
+
 	## Move crc_init for Linux to a different
 	mov     crc_init_arg, crc_init
 
@@ -168,9 +172,8 @@ SYM_FUNC_START(crc_pcl)
 	xor     crc2, crc2
 
 	## branch into array
-	leaq	jump_table(%rip), %bufp
-	movslq	(%bufp,%rax,4), len
-	addq	len, %bufp
+	movslq	(%rbp,%rax,4), %bufp
+	addq	%rbp, %bufp
 	.reloc	., R_X86_64_NONE, jump_table
 	JMP_NOSPEC bufp
 
@@ -197,7 +200,7 @@ SYM_FUNC_START(crc_pcl)
 .altmacro
 LABEL crc_ %i
 .noaltmacro
-	ENDBR
+	endbr64
 	crc32q   -i*8(block_0), crc_init
 	crc32q   -i*8(block_1), crc1
 	crc32q   -i*8(block_2), crc2
@@ -207,7 +210,7 @@ LABEL crc_ %i
 .altmacro
 LABEL crc_ %i
 .noaltmacro
-	ENDBR
+	endbr64
 	crc32q   -i*8(block_0), crc_init
 	crc32q   -i*8(block_1), crc1
 # SKIP  crc32  -i*8(block_2), crc2 ; Don't do this one yet
@@ -241,7 +244,7 @@ LABEL crc_ %i
 	################################################################
 
 LABEL crc_ 0
-	ENDBR
+	endbr64
 	mov     tmp, len
 	cmp     $128*24, tmp
 	jae     .Lfull_block
@@ -311,26 +314,11 @@ LABEL less_than_ %j			# less_than_j: Length should be in
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
-.size	jump_table, . - jump_table
-.type	jump_table, @object
-
 	################################################################
 	## PCLMULQDQ tables
 	## Table is 128 entries x 2 words (8 bytes) each
@@ -465,3 +453,21 @@ K_table:
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
+
+.size	jump_table, . - jump_table
+.type	jump_table, @object
+
+	.long	crc_pcl - .
-- 
2.47.0.rc1.288.g06298d1525-goog

