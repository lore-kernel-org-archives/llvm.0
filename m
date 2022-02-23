Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E073C6A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645621173; x=1677157173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdwXpwxeqUH7Cq2Ae1obglVV8LjCsQ3JhjCcS4UhTeo=;
  b=AfPFac9uxphUsmJ8ocT0fOocb+7bmqYt9OUIW1YnP0rouj703ZVEZOLx
   SKoGfGM+qaIO33KwaPPGRcccEkhB66gsGibCjc6b5m2NN1ttja0O+Tgsn
   AodS36KLd4hqiqEnkKucFdiyNiM/asiYW+OoyH4Eo3HgVfAq7dXcrXP5r
   K0fry0d3TToXVJJay7PZ5ylRFfVIPInTDca8Y8r3aaNLeZ2DJ4+7kTxHv
   7pgCC6/a4HduKfWLyEpIKDyOsHR7hinlvILnR0ll0qStU9xzVwxcY+fph
   w4Srp6k7PAjxzvNKV2NSEglsEufC+nPslht7jlY3nQWbm+VUR+9nZlMd0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338393097"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="338393097"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="543306233"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2022 04:59:31 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMrEw-0001S1-Ip; Wed, 23 Feb 2022 12:59:30 +0000
Date: Wed, 23 Feb 2022 20:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>
Subject: [ebiggers:crypto-pending 7/7]
 arch/arm64/crypto/polyval-ce-glue.c:355:33: warning: unused variable
 'polyval_cpu_feature'
Message-ID: <202202232016.TAxtXYiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crypto-pending
head:   a46b8b65de5ca0c5dbe41a5682ec5a9c66ec8f48
commit: a46b8b65de5ca0c5dbe41a5682ec5a9c66ec8f48 [7/7] crypto: arm64/polyval: Add PMULL accelerated implementation of POLYVAL
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220223/202202232016.TAxtXYiJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/commit/?id=a46b8b65de5ca0c5dbe41a5682ec5a9c66ec8f48
        git remote add ebiggers https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
        git fetch --no-tags ebiggers crypto-pending
        git checkout a46b8b65de5ca0c5dbe41a5682ec5a9c66ec8f48
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/crypto/ arch/arm64/kvm/hyp/nvhe/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/crypto/polyval-ce-glue.c:355:33: warning: unused variable 'polyval_cpu_feature' [-Wunused-const-variable]
   static const struct cpu_feature polyval_cpu_feature[] = {
                                   ^
   1 warning generated.


vim +/polyval_cpu_feature +355 arch/arm64/crypto/polyval-ce-glue.c

   354	
 > 355	static const struct cpu_feature polyval_cpu_feature[] = {
   356		{ cpu_feature(PMULL) }, { }
   357	};
   358	MODULE_DEVICE_TABLE(cpu, polyval_cpu_feature);
   359	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
