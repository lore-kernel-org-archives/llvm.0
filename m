Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9AA2C9D;
	Fri, 17 Mar 2023 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679093003; x=1710629003;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0WfkptoQ0NvK+ISQcwbio0OYd5nFmFa/0JdMe+C/j2g=;
  b=a0jjv5+ioOfKXM2qYhiuZ0TnxXoRfCI7ifmhoXUaw3zsWPsF2HjwR5WK
   /iRiuuN5tjz3o2jndmAGG85LSdxrM2ieUbFf7WE+iQHWQ8XQDiSq88p0v
   dZjiaKmfHbBfJzP3NdV6lEsyHWp/hq+ANG4j8D/xCk0BypEhwpn4IUb++
   BtfdFC+lyYz5zHLSb6GTvFatodLF9nWklZzrXzKNDPNXP/vj9/sfFInQh
   iG4ZE6tvM9JKSCGhMrp9AHWsFh7k+pgOM8RPyay20LhkGtjXXmf+Hkqpb
   IJLnGOuBhvDUxRuTs+mYWV/6ZNQ8KstLsWjg0xC4gxmmEtcRut154SL/F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="366081986"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="366081986"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 15:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="749434627"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="749434627"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2023 15:43:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdInB-0009cw-22;
	Fri, 17 Mar 2023 22:43:21 +0000
Date: Sat, 18 Mar 2023 06:43:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 4/8]
 arch/x86/kvm/../../../virt/kvm/kvm_main.o: warning: objtool: static_call:
 can't find static_call_key symbol: __SCK__kvm_x86_vcpu_blocking
Message-ID: <202303180609.ET4TPrgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   74dbc56ffbac4b4912e598d245eaf4b0a6db638f
commit: 5c0a5c2c499b4ba2bb84fff7c63ae9365e36cb2c [4/8] static_call: Remove static_call_mod()
config: x86_64-randconfig-a011-20230313 (https://download.01.org/0day-ci/archive/20230318/202303180609.ET4TPrgv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=5c0a5c2c499b4ba2bb84fff7c63ae9365e36cb2c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 5c0a5c2c499b4ba2bb84fff7c63ae9365e36cb2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180609.ET4TPrgv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.o: warning: objtool: static_call: can't find static_call_key symbol: __SCK__kvm_x86_vcpu_blocking
--
>> arch/x86/kvm/irq.o: warning: objtool: static_call: can't find static_call_key symbol: __SCK__kvm_x86_migrate_timers
--
>> arch/x86/kvm/lapic.o: warning: objtool: static_call: can't find static_call_key symbol: __SCK__kvm_x86_hwapic_irr_update

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
