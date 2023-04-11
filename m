Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949EE15C1;
	Tue, 11 Apr 2023 00:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681174727; x=1712710727;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ru0hlo1MkkXDARc0kgvxfHugB8y2Pmpu+a61GBPH8rI=;
  b=hT1mLz8peDOu+eRIpf+tu866OQu5qq0qY/+wcWzztFcGLR7OiduBiBzq
   oqy1GdUDmaKIhmLmoS8cgUD0dDHLrDR7BBJ3QzWN0KuVUynoVKYoy+ID1
   QstnJe/oVfrjoU7h3cJ93BQTRzaNtEJzXwdstjn0jVwfvijBB27MB26HK
   KDEuc53zn3vNDw/Y+U0t1abOlHe0IIJ7A6fRAf4HRkVRIhS7C42prfMTn
   VkLEWy7hs7/ZGg+ygZbWATtZjao16lp9x4YmR0kWoYJtY2ybuJPv8fXQj
   PNTHpv8o84NNIcNVBEO5AOKcbHDWFfgeG7hnAdZr7KziSchjet/DpqRGC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327589020"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="327589020"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 17:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752948895"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="752948895"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 17:58:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm2LN-000Vlf-17;
	Tue, 11 Apr 2023 00:58:45 +0000
Date: Tue, 11 Apr 2023 08:57:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android-4.14-stable 4554/29447] arch/x86/mm/fault.o:
 warning: objtool: no_context()+0x1c9: unreachable instruction
Message-ID: <202304110819.bEMXLGae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   285fc83a087180f0bc30b75285d4bc2cdcceae06
commit: 23fb7597e6df2935bbfd0cca5a4c3ad837043aa4 [4554/29447] FROMLIST: kbuild: add __cc-ifversion and compiler-specific variants
config: x86_64-randconfig-a003-20230410 (https://download.01.org/0day-ci/archive/20230411/202304110819.bEMXLGae-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.14-stable
        git checkout 23fb7597e6df2935bbfd0cca5a4c3ad837043aa4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110819.bEMXLGae-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.o: warning: objtool: no_context()+0x1c9: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
