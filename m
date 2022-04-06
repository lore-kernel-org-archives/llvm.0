Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF717FB
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6572AC385A3;
	Wed,  6 Apr 2022 08:57:17 +0000 (UTC)
Date: Wed, 6 Apr 2022 09:57:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 09/10] mm/slab: Simplify create_kmalloc_cache() args and
 make it static
Message-ID: <Yk1V6do0AmXCB1OK@arm.com>
References: <20220405135758.774016-10-catalin.marinas@arm.com>
 <202204061348.mo7QK7AD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204061348.mo7QK7AD-lkp@intel.com>

On Wed, Apr 06, 2022 at 01:35:53PM +0800, kernel test robot wrote:
> Hi Catalin,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on hnaz-mm/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
> base:   https://github.com/hnaz/linux-mm master
> config: riscv-buildonly-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220406/202204061348.mo7QK7AD-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/594fc15f21ce6de4d37971f717ff4223ab271823
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
>         git checkout 594fc15f21ce6de4d37971f717ff4223ab271823
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: vmlinux.o(.data+0x2836c8): Section mismatch in reference from the variable sctp_prot to the variable .init.text:.LBB19_63
> The variable sctp_prot references
> the variable __init .LBB19_63
> If the reference is valid then annotate the
> variable with or __refdata (see linux/init.h) or name the variable:

Same with the other report, I don't think these are caused by my
patches.

Could you please try the patches again on top of 5.18-rc1?

Thanks.

-- 
Catalin
