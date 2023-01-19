Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250AA93E;
	Thu, 19 Jan 2023 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674147789; x=1705683789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tb+2X4CHzKp5LNh1H+Of2aok4bomjhfO2l2hfHcLn0Q=;
  b=eNqsqx5bk3HPrQKvUSpJ5oSDZ35XqJY0U39geIVDgfS/s1kWGqHWUU7q
   odANBD+HXbVH11Yn/i+gb42tRAQS8UUMdTYXIbUkQjdMb8ZgZ2U9YfYz8
   M+COHXKif9ZVAXtOwvVnSQV/S0cKZ17Pxuc74twC7G5CoicKNCr/k62SH
   u5R8MEwQBuXzdWNOCuQGR+R3MuccBJQCBJxexIfzIFjqWNowkdcK+3A1G
   oSxggRAgg+c9bbKHPAaq8BOUSwTa4CrtGYW3q0LG5+AVlR+vSC/dFLKST
   4JEIto5w6FjhDDuLDLY9Hlkn4RhqbO4kLTJcnC+CKZ1ttvZ0DzDIeDjIp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352599748"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="352599748"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 09:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692495822"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="692495822"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2023 09:03:01 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIYJY-0001eu-1C;
	Thu, 19 Jan 2023 17:03:00 +0000
Date: Fri, 20 Jan 2023 01:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [intel-tdx:kvm-upstream 96/190] ./usr/include/asm/kvm.h:599:22:
 warning: field 'cpuid' with variable sized type 'struct kvm_cpuid2' not at
 the end of a struct or class is a GNU extension
Message-ID: <202301200137.cQZNeF30-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   6a57a45197c90b4d3fade588d2c49ab13ced5957
commit: a0b5c459cce27c83a1275a3108f810299635d217 [96/190] KVM: TDX: initialize VM with TDX specific parameters
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230120/202301200137.cQZNeF30-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/a0b5c459cce27c83a1275a3108f810299635d217
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout a0b5c459cce27c83a1275a3108f810299635d217
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/asm/kvm.h:599:22: warning: field 'cpuid' with variable sized type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                           struct kvm_cpuid2 cpuid;
                                             ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
