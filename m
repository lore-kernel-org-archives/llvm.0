Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B78328AB0C;
	Thu,  8 May 2025 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734164; cv=none; b=t1xqJWPDQmIJijR9Fa8zklElSMUAjAwiV/74Kh5dby/lRLj27sXmQFInYc03x3mwo8YxNa8vuklGKe5Z12BmQymkXFoRxpeVGXeRDrCF6uC3R+GFgPxOMUSij4JKfOIJXi43W23N/DcapVZt56g4QAuQ7MAFDayEDpG7gekBRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734164; c=relaxed/simple;
	bh=P5WWapKWRySZHI3DOpIQpnDfAtEfWxYpia9FgpAE1DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGcwwytdmARFrw33/Kqs77GabtXLi87MszPca5dvHB/T83yanDGM5KVxJ6V3wbNhFgp/SQNEmgcnVPeW5WZ8ImQIjUW8Z16jIhmSoGFEp3oDXAO4TExbB75CEm787UyhARx0REJVEsZdve7vi9Na+dFCDpXWNIoOM20iHlCTvo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uD7LR-0007ln-00; Thu, 08 May 2025 21:55:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DF2A0C01A2; Thu,  8 May 2025 21:53:27 +0200 (CEST)
Date: Thu, 8 May 2025 21:53:27 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Marco Crivellari <marco.crivellari@suse.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [linux-next:master 5904/8679] <instantiation>:7:11: error:
 expected an immediate
Message-ID: <aB0Lt7e4tnRK355u@alpha.franken.de>
References: <202505071331.Z0N2eSkr-lkp@intel.com>
 <20250508164308.GC834338@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508164308.GC834338@ax162>

On Thu, May 08, 2025 at 05:43:08PM +0100, Nathan Chancellor wrote:
> On Wed, May 07, 2025 at 01:49:02PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   0a00723f4c2d0b273edd0737f236f103164a08eb
> > commit: 56651128e2fbad80f632f388d6bf1f39c928267a [5904/8679] MIPS: Fix idle VS timer enqueue
> > config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20250507/202505071331.Z0N2eSkr-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071331.Z0N2eSkr-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505071331.Z0N2eSkr-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> <instantiation>:7:11: error: expected an immediate
> >     ori $26, r4k_wait_idle_size - 2
> >              ^
> >    <instantiation>:10:13: error: expected an immediate
> >     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >                ^
> >    <instantiation>:10:29: error: expected an immediate
> >     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >                                ^
> > >> <instantiation>:7:11: error: expected an immediate
> >     ori $26, r4k_wait_idle_size - 2
> >              ^
> >    <instantiation>:10:13: error: expected an immediate
> >     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >                ^
> >    <instantiation>:10:29: error: expected an immediate
> >     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >                                ^
> 
> I do not see this with tip of tree LLVM. It seems this was only recently
> supported in the integrated assembler:
> 
> https://github.com/llvm/llvm-project/commit/b65e0947cade9bd39036a7700b54c1df4ec00756

cool

> If it is not easy to work around, we can probably just leave it broken
> and tell anybody who notices to upgrade their compiler.

I wrapped my head around it today, but no idea how to solve it...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
