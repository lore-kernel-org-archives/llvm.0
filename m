Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282F3217;
	Sat,  4 Feb 2023 20:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675541595; x=1707077595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=impB2PY5ZQlafmRLAVSitt88Gdvkw4xHxJZ2JEItRNk=;
  b=M0WfJTwk0mXW+7MeeJ2TACmSisijTpJjO/5fW8Pd4OPMehvUdJ/+0O36
   UnCfFieHPtsMCIJrTwL4y8/z2bnMUFDjDPuoIzZJR6lUykgPcqQHbsQjy
   I5wtcPPOT99FNwuF6Qln09rp8shr4KCg6kDygS3pqK/aT2akzXjza3H87
   wAXXLFzDm/2AefYtGk/AdDlWvT7W1eXCgYiPeb783sR143CwbxOgBT3z4
   nn0roE1wOHzLPFkDHvgAMNIcwJGW1VWx0c8bav/6kum4RWkIU8NeDIcHD
   898z5hAO1m4DQUdnBZ9SZIGpvykrVhBWb87L6YefMcfrW3KBABv+nRIyf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393580203"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393580203"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 12:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698434249"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="698434249"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 12:13:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOOu7-0001W6-13;
	Sat, 04 Feb 2023 20:12:55 +0000
Date: Sun, 5 Feb 2023 04:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:virtual_cpu_hotplug/rfc/v1 8/32]
 arch/x86/kernel/topology.c:147:49: error: no member named 'cpu' in 'struct
 cpu'
Message-ID: <202302050422.aKurEcYI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git virtual_cpu_hotplug/rfc/v1
head:   81295db7555df74bd02dab0b7e87b512d3a3de34
commit: bbbbfae28e723520ab31d000146207547cc62124 [8/32] x86/topology: Switch over to GENERIC_CPU_DEVICES
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230205/202302050422.aKurEcYI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=bbbbfae28e723520ab31d000146207547cc62124
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse virtual_cpu_hotplug/rfc/v1
        git checkout bbbbfae28e723520ab31d000146207547cc62124
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/topology.c:145:19: error: static declaration of 'arch_register_cpu' follows non-static declaration
   static int __init arch_register_cpu(int num)
                     ^
   include/linux/cpu.h:78:12: note: previous declaration is here
   extern int arch_register_cpu(int cpu);
              ^
>> arch/x86/kernel/topology.c:147:49: error: no member named 'cpu' in 'struct cpu'
           return register_cpu(&per_cpu(cpu_devices, num).cpu, num);
                                ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_CPU
   Depends on [n]: ACPI [=y] && ACPI_PROCESSOR [=y] && HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y]


vim +147 arch/x86/kernel/topology.c

271eb5c588e5d0a Jaswinder Singh Rajput 2009-03-21  144  
d987402695f16ae Alexander van Heukelum 2008-02-01  145  static int __init arch_register_cpu(int num)
3eaf5efae72b33b Sam Ravnborg           2008-01-30  146  {
3eaf5efae72b33b Sam Ravnborg           2008-01-30 @147  	return register_cpu(&per_cpu(cpu_devices, num).cpu, num);

:::::: The code at line 147 was first introduced by commit
:::::: 3eaf5efae72b33bc6132e9590e5d4bf11532f8c4 x86: fix section mismatch warning in topology.c

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
