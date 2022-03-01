Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7303D7A
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 00:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646095548; x=1677631548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LjvKYA9/yqf6RtfttTlZpEZ4pxfMp3PDIxsCWp/430o=;
  b=IAHtgS7qy9iqzRCBxCg/YcCCd1uGbtm+Sjb2KebT78SZsKf0Ci3P4JWg
   lyTJyQORP4uFkMfsrfJZZisTEwjA9Ar1hJbIVUNcZcGdkgZgxuTxNH+3t
   3m6/v1f2Pjnq3Tl9kY/MD42xoLjEXqWia+fB5FS7MJgxFJpHoEUhjIztd
   M/Z6bnDohctKBcxdVoCT72XrG2EQNSCtMC57KjUK80lpsP06SBmWZ8+Ux
   XOoxjZYSFvLhd7lxkUG2xd+RybC2C54AguoV1UXVNUa0AvIIr315XEvfN
   Hjh1jGtwXoJcqgRwhAEDIXsNeU3pDKkeKLUY3iHVnGZLHcCLiX+iCHbWc
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="277686292"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="277686292"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 16:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="708861501"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Feb 2022 16:45:38 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOqe1-0007wd-T0; Tue, 01 Mar 2022 00:45:37 +0000
Date: Tue, 1 Mar 2022 08:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Metin Kaya <metikaya@amazon.co.uk>,
	Paul Durrant <pdurrant@amazon.co.uk>
Subject: Re: [PATCH v2 12/17] KVM: x86/xen: handle PV timers oneshot mode
Message-ID: <202203010834.0rk7I4n5-lkp@intel.com>
References: <20220228200552.150406-13-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228200552.150406-13-dwmw2@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvm/master]
[also build test WARNING on v5.17-rc6 next-20220228]
[cannot apply to mst-vhost/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Woodhouse/KVM-Add-Xen-event-channel-acceleration/20220301-040936
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git master
config: i386-randconfig-a004-20220228 (https://download.01.org/0day-ci/archive/20220301/202203010834.0rk7I4n5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9e28d0cae6d7075379c9afdd36f014227c6a7553
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Woodhouse/KVM-Add-Xen-event-channel-acceleration/20220301-040936
        git checkout 9e28d0cae6d7075379c9afdd36f014227c6a7553
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/xen.c:183:6: warning: no previous prototype for function 'kvm_xen_init_timer' [-Wmissing-prototypes]
   void kvm_xen_init_timer(struct kvm_vcpu *vcpu)
        ^
   arch/x86/kvm/xen.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_xen_init_timer(struct kvm_vcpu *vcpu)
   ^
   static 
>> arch/x86/kvm/xen.c:1030:41: warning: shift count >= width of type [-Wshift-count-overflow]
                                (delta > 0 && (uint32_t) (delta >> 50) != 0))) {
                                                                ^  ~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   2 warnings generated.


vim +/kvm_xen_init_timer +183 arch/x86/kvm/xen.c

   182	
 > 183	void kvm_xen_init_timer(struct kvm_vcpu *vcpu)
   184	{
   185		hrtimer_init(&vcpu->arch.xen.timer, CLOCK_MONOTONIC,
   186			     HRTIMER_MODE_ABS_PINNED);
   187		vcpu->arch.xen.timer.function = xen_timer_callback;
   188	}
   189	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
