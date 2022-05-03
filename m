Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC2A3204
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 15:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAF7C385A4;
	Tue,  3 May 2022 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651590842;
	bh=Sj1vTOeAv+Oacr7lRscJDfSOWLqwBxyp2EyvsqLxJiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeuRzFyLU37V1RLJqvymZraTIQhhFq1GvoN08S12FqaVSrewH4Fgx67wpcepZU8/x
	 i4TFI6DQlXjHVXiTFfhykA5Hrrt4cSgcL/zvbZBFcSSxFxQ6s3orwnm8PeyTX9e0kd
	 67+p12AVbgUDGJeLnR4+1dtafYLlfuEgzCSs5pf0oPA2N1pmH3o6kkEGlzB73h89WP
	 KpKUPs/nWqS2sE3Or90yrVt7SLzhkhebQyqRV1WP0bGMGFqfq8tkhbSFkSTLrzLLbO
	 lfoGRjkUkMQa3KKb3/6ZB77t3kVhKzjdaELlX07zz5ZS/Hzbycp2hcm9hH4+5kRMvo
	 ufSAyTdXWIOtQ==
Date: Tue, 3 May 2022 08:14:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: akpm@linuxfoundation.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH 00/21] Folio patches for 5.19
Message-ID: <YnFGuPWgT7tT7iAV@dev-arch.thelio-3990X>
References: <20220429192329.3034378-1-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429192329.3034378-1-willy@infradead.org>

On Fri, Apr 29, 2022 at 08:23:08PM +0100, Matthew Wilcox (Oracle) wrote:
> Andrew, do you want to include these patches in -mm?
> 
>  - Finish the conversion from alloc_pages_vma() to vma_alloc_folio()
>  - Finish converting shrink_page_list() to folios
>  - Start converting shmem from pages to folios (alas, not finished,
>    I have simply run out of time with all the debugging/fixing needed
>    for 5.18)
> 
> Matthew Wilcox (Oracle) (21):
>   shmem: Convert shmem_alloc_hugepage() to use vma_alloc_folio()
>   mm/huge_memory: Convert do_huge_pmd_anonymous_page() to use 
>     vma_alloc_folio()
>   mm: Remove alloc_pages_vma()
>   vmscan: Use folio_mapped() in shrink_page_list()
>   vmscan: Convert the writeback handling in shrink_page_list() to folios
>   swap: Turn get_swap_page() into folio_alloc_swap()
>   swap: Convert add_to_swap() to take a folio
>   vmscan: Convert dirty page handling to folios
>   vmscan: Convert page buffer handling to use folios
>   vmscan: Convert lazy freeing to folios
>   vmscan: Move initialisation of mapping down
>   vmscan: Convert the activate_locked portion of shrink_page_list to
>     folios
>   vmscan: Remove remaining uses of page in shrink_page_list
>   mm/shmem: Use a folio in shmem_unused_huge_shrink
>   mm/swap: Add folio_throttle_swaprate
>   mm/shmem: Convert shmem_add_to_page_cache to take a folio
>   mm/shmem: Turn shmem_should_replace_page into
>     shmem_should_replace_folio
>   mm/shmem: Turn shmem_alloc_page() into shmem_alloc_folio()
>   mm/shmem: Convert shmem_alloc_and_acct_page to use a folio
>   mm/shmem: Convert shmem_getpage_gfp to use a folio
>   mm/shmem: Convert shmem_swapin_page() to shmem_swapin_folio()

This series is now in next-20220503 and causes the following clang
warnings:

mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (!page) {
                    ^~~~~
mm/shmem.c:1761:6: note: uninitialized use occurs here
        if (folio) {
            ^~~~~
mm/shmem.c:1704:3: note: remove the 'if' if its condition is always false
                if (!page) {
                ^~~~~~~~~~~~
mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence this warning
        struct folio *folio;
                           ^
                            = NULL
mm/shmem.c:2340:8: error: variable 'page' is uninitialized when used here [-Werror,-Wuninitialized]
                if (!page)
                     ^~~~
mm/shmem.c:2321:19: note: initialize the variable 'page' to silence this warning
        struct page *page;
                         ^
                          = NULL
2 errors generated.

The first warning is pretty simple as far as I can tell:

diff --git a/mm/shmem.c b/mm/shmem.c
index 820fde6c2ef6..6a18641a90ff 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1682,7 +1682,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct mm_struct *charge_mm = vma ? vma->vm_mm : NULL;
 	struct page *page;
-	struct folio *folio;
+	struct folio *folio = NULL;
 	swp_entry_t swap;
 	int error;
 

However, I am not sure about the second one. It appears to be caused by
patch 18 in this series. Should it have actually been:

diff --git a/mm/shmem.c b/mm/shmem.c
index 820fde6c2ef6..9e0bd0cffe30 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2337,6 +2337,7 @@ int shmem_mfill_atomic_pte(struct mm_struct *dst_mm,
 
 	if (!*pagep) {
 		ret = -ENOMEM;
+		page = &shmem_alloc_folio(gfp, info, pgoff)->page;
 		if (!page)
 			goto out_unacct_blocks;
 

?

Cheers,
Nathan
