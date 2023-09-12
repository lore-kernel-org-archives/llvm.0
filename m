Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4F17C2;
	Tue, 12 Sep 2023 06:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694500806; x=1726036806;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RFN/1WLhrKHYklUBnLzbFyc9ySNlrbxGxFqN3OXKHtk=;
  b=BWKrgzHl6vZFBXOtGrNIyHbgjp5lJh5FXbuigHRV6U1TzMQ2I6gNuikl
   5culmNLeSOK/ceeH3kvC5AiaeGahu/qX35lVYRVsL3vKvAOFIr1UMvw7H
   bOi6Pg8r8YkxshIK0gZ44neg5ohjX8SGbeORhpRPeRWAoX+480awQXI2/
   cGsov0P1CvgvW0Ck83MDP2ZJkDRdS6lEcxXebdqTe3dJ6+SaAwrW5f3Kb
   UU1V/0QJxAdhnfZYVtKhGCWyQ6DyFsrTTyaIUd9UWLovkbXNWEEFg3PJ9
   qClV029ShugmqLP0BOrdiLN4uesZpTsjUHWTffbX8W20U78Iwxco/5Ltl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368546545"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="368546545"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 23:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="720278214"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="720278214"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2023 23:40:03 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfx45-00001k-0l;
	Tue, 12 Sep 2023 06:40:01 +0000
Date: Tue, 12 Sep 2023 14:30:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [rafael-pm:bleeding-edge 2/5] ld.lld: error:
 vmlinux.a(init/main.o):(function __traceiter_initcall_level: .text+0x8):
 relocation R_RISCV_HI20 out of range: 528384 is not in [-524288, 524287];
 references '__tracepoint_initcall_level'
Message-ID: <202309121434.B34VzSZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Michal Wilczynski <michal.wilczynski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   eb9b927bbb5841d2ff0f92548a5d7c724d2692ee
commit: ebc7abb35b258152d4a424f89d7c03db1d7ce61c [2/5] thermal: Constify the trip argument of the .get_trend() zone callback
config: riscv-randconfig-r005-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121434.B34VzSZM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121434.B34VzSZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121434.B34VzSZM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_level: .text+0x8): relocation R_RISCV_HI20 out of range: 528384 is not in [-524288, 524287]; references '__tracepoint_initcall_level'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
