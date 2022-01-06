Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C9B2C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 20:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641501707; x=1673037707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GVQVui8sx4WukJ6YIYlSQWZS6cdWl9ZfkzVAP2hn6qE=;
  b=UT5Dc+2JrCXVY/qZD8wcuaChF8U6RQLFkldsOzS4CTnJ7N2pd3BArQpd
   sXCeDUuXoO++THD97qftS+skVDvTITFq6Xznsr+rv3vMRBDLzP0HRb/0k
   JxDuVqYLpJH7UbryBBAiks1dUhcAzona7B1iFVMAjXjlykHXsFvigLmbu
   7eWSFSjUH5gYsbou/cUbxoqDTAFDYAUmVsLYVZ1fh7yCPMevfPMFUbMMC
   NZwj6qyhc+YbHp3w3wlUxdUgnIS5vSDY5JxKChVSkHBMBY3qBAbaPdebW
   3JNIUX46YjXH4yBdytFGyjayr4ZeeqLS4/L4z02x5dGAmnY0Xmdxt1PHi
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242689120"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="242689120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 12:41:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="489058794"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 12:41:29 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5ZZg-000HwV-VA; Thu, 06 Jan 2022 20:41:28 +0000
Date: Fri, 7 Jan 2022 04:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Liang Yang <liang.yang@amlogic.com>,
	Richard Weinberger <richard@nod.at>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>
Subject: Re: [PATCH] mtd: rawnand: meson: fix the clock after discarding
 sd_emmc_c_clkc
Message-ID: <202201070440.ncSR3Xpb-lkp@intel.com>
References: <20220106032504.23310-1-liang.yang@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106032504.23310-1-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Liang,

I love your patch! Yet something to improve:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on v5.16-rc8 next-20220106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Liang-Yang/mtd-rawnand-meson-fix-the-clock-after-discarding-sd_emmc_c_clkc/20220106-114103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: hexagon-randconfig-r045-20220106 (https://download.01.org/0day-ci/archive/20220107/202201070440.ncSR3Xpb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/mtd-rawnand-meson-fix-the-clock-after-discarding-sd_emmc_c_clkc/20220106-114103
        git checkout a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
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
