Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639E47B
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656526628; x=1688062628;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ERfQEz62jnH6BKVyrtwcJwTjXSyE4ph+P8/8tt/LcLA=;
  b=UIJhZInuO1enAzwCh39mRfixhKE9w0BFTWLe+BpjJ6XzkBIVza3L1lXq
   xrRO0rnIl3YNMQ2/1jw+n0Nul1XrGch3d80I8byYYzuJQi0neQfZYWGqW
   mqKrF9bthWfu4FO0NAEpyn0AAnsVmbLdntlhdocjbUkJAJJMOhwonIQGK
   V9LE0TvqBPFjc0bJmdggKAFsbBq9cnZQ2NArfjUuC8tDgKXki/K+2UIg4
   vYKrNxUiECrODba4Eai06xroI6d0qCpBBwyVF5yCqITF7ejG2lc59w9wO
   9Ne0MmD+qIRjTG/FK1FwjR9ECWHSHaZt6HKFUQ8P3A1ul3PDZOsZj+mCy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="265145571"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="265145571"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 11:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="733277750"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2022 11:17:07 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6cFO-000BPG-EP;
	Wed, 29 Jun 2022 18:17:06 +0000
Date: Thu, 30 Jun 2022 02:16:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 3856/6619] ld.lld: error:
 arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_parent_hartid:
 .text+0xf0): relocation R_RISCV_HI20 out of range: 528476 is not in
 [-524288, 524287]; references .L.str
Message-ID: <202206300247.kaEAUdBB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Liu Ying <victor.liu@nxp.com>
CC: Robert Foss <robert.foss@linaro.org>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c4ef528bd006febc7de444d9775b28706d924f78
commit: 48ed447c698b97ac6150e516139982d88231175d [3856/6619] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge binding
config: riscv-randconfig-r032-20220629 (https://download.01.org/0day-ci/archive/20220630/202206300247.kaEAUdBB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=48ed447c698b97ac6150e516139982d88231175d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 48ed447c698b97ac6150e516139982d88231175d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD c4ef528bd006febc7de444d9775b28706d924f78 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_parent_hartid: .text+0xf0): relocation R_RISCV_HI20 out of range: 528476 is not in [-524288, 524287]; references .L.str
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/cpu.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
