Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F192D29A5
	for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 12:27:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8ACB23A;
	Mon, 21 Nov 2022 04:28:01 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.25.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 299953F7D8;
	Mon, 21 Nov 2022 04:27:54 -0800 (PST)
Date: Mon, 21 Nov 2022 12:27:51 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] arm64/mm: Drop redundant BUG_ON(!pgtable_alloc)
Message-ID: <Y3tuxzl54BvG406t@FVFF77S0Q05N.cambridge.arm.com>
References: <20221118053102.500216-1-anshuman.khandual@arm.com>
 <Y3pS5fdZ3MdLZ00t@dev-arch.thelio-3990X>
 <fd67eca3-59f4-4455-e3db-ba853c3f949b@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd67eca3-59f4-4455-e3db-ba853c3f949b@arm.com>

On Mon, Nov 21, 2022 at 11:00:42AM +0530, Anshuman Khandual wrote:
> Hello Nathan,
> 
> Thanks for the report.
> 
> On 11/20/22 21:46, Nathan Chancellor wrote:
> > Hi Anshuman,

> > I just bisected a boot failure in our QEMU-based continuous integration
> > setup to this change as commit 9ed2b4616d4e ("arm64/mm: Drop redundant
> > BUG_ON(!pgtable_alloc)") in the arm64 tree. There is no output so the
> > panic clearly happens early at boot. If I move back to the previous
> > commit and add a WARN_ON() like so:
> > 
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index d386033a074c..9280a92ff920 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -383,6 +383,7 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
> >  	phys &= PAGE_MASK;
> >  	addr = virt & PAGE_MASK;
> >  	end = PAGE_ALIGN(virt + size);
> > +	WARN_ON(!pgtable_alloc);
> >  
> >  	do {
> >  		next = pgd_addr_end(addr, end);
> > 
> > I do see some stacktraces. I have attached the boot log from QEMU.
> > 
> > If there is any additional information I can provide or patches I can
> > test, I am more than happy to do so.
> 
> There are couple of instances, where __create_pgd_mapping() function gets called
> without a valid pgtable alloc function (NULL is passed on instead), as it is not
> expected to allocate page table pages, during the mapping process. The following
> change after this patch should solve the reported problem.
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9ea8e9039992..a00563122fcb 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -42,6 +42,7 @@
>  #define NO_BLOCK_MAPPINGS      BIT(0)
>  #define NO_CONT_MAPPINGS       BIT(1)
>  #define NO_EXEC_MAPPINGS       BIT(2)  /* assumes FEAT_HPDS is not used */
> +#define NO_ALLOC_MAPPINGS      BIT(3)  /* does not allocate page table pages */
>  
>  int idmap_t0sz __ro_after_init;
>  
> @@ -380,7 +381,7 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>         phys &= PAGE_MASK;
>         addr = virt & PAGE_MASK;
>         end = PAGE_ALIGN(virt + size);
> -       BUG_ON(!pgtable_alloc);
> +       BUG_ON(!(flags & NO_ALLOC_MAPPINGS) && !pgtable_alloc);
>  
>         do {
>                 next = pgd_addr_end(addr, end);
> @@ -453,7 +454,7 @@ static void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
>                 return;
>         }
>         __create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
> -                            NO_CONT_MAPPINGS);
> +                            NO_CONT_MAPPINGS | NO_ALLOC_MAPPINGS);
>  }
>  
>  void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
> @@ -481,7 +482,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
>         }
>  
>         __create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
> -                            NO_CONT_MAPPINGS);
> +                            NO_CONT_MAPPINGS | NO_ALLOC_MAPPINGS);
>  
>         /* flush the TLBs after updating live kernel mappings */
>         flush_tlb_kernel_range(virt, virt + size);

This is now more complicated than what we had originally, and it doesn't catch
the case where the caller sets NO_ALLOC_MAPPINGS but the callee ends up needing
to perform an allocation, which the old code would have caught.

This is clearly more subtle than we thought initially; for now could we please
just drop the patch?

Thanks,
Mark.
