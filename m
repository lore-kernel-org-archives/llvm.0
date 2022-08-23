Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2BA3B
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 07:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661238089; x=1692774089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZypyCjFzyTXB8yyU6iCIEXYn2kcxBHcOlnvkN2wxx4=;
  b=eSc3+ILwgq4DOioKBuTN2CtEf7+/HtHvn77kZymFm2DAqfYsAVfmnKOD
   HN6loQgUeBHAr6I0iGH54YCkvmRz7i9cTspSh3DsfN8UXVRN61XRI6mwH
   sUpNFQJG00cVYX1jPp0WsPSyxwMbACK26/V8IFj9AOhPUNm+i7+g0heFk
   G5zL0M9UQ0hsByzNhpL4bAwP5bnwmripKZbwc/ykDTh863P1A9xA7u+/6
   bkN1iV0U50QfICtkc5pQ36h0q/147h4r2CLubL9s3WTPQImVHZvPaO/rF
   y6j+xSthSSBX6mizAODi+q5BPWad4TzSJP8Z9yn7XV7DkpdD/uphTElws
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="319650028"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="319650028"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 00:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="735383095"
Received: from lkp-server01.sh.intel.com (HELO 5b31f6010e99) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Aug 2022 00:01:17 -0700
Received: from kbuild by 5b31f6010e99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQNuW-00009t-2k;
	Tue, 23 Aug 2022 07:01:16 +0000
Date: Tue, 23 Aug 2022 15:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 49/314]
 usr/include/asm/kvm.h:606:22: warning: field 'cpuid' with variable sized
 type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
 extension
Message-ID: <202208231439.fY8AdaYo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   552dd80c48f67ca01bcdd10667e0c11efd375177
commit: 1a5eb8b1aafbbb1015198bb2d2caf0e1a7557673 [49/314] KVM: TDX: initialize VM with TDX specific parameters
config: i386-randconfig-r031-20220822 (https://download.01.org/0day-ci/archive/20220823/202208231439.fY8AdaYo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/1a5eb8b1aafbbb1015198bb2d2caf0e1a7557673
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 1a5eb8b1aafbbb1015198bb2d2caf0e1a7557673
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/kvm.h:15:
>> usr/include/asm/kvm.h:606:22: warning: field 'cpuid' with variable sized type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                           struct kvm_cpuid2 cpuid;
                                             ^
   1 warning generated.
--
   In file included from <built-in>:1:
>> ./usr/include/asm/kvm.h:606:22: warning: field 'cpuid' with variable sized type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                           struct kvm_cpuid2 cpuid;
                                             ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
