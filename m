Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9737D23DC;
	Sat,  4 Feb 2023 21:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675546501; x=1707082501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ujb0P9ReMinYlWKi5+KZbSZJH3+VkyqUYBrxS/rxhAo=;
  b=QWF69Igo9MNXB+uY3y08zv/hFLKErfp7q4/7nUus17VFebSPDR5awPi6
   q8AH8Jt6tui8aOr1hfPEd/dej6b8HgwhwWqYDCV/QXFP20SmcwtruKRTe
   gNl0RNbz5lIdOC9i3GITask1c3wISHuNrdsN5yaH63oMKMtambFIzf18f
   DsScxrGyCUyqcuNm52rZDYQzio5jZfEOP/f5+uV4Ko2chO0eoxQvJsNRm
   KqxqQSFGdCu4OlCxRmPUX2RhSJUaM9nvvYfaUJX5LL5y8ypaqgI9gEQsV
   PrPTNOPXojlSEeZgxshOtJigxxT3T2BYaUAmNVFWX+eonWgAkeZu+h0w4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415205967"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415205967"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 13:34:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="774728217"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="774728217"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2023 13:34:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOQBU-0001XU-2f;
	Sat, 04 Feb 2023 21:34:56 +0000
Date: Sun, 5 Feb 2023 05:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:virtual_cpu_hotplug/rfc/v1 20/32] drivers/base/cpu.c:504:2:
 error: implicit declaration of function 'unregister_cpu' is invalid in C99
Message-ID: <202302050505.vWGB6FVR-lkp@intel.com>
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
commit: 9048fbcbea6dd1dfa42a3b9409695ff9199a417d [20/32] drivers: base: Implement weak arch_unregister_cpu()
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230205/202302050505.vWGB6FVR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=9048fbcbea6dd1dfa42a3b9409695ff9199a417d
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse virtual_cpu_hotplug/rfc/v1
        git checkout 9048fbcbea6dd1dfa42a3b9409695ff9199a417d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/base/cpu.c:504:2: error: implicit declaration of function 'unregister_cpu' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           unregister_cpu(&per_cpu(cpu_devices, num));
           ^
   drivers/base/cpu.c:504:2: note: did you mean 'register_cpu'?
   drivers/base/cpu.c:359:5: note: 'register_cpu' declared here
   int register_cpu(struct cpu *cpu, int num)
       ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_PRESENT_CPU
   Depends on [n]: ACPI [=y] && ACPI_PROCESSOR [=y] && HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y]


vim +/unregister_cpu +504 drivers/base/cpu.c

   501	
   502	void __weak arch_unregister_cpu(int num)
   503	{
 > 504		unregister_cpu(&per_cpu(cpu_devices, num));
   505	}
   506	#endif
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
