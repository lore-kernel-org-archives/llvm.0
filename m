Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014017CC
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 21:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646168672; x=1677704672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkBpiGS9qT2A5/AO8ZoQHW0JjgI9k0Vg9Eiwm+kBaEU=;
  b=SY4ek9+JRur4h3XGkc9TN6WBvxMlOkPoo8+QJXsAjl16jaFkMjJS3Gm4
   xiTY1pbvxVwjy2LmlgtN8EfgJfydVJzZR9IjVoc2m9LRIfbsvXzVrXbMy
   Glwa1li2bzjkeFe6kv8vqSJhl7HVJODw+wkv82QO2bfhswQcTs5DsyVO2
   0SJp86OwsYtSREcchon78St35c3xQ/lvLQ22AcsJk23zHlP1JU/qbeEOq
   MCAUM7jLr1IQJn5epKd56aUJFlkq/MHo+/o1b0wDhbilYFLP6p30abe94
   4cfGllMW5MxYcbWZgXxW6/2HivrYJASg2s34QjPfno84kB0/EtmpM9k4E
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236750451"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="236750451"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 13:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="641421998"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Mar 2022 13:04:30 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nP9fZ-00011o-8l; Tue, 01 Mar 2022 21:04:29 +0000
Date: Wed, 2 Mar 2022 05:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [chenxing:msc313_mainlining 80/96] Error:
 arch/arm/boot/dts/mstar-infinity2m-ssd201-wirelesstag-ido-som2d01.dtsi:18.1-9
 Label or path pm_uart not found
Message-ID: <202203020419.Kj7avg87-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://github.com/linux-chenxing/linux.git msc313_mainlining
head:   8ac61fd8fe35232e1061ab5e3e7b665cac918068
commit: a129af18616a3b5ad4c4af70458703a052da2d63 [80/96] ARM: dts: mstar: Add top level dts for ssd201-som2d01
config: arm-randconfig-r006-20220301 (https://download.01.org/0day-ci/archive/20220302/202203020419.Kj7avg87-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/linux-chenxing/linux/commit/a129af18616a3b5ad4c4af70458703a052da2d63
        git remote add chenxing git://github.com/linux-chenxing/linux.git
        git fetch --no-tags chenxing msc313_mainlining
        git checkout a129af18616a3b5ad4c4af70458703a052da2d63
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/mstar-infinity2m-ssd201-wirelesstag-ido-som2d01.dtsi:18.1-9 Label or path pm_uart not found
>> FATAL ERROR: Syntax error parsing input tree

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
