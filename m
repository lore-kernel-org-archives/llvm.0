Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4661640D;
	Mon, 10 Jul 2023 22:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689029134; x=1720565134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+sLabsuDchu+s0gv9479KdIXDdWyp0p/7X2ZTAmGSQ=;
  b=bOjGmO3wiygGGGoPo3aNiaagul4pLEFm1N5Zn3vVtbRT+6n+T9BK4JL7
   1JBIGkvahsi2XfvTz/CCGIl4HgVjZ27N25SHXTrzAxIcUVAZuRS5xdY2J
   uL/dlhalnarfXFgoFd6QHLQRXgjkwIEYmcmsmOIohcfGvpw9KlyX7RSAi
   bxPOTwaVNsAksqFwqQKTISG4dXwCZ8Y9J450RDiP1qQsk7ujS1uXnXZgs
   Tea6VPW9XjTKzeh0Q3tvjJ4GtQQRZ3AC+Ipo23RW9CEy0ygKN3hdLlgw6
   shU5LuoVN3/ndpqZbGzZtZfaxtt2Bt693b8zj4cld5YSggO+vFx3oyExY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344072511"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="344072511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 15:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894949802"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="894949802"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Jul 2023 15:45:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIzdK-00044b-0x;
	Mon, 10 Jul 2023 22:45:30 +0000
Date: Tue, 11 Jul 2023 06:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/bleeding-edge 1/4]
 drivers/thermal/tegra/../thermal_core.h:18:2: warning: This header can only
 be included by the thermal core code
Message-ID: <202307110606.HYayrBLO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   c1601aa7a4588e3b79522dfba93c41630f04950f
commit: 1211989c112f7e29bf11589aab7ee6da5ae9540c [1/4] thermal/core: Hardening the self-encapsulation
config: arm-randconfig-r032-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110606.HYayrBLO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110606.HYayrBLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110606.HYayrBLO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/thermal/tegra/soctherm.c:36:
>> drivers/thermal/tegra/../thermal_core.h:18:2: warning: This header can only be included by the thermal core code [-W#warnings]
   #warning This header can only be included by the thermal core code
    ^
   1 warning generated.


vim +18 drivers/thermal/tegra/../thermal_core.h

    16	
    17	#ifndef THERMAL_CORE_SUBSYS
  > 18	#warning This header can only be included by the thermal core code
    19	#endif
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
