Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C317FB
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 08:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53371C385A3;
	Wed,  6 Apr 2022 08:56:17 +0000 (UTC)
Date: Wed, 6 Apr 2022 09:56:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 01/10] mm/slab: Decouple ARCH_KMALLOC_MINALIGN from
 ARCH_DMA_MINALIGN
Message-ID: <Yk1VrlIi/eN7fc7d@arm.com>
References: <20220405135758.774016-2-catalin.marinas@arm.com>
 <202204060957.sHGvCxYf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204060957.sHGvCxYf-lkp@intel.com>

On Wed, Apr 06, 2022 at 10:01:45AM +0800, kernel test robot wrote:
> [auto build test WARNING on hnaz-mm/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
> base:   https://github.com/hnaz/linux-mm master
> config: riscv-buildonly-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220406/202204060957.sHGvCxYf-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/4b3dfcfcd58dc57d321559e467e85ce909539755
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
>         git checkout 4b3dfcfcd58dc57d321559e467e85ce909539755
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: vmlinux.o(.text+0xf8244): Section mismatch in reference from the function perf_swevent_set_period() to the function .init.text:set_reset_devices()
> The function perf_swevent_set_period() references
> the function __init set_reset_devices().
> This is often because perf_swevent_set_period lacks a __init
> annotation or the annotation of set_reset_devices is wrong.

I don't see how this relates to the patch which just defines
ARCH_DMA_MINALIGN. It may be something wrong in the tree you used as a
base. My patches are based on 5.18-rc1.

-- 
Catalin
