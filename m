Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBE47F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 01:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651543035; x=1683079035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NyefZZ9y7G7xrqWCgPttv9WeU8zvIUfo/AfMX+3Wl2k=;
  b=LJoiMfDnrqGBm1+0a4pLBbzP9F30gDv5AK98kyL+KvDhqmLQUpcsFTmH
   pQufyyaHp3t9yJmvM64jS4Z6Sz1G+ZiAz/T6RauiuBMHMrIoMnhIKoWtB
   J8gm8RKPF48nrHGMrv8XXuh418Em0uHKlrftHNyx/b0nJ6dZPSFnLZNKk
   GLFZZ0cE6z0ASyvjWnxOaRpLKPYau6HYE+cOAXzuiusZhUpELdw5GwO3J
   kJQP7TmzpgmrIY+g0g8WHygDqNsxuu+7EMDk6z2nq91dq/0TItM5Iyyw7
   jsrYwoG6BoPK5dLHQK4WQz8MkE/OK3V9P8hwX0agfNJMQz55imwrETWMA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266223139"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; 
   d="scan'208";a="266223139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 18:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; 
   d="scan'208";a="620156274"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 May 2022 18:57:13 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlhmq-000A3h-Gz;
	Tue, 03 May 2022 01:57:12 +0000
Date: Tue, 3 May 2022 09:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Zeng Guang <guang.zeng@intel.com>
Subject: [kvm:queue 74/77] arch/x86/kvm/vmx/vmx.c:4405:5: error: no previous
 prototype for function 'vmx_get_pid_table_order'
Message-ID: <202205030944.BOEY0IuK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   2764011106d0436cb44702cfb0981339d68c3509
commit: 101c99f6506d7fc293111190d65fedadb711c9ea [74/77] KVM: VMX: enable IPI virtualization
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220503/202205030944.BOEY0IuK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=101c99f6506d7fc293111190d65fedadb711c9ea
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm queue
        git checkout 101c99f6506d7fc293111190d65fedadb711c9ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:4405:5: error: no previous prototype for function 'vmx_get_pid_table_order' [-Werror,-Wmissing-prototypes]
   int vmx_get_pid_table_order(struct kvm *kvm)
       ^
   arch/x86/kvm/vmx/vmx.c:4405:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vmx_get_pid_table_order(struct kvm *kvm)
   ^
   static 
   1 error generated.


vim +/vmx_get_pid_table_order +4405 arch/x86/kvm/vmx/vmx.c

  4404	
> 4405	int vmx_get_pid_table_order(struct kvm *kvm)
  4406	{
  4407		return get_order(kvm->arch.max_vcpu_ids * sizeof(*to_kvm_vmx(kvm)->pid_table));
  4408	}
  4409	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
