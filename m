Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172F021CA00;
	Wed, 17 Sep 2025 02:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758075648; cv=none; b=rjOsqfTdyPIGWsynEqYO8HZANkrC4eZvlGlo4ZwKxp4oXymuot1KrIbMhtBXOGprP5iWi8AVE5JF6lY/mu+f3FTrGUkVgw/RGfhXGnEB8Son8N+GxYHjHpBC/W2gM5mJRflmeagSfIgN9OtdjKLVAGR5iMcKv1dWScrXPZZxG1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758075648; c=relaxed/simple;
	bh=r1UlIgUlkprdv2jy4RgTkhkaEP1kfK2+bVNiN02YlwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tONd0ELpryLqztCw9jkpjKEZdvY93h/dJfuqa1MlG7z7DSn/1P1diaaEt8gkv5+nTJgOXZpYZ+WcJ/8PZQCDQTpj6MiDl2ahoFJxwmC7hMEtZGGMb9PNbRpxbVYMRnPO0k85dBEF/wvipud05VA8ekAbTjGGpJ06/Nkax7omaZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+4ti1iv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+4ti1iv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3203FC4CEEB;
	Wed, 17 Sep 2025 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758075647;
	bh=r1UlIgUlkprdv2jy4RgTkhkaEP1kfK2+bVNiN02YlwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+4ti1ivE6v/eHhf0q40NOdzWDJM3MNTmULkaJcUurjkZePJhg1oraUNkT+M0xXqp
	 +LavpBQL1ODu9CvlKYz3AigG52MXS7wbN4jccxw8B/axHndy8NePQTSKoGTQpmsd4a
	 6r0E5HQNbtQlalL1heCWyHAV6hKk2pMziRFH7fKD8LJcebfDJW9D72uSsM1wq61Uz7
	 OLb0NgFogsN5p+UELhed2RTdO9xBk7QbT3+A5VBI0z9R0ZH7MZoyYowdmo+BZfQimo
	 ok8gPK0TpjXkCqYB4RHOF8j71iak2W9KVTTx1MnfqyE1Z+U4YswFFonXuLOUm4xEHb
	 X3+0NmwCDtA8w==
Date: Tue, 16 Sep 2025 19:20:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Oliver Sang <oliver.sang@intel.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [jgunthorpe:iommu_pt_vtd 8/34] ERROR: modpost: "__udivdi3"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <20250917022043.GB3106929@ax162>
References: <202508271856.ixwxgh3g-lkp@intel.com>
 <20250902124856.GE186519@nvidia.com>
 <aMj38M8HeDSQHQPf@xsang-OptiPlex-9020>
 <20250916141256.GF1086830@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916141256.GF1086830@nvidia.com>

Hi Jason,

On Tue, Sep 16, 2025 at 11:12:56AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 16, 2025 at 01:38:56PM +0800, Oliver Sang wrote:
> > hi, Jason,
> > 
> > On Tue, Sep 02, 2025 at 09:48:56AM -0300, Jason Gunthorpe wrote:
> > > On Wed, Aug 27, 2025 at 06:53:24PM +0800, kernel test robot wrote:
> > > > tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
> > > > head:   fbb816ad5a7780a27bde18e3090b30552b6068f9
> > > > commit: 9722034883c205c7cfc7e395cb9a44221f010fc3 [8/34] iommupt: Add map_pages op
> > > > config: i386-randconfig-r111-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/config)
> > > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202508271856.ixwxgh3g-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > > 
> > > > >> ERROR: modpost: "__udivdi3" [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
> > > 
> > > I could not reproduce this..
> > 
> > sorry for late.
> > 
> > not sure how you reproduce? the reroducer in
> > https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/reproduce
> > is wrong. could you try below?
> 
> I used the instructions with the ubuntu clang 20 build.
> 
> Your instructions with the 0day clang build do reproduce.
> 
> This seems like a bug in that 0day clang compiler build:
> 
> static inline unsigned int pt_pgsz_lg2_to_level(struct pt_common *common,
> 						unsigned int pgsize_lg2)
> {
> 	static_assert(PT_GRANULE_LG2SZ < 256);
> 	return (pgsize_lg2 - PT_GRANULE_LG2SZ) /
> 	       ((unsigned int)(PT_TABLEMEM_LG2SZ - ilog2(PT_ITEM_WORD_SIZE)));
> 
> Is the source of the issue.
> 
> I added this:
> 
> 	typeof(PT_GRANULE_LG2SZ) x = PT_GRANULE_LG2SZ;
> 
> 	static_assert(sizeof(x) == 8);
> 
> And my compilers, and the 0day sparse, all fail that static_assert, x
> is 'int'.
> 
> ../drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h:36:9: sparse: error: static assertion failed: "sizeof(x) == 8"
> 
> This is correct as in C the type of an enum value is always int and it
> is a GCC extension that if int is not big enough for the constant the
> type is promoted till it is.
> 
> But for some reason your clang 20 build is saying it is not int. That
> then triggers incorrect 64 bit division.

I spent some time looking into this today and I ran out of time before
coming to any real conclusion but I wanted to dump what I had so far.

This error is not reproducible with LLVM 19.1.7 but it is with LLVM
20.1.8. Running a bisect between those two versions reveals

  https://github.com/llvm/llvm-project/commit/a0f88901a4e6a6618c3ec02108103d0415e28834

as the bad commit, which certainly makes sense, as C23 made this GCC
extension as part of the standard so clang needed to account for that.
As far as I can tell, GCC did the same thing in

  https://gcc.gnu.org/cgit/gcc/commit/?id=3b3083a598ca3f4b6203284e01ed39ab6ff0844f

  "The standard feature gives all the values of such an enum the enumerated
  type (while keeping type int if that can represent all values of the
  enumeration), where previously GCC only gave those values outside the range
  of int the enumerated type... this patch makes the change to types of
  enumerators unconditionally (if that causes problems in practice we could
  always make it conditional on C2x mode instead)."

so I am somewhat surprised GCC does not exhibit similar behavior since I
would expect the underlying type of this enum to be 'unsigned long long'
from the GENMASK_ULL usage to define PT_TOP_PHYS_MASK... but I have not
been able to figure out why yet.

This could be easily worked around by moving PT_TOP_PHYS_MASK to its own
enum like has been done in the past like ff1cc97b1f4c ("block/blk-iocost
(gcc13): keep large values in a new enum") did.

Cheers,
Nathan
