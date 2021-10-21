Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097162C81
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 12:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id CCC9380EB;
	Thu, 21 Oct 2021 12:34:47 +0000 (UTC)
Date: Thu, 21 Oct 2021 15:34:13 +0300
From: Tony Lindgren <tony@atomide.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [linux-next:master 8693/9489]
 drivers/mmc/host/sdhci-omap.c:1450:21: error: use of undeclared identifier
 'sdhci_omap_runtime_suspend'; did you mean '__pm_runtime_suspend'?
Message-ID: <YXFeRQ6S5wK+VO+K@atomide.com>
References: <202110210056.QMBILm00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110210056.QMBILm00-lkp@intel.com>

* kernel test robot <lkp@intel.com> [211020 16:23]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   51dba6e335ff9d1f6f50b5cacced8598956e1437
> commit: f433e8aac6b94218394c6e7b80bb89e4e79c9549 [8693/9489] mmc: sdhci-omap: Implement PM runtime functions
> config: riscv-randconfig-r042-20211020 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9660563950aaed54020bfdf0be07e7096a9553e4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f433e8aac6b94218394c6e7b80bb89e4e79c9549
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout f433e8aac6b94218394c6e7b80bb89e4e79c9549
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/mmc/host/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/mmc/host/sdhci-omap.c:1450:21: error: use of undeclared identifier 'sdhci_omap_runtime_suspend'; did you mean '__pm_runtime_suspend'?
>            SET_RUNTIME_PM_OPS(sdhci_omap_runtime_suspend,
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                               __pm_runtime_suspend

Hmm so seems like these should not be in the CONFIG_PM_SLEEP. Probably
best to just use __maybe_unused here instead, I'll send a patch doing
that if no objections.

Regards,

Tony
