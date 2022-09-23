Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053C3D63
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 14:18:23 +0000 (UTC)
Received: from p508fdb48.dip0.t-ipconnect.de ([80.143.219.72] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1obiqX-00075M-QP; Fri, 23 Sep 2022 15:36:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jagan Teki <jagan@edgeble.ai>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>, Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [linux-next:master 7127/7934] drivers/clk/rockchip/clk-rv1126.c:178:7: warning: unused variable 'mux_cpll_hpll_gpll_p'
Date: Fri, 23 Sep 2022 15:36:01 +0200
Message-ID: <15020006.tv2OnDr8pf@phil>
In-Reply-To: <202209192243.d80zUWVW-lkp@intel.com>
References: <202209192243.d80zUWVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 19. September 2022, 16:37:25 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
> commit: 7f2f620daa88e72b04efd2f3da84abea0b5ca1c7 [7127/7934] clk: rockchip: Add clock controller support for RV1126 SoC
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20220919/202209192243.d80zUWVW-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7f2f620daa88e72b04efd2f3da84abea0b5ca1c7
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 7f2f620daa88e72b04efd2f3da84abea0b5ca1c7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/rockchip/ drivers/irqchip/ drivers/net/wireless/ralink/rt2x00/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):

I've dropped the relevant unused definitions now.
If they come up later again, someone can re-add them.


Heiko


