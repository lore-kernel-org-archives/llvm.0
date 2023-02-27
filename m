Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E69833C5;
	Mon, 27 Feb 2023 23:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677541929; x=1709077929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hu4ygXuFVSKvu6cm5ZSH8hAwRI3iH0qbGwBD+G1d7A=;
  b=PeQR3WU5Gj1809MiboUIV6KVAfUlDJVrO/qyK8KXjFT2/C2Ks2y406rD
   6u70DiMZCI70tbMr+H1OTM0eISowmqr4Dt2Y5M6589FPP869SKgcBvDZQ
   xjaBe8/xz59RuqNEn0cAfsfcbKzQgnaqFklzPsDdyc/jPLTgNye8+kVWs
   0xaUzxp+s2C8bX+2sIrUI9WAreMdPK98ueRbG5mybPbHs9MHR3JTnFtDF
   Dc9CZHN5FaTqU8XgJGAVILq29Pxt5Hi2XJ1WKXJs41Jx4nK1zW381Mvso
   tNDq04TKIifgq81b5EWFgm1gTgguv2snrK/UbE7xsJDVA9qpbBtYqcDdO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332725699"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="332725699"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 15:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="673924596"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="673924596"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Feb 2023 15:52:06 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWnHp-0004tC-33;
	Mon, 27 Feb 2023 23:52:05 +0000
Date: Tue, 28 Feb 2023 07:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore
 files
Message-ID: <202302280702.GPo16kcF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   982818426a0ffaf93b0621826ed39a84be3d7d62
commit: 91ecf7ff1b036f3fe1183809661119b1ee109b19 kbuild: make W=1 warn files that are tracked but ignored by git
date:   5 weeks ago
config: i386-randconfig-a004-20230227 (https://download.01.org/0day-ci/archive/20230228/202302280702.GPo16kcF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=91ecf7ff1b036f3fe1183809661119b1ee109b19
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 91ecf7ff1b036f3fe1183809661119b1ee109b19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280702.GPo16kcF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/.yamllint: warning: ignored by one of the .gitignore files
>> drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
>> drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
>> drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
>> fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
>> fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
>> kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
>> lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
>> mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
