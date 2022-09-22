Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BD41FD5
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663822983; x=1695358983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBTtqQVo7qtn1YB1Hzz5RclGbFSO3x9PEKfvA9yexH4=;
  b=a89JfFPaExs6xqXF/6j2j3D2jTq9HTUbdiKc06OicNPHHL5Iakqg5AmV
   rqDcflOx4U3SKryCTj+ZFG7WIf5m8x+jcePxJBAb+q1vpZjfShudkPIY8
   vqlYB5nJor6WJp8p79BVUy7SIlYBpj8AncIPpYeMr3Sn2uaFhE+mDbEqA
   sAuw/09I2/Ce2kZmGwfsLhVi4Tb/5yXUojWdfbihuJFuhyCdqi3PY1+FS
   msCdFGIEbWfxWy4DTRU0SXGfFaPwduMrnFfMIBhJ9W4hJw3z/dXu/B7mh
   4C2aoWLca/Rcv5PAggl5+rUQB8ZMR7QUfPb9pzfXA0M0VIaFBrYKTqQzZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280568666"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="280568666"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 22:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="948443650"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2022 22:03:01 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obEMX-0004KO-0s;
	Thu, 22 Sep 2022 05:03:01 +0000
Date: Thu, 22 Sep 2022 13:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7663/8813] ERROR: modpost: "boot_cpu_data"
 [arch/x86/events/intel/intel-cstate.ko] undefined!
Message-ID: <202209221237.rz9PdFoG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   483fed3b5dc8ce3644c83d24240cf5756fb0993e
commit: 48f513e2b9304affc43dcdf95a150ad02d70f9fd [7663/8813] kbuild: use obj-y instead extra-y for objects placed at the head
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220922/202209221237.rz9PdFoG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=48f513e2b9304affc43dcdf95a150ad02d70f9fd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 48f513e2b9304affc43dcdf95a150ad02d70f9fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "boot_cpu_data" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "x86_match_cpu" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "__cpuhp_remove_state" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "perf_pmu_unregister" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "perf_msr_probe" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "__cpuhp_setup_state" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "perf_pmu_register" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "_printk" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "cpu_bit_bitmap" [arch/x86/events/intel/intel-cstate.ko] undefined!
>> ERROR: modpost: "perf_pmu_migrate_context" [arch/x86/events/intel/intel-cstate.ko] undefined!
WARNING: modpost: suppressed 48031 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
