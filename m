Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8592A6FCB;
	Mon, 17 Apr 2023 13:50:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C1E91691;
	Mon, 17 Apr 2023 06:50:48 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.19.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87AD33F5A1;
	Mon, 17 Apr 2023 06:50:03 -0700 (PDT)
Date: Mon, 17 Apr 2023 14:49:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [linux-next:master 10286/12016] arch/arm64/mm/fixmap.c:199:10:
 warning: variable 'bm_pudp' set but not used
Message-ID: <ZD1OhVZElN1uGRJy@FVFF77S0Q05N>
References: <202304172004.r3IPh5Ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304172004.r3IPh5Ja-lkp@intel.com>

On Mon, Apr 17, 2023 at 08:55:17PM +0800, kernel test robot wrote:
> Hi Mark,

Hi,

> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

I took a look, and this warning existed in the prior commit. All that has
changed is that it has moved from arch/arm64/mm/mmu.c to arch/arm64/mm/init.c.

This commit is not to blame, and there is no regression here.

The warning itself is bogus; more details on that below. Please ignore this.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d3f2cd24819158bb70701c3549e586f9df9cee67
> commit: b97547761b02cc95e0e6be827dc9ca9da8142761 [10286/12016] arm64: mm: move fixmap code to its own file
> config: arm64-buildonly-randconfig-r004-20230416 (https://download.01.org/0day-ci/archive/20230417/202304172004.r3IPh5Ja-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b97547761b02cc95e0e6be827dc9ca9da8142761
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout b97547761b02cc95e0e6be827dc9ca9da8142761
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304172004.r3IPh5Ja-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/arm64/mm/fixmap.c:199:10: warning: variable 'bm_pudp' set but not used [-Wunused-but-set-variable]
>                    pud_t *bm_pudp;
>                           ^
>    1 warning generated.
> 
> 
> vim +/bm_pudp +199 arch/arm64/mm/fixmap.c
> 
:>    182	
>    183	/*
>    184	 * Copy the fixmap region into a new pgdir.
>    185	 */
>    186	void __init fixmap_copy(pgd_t *pgdir)
>    187	{
>    188		if (!READ_ONCE(pgd_val(*pgd_offset_pgd(pgdir, FIXADDR_TOT_START)))) {
>    189			/*
>    190			 * The fixmap falls in a separate pgd to the kernel, and doesn't
>    191			 * live in the carveout for the swapper_pg_dir. We can simply
>    192			 * re-use the existing dir for the fixmap.
>    193			 */
>    194			set_pgd(pgd_offset_pgd(pgdir, FIXADDR_TOT_START),
>    195				READ_ONCE(*pgd_offset_k(FIXADDR_TOT_START)));
>    196		} else if (CONFIG_PGTABLE_LEVELS > 3) {
>    197			pgd_t *bm_pgdp;
>    198			p4d_t *bm_p4dp;
>  > 199			pud_t *bm_pudp;

The full piece of code in question is:

|        } else if (CONFIG_PGTABLE_LEVELS > 3) {
|                pgd_t *bm_pgdp;
|                p4d_t *bm_p4dp;
|                pud_t *bm_pudp;
                        ^ defined

|                /*
|                 * The fixmap shares its top level pgd entry with the kernel
|                 * mapping. This can really only occur when we are running
|                 * with 16k/4 levels, so we can simply reuse the pud level
|                 * entry instead.
|                 */
|                BUG_ON(!IS_ENABLED(CONFIG_ARM64_16K_PAGES));
|                bm_pgdp = pgd_offset_pgd(pgdp, FIXADDR_TOT_START);
|                bm_p4dp = p4d_offset(bm_pgdp, FIXADDR_TOT_START);
|                bm_pudp = pud_set_fixmap_offset(bm_p4dp, FIXADDR_TOT_START);
                 ^ set

|                pud_populate(&init_mm, bm_pudp, lm_alias(bm_pmd));
                                        ^ used

|                pud_clear_fixmap();
|        } else {

What's happening here is that the config has CONFIG_PGTABLE_LEVELS=2, where the
above block is unreachable, but the warning is being generated for trivially
unreachable code.

With that config, we'll use include/asm-generic/pgtable-nopmd.h, where
pud_populate() is defined as:

| #define pud_populate(mm, pmd, pte)          do { } while (0)

... and hence it's complaing that the (unreachable) definition and
initialization of bm_pudp is not used.

If I reconfigure the kernel with 4K pages and 48-bit VAs so that
CONFIG_PGTABLE_LEVELS=4, the above warning isn't generated.

Thanks,
Mark.
