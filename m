Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C7C2C80
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650657494; x=1682193494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=khxBa9ANLkANHc/Zo28EzKs8RaABxYVq6PMhf/+H9ok=;
  b=ZiOeOGWNdeG4XMTRNIkZyMzdjlR3A/LY2wwD63EwR0Oc30IVXtOSCtb2
   arTS6YlGW+RX6oMed/f59t6c5m0pfyLyqrVPr2T/1+x5jnHIZLajSbFAm
   Sd/7+yFavgQ/WoUoAce3PFR1ZQMemp1ISo9d3nJtX0hXMtF1zgXkApm83
   rXELJy/I6IijN6TcO2pDeihtqqOO+oMG6zl6oiVoZcn5kmAehYa4RwXkg
   /cYby9/3G78XCA1yes5Iz/IG/WWiahguXNbzjQhZ55vfNwEHaXc6wA5zG
   PlfuoFyGBFXw7ROuDUAY3I4l1vnqZrBKIf2y/IT8ZiNBamlfqsQ2EkUc7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351221324"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="351221324"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 12:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="511718007"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Apr 2022 12:58:11 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhzPu-000AXl-M5;
	Fri, 22 Apr 2022 19:58:10 +0000
Date: Sat, 23 Apr 2022 03:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Peter Gonda <pgonda@google.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH for-5.18] KVM: fix bad user ABI for KVM_EXIT_SYSTEM_EVENT
Message-ID: <202204230312.8EOM8DHM-lkp@intel.com>
References: <20220422103013.34832-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422103013.34832-1-pbonzini@redhat.com>

Hi Paolo,

I love your patch! Yet something to improve:

[auto build test ERROR on kvm/master]
[also build test ERROR on linus/master v5.18-rc3]
[cannot apply to kvmarm/next mst-vhost/linux-next linux/master next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-fix-bad-user-ABI-for-KVM_EXIT_SYSTEM_EVENT/20220422-184535
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git master
config: riscv-randconfig-r014-20220422 (https://download.01.org/0day-ci/archive/20220423/202204230312.8EOM8DHM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/71af2c55b700878ad9d73c90c6b75f327f36d0a9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paolo-Bonzini/KVM-fix-bad-user-ABI-for-KVM_EXIT_SYSTEM_EVENT/20220422-184535
        git checkout 71af2c55b700878ad9d73c90c6b75f327f36d0a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_sbi.c:98:30: error: use of undeclared identifier 'reason'
           run->system_event.data[0] = reason;
                                       ^
   1 error generated.


vim +/reason +98 arch/riscv/kvm/vcpu_sbi.c

    83	
    84	void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
    85					     struct kvm_run *run,
    86					     u32 type, u64 flags)
    87	{
    88		unsigned long i;
    89		struct kvm_vcpu *tmp;
    90	
    91		kvm_for_each_vcpu(i, tmp, vcpu->kvm)
    92			tmp->arch.power_off = true;
    93		kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
    94	
    95		memset(&run->system_event, 0, sizeof(run->system_event));
    96		run->system_event.type = type;
    97		run->system_event.ndata = 1;
  > 98		run->system_event.data[0] = reason;
    99		run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
