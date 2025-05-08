Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4680578F32;
	Thu,  8 May 2025 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722593; cv=none; b=FauLUuMc3th7jQbH1eJPBVX82NHLPAVATTVHl740gBzUvhkb1Bfh7zPq7pyTfbe8tNS5ji+DpPZJomWsx2IW64XQ49CDkeSFgt+H2k3OJ5P8hNT8blyvB7+BmSHZ7DaZi1wGsEuK2H2H7fU4p8veVs7PD7sdzLvkmnTLYELcYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722593; c=relaxed/simple;
	bh=YnMHvZ7LtKUPsdXREYb6lUhWJXrjWM660J4wNG5LMiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2BZuWMNi3V8UwWFX89IVWxc6x2u+mpLhBkU5qYBpyoNEqn3xUlxThJsNrY31yvekIm/1mFe6IQ3u5wD2H4094jlyclhyzfz3vp+Bm+7aHmyUNMAqzVgojYKjgUfNr3IBuatqTSfKQ33Lh7RmXelWkTUNxZoTvgptxSX+rm5G1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jt/ZE1v7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jt/ZE1v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B8EC4CEE7;
	Thu,  8 May 2025 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746722592;
	bh=YnMHvZ7LtKUPsdXREYb6lUhWJXrjWM660J4wNG5LMiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jt/ZE1v7/rWv43PyOIt/WBf/KQULNFAOI4Rya7qDVuMezC3AyqjYcPD5JW0xgQP0o
	 tYWA7Exmd9cf+QbolYjp3YZVM7rPCDMiHvUdlCI/gdqucD6OZZzTfu5v24AEHo+LzB
	 HxOVgVf36Cd6fXU5Qk9c1T5BkaaOPwszoIKZYuceoiEv0mcjWYLs4L+11Ocj2yCLta
	 3ea3S983RtuSzkzfEY8OoKHZe/lvbpm1wsVF3eAK+y9gxftWeS46hNYr3tm4V77+jH
	 M4jasLzFrWb7T119WVZDnGnkaL5S5xkjHFAdY/TBGCTl/uOwFa+jpRwbO22nvLnkdQ
	 VcYWO6vG+lXog==
Date: Thu, 8 May 2025 17:43:08 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Marco Crivellari <marco.crivellari@suse.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [linux-next:master 5904/8679] <instantiation>:7:11: error:
 expected an immediate
Message-ID: <20250508164308.GC834338@ax162>
References: <202505071331.Z0N2eSkr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505071331.Z0N2eSkr-lkp@intel.com>

On Wed, May 07, 2025 at 01:49:02PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0a00723f4c2d0b273edd0737f236f103164a08eb
> commit: 56651128e2fbad80f632f388d6bf1f39c928267a [5904/8679] MIPS: Fix idle VS timer enqueue
> config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20250507/202505071331.Z0N2eSkr-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071331.Z0N2eSkr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505071331.Z0N2eSkr-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> <instantiation>:7:11: error: expected an immediate
>     ori $26, r4k_wait_idle_size - 2
>              ^
>    <instantiation>:10:13: error: expected an immediate
>     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                ^
>    <instantiation>:10:29: error: expected an immediate
>     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                                ^
> >> <instantiation>:7:11: error: expected an immediate
>     ori $26, r4k_wait_idle_size - 2
>              ^
>    <instantiation>:10:13: error: expected an immediate
>     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                ^
>    <instantiation>:10:29: error: expected an immediate
>     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                                ^

I do not see this with tip of tree LLVM. It seems this was only recently
supported in the integrated assembler:

https://github.com/llvm/llvm-project/commit/b65e0947cade9bd39036a7700b54c1df4ec00756

If it is not easy to work around, we can probably just leave it broken
and tell anybody who notices to upgrade their compiler.

Cheers,
Nathan
