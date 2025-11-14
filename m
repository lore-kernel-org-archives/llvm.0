Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DDB2AE78;
	Fri, 14 Nov 2025 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147902; cv=none; b=n7Gg6nTcaMe8AmnAwvY9kaH6v8qn6k24mMBbhdXIYFR2NQT6vzxriPodhAUOlZWTkFg5XrQug3EsMQyXj5mqrWCJ79SWsrYAGP2DctnHChzn1xwrBJv+G4qItUnOQk5wTxcYY+N3p/imLGlNfRqIOz9mJL5k05yiIr/zXUV1r4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147902; c=relaxed/simple;
	bh=q1olEHlGpuigXtFzJVBaSoMshU+v/j0ueFTcAUs+I9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CH1717TDsF18h+VV98EwlffddKUpsw164RM64njoHds6CPcgOmMySPi/fj3tumHZq7bVk9NJppZcqyZy9awxC0Ij8UYsE2zutTvtRcKtGmEGIH/fONASNaiA2KcaMjwbKDrmMqLMLXCC73iU91zK+nu6ys5FNYSCqqcGZ04yLJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jy0Sphxk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jy0Sphxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED921C116B1;
	Fri, 14 Nov 2025 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763147902;
	bh=q1olEHlGpuigXtFzJVBaSoMshU+v/j0ueFTcAUs+I9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jy0Sphxk9WR3dz6SBtNjAI3Ag2YV7/GuKr7/FFWOwTamKuZCdqFwcjOXh/hJ3+Ian
	 gArB2pLXfsGjcZhJMAGERlegHCumDDyuUoBmj1JyqZ+TcSSwkqcOWRcSjZEaHruHTr
	 HrsNXqOWkf0E1Ev/PpDXMacfc/DKQHo/itZwh/vqf5IJwgh0wYXAnbIPfEdYnlk/Og
	 UuqFZX3EZTPpv5YL1A2XaeykoteoPNQk+uMRFmWUutc8D8qK9T0JtawgKlAsQ14Fvo
	 3H2TJ1HaqAsNxl3ZCl+UIskhnYGaee2i1MaTooLgDSAmlPF0YPtnNKeV90KBT10itb
	 baNAz/2G9utJw==
Date: Fri, 14 Nov 2025 12:18:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 17179869184 to 0
Message-ID: <20251114191817.GA1089438@ax162>
References: <202511141140.LrrRrtIv-lkp@intel.com>
 <20251114182956.GD2566209@ax162>
 <aRd69_c1pULRoKOU@casper.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRd69_c1pULRoKOU@casper.infradead.org>

On Fri, Nov 14, 2025 at 06:54:47PM +0000, Matthew Wilcox wrote:
> On Fri, Nov 14, 2025 at 11:29:56AM -0700, Nathan Chancellor wrote:
> > > >> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
> > >     1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
> > >          |                       ^~~~~~~~~~~~~~~~~~
> > >    include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
> > >     2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
> > >          |                                         ^~~~~~~~~~~~~~~
> > >    include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
> > >     2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
> > >          |                                 ~~~~~~~~~ ^~~~~~
> > >    include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
> > >       56 | #define SZ_16G                          _AC(0x400000000, ULL)
> > >          |                                         ^~~~~~~~~~~~~~~~~~~~~
> 
> Clearly this is a 32-bit build, since otherwise a conversion from
> "unsigned long long" to "unsigned long" is a NOP.  But 32-bit cannot
> support 16GB folios!
> 
> I say this is a bug in powerpc32's config.
> 
> #if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> #define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
> ...
> #else
> #define MAX_FOLIO_ORDER         PUD_ORDER
> 
> (PUD_ORDER is 16GB, so I think this will be what's being picked up)
> 
> but the only place the mentions ARCH_HAS_GIGANTIC_PAGE is pretty
> clearly dependent on 64bit ...
> 
> config PPC_RADIX_MMU
>         bool "Radix MMU Support"
>         depends on PPC_BOOK3S_64
>         select ARCH_HAS_GIGANTIC_PAGE
> 
> so I'm a bit stuck about how this comes to be.  Adding the PPC people
> for thoughts.

Note that the original report is against mm-unstable and flags

  https://git.kernel.org/akpm/mm/c/c3f81a41ba6f93693d208edde08ce2b0da21c645
  https://lore.kernel.org/20251112145632.508687-1-david@kernel.org/

in mm-hotfixes-unstable as the problematic change. This configuration ends up
with

  $ rg -N 'HAVE_GIGANTIC|HUGETLB|PPC_8xx' .config
  # CONFIG_CGROUP_HUGETLB is not set
  CONFIG_PPC_8xx=y
  CONFIG_HAVE_GIGANTIC_FOLIOS=y
  CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
  CONFIG_HUGETLBFS=y
  CONFIG_HUGETLB_PAGE=y

  config PPC_8xx
      bool "Freescale 8xx"
      select ARCH_SUPPORTS_HUGETLBFS
      select FSL_SOC
      select PPC_KUEP
      select HAVE_ARCH_VMAP_STACK
      select HUGETLBFS

which may indicate a bug in either selecting ARCH_HAS_GIGANTIC_PAGE in
this case or the logic of HAVE_GIGANTIC_FOLIOS in that change?

Cheers,
Nathan
