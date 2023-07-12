Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3DDF61;
	Wed, 12 Jul 2023 22:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689199329; x=1720735329;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Qepz9BeeAk9CAQO8RE9XUm6wzx5LSTO5LAz6cLuRtS0=;
  b=fF9N9HIb1yQvzRSzLbV/craljWSJ4FUQkts3QmUQeynsPBOTeg8/+qrz
   sjsp2Dz0Ta4WDbWdVVJudI4k6BCmEpZY5i1SMBjA7ZnM763ZrzQv/K8OU
   LKA4ATls/KlE+vp35o2KuV0Hti5bfuxFntxCGRFYwRrh6KxB3cdQPLcjs
   baA/OmopeEQOI+4Tw2qIa2PcyPUk8hmEF3Sv1h+u8+k8d3QZPLn9SUDVn
   Bz5h1dvq/H1sjQSPbPsqrMggotDd3W2XqCcvR5NBw1NQBjeaMFizd56p3
   VmG0pphVEe3AUfdDnd/ZLfPfdOIPVZwDOFQ/u19NRRhoLMFpqT2B7cg9a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="368550488"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="368550488"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 15:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="721661812"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="721661812"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jul 2023 15:02:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJhuR-00060b-1a;
	Wed, 12 Jul 2023 22:02:07 +0000
Date: Thu, 13 Jul 2023 06:01:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: jme_check_link() falls through to next
 function orion_mdio_probe()
Message-ID: <202307130504.1s62FF8c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f01e9fed8454dcd89727016c3e5b2fbb8f8e50c
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   8 weeks ago
config: x86_64-randconfig-r011-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130504.1s62FF8c-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130504.1s62FF8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130504.1s62FF8c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: jme_check_link() falls through to next function orion_mdio_probe()
   vmlinux.o: warning: objtool: ipc_imem_run_state_worker() falls through to next function ipc_imem_startup_timer_cb()
   vmlinux.o: warning: objtool: vhci_coredump_hdr() falls through to next function vhci_open_timeout()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
