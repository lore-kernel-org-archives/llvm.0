Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786327B
	for <llvm@lists.linux.dev>; Mon,  3 Oct 2022 22:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C130EC433D6;
	Mon,  3 Oct 2022 22:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664835405;
	bh=NJyz/T+EkJhFvmjGYhkGYed0B8UcQEphU7bJFCNl+q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBHmBDb566uyWtqu76NaEp7oJqAH0LAl7uSzhakgFW5swEUHIZM8P/bSY9wFfBa5j
	 3+PXeAt+ZYhsH7c31Ov03upYWI5uAsjebeDSUrf1JHHHuHc+SaPKRg3pgBOlYP8Q40
	 Eu2iq51b7z8yrf/XkPJzIWWWx+Qve8V7AmiQcO5KMfKRqHQ+v9g7O8oFUPAwBp3OKS
	 LUV3+6qi12KtnbrDF4WgPF5gjSm7Lzbm/vwDD8axRJrK4iL/X/3I3OL6zt+OF73wVG
	 RyFmivJzNBKH9A0c8XdQsBBl001D7tZgZs0PB8mNVqi2twf3E5X2n8rVvl55BcRrq9
	 MUPVPZ4JXeFJA==
Date: Mon, 3 Oct 2022 15:16:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [linux-next:master 11523/11993]
 include/asm-generic/rwonce.h:67:9: error: expected string literal in 'asm'
Message-ID: <YztfSxGPA5JNwInL@dev-arch.thelio-3990X>
References: <202210040658.MIQoJiKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210040658.MIQoJiKz-lkp@intel.com>

On Tue, Oct 04, 2022 at 06:13:07AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   274d7803837da78dfc911bcda0d593412676fc20
> commit: ba00c2a04fa5431d204a4183062b30372c062aa7 [11523/11993] arm64: fix the build with binutils 2.27
> config: arm64-randconfig-r034-20221003
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ba00c2a04fa5431d204a4183062b30372c062aa7
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout ba00c2a04fa5431d204a4183062b30372c062aa7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/arm64/kernel/module-plts.c:6:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/arm64/include/asm/elf.h:8:
>    In file included from arch/arm64/include/asm/hwcap.h:9:
>    In file included from arch/arm64/include/asm/cpufeature.h:9:
>    In file included from arch/arm64/include/asm/alternative-macros.h:5:
>    In file included from include/linux/bits.h:22:
>    In file included from include/linux/build_bug.h:5:
>    In file included from include/linux/compiler.h:248:
>    In file included from arch/arm64/include/asm/rwonce.h:71:
> >> include/asm-generic/rwonce.h:67:9: error: expected string literal in 'asm'
>            return __READ_ONCE(*(unsigned long *)addr);
>                   ^
>    arch/arm64/include/asm/rwonce.h:43:16: note: expanded from macro '__READ_ONCE'
>                    asm volatile(__LOAD_RCPC(b, %w0, %1)                    \
>                                 ^
>    arch/arm64/include/asm/rwonce.h:17:2: note: expanded from macro '__LOAD_RCPC'
>            ALTERNATIVE(                                                    \
>            ^

https://lore.kernel.org/20221003193759.1141709-1-nathan@kernel.org/
should resolve this.

Cheers,
Nathan
