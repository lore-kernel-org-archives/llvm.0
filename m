Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D92582;
	Fri,  7 Apr 2023 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680901747; x=1712437747;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vI5hyg2nZUIAdwPZ62JpGCRbd1qveFnCNFPE4G+dbzs=;
  b=Vdt1KqPcqIta2aLROr2aFdn/C3RVBcBIfyfPdOiWPvyx5rF30yIubWvM
   PYwDm8s2v02OLGBCGq9P39t5OmcEzbdfJAV+pLDpNY9WlLTrVbf+iKsWf
   ye/Ec8Y4JF19NVcr+B8xSP1UEh7atbq9uwOqCEC828dT6bCG0XWbv5jrd
   LGqy/cZb8Af/7ROUrXXHl3n3yXSQdTbS7jckaXQEvcxFqKIPf4u0F83Uc
   dBm5I3Vxq6eKPi3w4nGzKfVz2AiZgGEw7vqAjkyAFZQOIWF5AMVK53RsM
   y2zaBjXPnAdoJLuhc/2LkzztTdR2ISFfsIUTZmn1o2/QMGxX6/OW3rs9N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405890958"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="405890958"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 14:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="1017369897"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="1017369897"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2023 14:09:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pktKT-000StA-1i;
	Fri, 07 Apr 2023 21:09:05 +0000
Date: Sat, 8 Apr 2023 05:08:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:objtool/core 22/23] kernel/sched/build_policy.o: warning:
 objtool: do_idle() falls through to next function cpu_startup_entry()
Message-ID: <202304080536.WJdtDBwF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
head:   fb799447ae2974a07907906dff5bd4b9e47b7123
commit: 071c44e4278156f18a6a56958617223b6bffa6ab [22/23] sched/idle: Mark arch_cpu_idle_dead() __noreturn
config: x86_64-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080536.WJdtDBwF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=071c44e4278156f18a6a56958617223b6bffa6ab
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip objtool/core
        git checkout 071c44e4278156f18a6a56958617223b6bffa6ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080536.WJdtDBwF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/build_policy.o: warning: objtool: do_idle() falls through to next function cpu_startup_entry()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
