Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0110A54
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647950251; x=1679486251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lmWLMtQQqVzHQ2GYjY+dNrTc8+Hhgn6kGkLT+kIDwQ=;
  b=LzEaPiRVMo8L8hQU/QdEGRcHiEkyLevfmSQlZcmS8QZyvg31OuF8Xf+w
   YA+r5E/kaMMps+cVcvGqgYs3lB/J5X4Qm25cUMNUl4xPRLhpYgGmDnb3S
   v6nODEKROcEZxlgKwuimWdyU3JdXQFKZ8GbQ0fIl8ioo7qfqXXzEGZYXk
   sASrYJFw7U5rzSV/vxdE6BTstdcMu7Qb+zNtj+PIvoKNu+RP1CHAl++Q8
   yHJkh9Weweoiwktnw272Q3Ux124meFL3R7UgoqCjMUkqpSYxhaAgSIZgW
   aizkbSpuJhIPUbYTJ8G242kkW+YJolX/Jmh32qvyk2UfGO9vAC6m7incc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257747548"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="257747548"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 04:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; 
   d="scan'208";a="648958488"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2022 04:57:27 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWd8h-000Ijz-7e; Tue, 22 Mar 2022 11:57:27 +0000
Date: Tue, 22 Mar 2022 19:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [linusw-pinctrl:for-next 72/78]
 drivers/pinctrl/mediatek/pinctrl-mt8186.c:1254:39: error: too many arguments
 to function call, expected single argument 'pdev', have 2 arguments
Message-ID: <202203221951.it5LJ3eo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   4d3a82e4ec28e7956db55487eeb480407a002c37
commit: 78df7bba4ab88dd6f663335858b92f9cfa2cb850 [72/78] pinctrl: mediatek: paris: Unify probe function by using OF match data
config: arm64-randconfig-r022-20220320 (https://download.01.org/0day-ci/archive/20220322/202203221951.it5LJ3eo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=78df7bba4ab88dd6f663335858b92f9cfa2cb850
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl for-next
        git checkout 78df7bba4ab88dd6f663335858b92f9cfa2cb850
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-mt8186.c:1254:39: error: too many arguments to function call, expected single argument 'pdev', have 2 arguments
           return mtk_paris_pinctrl_probe(pdev, &mt8186_data);
                  ~~~~~~~~~~~~~~~~~~~~~~~       ^~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-paris.h:60:5: note: 'mtk_paris_pinctrl_probe' declared here
   int mtk_paris_pinctrl_probe(struct platform_device *pdev);
       ^
   1 error generated.


vim +/pdev +1254 drivers/pinctrl/mediatek/pinctrl-mt8186.c

8b483bda1e46604 Guodong Liu 2022-02-16  1247  
8b483bda1e46604 Guodong Liu 2022-02-16  1248  static const struct of_device_id mt8186_pinctrl_of_match[] = {
8b483bda1e46604 Guodong Liu 2022-02-16  1249  	{ .compatible = "mediatek,mt8186-pinctrl", },
8b483bda1e46604 Guodong Liu 2022-02-16  1250  	{ }
8b483bda1e46604 Guodong Liu 2022-02-16  1251  };
8b483bda1e46604 Guodong Liu 2022-02-16  1252  static int mt8186_pinctrl_probe(struct platform_device *pdev)
8b483bda1e46604 Guodong Liu 2022-02-16  1253  {
8b483bda1e46604 Guodong Liu 2022-02-16 @1254  	return mtk_paris_pinctrl_probe(pdev, &mt8186_data);
8b483bda1e46604 Guodong Liu 2022-02-16  1255  }
8b483bda1e46604 Guodong Liu 2022-02-16  1256  

:::::: The code at line 1254 was first introduced by commit
:::::: 8b483bda1e4660411b24736e5fd6ddab472611bc pinctrl: add pinctrl driver on mt8186

:::::: TO: Guodong Liu <guodong.liu@mediatek.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
