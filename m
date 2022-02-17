Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A43D8C
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645103155; x=1676639155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y40DBqaIdT6zBhrgCBj8cBu666AKZYDew2yl1iQwfVY=;
  b=IGafNkaSz3Dhhi06l/1LRBQISWYpZWR2qqLyzeoHrFaFLn7vPKAIHCvR
   wFKdF1gHIyYTYtZnF45ObLc8YXUHU4CPIa+yfUtWJ1SkcB+NLHGHAEj9i
   7FuRwmC8HgRQxETHOXy53qUaT76wN5c/zVOWSJjliA5WZmeB1vpTVWVdZ
   Tuog+3D30EKqQx8NobQTnakVq6MVNTb6PdFV8a8iy2+bG/sBZbtMde8bO
   RT43dUid2kup0FpM7sRvAvmBMgCi8Xzi7O41DkTMbVQZZ5jnFtcDh/9/r
   Ln23t2ZdRBcaL2GkIbLPj8jAwDn3GbGtJnnNHBrIrcBTWuNwAJjUHWvZ4
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="337312618"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="337312618"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 05:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="589386402"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2022 05:05:50 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKgTl-0000D7-BO; Thu, 17 Feb 2022 13:05:49 +0000
Date: Thu, 17 Feb 2022 21:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Liang Yang <liang.yang@amlogic.com>,
	Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	BiChao Zheng <bichao.zheng@amlogic.com>,
	YongHui Yu <yonghui.yu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] mtd: rawnand: meson: discard the common
 MMC sub clock framework
Message-ID: <202202172131.hVJG538q-lkp@intel.com>
References: <20220217063346.21691-2-liang.yang@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217063346.21691-2-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Liang,

I love your patch! Yet something to improve:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Liang-Yang/refine-the-NFC-clock-framework/20220217-145053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: hexagon-randconfig-r013-20220217 (https://download.01.org/0day-ci/archive/20220217/202202172131.hVJG538q-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d3d7ef65145346ff8212125d56afff6290a5ab68
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/refine-the-NFC-clock-framework/20220217-145053
        git checkout d3d7ef65145346ff8212125d56afff6290a5ab68
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __clk_get_name
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: clk_divider_ops
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: devm_clk_register
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
