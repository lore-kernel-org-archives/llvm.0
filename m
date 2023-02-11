Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2336F3FC7;
	Sat, 11 Feb 2023 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676137823; x=1707673823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCMZ+TaH5BhJHU/ILxxkVHYieOfOEBf1VgQ4nWfNW2Y=;
  b=I++uzbZGpJYOyOVKuRGWfdzAJRNE7F8vBiOQQ/w5KumKs8zuXiNeOPw+
   5GTLivYUxADq4cJJElv+9SgV26OEWBJ2/eqijrDYSsjqWK0bFeZtX5f2+
   xxDIfsugtYNaj8zNRU8lFAaiXm0ovtkgJ2ojp/tnWMcUPws9uFVG0axY7
   yx+RpnvY5ZyJuRGvyocSI3Ml7WWnNKor+AF8u6g5YwWgXeLerHfI4wOSm
   sAEfGh+4hSIq85puJpRooYiDRKPkzW27Lm6d/MbWn7+Zds7yg6IACHpiL
   nFVwUzv9mNyxsESyDNYay75ErsopR2G2i3kPotepLm3wrCkK7NmKaTcGH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="416858824"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="416858824"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 09:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="792299320"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="792299320"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Feb 2023 09:50:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQu0y-0006iX-1C;
	Sat, 11 Feb 2023 17:50:20 +0000
Date: Sun, 12 Feb 2023 01:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/shrink-reloc 9/9] ld.lld: error:
 drivers/mtd/nand/onenand/onenand.o: invalid symbol index
Message-ID: <202302120106.JFvGHgMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/shrink-reloc
head:   f6fc990282a852a0b9aefd96ebda944b953db021
commit: f6fc990282a852a0b9aefd96ebda944b953db021 [9/9] objtool: Single-linked reloc_list(s)
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230212/202302120106.JFvGHgMj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=f6fc990282a852a0b9aefd96ebda944b953db021
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/shrink-reloc
        git checkout f6fc990282a852a0b9aefd96ebda944b953db021
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash M=drivers/mtd

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120106.JFvGHgMj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/mtd/nand/onenand/onenand.o: invalid symbol index

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
