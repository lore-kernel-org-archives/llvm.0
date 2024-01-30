Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8C7D409
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 22:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652546; cv=none; b=eW6d9LS6Cm0NbHouWxwQY/E5nEY63Cl/hOsXUrh8cR69x469mCpxdT8Qj6JW+Cf03a9FU9LBHRfvOmL/f0vCTJPrU6MzfJepy2ijdYkUV3WSX+t7bZlRpWziIBcn/Xu9tj1VRoAyODVJlqTGBJdcRWMNiC5LQ6kDV3Si0tvtubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652546; c=relaxed/simple;
	bh=cAGKrm92oVrNmOiOMn8fy23L/TVwM7iclaVD4LZh5WE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J7ge4QXsBcdvYCQcCD1Zr5Iz9UKgKEeMIEt1CsY3U9z86vX2J39lXKd7Au2ZP0/ju7/U8wSJIGG2C4zWh8Fasn/xwVZp490Btq9GG9irQE7utA338NC+6+9U0BF7USY83M9jImPxpiW93DE5Obu5WEkDF/NUuiVX9T8BJ0z+QBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fF8CFle+; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fF8CFle+"
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3637e2a2e5fso1819095ab.0
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 14:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706652544; x=1707257344; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v4ZNXq4RV3WjW3eGUbkswFledHjcQCF1i0cLTt8hHb8=;
        b=fF8CFle+XBaRKiRP7o01QwWF3LI61qUKxi6vsJXI2XdQDbR5cc3kke/tXv9mFU/WOK
         1wbQj1QZ8yGlWvVZWM3a4mQDDMczm2+7ZazeGvLqroYDBADdXaKrAkCuw5eORJHP3m1c
         EOAo7fpr4Le7/IhVTCLBB2F78S2bMwVYnzWRG7ul5Tz2kEhk5RrlWOaml1WYIS0cBd4V
         OoK7vanwR1JQ0PajyYDbr2GqDkih5Yfr3mw4SS/7ceSl3cIDe9XdcnnhD7pLrJN1iQJt
         dPpMLwi2N8ts7U0aIqkEzYec93Hy5/+f2b8sDxxteiB5sMoq9Y7jFAhM7g7Ur71mO5WU
         ruNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652544; x=1707257344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4ZNXq4RV3WjW3eGUbkswFledHjcQCF1i0cLTt8hHb8=;
        b=U9NJBouo6XiFNmoby5tH9wrQgWpVNhSWZHGVhCwgXC2UCP7gEh1ZK+lJOTHazXjT/1
         r+HGmmEdPhE7JK2Bj4R3qAg9WLfLI2xNdDBMRwIW2EUAAjTkoXBoYZE4VouWxbB/7aCD
         00PFOVd7rpN3r1J69iVv8KbwhL/GQtEu2QhnfGebmGT9ePU3t8onX/CATbrevJUtw37f
         dr/8Em0q5mKLye4hjl/xZBg7FMGQsC7s3q4Hnve8TLgJa6lmcDAT1ALo9u/AS2cf3+3H
         vBbIrTLAtUhyaoJVOyvRBFh3ai8486L3yq0dX/KosJnXnw79pKt8Y/nfd8F9HXJWDoE6
         KB8g==
X-Gm-Message-State: AOJu0Yw6F+FTK0FBBPLqgl+cDCTtm0PhpCZZb81gPUzXgbzhw11MQc5J
	3yaer8gZikQAT5aLXDWLAE0amylvQ3zZEpGaAYK3GqZMtYIpUVLnr+JDcFW6T7jH+7DUEwDziAK
	s5xKXL2bUSShLbKFZPFcBEpoeBKhY/A==
X-Google-Smtp-Source: AGHT+IGLFDGZPeP67g5zfyhIPj2E3tcSBR6QJ4v+rNDYBBTtGTydMOdlEidlwkSIVWN2gnrHVjbqLZp5evEJhBBxyEQp
X-Received: from loughlin00.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:1b6f])
 (user=kevinloughlin job=sendgmr) by 2002:a05:6e02:92d:b0:363:8c76:8741 with
 SMTP id o13-20020a056e02092d00b003638c768741mr50259ilt.0.1706652543762; Tue,
 30 Jan 2024 14:09:03 -0800 (PST)
Date: Tue, 30 Jan 2024 22:08:45 +0000
In-Reply-To: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240130220845.1978329-3-kevinloughlin@google.com>
Subject: [PATCH v3 2/2] x86/head64: Replace pointer fixups with RIP_RELATIVE_ADDR()
From: Kevin Loughlin <kevinloughlin@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Hou Wenlong <houwenlong.hwl@antgroup.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>
Cc: Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, 
	Jacob Xu <jacobhxu@google.com>, Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that we have RIP_RELATIVE_ADDR(), we can replace the "fixup_*()"
family of functions in head64.c with the new macro for cleaner code.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 arch/x86/kernel/head64.c | 63 +++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 39 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index d159239997f4..e782149eefc4 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -85,23 +85,8 @@ static struct desc_ptr startup_gdt_descr __initdata = {
 	.address = 0,
 };
 
-static void __head *fixup_pointer(void *ptr, unsigned long physaddr)
-{
-	return ptr - (void *)_text + (void *)physaddr;
-}
-
-static unsigned long __head *fixup_long(void *ptr, unsigned long physaddr)
-{
-	return fixup_pointer(ptr, physaddr);
-}
-
 #ifdef CONFIG_X86_5LEVEL
-static unsigned int __head *fixup_int(void *ptr, unsigned long physaddr)
-{
-	return fixup_pointer(ptr, physaddr);
-}
-
-static bool __head check_la57_support(unsigned long physaddr)
+static bool __head check_la57_support(void)
 {
 	/*
 	 * 5-level paging is detected and enabled at kernel decompression
@@ -110,17 +95,17 @@ static bool __head check_la57_support(unsigned long physaddr)
 	if (!(native_read_cr4() & X86_CR4_LA57))
 		return false;
 
-	*fixup_int(&__pgtable_l5_enabled, physaddr) = 1;
-	*fixup_int(&pgdir_shift, physaddr) = 48;
-	*fixup_int(&ptrs_per_p4d, physaddr) = 512;
-	*fixup_long(&page_offset_base, physaddr) = __PAGE_OFFSET_BASE_L5;
-	*fixup_long(&vmalloc_base, physaddr) = __VMALLOC_BASE_L5;
-	*fixup_long(&vmemmap_base, physaddr) = __VMEMMAP_BASE_L5;
+	*((unsigned int *)RIP_RELATIVE_ADDR(__pgtable_l5_enabled)) = 1;
+	*((unsigned int *)RIP_RELATIVE_ADDR(pgdir_shift)) = 48;
+	*((unsigned int *)RIP_RELATIVE_ADDR(ptrs_per_p4d)) = 512;
+	*((unsigned long *)RIP_RELATIVE_ADDR(page_offset_base)) = __PAGE_OFFSET_BASE_L5;
+	*((unsigned long *)RIP_RELATIVE_ADDR(vmalloc_base)) = __VMALLOC_BASE_L5;
+	*((unsigned long *)RIP_RELATIVE_ADDR(vmemmap_base)) = __VMEMMAP_BASE_L5;
 
 	return true;
 }
 #else
-static bool __head check_la57_support(unsigned long physaddr)
+static bool __head check_la57_support(void)
 {
 	return false;
 }
@@ -175,8 +160,8 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdv
  * Code in __startup_64() can be relocated during execution, but the compiler
  * doesn't have to generate PC-relative relocations when accessing globals from
  * that function. Clang actually does not generate them, which leads to
- * boot-time crashes. To work around this problem, every global pointer must
- * be adjusted using fixup_pointer() or RIP_RELATIVE_ADDR().
+ * boot-time crashes. To work around this problem, every global variable access
+ * must be adjusted using RIP_RELATIVE_ADDR().
  */
 unsigned long __head __startup_64(unsigned long physaddr,
 				  struct boot_params *bp)
@@ -194,7 +179,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	int i;
 	unsigned int *next_pgt_ptr;
 
-	la57 = check_la57_support(physaddr);
+	la57 = check_la57_support();
 
 	/* Is the address too large? */
 	if (physaddr >> MAX_PHYSMEM_BITS)
@@ -215,7 +200,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 
 	/* Fixup the physical addresses in the page table */
 
-	pgd = fixup_pointer(early_top_pgt, physaddr);
+	pgd = RIP_RELATIVE_ADDR(early_top_pgt);
 	p = pgd + pgd_index(__START_KERNEL_map);
 	if (la57)
 		*p = (unsigned long)level4_kernel_pgt;
@@ -224,15 +209,15 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	*p += _PAGE_TABLE_NOENC - __START_KERNEL_map + load_delta;
 
 	if (la57) {
-		p4d = fixup_pointer(level4_kernel_pgt, physaddr);
+		p4d = RIP_RELATIVE_ADDR(level4_kernel_pgt);
 		p4d[511] += load_delta;
 	}
 
-	pud = fixup_pointer(level3_kernel_pgt, physaddr);
+	pud = RIP_RELATIVE_ADDR(level3_kernel_pgt);
 	pud[510] += load_delta;
 	pud[511] += load_delta;
 
-	pmd = fixup_pointer(level2_fixmap_pgt, physaddr);
+	pmd = RIP_RELATIVE_ADDR(level2_fixmap_pgt);
 	for (i = FIXMAP_PMD_TOP; i > FIXMAP_PMD_TOP - FIXMAP_PMD_NUM; i--)
 		pmd[i] += load_delta;
 
@@ -243,8 +228,8 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * it avoids problems around wraparound.
 	 */
 
-	next_pgt_ptr = fixup_pointer(&next_early_pgt, physaddr);
-	early_dynamic_pgts_ptr = fixup_pointer(early_dynamic_pgts, physaddr);
+	early_dynamic_pgts_ptr = RIP_RELATIVE_ADDR(early_dynamic_pgts);
+	next_pgt_ptr = RIP_RELATIVE_ADDR(next_early_pgt);
 	pud = (pudval_t *) early_dynamic_pgts_ptr[(*next_pgt_ptr)++];
 	pmd = (pmdval_t *) early_dynamic_pgts_ptr[(*next_pgt_ptr)++];
 
@@ -272,7 +257,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 
 	pmd_entry = __PAGE_KERNEL_LARGE_EXEC & ~_PAGE_GLOBAL;
 	/* Filter out unsupported __PAGE_KERNEL_* bits: */
-	mask_ptr = fixup_pointer(&__supported_pte_mask, physaddr);
+	mask_ptr = RIP_RELATIVE_ADDR(__supported_pte_mask);
 	pmd_entry &= *mask_ptr;
 	pmd_entry += sme_me_mask_fixed_up;
 	pmd_entry +=  physaddr;
@@ -299,7 +284,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * error, causing the BIOS to halt the system.
 	 */
 
-	pmd = fixup_pointer(level2_kernel_pgt, physaddr);
+	pmd = RIP_RELATIVE_ADDR(level2_kernel_pgt);
 
 	/* invalidate pages before the kernel image */
 	for (i = 0; i < pmd_index((unsigned long)_text); i++)
@@ -318,7 +303,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * Fixup phys_base - remove the memory encryption mask to obtain
 	 * the true physical address.
 	 */
-	*fixup_long(&phys_base, physaddr) += load_delta - sme_me_mask_fixed_up;
+	*((unsigned long *)RIP_RELATIVE_ADDR(phys_base)) += load_delta - sme_me_mask_fixed_up;
 
 	return sme_postprocess_startup(bp, pmd);
 }
@@ -594,15 +579,15 @@ static void set_bringup_idt_handler(gate_desc *idt, int n, void *handler)
 /* This runs while still in the direct mapping */
 static void __head startup_64_load_idt(unsigned long physbase)
 {
-	struct desc_ptr *desc = fixup_pointer(&bringup_idt_descr, physbase);
-	gate_desc *idt = fixup_pointer(bringup_idt_table, physbase);
+	struct desc_ptr *desc = RIP_RELATIVE_ADDR(bringup_idt_descr);
+	gate_desc *idt = RIP_RELATIVE_ADDR(bringup_idt_table);
 
 
 	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
 		void *handler;
 
 		/* VMM Communication Exception */
-		handler = fixup_pointer(vc_no_ghcb, physbase);
+		handler = RIP_RELATIVE_ADDR(vc_no_ghcb);
 		set_bringup_idt_handler(idt, X86_TRAP_VC, handler);
 	}
 
@@ -629,7 +614,7 @@ void early_setup_idt(void)
 void __head startup_64_setup_env(unsigned long physbase)
 {
 	/* Load GDT */
-	startup_gdt_descr.address = (unsigned long)fixup_pointer(startup_gdt, physbase);
+	startup_gdt_descr.address = (unsigned long)RIP_RELATIVE_ADDR(startup_gdt);
 	native_load_gdt(&startup_gdt_descr);
 
 	/* New GDT is live - reload data segment registers */
-- 
2.43.0.429.g432eaa2c6b-goog

