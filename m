Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861937480
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 21:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7687C433C1;
	Thu,  1 Sep 2022 21:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662068902;
	bh=AgaBXEIpBBFQ/ZE0Isjng2Wc1nL21eGQ8i4n5nIJjq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJaePjrI9x6zMby4A9gt+zlJ/VhqubPs/Dy/LXPZ20fav1fz+3RTbP7aHRK/N0JYD
	 TdNnX7bDS522/UAVNcrPl9CBzdRLFdu/4rprlosYtmFN99SN0/O85YBFvcgDtbH/d1
	 mFZ5addvRNR5KZ5W+rkOiR+gALNvLtvJ023Huf9FHEGO5efATJc8IgDdCn3VPH4EOR
	 FdyW78NWqQ4XOjsovpVz0P3BSBOw5ZwDXHA+DjIwJ8G/wpYmi5pkKBFyUCM2cqbjPC
	 H30gLMOw5F7IQiq3ky43hQClAaA2amJossODFHR4XKKNEH5+1fyPMqK2gP7YYki5NT
	 0wBYa/oHZj2tA==
Date: Thu, 1 Sep 2022 14:48:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [masahiroy-kbuild:kbuild 18/19] ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151];
 references __vmnewmap
Message-ID: <YxEoo8M++9tyaLOO@thelio-3990X>
References: <202209020450.jH1ovepP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209020450.jH1ovepP-lkp@intel.com>

+ Masahiro

On Fri, Sep 02, 2022 at 04:41:09AM +0800, kernel test robot wrote:
> CC: linux-kbuild@vger.kernel.org
> TO: Masahiro Yamada <masahiroy@kernel.org>
> 
> Hi Masahiro,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   67c0e0cf21cd5065fba45a6a00dd252ae4b9417a
> commit: 0b1de512cba77e11bdf0305264c56ab61b23b3e1 [18/19] kbuild: use obj-y instead extra-y for objects placed at the head
> config: hexagon-randconfig-r041-20220831 (https://download.01.org/0day-ci/archive/20220902/202209020450.jH1ovepP-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=0b1de512cba77e11bdf0305264c56ab61b23b3e1
>         git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>         git fetch --no-tags masahiroy-kbuild kbuild
>         git checkout 0b1de512cba77e11bdf0305264c56ab61b23b3e1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151]; references __vmnewmap
>    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> --
> >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2313056 is not in [-2097152, 2097151]; references __vmsetvec
>    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> --
> >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152, 2097151]; references memset
>    >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 
