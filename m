Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D18A1FA1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649749049; x=1681285049;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0LJFvrdyN/JW03J9udGK9z8Z3EITY86/qGe+UYJwVjM=;
  b=Leo8rNPKrmUEmyiVJgG/hzNCQ3akhmSMrDeQQKpX/TWJyNCNt08gxdDj
   bOor1jQ0xsJ8hmcM2Hq4tJVQW8oNazhjxsQz+R2kDxlR7/dejVUw7wZwT
   OxgK3QRVkSqgtSQpzcf/bt6J3KkMrtX0YNCn0970I1o1ezqfq8OFFkRYN
   3LgjERudPKc+cgoI2S4qMdYR7ThxrLdmA66bshk0uBGupcW6KnqK5sly/
   mdWBT3LpKF7Jkmgi68DgrVB4RJR7KqSEUroxSp32v5uJqd1XczOn3SWrd
   Hov6/SQoROHkborNb1nMZlHYDCHlVACE6n944bu085tFnmCpryluWceSr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="287315895"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="287315895"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 00:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="525925955"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Apr 2022 00:37:24 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neB5X-0002dU-Ck;
	Tue, 12 Apr 2022 07:37:23 +0000
Date: Tue, 12 Apr 2022 15:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:queue/5.17 638/1505]
 drivers/net/dsa/realtek/realtek-smi-core.c:494:34: warning: unused variable
 'realtek_smi_of_match'
Message-ID: <202204121538.1pGOoGfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.17
head:   22fa848c25c536c9ec7b151d56caa65b3e5b8b68
commit: b0cbd13db467ef03b28297d3effb6b726c0dcba8 [638/1505] net: dsa: realtek-smi: move to subdirectory
config: x86_64-randconfig-r033-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121538.1pGOoGfb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b0cbd13db467ef03b28297d3effb6b726c0dcba8
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.17
        git checkout b0cbd13db467ef03b28297d3effb6b726c0dcba8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/dsa/realtek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/realtek/realtek-smi-core.c:494:34: warning: unused variable 'realtek_smi_of_match' [-Wunused-const-variable]
   static const struct of_device_id realtek_smi_of_match[] = {
                                    ^
   1 warning generated.


vim +/realtek_smi_of_match +494 drivers/net/dsa/realtek/realtek-smi-core.c

0650bf52b31ff3 drivers/net/dsa/realtek-smi-core.c Vladimir Oltean 2021-09-17  493  
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14 @494  static const struct of_device_id realtek_smi_of_match[] = {
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  495  	{
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  496  		.compatible = "realtek,rtl8366rb",
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  497  		.data = &rtl8366rb_variant,
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  498  	},
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  499  	{
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  500  		/* FIXME: add support for RTL8366S and more */
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  501  		.compatible = "realtek,rtl8366s",
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  502  		.data = NULL,
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  503  	},
4af2950c50c863 drivers/net/dsa/realtek-smi-core.c Alvin Šipraga   2021-10-18  504  	{
4af2950c50c863 drivers/net/dsa/realtek-smi-core.c Alvin Šipraga   2021-10-18  505  		.compatible = "realtek,rtl8365mb",
4af2950c50c863 drivers/net/dsa/realtek-smi-core.c Alvin Šipraga   2021-10-18  506  		.data = &rtl8365mb_variant,
4af2950c50c863 drivers/net/dsa/realtek-smi-core.c Alvin Šipraga   2021-10-18  507  	},
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  508  	{ /* sentinel */ },
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  509  };
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  510  MODULE_DEVICE_TABLE(of, realtek_smi_of_match);
d8652956cf37c5 drivers/net/dsa/realtek-smi.c      Linus Walleij   2018-07-14  511  

:::::: The code at line 494 was first introduced by commit
:::::: d8652956cf37c5caa8c19e0b99ce5ca235c6d5de net: dsa: realtek-smi: Add Realtek SMI driver

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
