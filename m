Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420F78F26;
	Thu, 23 Apr 2026 22:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982143; cv=none; b=kT/5oZLfApgK3D7bNEB8mzaWQxdGv6k7iFj9Q6PT4adewnKuPEyuGZkJLQRyNnDsY91IoYTa2iaiCjsDmNxqBaFj05FQbxQOHFk+jN/THgnOaVAR1HyzVKR1FBy7s67REKryfbnBBJrenOums0gQ81AJ4YkOyS6vr/A7b3BvERc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982143; c=relaxed/simple;
	bh=bW1b1x3OmSNtG0f4h8IMrWELM2etfBGnJqZpHmwMMKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ht+QeN7wzmhvNYuSyAf3x99eRqZ3msohOpvdLAAh+ANVaFJVUIy7jUhvbCzXLXCHufck7pkLB+eQtJcdIXh1e25OZnOjdIBALfDR3KbAmTTDNSlnnrcIFH9r+NI8T8P/FxXMFoayAiLRbfBavCkI8sMWrwVCRdFP1nlbn4DSufI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDSsfHjv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDSsfHjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC515C2BCAF;
	Thu, 23 Apr 2026 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776982142;
	bh=bW1b1x3OmSNtG0f4h8IMrWELM2etfBGnJqZpHmwMMKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDSsfHjvNgkAcn/HfZiRFWPq3iXjOgxaLdV1syAJSbkIXiPEUmYGoKUw8udTjkXu9
	 WFaYVnAJOyZ0Zdk+rxSL8K+PJmHCC6UN6vuXJWrCqSrbbfJbFyDashNScdxiyLdvKr
	 +iSis4cVSjqrMdIu3PVtGm1/72hN5WswNE5mwKKhK9XzAQGWJVblfBOU1Wle6/Sh7j
	 gpO49E976nk0M+XHBzV/LwNeNWxGHceS5EbZtEqSFaRP1YZU0KegCWvSarxLWbofCZ
	 J5o+f2m9DrayCfAQTpx0Ux4QUBUuown/Ah2G2QiZuPFcke052dtJhm6KKvtmXVX2ZX
	 9IDiK0jNbE18A==
Date: Thu, 23 Apr 2026 15:08:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [linux-next:master 14465/14612] clang: error: ignoring
 '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s)
Message-ID: <20260423220859.GB3447678@ax162>
References: <202604232041.ESJDwVG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604232041.ESJDwVG4-lkp@intel.com>

On Thu, Apr 23, 2026 at 08:21:10PM +0800, kernel test robot wrote:
> TO: Huacai Chen <chenhuacai@loongson.cn>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   70c8a7ec6715b5fb14e501731b5b9210a16684f7
> commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd [14465/14612] LoongArch: Adjust build infrastructure for 32BIT/64BIT
> config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260423/202604232041.ESJDwVG4-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604232041.ESJDwVG4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604232041.ESJDwVG4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
>    scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
>      641 | static int dts_version = 1;
>          |            ^
>    1 warning generated.
> >> clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]
> >> clang: error: ignoring '-mabi=ilp32s' as it conflicts with that implied by '-msoft-float' (lp64s) [-Werror,-Woption-ignored]

Reported this on the original thread for further discussion:

  https://lore.kernel.org/20260423220647.GA3447678@ax162/

>    make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1
>    make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1
>    make[3]: Target 'scripts/mod/' not remade because of errors.
>    make[2]: *** [Makefile:1336: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
