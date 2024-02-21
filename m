Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1931A482F3
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515344; cv=none; b=Bn7V40koSB+aHhv2payS8ndu1QMgq+35SdKZ5wCUM4hBdKaV9JyVTWPsxMDpv6R9te3EQxsfF6fmVgwPXZOx1bPXIeVf73uo317HeeM9QrPblFf1DVu4KlfpmLikjQMrhNWIy5flZt/jb7Vfd2zEvuijY1ZxLoePgTRS+Fts620=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515344; c=relaxed/simple;
	bh=2RZc+OzKZCl8YvmipTaTRDsbfIBsnndPUmVKA1yKSts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k89PP/ZYfifO1sooGUv2VntFuiC2JuDCHfRLdO5swEaEBkLDvhYb4DARlnDLMGYDKBGwrKwFd/gujLA4xKbh36T0i9JMb6MfZRxN6bfrQ7wYmywmtEwAZ2h+aqpEwHbAb3AFE7ZeVY/UwW/ZdwVEAA0a5POsTWOgrMZl1bqsWNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uAkLTbgQ; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uAkLTbgQ"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc05887ee9so7686529276.1
        for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708515342; x=1709120142; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y5gC7csmOryHPxIGBtz1GA+4X+0n6cre/zcvSeIDBs=;
        b=uAkLTbgQKCvEI/om6xBccWf4zMvbSY4wgMG2gJtNj1h1+Ex1mouCw1dcg0pJxb+iKZ
         vnqtbV7+T9OfvM21M2jtXh6l8fkAIDGMfShcTrGG1zxhwpWIh7UtBjhBTu3DvkMg44L8
         VX7GhXBc3po+6HmD2qSeaqK5so4EKxiwl5AbGP95cQO6d831ebgNfbQot/pIptEJLv2s
         +OsQmxzTRDUrfITr+DVgvgVB3opnob3q7fLD1RIfTzQppyTBJSEmj/hKAvHgMwGkHkfS
         RJukkHk6XA8ZrEoGSU2RgHFXYo46CqatqHoHwYB73AqEiO4yw2i4OdZzi79mCH5jGo+P
         E8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515342; x=1709120142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y5gC7csmOryHPxIGBtz1GA+4X+0n6cre/zcvSeIDBs=;
        b=q0cUdtLttqrDNJ1hZnxvkTmOlDBTwJCT4e+BtlbCW8rdgqplDE8b5DnN3A62y9xBRj
         djiT1VHOFG7ZjZqgL2vKd5DIlIcy7uX5wVUpZ3UW7QDPF34VfXbNLBibdbd6iX1AkKRN
         BYwaHgWUWSYp7h0CW5/khi1uWSgF/YFpaQQzLrvWSWDY+yrZjtM/pF6ER7b6ogQRvGD4
         cVUAtUH+jnDGot8BUz+PROKdoVSOUZqfm57NEpyR+IsdAj0awDvkXc10LSuF4D3DzbA/
         EGt27tNChytLjzFI4+snl1s6Y2aYtNYdABD5riQ2oJWiMJMemUAEKMWOQHutQirhdYub
         Pwsg==
X-Forwarded-Encrypted: i=1; AJvYcCUa1eaOURN4+07u4r9tRodC+Mvsl1fxZOrL5/Nq8awsqDQE2FcFU8NdrYHnj1xhzaOe4/+lq9h1xh5t1DlR+Zq15+fAzA==
X-Gm-Message-State: AOJu0YxWY5LfZ6xrS21rpzHHCnTDAM7YB38TlyH1lhky9kVUVd7PaM07
	+r0iO6CfzCw8O1EoT3a5dAKhTXDALojXI0BJEVyohzt7gbzPge3hpU0qdnbQiTx1kLBLmA==
X-Google-Smtp-Source: AGHT+IFELx03HuT0Inbkk/6jf+jmcEOFUz77S85HuXmJ2/vo3Tmzp9E1tSdM6FzUvRXx2iV06N6VbqE/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a25:c06:0:b0:dbe:387d:a8ef with SMTP id
 6-20020a250c06000000b00dbe387da8efmr680600ybm.1.1708515341658; Wed, 21 Feb
 2024 03:35:41 -0800 (PST)
Date: Wed, 21 Feb 2024 12:35:10 +0100
In-Reply-To: <20240221113506.2565718-18-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221113506.2565718-18-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903; i=ardb@kernel.org;
 h=from:subject; bh=swM7c8C7m6s+syovcWAlr4I1pvzKmPTAbfvGRxDNNBo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfXq/bf72s8c5X6zfe4kzhLF88Ur7P10Jv1+c5Ij3Kphl
 3trnr9SRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiISwXDP+Vl63+6nT136ee+
 a7WfF7mxtuzU745WC96z5anM3cc8hWkM/0Nz2E7NSCsXY+vlOrVpn+zruNaY9l8JFYocrFU2Tpo M/AA=
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221113506.2565718-21-ardb+git@google.com>
Subject: [PATCH v5 03/16] x86/startup_64: Use RIP_REL_REF() to access early_dynamic_pgts[]
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

early_dynamic_pgts[] and next_early_pgt are accessed from code that
executes from a 1:1 mapping so it cannot use a plain access from C.
Replace the use of fixup_pointer() with RIP_REL_REF(), which is better
and simpler.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head64.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index f98f5b6a06b5..2ac904110f6a 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -170,6 +170,7 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdv
 unsigned long __head __startup_64(unsigned long physaddr,
 				  struct boot_params *bp)
 {
+	pmd_t (*early_pgts)[PTRS_PER_PMD] = RIP_REL_REF(early_dynamic_pgts);
 	unsigned long load_delta, *p;
 	unsigned long pgtable_flags;
 	pgdval_t *pgd;
@@ -179,7 +180,6 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	pteval_t *mask_ptr;
 	bool la57;
 	int i;
-	unsigned int *next_pgt_ptr;
 
 	la57 = check_la57_support(physaddr);
 
@@ -231,15 +231,14 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * it avoids problems around wraparound.
 	 */
 
-	next_pgt_ptr = fixup_pointer(&next_early_pgt, physaddr);
-	pud = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], physaddr);
-	pmd = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], physaddr);
+	pud = &early_pgts[0]->pmd;
+	pmd = &early_pgts[1]->pmd;
+	RIP_REL_REF(next_early_pgt) = 2;
 
 	pgtable_flags = _KERNPG_TABLE_NOENC + sme_get_me_mask();
 
 	if (la57) {
-		p4d = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++],
-				    physaddr);
+		p4d = &early_pgts[RIP_REL_REF(next_early_pgt)++]->pmd;
 
 		i = (physaddr >> PGDIR_SHIFT) % PTRS_PER_PGD;
 		pgd[i + 0] = (pgdval_t)p4d + pgtable_flags;
-- 
2.44.0.rc0.258.g7320e95886-goog

