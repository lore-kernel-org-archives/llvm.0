Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EEC4634
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 23:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645139541; x=1676675541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4drnSv8QYVuvNNyAm9hEzkUtF2mEcKzJVJkuUi0eOEk=;
  b=To6ABOyqRM2LIdzIxyv8/+x27D8bsgICjrW3iEch1zpm9ucOOZt7ZI0O
   8LNOssU/rF6Tm4GpwsFrzk3KK1RzTn5rTVpShMpBvWY/QvaB3mGx8RKXo
   kGcTcgK2jI8OrEYpfI40HtUGMRWxQ6quHoGnCUK7JxQujsw6PKtHo4N3W
   Yyv89oF4xez1n1H5/SqRQKmcywYpDuN0wLV6pKFa8aSh1qYDz87Aic4JE
   8oyAaiDxRp8mCZqV8U6Mk2JnGkgv2utkYN+SMRgp4GxjVo7wVuQ93I1Jn
   sJVFG2y7vbl5Mtq2wt6/heMKjuWLIzdTD/GMY/DGhWKa5KxlPwpakf982
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250942201"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="250942201"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 15:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="503749843"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Feb 2022 15:12:06 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKpwT-0000is-Om; Thu, 17 Feb 2022 23:12:05 +0000
Date: Fri, 18 Feb 2022 07:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [kvm:master 22/22] arch/x86/kvm/x86.c:992:19: error: unused function
 'kvm_guest_supported_xfd'
Message-ID: <202202180700.dnGoHs4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git master
head:   988896bb61827345c6d074dd5f2af1b7b008193f
commit: 988896bb61827345c6d074dd5f2af1b7b008193f [22/22] x86/kvm/fpu: Remove kvm_vcpu_arch.guest_supported_xcr0
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220218/202202180700.dnGoHs4Z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=988896bb61827345c6d074dd5f2af1b7b008193f
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm master
        git checkout 988896bb61827345c6d074dd5f2af1b7b008193f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:992:19: error: unused function 'kvm_guest_supported_xfd' [-Werror,-Wunused-function]
   static inline u64 kvm_guest_supported_xfd(struct kvm_vcpu *vcpu)
                     ^
   arch/x86/kvm/x86.c:2364:19: error: unused function 'gtod_is_based_on_tsc' [-Werror,-Wunused-function]
   static inline int gtod_is_based_on_tsc(int mode)
                     ^
   2 errors generated.


vim +/kvm_guest_supported_xfd +992 arch/x86/kvm/x86.c

   991	
 > 992	static inline u64 kvm_guest_supported_xfd(struct kvm_vcpu *vcpu)
   993	{
   994		return kvm_guest_supported_xcr0(vcpu) & XFEATURE_MASK_USER_DYNAMIC;
   995	}
   996	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
