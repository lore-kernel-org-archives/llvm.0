Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C82C9D
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 00:50:03 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id p6-20020a63ab06000000b0033fcc84d4f6so11330282pgf.5
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 16:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=LW0CGWCdKGNybf5BvgByl5slEYTpalX7lGLuyFTmzzE=;
        b=KF/N+QYr4iO95cCpL1G4uzy3+ivkEMfpIpF7KmjMsjT6UFuAiLOkDkuFPC+4P2sUlY
         ihpRqaIjOz4kN6/89V2YCtvtnEp6CgO2lgyYbLPfV92eWmU/hBojGwPjCs3FwKyZsXrX
         yuoY9faMjNWzQpgzPtwNASEsZCoeIVq40P6nCQwX4KrJmIivrRIFkVMNC4gBhgu7QdQK
         nzJ5R1NlpEyjMBzZKMCYYmm8a4J05RK4Y1u2dvI4M0nezvomCbEtKSi+IA/jtC0k80d9
         fXLvxpGVAcj1/8GzA0YN4YJezqs8Fe3DTGszxuuV5bau90Ty1COT15DCtwmt2tWIfHVv
         EWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=LW0CGWCdKGNybf5BvgByl5slEYTpalX7lGLuyFTmzzE=;
        b=myj/lldorsOzzYJCSZonWtyvGMrEutvNlxS+sXxAFicltK1n9+q93xBw6Ze52t8KAN
         kniF9jqvMVY5rPpYXMExvIAC6J0yJDW9oqoe5o0NOEXUxBM5CrFE4awBT+OdsUp1UfUM
         pm01eE00qmUWYoyEmVevXSneiZqj1bnU6WWDO5ySFSoSnOkqeRdcjpUNB51C96Tv9MSA
         CWTS3n4erYQhoGgkJM5vfWd9JwsRaWkfoh9C6itW7UuneBSceNsvLl2Q+YpKh8l7jTV5
         ghy6p1ik0B7wC30TaymnC1cHA4CRea654YikSeZSoPFuQcL19kmlk3ickrrL8SDfx0mC
         ZQ6A==
X-Gm-Message-State: AOAM5325Hj5781yrUG8a4TVXffJLa/DCR6ydXqjG9qcHtaGrjhCY7DsR
	aWjUd7WlIqrHbeRquKYro1KUkjVh/6U=
X-Google-Smtp-Source: ABdhPJz2wdcFwYzdK82hva9pUCt+iTHlqo2myaKtJAqY+WJziu6dFA2uGVEY5NWktaR6JfhrV1Ro8gjVAm8=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2cf:: with SMTP id
 b15mr13593957pft.0.1643763003513; Tue, 01 Feb 2022 16:50:03 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Feb 2022 00:49:43 +0000
In-Reply-To: <20220202004945.2540433-1-seanjc@google.com>
Message-Id: <20220202004945.2540433-4-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220202004945.2540433-1-seanjc@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v2 3/5] KVM: x86: Use __try_cmpxchg_user() to update guest PTE
 A/D bits
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Tadeusz Struk <tadeusz.struk@linaro.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Use the recently introduced __try_cmpxchg_user() to update guest PTE A/D
bits instead of mapping the PTE into kernel address space.  The VM_PFNMAP
path is broken as it assumes that vm_pgoff is the base pfn of the mapped
VMA range, which is conceptually wrong as vm_pgoff is the offset relative
to the file and has nothing to do with the pfn.  The horrific hack worked
for the original use case (backing guest memory with /dev/mem), but leads
to accessing "random" pfns for pretty much any other VM_PFNMAP case.

Fixes: bd53cb35a3e9 ("X86/KVM: Handle PFNs outside of kernel reach when touching GPTEs")
Debugged-by: Tadeusz Struk <tadeusz.struk@linaro.org>
Tested-by: Tadeusz Struk <tadeusz.struk@linaro.org>
Reported-by: syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 45 +---------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 5b5bdac97c7b..551de15f342f 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -143,49 +143,6 @@ static bool FNAME(is_rsvd_bits_set)(struct kvm_mmu *mmu, u64 gpte, int level)
 	       FNAME(is_bad_mt_xwr)(&mmu->guest_rsvd_check, gpte);
 }
 
-static int FNAME(cmpxchg_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
-			       pt_element_t __user *ptep_user, unsigned index,
-			       pt_element_t orig_pte, pt_element_t new_pte)
-{
-	int npages;
-	pt_element_t ret;
-	pt_element_t *table;
-	struct page *page;
-
-	npages = get_user_pages_fast((unsigned long)ptep_user, 1, FOLL_WRITE, &page);
-	if (likely(npages == 1)) {
-		table = kmap_atomic(page);
-		ret = CMPXCHG(&table[index], orig_pte, new_pte);
-		kunmap_atomic(table);
-
-		kvm_release_page_dirty(page);
-	} else {
-		struct vm_area_struct *vma;
-		unsigned long vaddr = (unsigned long)ptep_user & PAGE_MASK;
-		unsigned long pfn;
-		unsigned long paddr;
-
-		mmap_read_lock(current->mm);
-		vma = find_vma_intersection(current->mm, vaddr, vaddr + PAGE_SIZE);
-		if (!vma || !(vma->vm_flags & VM_PFNMAP)) {
-			mmap_read_unlock(current->mm);
-			return -EFAULT;
-		}
-		pfn = ((vaddr - vma->vm_start) >> PAGE_SHIFT) + vma->vm_pgoff;
-		paddr = pfn << PAGE_SHIFT;
-		table = memremap(paddr, PAGE_SIZE, MEMREMAP_WB);
-		if (!table) {
-			mmap_read_unlock(current->mm);
-			return -EFAULT;
-		}
-		ret = CMPXCHG(&table[index], orig_pte, new_pte);
-		memunmap(table);
-		mmap_read_unlock(current->mm);
-	}
-
-	return (ret != orig_pte);
-}
-
 static bool FNAME(prefetch_invalid_gpte)(struct kvm_vcpu *vcpu,
 				  struct kvm_mmu_page *sp, u64 *spte,
 				  u64 gpte)
@@ -284,7 +241,7 @@ static int FNAME(update_accessed_dirty_bits)(struct kvm_vcpu *vcpu,
 		if (unlikely(!walker->pte_writable[level - 1]))
 			continue;
 
-		ret = FNAME(cmpxchg_gpte)(vcpu, mmu, ptep_user, index, orig_pte, pte);
+		ret = __try_cmpxchg_user(ptep_user, &orig_pte, pte, fault);
 		if (ret)
 			return ret;
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

