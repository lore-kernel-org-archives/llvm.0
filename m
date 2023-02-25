Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020367C;
	Sat, 25 Feb 2023 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677315627; x=1708851627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Znvyp+4Hl7nL8bb2ycKQ/IAnYu1hZT2zRX7E4beryPU=;
  b=h/Tyr9mPWVFse5stFJ98s9cNymSrEcd9CJFwyyGZ7RwIDl107PoQu4AB
   HjpXcYdytI2NOE+KCx+1ltxln3FTz8a+Oq/aA9L5mtG7f8ayySjPBlP0G
   ToCD+FPm/WoEXjtReyCu4FFrzM2pOdjUKnM5cK2m8YQ/ZzbNNZIvy2R0F
   vx7gcCzKMSdBnoCr2C+F350SR2P/OEsTie3xLRhO4jTVV7o9/2L45a2an
   8f8TGFx5KMc+0M9EYdgC1q+x/LN2lsFC8yoGQ9QqwCzPQz3PBm7X6WdrR
   OsNiwLnoJ1iR7xSxZ3ChI+UNnx4wIqse4NigpKwv2yKEutsv9Zx8mJBQz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335079754"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="335079754"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 01:00:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705553488"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="705553488"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Feb 2023 01:00:25 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVqPo-00034j-11;
	Sat, 25 Feb 2023 09:00:24 +0000
Date: Sat, 25 Feb 2023 16:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 96/371]
 usr/include/asm/kvm.h:599:22: warning: field 'cpuid' with variable sized
 type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
 extension
Message-ID: <202302251624.OjWYzg5D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   236af3da84d067f3af446ccf2211937cd9ddc42f
commit: b50c9426e0960726923c64ee3c6ead344f6f2c76 [96/371] KVM: TDX: initialize VM with TDX specific parameters
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230225/202302251624.OjWYzg5D-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/b50c9426e0960726923c64ee3c6ead344f6f2c76
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b50c9426e0960726923c64ee3c6ead344f6f2c76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251624.OjWYzg5D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/asm/kvm_perf.h:7:
>> usr/include/asm/kvm.h:599:22: warning: field 'cpuid' with variable sized type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                           struct kvm_cpuid2 cpuid;
                                             ^
   1 warning generated.
--
   In file included from <built-in>:1:
>> ./usr/include/asm/kvm.h:599:22: warning: field 'cpuid' with variable sized type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                           struct kvm_cpuid2 cpuid;
                                             ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
