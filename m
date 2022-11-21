Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E75D3C2E
	for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 12:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF7EC433D6;
	Mon, 21 Nov 2022 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669035095;
	bh=hk2aUB5pt6JJuleoc6iOhWpUXoHz8hORZDiVJL9+98E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X23QJBIvxLaqj+idLvRDjxZNy0pQ+W06sbxOwUSmAMlztiAwic772hPgi8gNLaaz2
	 3KheMwlIfveytbwuy6GV4tLt6PKeZ9nQ+2Um8OOn/s3KeUNwForpVeqeiKm1vN7hz5
	 BKBxnxWch1TUjp15tQSbFj30dmHoGT9ndz51eRXvvPaoNnXAiqmVX8y5FrnImRdjLr
	 hwslneyM/kPzb0tykmlgexVdB2BSVi+OoydRwkFsAn4fhv80xagF4//unPtmlXjlsL
	 q+gZDCA32Y5o3+AjVCwX+RBjpHy+IFliStcd/r2aPQGM1QDeQ8bD39ix2MyJHLy19u
	 P92fWO3ZpiaCA==
Date: Mon, 21 Nov 2022 12:51:29 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] arm64/mm: Drop redundant BUG_ON(!pgtable_alloc)
Message-ID: <20221121125128.GA7097@willie-the-truck>
References: <20221118053102.500216-1-anshuman.khandual@arm.com>
 <Y3pS5fdZ3MdLZ00t@dev-arch.thelio-3990X>
 <fd67eca3-59f4-4455-e3db-ba853c3f949b@arm.com>
 <Y3tuxzl54BvG406t@FVFF77S0Q05N.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3tuxzl54BvG406t@FVFF77S0Q05N.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 21, 2022 at 12:27:51PM +0000, Mark Rutland wrote:
> On Mon, Nov 21, 2022 at 11:00:42AM +0530, Anshuman Khandual wrote:
> > On 11/20/22 21:46, Nathan Chancellor wrote:
> > > I just bisected a boot failure in our QEMU-based continuous integration
> > > setup to this change as commit 9ed2b4616d4e ("arm64/mm: Drop redundant
> > > BUG_ON(!pgtable_alloc)") in the arm64 tree. There is no output so the
> > > panic clearly happens early at boot. If I move back to the previous
> > > commit and add a WARN_ON() like so:
> > > 
> > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > index d386033a074c..9280a92ff920 100644
> > > --- a/arch/arm64/mm/mmu.c
> > > +++ b/arch/arm64/mm/mmu.c
> > > @@ -383,6 +383,7 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
> > >  	phys &= PAGE_MASK;
> > >  	addr = virt & PAGE_MASK;
> > >  	end = PAGE_ALIGN(virt + size);
> > > +	WARN_ON(!pgtable_alloc);
> > >  
> > >  	do {
> > >  		next = pgd_addr_end(addr, end);
> > > 
> > > I do see some stacktraces. I have attached the boot log from QEMU.
> > > 
> > > If there is any additional information I can provide or patches I can
> > > test, I am more than happy to do so.
> > 
> > There are couple of instances, where __create_pgd_mapping() function gets called
> > without a valid pgtable alloc function (NULL is passed on instead), as it is not
> > expected to allocate page table pages, during the mapping process. The following
> > change after this patch should solve the reported problem.
> > 
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 9ea8e9039992..a00563122fcb 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -42,6 +42,7 @@
> >  #define NO_BLOCK_MAPPINGS      BIT(0)
> >  #define NO_CONT_MAPPINGS       BIT(1)
> >  #define NO_EXEC_MAPPINGS       BIT(2)  /* assumes FEAT_HPDS is not used */
> > +#define NO_ALLOC_MAPPINGS      BIT(3)  /* does not allocate page table pages */
> >  
> >  int idmap_t0sz __ro_after_init;
> >  
> > @@ -380,7 +381,7 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
> >         phys &= PAGE_MASK;
> >         addr = virt & PAGE_MASK;
> >         end = PAGE_ALIGN(virt + size);
> > -       BUG_ON(!pgtable_alloc);
> > +       BUG_ON(!(flags & NO_ALLOC_MAPPINGS) && !pgtable_alloc);
> >  
> >         do {
> >                 next = pgd_addr_end(addr, end);
> > @@ -453,7 +454,7 @@ static void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
> >                 return;
> >         }
> >         __create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
> > -                            NO_CONT_MAPPINGS);
> > +                            NO_CONT_MAPPINGS | NO_ALLOC_MAPPINGS);
> >  }
> >  
> >  void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
> > @@ -481,7 +482,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
> >         }
> >  
> >         __create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
> > -                            NO_CONT_MAPPINGS);
> > +                            NO_CONT_MAPPINGS | NO_ALLOC_MAPPINGS);
> >  
> >         /* flush the TLBs after updating live kernel mappings */
> >         flush_tlb_kernel_range(virt, virt + size);
> 
> This is now more complicated than what we had originally, and it doesn't catch
> the case where the caller sets NO_ALLOC_MAPPINGS but the callee ends up needing
> to perform an allocation, which the old code would have caught.
> 
> This is clearly more subtle than we thought initially; for now could we please
> just drop the patch?

Absolutely, this was supposed to be a trivial cleanup but clearly it's much
more than that. I'll revert it today.

Thanks, Nathan!

Will
