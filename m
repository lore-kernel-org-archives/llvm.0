Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397947B
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655552238; x=1687088238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOYo46dpjPADJUZif/M9VCCs/cdqw1jhFQJdCWKAs90=;
  b=jYplqyboqo4PaY+z4EyMbHo3ywZBfxQlwrr8Lz5VXK53Adc6Cer6p/Ay
   qLcRnfCQr2+cdCXn/a+RgeAODSWbJlmNxs7G03ASrYcMbYL/GIp41wPxG
   1tGGAm8Fw1F2yFv/4Gaun3m+AksvzCDkO5iiZfc4PfIG5EjAQ2lrqgPaJ
   NrfV7ckNn3BXPzzpqi5eA2RuIrXYiYvSECI7zbFnYAUxp+G34Nz1mISFU
   bRYp5g0HIRLTXIw45Bf2l0URF1eUiZpwxKoDkylnkLmleUq9mnVEuSpXq
   CgtrTJ67RjyFt4O41tJijTOyGHJmtItUlRcrNSrUDD3UxR4zp+SpK/K0T
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268365753"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="268365753"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 04:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="763557267"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jun 2022 04:37:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2WlP-000QHx-DQ;
	Sat, 18 Jun 2022 11:37:15 +0000
Date: Sat, 18 Jun 2022 19:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Liang He <windhl@126.com>, linux@armlinux.org.uk
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, windhl@126.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: mm: (cache-feroceon-l2) Add missing of_node_put()
Message-ID: <202206181916.KzyEh57x-lkp@intel.com>
References: <20220616030232.3974254-1-windhl@126.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616030232.3974254-1-windhl@126.com>

Hi Liang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on arm/for-next]
[also build test ERROR on arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next xilinx-xlnx/master linus/master keystone/next v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-He/arm-mm-cache-feroceon-l2-Add-missing-of_node_put/20220616-110418
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
config: arm-mv78xx0_defconfig (https://download.01.org/0day-ci/archive/20220618/202206181916.KzyEh57x-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 91688716ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/bfe3f64dcc525721223aeb2d18594832ac9273c5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liang-He/arm-mm-cache-feroceon-l2-Add-missing-of_node_put/20220616-110418
        git checkout bfe3f64dcc525721223aeb2d18594832ac9273c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mm/cache-feroceon-l2.c:382:9: error: use of undeclared label 'out_put'
                           goto out_put;
                                ^
   1 error generated.


vim +/out_put +382 arch/arm/mm/cache-feroceon-l2.c

   376	
   377		node = of_find_matching_node(NULL, feroceon_ids);
   378		if (node && of_device_is_compatible(node, "marvell,kirkwood-cache")) {
   379			base = of_iomap(node, 0);
   380			if (!base) {
   381				ret = -ENOMEM;
 > 382				goto out_put;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
