Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E477D28725B;
	Mon, 25 Aug 2025 20:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756152441; cv=none; b=OtuovZBxsuTeENb0J2vvkbC3T4on7aA1tp1YLqoMu7fGlKh3FF5mdH2u9koBY2PtBQKdzZpNFmtwHHl3EP/t6Wf51iTIbOx/Zkht+UjtknrD/oQgqnSYvp8o/hBa00rDq8UEvLOSWnxtIcFS+pi4dNJ6hz4C5lLLYMKLJzQvU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756152441; c=relaxed/simple;
	bh=/3rKbaJD+w6nURlr7+uhBX9TAhFoWk7q48ExNb7Wiq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSYcfuSIZUIj3ORBTky639/jmEyzY3naOz1y9Ix9bzGQnl/AQdXBX4VdQXOgTswCZTdwhdZO7ScGETaeb5dmBqKyZOwEpbwZN17ixLdK07u46C03pXh8X8M3IO0+hM+6gCZoQrTVlw6GIWpV0hfNBrlIC++u6awCSB44NTnLUxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okZorsbX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okZorsbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BC1C116B1;
	Mon, 25 Aug 2025 20:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756152440;
	bh=/3rKbaJD+w6nURlr7+uhBX9TAhFoWk7q48ExNb7Wiq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okZorsbXLxI1C0tQJOJhpXkygrsAezPT+G9FqvCMtkuufdEJvwjZLRFO0eFxfdzbt
	 4OU30VK3uzdtYHYGiKx51p+O4tgSHQ2BZDZEgWg2P6W/r2+1jZ8sRTH/203KgV057Q
	 FV06YSnofD90bfoZch8IdffPcpOfHe230rO4CQaZlPBY7iAaqbfuGAvlNoecDVs12c
	 JkrNfKYI33pZOXcAyup821Zi7LB+eNk/nGLE3f9lv2oacQrymSVCYdEsoHvu7cX6fO
	 G2IFhjdufyv25hx2skCeLhtVbLKFTXKOr1In9l7fAhz7f0Sy4ZNl8aOarP9h/eyD84
	 rW9rN/C+94/HA==
Date: Mon, 25 Aug 2025 13:07:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Rohan McLure <rmclure@linux.ibm.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [akpm-mm:mm-new 216/233]
 arch/riscv/include/asm/pgtable.h:951:36: error: too few arguments to
 function call, expected 3, have 2
Message-ID: <20250825200715.GA598466@ax162>
References: <202508230551.qiEQu04P-lkp@intel.com>
 <20250822150906.7a6a87a7a8ad69f2ad67c817@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822150906.7a6a87a7a8ad69f2ad67c817@linux-foundation.org>

On Fri, Aug 22, 2025 at 03:09:06PM -0700, Andrew Morton wrote:
> On Sat, 23 Aug 2025 05:30:45 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > head:   a8af4c2fd982fd94fffde3c5b6b764fd20af68fe
> > commit: e009b0f3187482a5756ff3b015cf30277cc1cfd9 [216/233] mm/page_table_check: reinstate address parameter in [__]page_table_check_pud_clear()
> 
> > config: riscv-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230551.qiEQu04P-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230551.qiEQu04P-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508230551.qiEQu04P-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from arch/riscv/kernel/asm-offsets.c:8:
> >    In file included from include/linux/mm.h:31:
> >    In file included from include/linux/pgtable.h:6:
> > >> arch/riscv/include/asm/pgtable.h:951:36: error: too few arguments to function call, expected 3, have 2
> >      951 |         page_table_check_pud_clear(mm, pud);
> >          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~        ^
> 
> Thanks, I added this:

It appears that this fix patch was applied to the wrong patch. The error
is about page_table_check_pud_check().

> --- a/arch/riscv/include/asm/pgtable.h~mm-page_table_check-reinstate-address-parameter-in-page_table_check_pud_set-fix

But this change is about page_table_check_pud_set(), so -next is now
broken in the opposite way

  arch/riscv/include/asm/pgtable.h:951:42: error: too many arguments to function call, expected 2, have 3
    951 |         page_table_check_pud_clear(mm, address, pud);
        |         ~~~~~~~~~~~~~~~~~~~~~~~~~~              ^~~
  include/linux/page_table_check.h:125:20: note: 'page_table_check_pud_clear' declared here
    125 | static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
        |                    ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

as it does not appear that e009b0f3187482a5756ff3b015cf30277cc1cfd9
is there.

> +++ a/arch/riscv/include/asm/pgtable.h
> @@ -948,7 +948,7 @@ static inline pud_t pudp_huge_get_and_cl
>  {
>  	pud_t pud = __pud(atomic_long_xchg((atomic_long_t *)pudp, 0));
>  
> -	page_table_check_pud_clear(mm, pud);
> +	page_table_check_pud_clear(mm, address, pud);
>  
>  	return pud;
>  }
> _
> 
> 
