Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D930F95;
	Mon, 16 Oct 2023 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD4CC433C8;
	Mon, 16 Oct 2023 17:54:54 +0000 (UTC)
Date: Mon, 16 Oct 2023 18:54:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64/mm: Hoist synchronization out of set_ptes() loop
Message-ID: <ZS147N1JKyUvaHyJ@arm.com>
References: <20231005140730.2191134-1-ryan.roberts@arm.com>
 <202310140531.BQQwt3NQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310140531.BQQwt3NQ-lkp@intel.com>

On Sat, Oct 14, 2023 at 05:15:51AM +0800, kernel test robot wrote:
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on arm64/for-next/core]
> [also build test WARNING on arm-perf/for-next/perf arm/for-next kvmarm/next soc/for-next linus/master v6.6-rc5 next-20231013]
> [cannot apply to arm/fixes]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/arm64-mm-Hoist-synchronization-out-of-set_ptes-loop/20231005-231636
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20231005140730.2191134-1-ryan.roberts%40arm.com
> patch subject: [PATCH v2] arm64/mm: Hoist synchronization out of set_ptes() loop
> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140531.BQQwt3NQ-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140531.BQQwt3NQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310140531.BQQwt3NQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from net/ipv4/route.c:66:
>    In file included from include/linux/mm.h:29:
>    In file included from include/linux/pgtable.h:6:
> >> arch/arm64/include/asm/pgtable.h:344:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
>      344 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>          |                                                                 ^
>    1 warning generated.

Thanks for the report. I think something like below will do (I'll test
and commit as a separate patch, it's not something that Ryan's patch
introduces):

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 68984ba9ce2a..b19a8aee684c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -341,8 +341,9 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 		mte_sync_tags(pte, nr_pages);
 }
 
-static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
-			      pte_t *ptep, pte_t pte, unsigned int nr)
+static inline void set_ptes(struct mm_struct *mm,
+			    unsigned long __always_unused addr,
+			    pte_t *ptep, pte_t pte, unsigned int nr)
 {
 	page_table_check_ptes_set(mm, ptep, pte, nr);
 	__sync_cache_and_tags(pte, nr);
@@ -353,7 +354,6 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		if (--nr == 0)
 			break;
 		ptep++;
-		addr += PAGE_SIZE;
 		pte_val(pte) += PAGE_SIZE;
 	}
 }
@@ -528,7 +528,8 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 #define pud_pfn(pud)		((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT)
 #define pfn_pud(pfn,prot)	__pud(__phys_to_pud_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
 
-static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
+static inline void __set_pte_at(struct mm_struct *mm,
+				unsigned long __always_unused addr,
 				pte_t *ptep, pte_t pte, unsigned int nr)
 {
 	__sync_cache_and_tags(pte, nr);

-- 
Catalin
