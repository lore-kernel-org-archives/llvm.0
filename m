Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453EF10EB
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 05:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653544797; x=1685080797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FoFi6ee/Unw0akjPodAajaS59MNcAC8Hemf/HS8pGgc=;
  b=YC0cb3bm0Rmz7EI02YGxeOsrWgCUoXBzJPtVNp+/arhhZoM2NK1Mu8eL
   tKsIbntLzSbvf/1Ep25qc5d7AFK/L+RNoOAMcWEgpB7gu6vQ0O7F3d491
   U7P8tlAD+e7JHqTQyVZVnXgbWb5n96pa7yLyQ6jmgCkaY2v1sKJ3lg2WA
   9zkWoUA4rHGk9UEvrXYK4HSWaSgUIrGIlT5o699xdUZ1EqFgnqVJklOXu
   85KurcjC7xEr0qU5kTqVC1Dw/dZJdrTJl76hTWyvsRX38ScJVpZxnT5Ro
   FNFbiLOFgSvVnWB19wD3GixJa4mFeljARpkhFhS7cTqwtVRC0MIt3u3E0
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="254544419"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="254544419"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 22:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="821079105"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 May 2022 22:59:52 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nu6XH-0003e8-NG;
	Thu, 26 May 2022 05:59:51 +0000
Date: Thu, 26 May 2022 13:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Zeng Guang <guang.zeng@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [intel-tdx:kvm-upstream-workaround 99/435]
 arch/x86/kvm/vmx/vmx.c:4410:5: error: no previous prototype for function
 'vmx_get_pid_table_order'
Message-ID: <202205261324.RC40VHb7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   0075383344a9c2bfaba7cca988c85008d92c4f8c
commit: 7325e60f0f39b6cffcc23ec74910cf0ec5ac1412 [99/435] KVM: VMX: enable IPI virtualization
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220526/202205261324.RC40VHb7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3d546191ad9d7d2ad2c7928204b9de51deafa675)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/7325e60f0f39b6cffcc23ec74910cf0ec5ac1412
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 7325e60f0f39b6cffcc23ec74910cf0ec5ac1412
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the intel-tdx/kvm-upstream-workaround HEAD 0075383344a9c2bfaba7cca988c85008d92c4f8c builds fine.
      It only hurts bisectability.

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
