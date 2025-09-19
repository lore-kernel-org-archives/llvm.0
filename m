Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E82D6604;
	Fri, 19 Sep 2025 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758321508; cv=none; b=T9w4gcAQ3QecuXLcDnCWB4mT6AwJ+bETm78ZZchetAO47dmp28cExzq+COyS0tcxRD4xblEmNn0cpoavUn9hGqK/ZW6MiXG9xuLVyLtZ3K6iRyU0e7YVF/pUR1xYjRd74Uo9RsycE7MyrCMBh0Mz8DTbfKDh6q7wheGWiA9QG/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758321508; c=relaxed/simple;
	bh=qXTh3BJzOx7yM6C9BuVBrmJsuTDg6Gyb6cDsLk1ZSVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISzWK6Gcr6Cl+FlAGFF6iXqKcgsisEO9RQbvM9EuWFsNDFlxuuQelvUBLhhHkBgFp5n2mOf9twHacpiKM3jd/BaRP79cpboTDE8RRQppxc6agi7dNzUh6t3pyAqAk0nM/df5aW3XlHO0yky1xGS4VBiHxjevzPWyzDJORLUcGBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfcGEevD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfcGEevD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C083C4CEF0;
	Fri, 19 Sep 2025 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758321507;
	bh=qXTh3BJzOx7yM6C9BuVBrmJsuTDg6Gyb6cDsLk1ZSVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfcGEevDKTP9JQQXsNv6MeNtA2FBHmaqga4getAfgvtrKKuel6KSB8Ef9knSeKmTa
	 zThFjH+BE9+A74cdOm6VqMV9RGx9CYrmqhl7os6t2kJm0rag7XQ6HcG39gIfX055aw
	 m4bq47if1Q8rNKBBiWiYl6PiqOeSXGev8pJkgvdki9JzYvMx1vFKTXB/dSKZ7TM7nY
	 s25GixOGZSWCLeZ8Jk6udawy1X4Uj/p1DXakMwb29IQzGaQXiazOdGqeKt0jxNs08v
	 NJqF72B3ujDug6eKYOPWcbnB84fcK3hREWzrw6+bg/CF+h7TPaMqAbiMzwTCPwZIVu
	 EoWXkKdTc6/GA==
Date: Fri, 19 Sep 2025 15:38:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [linux-next:master 9765/10654]
 drivers/gpu/drm/xe/tests/xe_pci.c:214:2: error: initializer element is not a
 compile-time constant
Message-ID: <20250919223823.GB44805@ax162>
References: <202509192041.tQwdE4DS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509192041.tQwdE4DS-lkp@intel.com>

On Fri, Sep 19, 2025 at 08:46:43PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
> commit: 5bb5258e357eb79719d1c998731b932c945cb52c [9765/10654] drm/xe/tests: Add pre-GMDID IP descriptors to param generators
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250919/202509192041.tQwdE4DS-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

                          ^ key info

> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192041.tQwdE4DS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509192041.tQwdE4DS-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/gpu/drm/xe/xe_pci.c:1104:
> >> drivers/gpu/drm/xe/tests/xe_pci.c:214:2: error: initializer element is not a compile-time constant
>            graphics_ip_xelp,
>            ^~~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/tests/xe_pci.c:221:2: error: initializer element is not a compile-time constant
>            media_ip_xem,
>            ^~~~~~~~~~~~
>    2 errors generated.
> 
> 
> vim +214 drivers/gpu/drm/xe/tests/xe_pci.c
> 
>    206	
>    207	/*
>    208	 * Pre-GMDID Graphics and Media IPs definitions.
>    209	 *
>    210	 * Mimic the way GMDID IPs are declared so the same
>    211	 * param generator can be used for both
>    212	 */
>    213	static const struct xe_ip pre_gmdid_graphics_ips[] = {
>  > 214		graphics_ip_xelp,
>    215		graphics_ip_xelpp,
>    216		graphics_ip_xehpg,
>    217		graphics_ip_xehpc,
>    218	};
>    219	

Prior to Clang 17 (and GCC 8 but that's not as much of a concern now
that this is the minimum supported version for building the kernel),
these structures would not be considered constant:

https://github.com/llvm/llvm-project/issues/44502
https://github.com/llvm/llvm-project/commit/0b2d5b967d98375793897295d651f58f6fbd3034

If this code cannot be modified to use pointers in a similar vein to
commit 17d49b7e47a1 ("power: supply: bq24190_charger: Fix "initializer
element is not constant" error"), this should probably be wrapped in

  #if !defined(CONFIG_CC_IS_CLANG) || CONFIG_CLANG_VERSION >= 170000

Cheers,
Nathan
