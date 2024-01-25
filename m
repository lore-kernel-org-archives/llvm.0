Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE0455C36
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182392; cv=none; b=dXxDCvPaBK1u4A5dGcw0T3d+T/bFm+V9oZozJUyPJBsxnzdL19w0zTourXuIfRb2nT8sGtsfXglLyBL5DbTn2Bg6i93f+nqz2QkK/IN2Eg8m5o0k+Wv1N0Ab71v8418QOTpJIJw80ME93pwz/rWybiOu70rf3JjT21bgPUzPPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182392; c=relaxed/simple;
	bh=0byiLPnDWEQfwFYPOageH65AoBGROCIbfIjdgEIOffg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qYKfoj+o2vS4KjcNAUuqZA+/qn1CvE3hcEPVMK+B/Vt5HWNIzR7pb66yaHplextg65YCpvycSpTG088PdG9mdA/4jM84NpCvBFiMJqoSPpEL6OUYXasPahCm1PD/ls++jGl1mftf4QxMnuYocCoj450bhxTOBdsXwSnrfRNko/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fNz124cV; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fNz124cV"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5fffb2798bfso72123617b3.2
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182389; x=1706787189; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu5UpmPKB2YLCZqvfGM/x/cMDohVrJdP/wVfbDfAQyQ=;
        b=fNz124cVWKaeNQ+kkwnvA6ksPnDxzx7Py9yUTnszl2Vt62kgiHHBZFBmWse+HM2VsJ
         asLPcpbWgYrADutV/10YC5oFGzJaTJXeq6nbkhDu1OCs149PNOFsevIA9mFV/Ak/x9lh
         v5bVocm0j4DheE6H5H9nZj+Nn6gAI/QjJD4ZGSuEw88jYtB6aIt7k+S4D9mh4fy7Hidr
         oeE6szfchMfcONTqjlrizNafrTiQamyk2Wb23+l0a6ivy+6fYdg3JJpzrtOz9auMW+8O
         goDZvWR1/ejvV+QwU3D0dHCUOn2ScXFpyRXWQq1q7gB+9v3tt7IPdTPeaDO0zxcwT01g
         IZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182389; x=1706787189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu5UpmPKB2YLCZqvfGM/x/cMDohVrJdP/wVfbDfAQyQ=;
        b=NGBCngS+6StveExi3IrZc4pEqBo6FroSqJy4okUhjRmeoQV4aHnIOvGAbN40db9HQX
         xWrOr9DfxW245FZfltIIbs7FfYJW6hzr5EBiAGI8MzzKUXFvPILUHwcMSAOTojGB6jJs
         6R8zXGwlzWzDb55YIm+5czxMQFdZAV/hsWmAQ2OwceqRzVQxsVZkJMC7XXaPw8qvlx/Y
         gtCuQ/waGWOmwgqdLdeSGKqNJiWusZfynEb6++3HA1rhUFJ9F8ohau0Yhpmvk8Vd63Cp
         qctkJeYhlEBD9vaB6hxodpUC4ZQnBXw/6vLY5+O/jsUWh4i9BPF9/mU5db/RuKf0zf95
         2F+g==
X-Gm-Message-State: AOJu0YyR0y8/iSN0g5SUG3zRyM6U8LpLJG7krpcjjb849gRe0+cEi5Lz
	JnCMjEyQGC+UkbVDKXpyQYNgk+Fdwh7GZyG/CnnRWKYGgs1OH+opMgJUj1w4IKiJ6GMV0g==
X-Google-Smtp-Source: AGHT+IH2ZMdK0yFVs9V28oU4JUMZ4C9voPcHonSkBQFa+Qf4lSb0VDC+TkQiCrNKNkecK2pTIjdLakiz
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6902:1ac5:b0:dbe:642c:2124 with SMTP id
 db5-20020a0569021ac500b00dbe642c2124mr453115ybb.0.1706182389569; Thu, 25 Jan
 2024 03:33:09 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:33 +0100
In-Reply-To: <20240125112818.2016733-19-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=ardb@kernel.org;
 h=from:subject; bh=Hd3xYUTi1QV5SlyH4OmfppihXDWH6zHA/zraGYWG1jw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWT6y/2x/MP/uz3CVv7baNn60+dbbIHuA/9mfjj3f1fR
 1/P6RIq7yhlYRDjYJAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATmaTAyPD2+pa2Dxbsd/fN
 jrsvvvyopfMmqYBp+f8FDP72z02YFf2V4X+B2iyJ35HcJiKreLw4Tjw9tO5KjeqymsqthxJdpnt 0O7MAAA==
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-33-ardb+git@google.com>
Subject: [PATCH v2 14/17] x86/sev: Avoid WARN() in early code
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

Drop uses of WARN() from code that is reachable from the early primary
boot path which executes via the initial 1:1 mapping before the kernel
page tables are populated. This is unsafe and mostly pointless, given
that printk() does not actually work yet at this point.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/sev.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index e5793505b307..8eb6454eadd6 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -698,7 +698,7 @@ static void __pitext early_set_pages_state(unsigned long vaddr, unsigned long pa
 		if (op == SNP_PAGE_STATE_SHARED) {
 			/* Page validation must be rescinded before changing to shared */
 			ret = pvalidate(vaddr, RMP_PG_SIZE_4K, false);
-			if (WARN(ret, "Failed to validate address 0x%lx ret %d", paddr, ret))
+			if (ret)
 				goto e_term;
 		}
 
@@ -711,21 +711,16 @@ static void __pitext early_set_pages_state(unsigned long vaddr, unsigned long pa
 
 		val = sev_es_rd_ghcb_msr();
 
-		if (WARN(GHCB_RESP_CODE(val) != GHCB_MSR_PSC_RESP,
-			 "Wrong PSC response code: 0x%x\n",
-			 (unsigned int)GHCB_RESP_CODE(val)))
+		if (GHCB_RESP_CODE(val) != GHCB_MSR_PSC_RESP)
 			goto e_term;
 
-		if (WARN(GHCB_MSR_PSC_RESP_VAL(val),
-			 "Failed to change page state to '%s' paddr 0x%lx error 0x%llx\n",
-			 op == SNP_PAGE_STATE_PRIVATE ? "private" : "shared",
-			 paddr, GHCB_MSR_PSC_RESP_VAL(val)))
+		if (GHCB_MSR_PSC_RESP_VAL(val))
 			goto e_term;
 
 		if (op == SNP_PAGE_STATE_PRIVATE) {
 			/* Page validation must be performed after changing to private */
 			ret = pvalidate(vaddr, RMP_PG_SIZE_4K, true);
-			if (WARN(ret, "Failed to validate address 0x%lx ret %d", paddr, ret))
+			if (ret)
 				goto e_term;
 		}
 
-- 
2.43.0.429.g432eaa2c6b-goog

