Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0BEA2;
	Sat, 12 Aug 2023 00:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691801520; x=1723337520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T9Daikl/u2ztX3eAdSfiNU9UYztQtRvgl1jmh5MBy9c=;
  b=ZYbnQo50404GipztWdkGXfqpXZQTol1kNO0/zzXSuloGh9hiauAgvnG4
   Q37x4aiIdvdbowdgHvTI/bkYizCEJDn2fPf2Bv+cgZM1T4DDpEcNI/wWS
   3pQqlnPPaVuytRPjLPcy48zhUopNWbuW1CiJ7LAs1Q04c1a4nd7SGRLwk
   pBZ1FD3IVA9eycpc9Kv28Omr5sUAn+Ho1ByRta2T2uxPIMqeUWDkvpouk
   +aLC3k3rP8OF/sTnn5m0fvlTpmAw6JDCTxGkdFgQageQJAjUGvytM1UPT
   baHSDJTmlnxUWTTtwIe2z9+A6EGXBMj4EowFwcEtuoellJyx1DoDTCJtZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438123417"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="438123417"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 17:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735936589"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="735936589"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2023 17:51:56 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUcrD-00089h-2E;
	Sat, 12 Aug 2023 00:51:55 +0000
Date: Sat, 12 Aug 2023 08:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nikunj A Dadhania <nikunj@amd.com>, kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nikunj A Dadhania <nikunj@amd.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH] KVM: SVM: Add exception to disable objtool warning for
 kvm-amd.o
Message-ID: <202308120845.gkEMVH5a-lkp@intel.com>
References: <20230802091107.1160320-1-nikunj@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802091107.1160320-1-nikunj@amd.com>

Hi Nikunj,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on mst-vhost/linux-next linus/master v6.5-rc5 next-20230809]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikunj-A-Dadhania/KVM-SVM-Add-exception-to-disable-objtool-warning-for-kvm-amd-o/20230802-171219
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230802091107.1160320-1-nikunj%40amd.com
patch subject: [PATCH] KVM: SVM: Add exception to disable objtool warning for kvm-amd.o
config: i386-randconfig-i013-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120845.gkEMVH5a-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120845.gkEMVH5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120845.gkEMVH5a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/vmenter.S:392:1: error: invalid instruction mnemonic 'stack_frame_non_standard_fp'
   STACK_FRAME_NON_STANDARD_FP(__svm_sev_es_vcpu_run)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/stack_frame_non_standard_fp +392 arch/x86/kvm/svm/vmenter.S

   352	
   353		/* Clobbers RAX, RCX, RDX.  */
   354		RESTORE_HOST_SPEC_CTRL
   355	
   356		/*
   357		 * Mitigate RETBleed for AMD/Hygon Zen uarch. RET should be
   358		 * untrained as soon as we exit the VM and are back to the
   359		 * kernel. This should be done before re-enabling interrupts
   360		 * because interrupt handlers won't sanitize RET if the return is
   361		 * from the kernel.
   362		 */
   363		UNTRAIN_RET
   364	
   365		/* "Pop" @spec_ctrl_intercepted.  */
   366		pop %_ASM_BX
   367	
   368		pop %_ASM_BX
   369	
   370	#ifdef CONFIG_X86_64
   371		pop %r12
   372		pop %r13
   373		pop %r14
   374		pop %r15
   375	#else
   376		pop %esi
   377		pop %edi
   378	#endif
   379		pop %_ASM_BP
   380		RET
   381	
   382		RESTORE_GUEST_SPEC_CTRL_BODY
   383		RESTORE_HOST_SPEC_CTRL_BODY
   384	
   385	3:	cmpb $0, kvm_rebooting
   386		jne 2b
   387		ud2
   388	
   389		_ASM_EXTABLE(1b, 3b)
   390	
   391	SYM_FUNC_END(__svm_sev_es_vcpu_run)
 > 392	STACK_FRAME_NON_STANDARD_FP(__svm_sev_es_vcpu_run)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
