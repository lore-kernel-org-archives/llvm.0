Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA9B15C4;
	Tue, 14 Feb 2023 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676339515; x=1707875515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTDhDipQPxyEctilq5zMdiTVvIQPhSXO8WlX9brIpnM=;
  b=ndTWbecaU+DRzSWvarD2NPYIyDYsIuAqB3y/NokD3iNvaj9IwD/N5eGp
   5K5eSqNUGpeb214A0Lnu1Ig+pVp7kyz4u34ZM0lTv9buBjIzBGi9Vc400
   z7qOtMm68KO8zbOCfgXmELOFlZRw0WhPMP4r0Ck8ztx8hplPwvDDRolty
   3rPPoyimEyX0i+RoiePiH75nDP1aS24p3xDMdJcrBkH+4qcTDK1NPSIWs
   nnMl2qkK3dk0XaixBltG5qta7d+98oQ4pvU9oy2ZjJnCPyt6TS+h7AAro
   itq/ZVMblXEDzSL/PXTQxe1p3ZObxgwfCzs73krZHRQFRvaYxaWmNLgCC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="311412056"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="311412056"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 17:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811823507"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="811823507"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2023 17:51:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRkU0-00087n-2R;
	Tue, 14 Feb 2023 01:51:48 +0000
Date: Tue, 14 Feb 2023 09:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Borislav Petkov <bp@suse.de>,
	Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
	Ben Hutchings <bwh@kernel.org>
Subject: [stable:linux-5.4.y 5560/7282] ld.lld: error:
 arch/x86/kvm/vmx/evmcs.o: contains a compressed section, but zlib is not
 available
Message-ID: <202302140915.yElUFeEX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   59342376e8f0c704299dc7a2c14fed07ffb962e2
commit: 5895a9297e609363ba4003c9d5839c967b237389 [5560/7282] KVM: VMX: Flatten __vmx_vcpu_run()
config: x86_64-randconfig-a004-20230213 (https://download.01.org/0day-ci/archive/20230214/202302140915.yElUFeEX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=5895a9297e609363ba4003c9d5839c967b237389
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 5895a9297e609363ba4003c9d5839c967b237389
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140915.yElUFeEX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: arch/x86/kvm/vmx/vmx.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmx.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmx.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmx.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmx.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmx.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmx.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmenter.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/pmu_intel.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/pmu_intel.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/pmu_intel.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/pmu_intel.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/pmu_intel.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/pmu_intel.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/pmu_intel.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmcs12.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmcs12.o: contains a compressed section, but zlib is not available
   ld.lld: error: arch/x86/kvm/vmx/vmcs12.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/kvm/vmx/evmcs.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/kvm/vmx/evmcs.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
