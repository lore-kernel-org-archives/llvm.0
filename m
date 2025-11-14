Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1934A771;
	Fri, 14 Nov 2025 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763145002; cv=none; b=OINWZFMKYol+wDhHoOq27W4WPpLjSlnBlr7l1mhO+8K+K4B1M6F+RIkppMaCHNnK4+S8rBeZKj02XttCa0fctKYVKtPhv9qHVIcbX1i3DLaxMoHY//do0NFza4ajKahrfX6aq5Ch8RexsPUaEBX13JHjOfatbIACWGjp4p5ZXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763145002; c=relaxed/simple;
	bh=TIbxS6C7c5fCvewEBNrOfoVYvU8etxkoLMi7WDCMwqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0h9qoYB52iuwP5xUm2ccWOSWZGiZZW6z1RmmPSlwJmZe//9bNnWMfLxJ+tWQWVp8ORR0PfWecwoyBNDWAm302V1LRFI048l2jQr3azlDSQbLnm7Xc+Cq1DYpv7o/3Ah0FlmQLjYcylIp5b1VrXh//BTDm4xoYP1/nQ9QNzfNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUbzaX8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUbzaX8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20FCC2BCB0;
	Fri, 14 Nov 2025 18:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763145001;
	bh=TIbxS6C7c5fCvewEBNrOfoVYvU8etxkoLMi7WDCMwqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUbzaX8m+OtqpsLPNs4j9vqpnhAj756anYr+ws9QRRC/gShZkuLDg58Le5LCNNOa1
	 n4jCOkbVMhKaWWj9qU7dXy8wpVeGFYJXtbXNwZhfk6xIjcSVkxK2uZLHKkagIMWu0R
	 OMypIBkw2zA6BlG3lCYRBGXmbSiqfBXaddUbPs0bWSJeo0n3xu8WXwrRYAzVeAKxc8
	 WQVM1aaDL5blFOtwVV8vVjP/MpfoZD7Yb3sa1NWV/vE6DjJG3Ut2+QvuIlLSJ1dzWT
	 uvqKSARrhe+FRNDJeD8NbrWcQyUVxLtQuXe+qEniZEsZRtwYU4X34TtqyJxUYbXwH9
	 w49/0qdtqNGeA==
Date: Fri, 14 Nov 2025 11:29:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 17179869184 to 0
Message-ID: <20251114182956.GD2566209@ax162>
References: <202511141140.LrrRrtIv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511141140.LrrRrtIv-lkp@intel.com>

On Fri, Nov 14, 2025 at 02:46:06PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   1c571d1c4c7e042c3c313d1a2058a17848ccebac
> commit: 2f6ff71280ffddb27ad7174d24f573e2683870cd [36/283] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
> config: powerpc-randconfig-002-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141140.LrrRrtIv-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141140.LrrRrtIv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511141140.LrrRrtIv-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
...
> >> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
>     1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
>          |                       ^~~~~~~~~~~~~~~~~~
>    include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
>     2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
>          |                                         ^~~~~~~~~~~~~~~
>    include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
>     2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
>          |                                 ~~~~~~~~~ ^~~~~~
>    include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
>       56 | #define SZ_16G                          _AC(0x400000000, ULL)
>          |                                         ^~~~~~~~~~~~~~~~~~~~~
>    include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
>       21 | #define _AC(X,Y)        __AC(X,Y)
>          |                         ^~~~~~~~~
>    include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
>       20 | #define __AC(X,Y)       (X##Y)
>          |                          ^~~~
>    <scratch space>:39:1: note: expanded from here
>       39 | 0x400000000ULL
>          | ^~~~~~~~~~~~~~
>    1 warning generated.

For the record, this is not a clang specific warning, as it happens when
building the same configuration with GCC:

  In file included from include/vdso/const.h:5,
                   from include/vdso/bits.h:5,
                   from include/linux/bits.h:5,
                   from include/linux/ratelimit_types.h:5,
                   from include/linux/printk.h:9,
                   from include/asm-generic/bug.h:28,
                   from arch/powerpc/include/asm/bug.h:116,
                   from include/linux/bug.h:5,
                   from include/linux/mmdebug.h:5,
                   from include/linux/mm.h:6,
                   from mm/util.c:2:
  mm/util.c: In function 'snapshot_page':
  include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '17179869184' to '0' [-Woverflow]
     20 | #define __AC(X,Y)       (X##Y)
        |                         ^~~~~~
  include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
     21 | #define _AC(X,Y)        __AC(X,Y)
        |                         ^~~~
  include/linux/sizes.h:56:41: note: in expansion of macro '_AC'
     56 | #define SZ_16G                          _AC(0x400000000, ULL)
        |                                         ^~~
  include/linux/mm.h:2214:43: note: in expansion of macro 'SZ_16G'
   2214 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
        |                                           ^~~~~~
  include/linux/mm.h:2223:41: note: in expansion of macro 'MAX_FOLIO_ORDER'
   2223 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
        |                                         ^~~~~~~~~~~~~~~
  mm/util.c:1266:23: note: in expansion of macro 'MAX_FOLIO_NR_PAGES'
   1266 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
        |                       ^~~~~~~~~~~~~~~~~~

Cheers,
Nathan
