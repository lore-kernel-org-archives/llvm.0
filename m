Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F957F
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 00:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651795872; x=1683331872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDsnw3ASTnR8ThsfVBTdSrYjKJCXtE4HRyK2jWA9t1s=;
  b=K1Iu71Ggz2xxVpRg1du8fYPm3cwK4jof4vDob2kVE2NpCJ7t2xHcDQoj
   RvVt65O1Bq4RA/TPHeXeJSLRBWnftgEQyVyyalBhD5nYI+460yLITC/C1
   IX8kzinmdcNhUhdZUIKH+fM0+mh7K3TvtISOYX2U9tyxGvoMu5365pE1X
   dj89mMQozGEGnPIiCh3B0gY6BkMu61DaZ01aPNQQSgxL1hzpbx2Ex1HZP
   6N/fVoA9tOEq+eLCTrrguYaXmcm5sZF9IeZ3+TH7dn3PCBR4d9kNFSVKO
   OV+6DRLmUSSieyElsbiTp795p62lAH21Q1/Kx1NwvNdXfb/gD89IgYfMm
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="250287128"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="250287128"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 17:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="585649802"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 May 2022 17:11:10 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmlYr-000Cru-GR;
	Fri, 06 May 2022 00:11:09 +0000
Date: Fri, 6 May 2022 08:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Zeng Guang <guang.zeng@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [intel-tdx:kvm-upstream-workaround 99/361]
 arch/x86/kvm/vmx/vmx.c:4410:5: error: no previous prototype for function
 'vmx_get_pid_table_order'
Message-ID: <202205060807.LvZYGFIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3b5b338cdf10dca7a2435d1f86b2dd9f1a3ad833
commit: 833404c859e4357ba656b2d19d5a405ba7bf4ec4 [99/361] KVM: VMX: enable IPI virtualization
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220506/202205060807.LvZYGFIP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/833404c859e4357ba656b2d19d5a405ba7bf4ec4
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 833404c859e4357ba656b2d19d5a405ba7bf4ec4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:4410:5: error: no previous prototype for function 'vmx_get_pid_table_order' [-Werror,-Wmissing-prototypes]
   int vmx_get_pid_table_order(struct kvm *kvm)
       ^
   arch/x86/kvm/vmx/vmx.c:4410:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vmx_get_pid_table_order(struct kvm *kvm)
   ^
   static 
   1 error generated.


vim +/vmx_get_pid_table_order +4410 arch/x86/kvm/vmx/vmx.c

  4409	
> 4410	int vmx_get_pid_table_order(struct kvm *kvm)
  4411	{
  4412		return get_order(kvm->arch.max_vcpu_ids * sizeof(*to_kvm_vmx(kvm)->pid_table));
  4413	}
  4414	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
