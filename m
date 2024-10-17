Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6931D1305;
	Thu, 17 Oct 2024 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729198936; cv=none; b=hA6ZswYX5CxG3LgQTbYkxyx/JRYWiYeKMtq0J9LOZSVDOcOIMIx0Uz6wmqT5l11R4lPwvEPPcBCOiI4SL0UgTliT4fu4i4OVTbXJ+I/kqTj0sLSsgZYFlIfyqMmRAbOxAZfvL73LKeN0kbuWqoXT1GS9JfUFGQfH7QpCLhYPP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729198936; c=relaxed/simple;
	bh=mwudDo7/9+DhH78DUKhEni8TZk5t8ytq7V7UbY+R+Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvQtVMF4Bs+/d2LrOtWokdX/jGpbrRHI5M7MkoILAaBIRhwwtI1ARaFOhSvujfa/osWHcI6URKap2/sQudHtG8lEbiy0+d+YDnOsDHRaZye/35RV6ZvgKx75kaA7wQfMOLcjk40nZ6jgEO6nbADFFj8RYrTvDqQ1Re+IYViqyfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfWdzafk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfWdzafk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A00C4CEC3;
	Thu, 17 Oct 2024 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729198935;
	bh=mwudDo7/9+DhH78DUKhEni8TZk5t8ytq7V7UbY+R+Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfWdzafkkIb17oZCmSLg5IH8NQB64GIgeZtjK+CA9w9mld7JwHJ/GyGZpAfUzTRXh
	 RZno31buNggIDp5tqAUBdP1WKyezfQTopyTpobuuWluBMzEghLEzom885UEvcCC2Ke
	 T7lafCoZ9GlDZ/CbtGPRdUPLqpR0L5id2i/PrHEQsa+Lz8BvjebXx/8PMw77D+a+qx
	 ltwjf4PxpJjCXijZ5sRwHqQCaF2EJR+ISj9eHv4s0/IzvAGdOQK5rbGJ519dJAjU7F
	 MO624M1ZSHHGHPSfGb3x5YJi8Csn8amdhAPvuv94+6RsWD5Fvvyd4durL0/VzgVc6V
	 OPIi8284RcBeQ==
Date: Thu, 17 Oct 2024 14:02:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] um: Fix passing '-n' to linker for stub_exe
Message-ID: <20241017210213.GA3914710@thelio-3990X>
References: <20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78@kernel.org>
 <202410171923.EbeKa7tA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410171923.EbeKa7tA-lkp@intel.com>

Thanks for the report!

On Thu, Oct 17, 2024 at 08:09:50PM +0800, kernel test robot wrote:
> Hi Nathan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 41ab5fe7471ff38d2909d1c93b88197a89c6a00f]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/um-Fix-passing-n-to-linker-for-stub_exe/20241017-051439
> base:   41ab5fe7471ff38d2909d1c93b88197a89c6a00f
> patch link:    https://lore.kernel.org/r/20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78%40kernel.org
> patch subject: [PATCH 1/2] um: Fix passing '-n' to linker for stub_exe
> config: um-defconfig (https://download.01.org/0day-ci/archive/20241017/202410171923.EbeKa7tA-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171923.EbeKa7tA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410171923.EbeKa7tA-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> clang: warning: argument unused during compilation: '-mno-3dnow' [-Wunused-command-line-argument]
>    /usr/bin/ld: arch/um/kernel/skas/stub_exe.o: in function `_start':
>    arch/um/kernel/skas/stub_exe.c:83: undefined reference to `memset'
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)

Technically, this warning also comes from the same patch that my series
fixes because it uses KBUILD_CFLAGS for linking, which may contain flags
that are not used by the compiler or linker driver. In this case, I
think this comes from the fact that '-mno-3dnow' is now a no-op in LLVM
because 3DNOW support is removed, so we could potentially shore up the
flags in arch/um/Makefile.

Regardless, I do not think it should block acceptance of this series.

Cheers,
Nathan
