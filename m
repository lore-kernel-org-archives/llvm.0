Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50868
	for <llvm@lists.linux.dev>; Sat, 27 Nov 2021 12:46:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="299160381"
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="299160381"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2021 04:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="457937767"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Nov 2021 04:46:51 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqx6Q-0009Vg-79; Sat, 27 Nov 2021 12:46:50 +0000
Date: Sat, 27 Nov 2021 20:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kenny Ho <Kenny.Ho@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 1/4] cgroup, perf: Add ability to connect to perf
 cgroup from other cgroup controller
Message-ID: <202111272015.KZlJ9xBN-lkp@intel.com>
References: <20211118202840.1001787-2-Kenny.Ho@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118202840.1001787-2-Kenny.Ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kenny,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.15]
[also build test WARNING on next-20211126]
[cannot apply to bpf-next/master bpf/master tip/perf/core v5.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kenny-Ho/Add-ability-to-attach-bpf-programs-to-a-tracepoint-inside-a-cgroup/20211119-043050
base:    8bb7eca972ad531c9b149c0a51ab43a417385813
config: hexagon-randconfig-r041-20211118 (https://download.01.org/0day-ci/archive/20211127/202111272015.KZlJ9xBN-lkp@intel.com/config)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6946ea4a7228dd06a9b6624702bcec1cfc7865ec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kenny-Ho/Add-ability-to-attach-bpf-programs-to-a-tracepoint-inside-a-cgroup/20211119-043050
        git checkout 6946ea4a7228dd06a9b6624702bcec1cfc7865ec
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash ipc/ kernel/events/ kernel/time/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:1095:21: warning: no previous prototype for function 'cgroup_tryget_perf_cgroup' [-Wmissing-prototypes]
   struct perf_cgroup *cgroup_tryget_perf_cgroup(struct cgroup *cgrp)
                       ^
   kernel/events/core.c:1095:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct perf_cgroup *cgroup_tryget_perf_cgroup(struct cgroup *cgrp)
   ^
   static 
   kernel/events/core.c:1114:1: warning: unused function 'perf_cgroup_switch' [-Wunused-function]
   perf_cgroup_switch(struct task_struct *task, struct task_struct *next)
   ^
   2 warnings generated.


vim +/cgroup_tryget_perf_cgroup +1095 kernel/events/core.c

  1094	
> 1095	struct perf_cgroup *cgroup_tryget_perf_cgroup(struct cgroup *cgrp)
  1096	{
  1097		return NULL;
  1098	}
  1099	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
