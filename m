Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03317D1
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 14:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6DEC433D6;
	Tue,  6 Sep 2022 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662475298;
	bh=MUHVkHD3HOWqB3Jg9koGYRAh7DYywb2rrdDAPy7SNss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guqhERkvwcvAmhG2DkzjXgYTGvFEcMqm0z5skZFohFv/kynuQtA8T+cJKck1URQJF
	 BV8hNOeE9FyZ7exOg0XjTBJ6pFrdw70SbgtMHQ8Pw4B9Qe89Zd9hhcnHDQFiEBdQC4
	 i/Dk8QiQSJtaDqOujHyCOtQgwQcLl//p+v+qlFfpSYtRmsl8XTYbqD5Py5x30muZaE
	 2qsr2cXnRK8M3+YT9zZmn4rUDvX3910POXVbbqF3yqVv7189ELFHE8RjaskjnUQBzH
	 poHXZ9AHYL2HEgKGEEzuPC2lAZ3PgLu7U/ZOyRWttF9hxw+WPRy5MVwMNlOK8xhoMx
	 mWKWrgBSeUoMA==
Date: Tue, 6 Sep 2022 07:41:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [arm-integrator:virt-to-pfn-v6.0-rc1 21/24] ld.lld: error:
 arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
Message-ID: <YxdcIGcQ+fB9G2qN@dev-arch.thelio-3990X>
References: <202209032354.b0SHaeQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209032354.b0SHaeQe-lkp@intel.com>

+ Linus

This shouldn't be clang/ld.lld specific

On Sat, Sep 03, 2022 at 11:23:41PM +0800, kernel test robot wrote:
> CC: linux-kernel@vger.kernel.org
> TO: Linus Walleij <linus.walleij@linaro.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.0-rc1
> head:   fd7709c9f1119794e96665ae423d79d93bfe43fc
> commit: c815de3dd0f6ccea52b05efa8e1be1043255006a [21/24] powerpc: Make virt_to_pfn() a static inline
> config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20220903/202209032354.b0SHaeQe-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=c815de3dd0f6ccea52b05efa8e1be1043255006a
>         git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
>         git fetch --no-tags arm-integrator virt-to-pfn-v6.0-rc1
>         git checkout c815de3dd0f6ccea52b05efa8e1be1043255006a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
>    scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
>    scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
> >> ld.lld: error: arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
>    >>> static inline unsigned long virt_to_pfn(const volatile void *kaddr)
>    >>> ^
> >> clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
>    make[2]: *** [arch/powerpc/kernel/vdso/Makefile:66: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>    make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
>    make[1]: *** [arch/powerpc/Makefile:392: vdso_prepare] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:222: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 
