Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956AA4F215
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828129; cv=none; b=GuOg6LOv6KmQEqJ79AMSMNblU7jthH/79a2RPk94ZEPilVUyxAT7LWrPJ6arwMHIBPscKJUONUaBRBC2YIpPzlLYcf9cwvr9nyLShYiIqirWXMIfObYr++jjzB3qwTlm/1YrHCcW0fih3LXqUJmf9mgHK7qnGJnH3Az8cFDMjuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828129; c=relaxed/simple;
	bh=DJj3BFuLzBkxhSjsLhYR2ws+biY4+9pzQT+zUXENl3c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DamQPl2f4m9z/8kSU7rep8MLHKfhj9qeVFfRG2AxFcfXX1/Wrzvl3o22B5t9ughWlP0HqPPabjeV1DbFnStKrW67kK/5OOPG2vYn/jYPpPIZTD3dF5+0luOYAc4gNRiAwvejuQAIpWn9+tn4zJnh7khVPCfBAW7/IeZg4zLVTxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xftt5YWV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xftt5YWV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-40f01cf71ceso27082875e9.1
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 04:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707828126; x=1708432926; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pi1QTrH02KU6Nn/lWHnRc1l99YL4s4zfhgW+K3Dfm0A=;
        b=xftt5YWVTP2xEAUNCN8I6KoxQuxupyJNmWpy456Jn4RCGtCkdkDwL92bUFWoDOjjmX
         Giu6s0Mx4gNbLzUhAZiuV8j9rSAqt2vdTQnihP2XKvdEnZV85FnshM8FNvRS3lg1uVLK
         ejlqbZa3SawToSbbyPcjPIA5B8kPaKUD49APVHU0uCSh002FRs9ewU0CW1BKhrbH5S36
         Dv6XNmYfQ2YqNrQ265GkbFm2y8s8B5Mlt9OU8iByTQo1ylTS9NWbzSqjqa3ZPgv06Txm
         hFvbSDPhlj8ShN6zSRwLlaPJz6EGj5EB6g1zX19SODRTNPdRU0fBsqd1ctZCqAEDl09r
         Q0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828126; x=1708432926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi1QTrH02KU6Nn/lWHnRc1l99YL4s4zfhgW+K3Dfm0A=;
        b=uXE91bZ+DgpZdANazQeA4kEedtH+4YVXucjOivWhUNaBdXwTjZ7cuTG2ewyCgp06M+
         7Z7phE9sBCxzUhM51AiYUbIAQjx8OAOJLG+zxIpZSE760vK4pVxEoAqLTSU7pMYRlXNC
         ybKl8qBbGmFgAIoM5Lb4YFYMranaZ39T0UPzyftv4w+ATWUavrqtx+Xk3GJpXHI7gthO
         UhesPLpmNJ75Uz6CRTVwR3NI+8OvDp5We0TRtACtB1kGE2gfj9LT4YThD71ZIpEJCsWc
         HGV/WnBmk/P3kqtGXJJZl2ejhIB6qdObGWCWLgO1bc9MrI26T2e3ttYFFzU5WplHHX5i
         ECsQ==
X-Gm-Message-State: AOJu0Yy4PuVNk4BIjZt5E8vRA3vJXuSi1punriv/gAwmUxAHdU1nJm4P
	EFE7foJtcFbPJmVJtH8bC4KNHHra7pOPE5ZD6nK8L78ttUqyREoue3GlA6Jmrx6CwgyZxw==
X-Google-Smtp-Source: AGHT+IHLC8GtxXKNTCFF9+V5LAAR+zWHYcyG5/vyeXh9Ce3NCNGuQTJ2QkE6E7s7gjfYScaNvwLWoFLK
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:518f:b0:411:63af:64a with SMTP id
 fa15-20020a05600c518f00b0041163af064amr8527wmb.2.1707828125840; Tue, 13 Feb
 2024 04:42:05 -0800 (PST)
Date: Tue, 13 Feb 2024 13:41:46 +0100
In-Reply-To: <20240213124143.1484862-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240213124143.1484862-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6745; i=ardb@kernel.org;
 h=from:subject; bh=OERD3a266KSHXOboqoPZ/suMs8HVBE4QuXB3+uJqMiI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfV0ctcjcR/xndn+O15duyZz/9+hBPe2oDCmepa35w473
 WW7Pye3o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkYhIjw5nk2K6wbEedOOE5
 Aee2v49UfdsekcA1pVqA9/uTXQrPtzIy7F3qo793SfOOimuX7v0o8mtZGZDpkXyn6GYXm8W8lwt VuQA=
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213124143.1484862-15-ardb+git@google.com>
Subject: [PATCH v4 02/11] x86/startup_64: Replace pointer fixups with
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

The code in __startup64() runs from a 1:1 mapping of memory, and uses
explicit pointer arithmetic to convert symbol references generated by
the compiler into references that work correctly via this 1:1 mapping.

This relies on the compiler generating absolute symbol references, which
will be resolved by the linker using the kernel virtual mapping.
However, the compiler may just as well emit RIP-relative references,
even when not operating in PIC mode, and so this explicit pointer
arithmetic is fragile and should be avoided. The fixup routines also
take a 'physical base' argument which needs to be passed around as
well.

Convert these pointer fixups to RIP-relative references, which are
guaranteed to produce the correct values without any explicit
arithmetic, removing the need to pass around the physical load address.
It also makes the code substantially easier to understand.

Replace bare 510/511 constants with the appropriate symbolic constants
while at it.  Note that pgd_index(__START_KERNEL_map) always produces
the value 511, regardless of the number of paging levels used, so a
symbolic constant is used here as well.

The remaining fixup_int()/fixup_long() calls related to 5-level paging
will be removed in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head64.c | 57 ++++++++------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 9d7f12829f2d..4b08e321d168 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -77,6 +77,7 @@ static struct desc_struct startup_gdt[GDT_ENTRIES] __initdata = {
 	[GDT_ENTRY_KERNEL_DS]           = GDT_ENTRY_INIT(DESC_DATA64, 0, 0xfffff),
 };
 
+#ifdef CONFIG_X86_5LEVEL
 static void __head *fixup_pointer(void *ptr, unsigned long physaddr)
 {
 	return ptr - (void *)_text + (void *)physaddr;
@@ -87,7 +88,6 @@ static unsigned long __head *fixup_long(void *ptr, unsigned long physaddr)
 	return fixup_pointer(ptr, physaddr);
 }
 
-#ifdef CONFIG_X86_5LEVEL
 static unsigned int __head *fixup_int(void *ptr, unsigned long physaddr)
 {
 	return fixup_pointer(ptr, physaddr);
@@ -164,22 +164,21 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdv
 /* Code in __startup_64() can be relocated during execution, but the compiler
  * doesn't have to generate PC-relative relocations when accessing globals from
  * that function. Clang actually does not generate them, which leads to
- * boot-time crashes. To work around this problem, every global pointer must
- * be adjusted using fixup_pointer().
+ * boot-time crashes. To work around this problem, every global variable must
+ * be accessed using RIP_REL_REF().
  */
 unsigned long __head __startup_64(unsigned long physaddr,
 				  struct boot_params *bp)
 {
-	unsigned long load_delta, *p;
+	pmd_t (*early_pgts)[PTRS_PER_PMD] = RIP_REL_REF(early_dynamic_pgts);
 	unsigned long pgtable_flags;
+	unsigned long load_delta;
 	pgdval_t *pgd;
 	p4dval_t *p4d;
 	pudval_t *pud;
 	pmdval_t *pmd, pmd_entry;
-	pteval_t *mask_ptr;
 	bool la57;
 	int i;
-	unsigned int *next_pgt_ptr;
 
 	la57 = check_la57_support(physaddr);
 
@@ -192,6 +191,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * and the address I am actually running at.
 	 */
 	load_delta = physaddr - (unsigned long)(_text - __START_KERNEL_map);
+	RIP_REL_REF(phys_base) = load_delta;
 
 	/* Is the address not 2M aligned? */
 	if (load_delta & ~PMD_MASK)
@@ -201,25 +201,19 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	load_delta += sme_get_me_mask();
 
 	/* Fixup the physical addresses in the page table */
-
-	pgd = fixup_pointer(early_top_pgt, physaddr);
-	p = pgd + pgd_index(__START_KERNEL_map);
-	if (la57)
-		*p = (unsigned long)level4_kernel_pgt;
-	else
-		*p = (unsigned long)level3_kernel_pgt;
-	*p += _PAGE_TABLE_NOENC - __START_KERNEL_map + load_delta;
-
 	if (la57) {
-		p4d = fixup_pointer(level4_kernel_pgt, physaddr);
-		p4d[511] += load_delta;
+		p4d = (p4dval_t *)&RIP_REL_REF(level4_kernel_pgt);
+		p4d[MAX_PTRS_PER_P4D - 1] += load_delta;
 	}
 
-	pud = fixup_pointer(level3_kernel_pgt, physaddr);
-	pud[510] += load_delta;
-	pud[511] += load_delta;
+	pud = &RIP_REL_REF(level3_kernel_pgt)->pud;
+	pud[PTRS_PER_PUD - 2] += load_delta;
+	pud[PTRS_PER_PUD - 1] += load_delta;
+
+	pgd = &RIP_REL_REF(early_top_pgt)->pgd;
+	pgd[PTRS_PER_PGD - 1] = (pgdval_t)(la57 ? p4d : pud) | _PAGE_TABLE_NOENC;
 
-	pmd = fixup_pointer(level2_fixmap_pgt, physaddr);
+	pmd = &RIP_REL_REF(level2_fixmap_pgt)->pmd;
 	for (i = FIXMAP_PMD_TOP; i > FIXMAP_PMD_TOP - FIXMAP_PMD_NUM; i--)
 		pmd[i] += load_delta;
 
@@ -230,16 +224,14 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * it avoids problems around wraparound.
 	 */
 
-	next_pgt_ptr = fixup_pointer(&next_early_pgt, physaddr);
-	pud = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], physaddr);
-	pmd = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], physaddr);
+	pud = &early_pgts[0]->pmd;
+	pmd = &early_pgts[1]->pmd;
+	p4d = &early_pgts[2]->pmd;
+	RIP_REL_REF(next_early_pgt) = 3;
 
 	pgtable_flags = _KERNPG_TABLE_NOENC + sme_get_me_mask();
 
 	if (la57) {
-		p4d = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++],
-				    physaddr);
-
 		i = (physaddr >> PGDIR_SHIFT) % PTRS_PER_PGD;
 		pgd[i + 0] = (pgdval_t)p4d + pgtable_flags;
 		pgd[i + 1] = (pgdval_t)p4d + pgtable_flags;
@@ -259,8 +251,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 
 	pmd_entry = __PAGE_KERNEL_LARGE_EXEC & ~_PAGE_GLOBAL;
 	/* Filter out unsupported __PAGE_KERNEL_* bits: */
-	mask_ptr = fixup_pointer(&__supported_pte_mask, physaddr);
-	pmd_entry &= *mask_ptr;
+	pmd_entry &= RIP_REL_REF(__supported_pte_mask);
 	pmd_entry += sme_get_me_mask();
 	pmd_entry +=  physaddr;
 
@@ -286,7 +277,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * error, causing the BIOS to halt the system.
 	 */
 
-	pmd = fixup_pointer(level2_kernel_pgt, physaddr);
+	pmd = &RIP_REL_REF(level2_kernel_pgt)->pmd;
 
 	/* invalidate pages before the kernel image */
 	for (i = 0; i < pmd_index((unsigned long)_text); i++)
@@ -301,12 +292,6 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	for (; i < PTRS_PER_PMD; i++)
 		pmd[i] &= ~_PAGE_PRESENT;
 
-	/*
-	 * Fixup phys_base - remove the memory encryption mask to obtain
-	 * the true physical address.
-	 */
-	*fixup_long(&phys_base, physaddr) += load_delta - sme_get_me_mask();
-
 	return sme_postprocess_startup(bp, pmd);
 }
 
-- 
2.43.0.687.g38aa6559b0-goog

