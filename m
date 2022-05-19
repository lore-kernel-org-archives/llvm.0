Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FA31FB8
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 02:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652928166; x=1684464166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6xV8ekPzx3Yt2dpmJfC+atg0RJvwErhgJl3h4CHsSg=;
  b=JJBkSGywY02q4Oa9e7mvgWh1DbVJqrAvs1BSxABhtKt8E4ti8j0AmIc4
   w4I9JpRIj0nU8C8+NytoQcU7tOuwjLs343V5NhzgcrSDSB/yFgHKEXczG
   Zry6GAzvcN0Bbw3zcgJSRoQlbErSIjYRjoDPFGVWrnXLtIRcFoUexbIac
   P1mY9oQH76hTO8UZc4XfbQAdcfTq1BNRuq4D0GZP3XMjdidO74iRzYRjx
   G6vk+3LbWFQeTw3yFeXUfA5qaikfkVzm5c6CuSCuwMy5xSTRKCqV0H7dg
   DL4sGvS4lKeZzfvFG7TrSIKTguDsdX1ZxGg8EelULsdsYH88tw3MY1S+3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="271941854"
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; 
   d="scan'208";a="271941854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 19:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; 
   d="scan'208";a="545836026"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 May 2022 19:42:44 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrW7f-0002xn-4X;
	Thu, 19 May 2022 02:42:43 +0000
Date: Thu, 19 May 2022 10:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Uros Bizjak <ubizjak@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: VMX: Use try_cmpxchg64 in pi_try_set_control
Message-ID: <202205191028.PcCtw7Xz-lkp@intel.com>
References: <20220518134550.2358-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518134550.2358-1-ubizjak@gmail.com>

Hi Uros,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kvm/master]
[also build test ERROR on mst-vhost/linux-next linux/master linus/master v5.18-rc7 next-20220518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/KVM-VMX-Use-try_cmpxchg64-in-pi_try_set_control/20220518-214709
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git master
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220519/202205191028.PcCtw7Xz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2af4f7c4ecfcaedf9b98ba30ee508dc0d9002955
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uros-Bizjak/KVM-VMX-Use-try_cmpxchg64-in-pi_try_set_control/20220518-214709
        git checkout 2af4f7c4ecfcaedf9b98ba30ee508dc0d9002955
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/posted_intr.c:45:7: error: call to undeclared function 'try_cmpxchg64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!try_cmpxchg64(&pi_desc->control, pold, new))
                ^
   arch/x86/kvm/vmx/posted_intr.c:45:7: note: did you mean '__cmpxchg64'?
   arch/x86/include/asm/cmpxchg_32.h:47:19: note: '__cmpxchg64' declared here
   static inline u64 __cmpxchg64(volatile u64 *ptr, u64 old, u64 new)
                     ^
   1 error generated.


vim +/try_cmpxchg64 +45 arch/x86/kvm/vmx/posted_intr.c

    36	
    37	static int pi_try_set_control(struct pi_desc *pi_desc, u64 *pold, u64 new)
    38	{
    39		/*
    40		 * PID.ON can be set at any time by a different vCPU or by hardware,
    41		 * e.g. a device.  PID.control must be written atomically, and the
    42		 * update must be retried with a fresh snapshot an ON change causes
    43		 * the cmpxchg to fail.
    44		 */
  > 45		if (!try_cmpxchg64(&pi_desc->control, pold, new))
    46			return -EBUSY;
    47	
    48		return 0;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
