Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14EB37E;
	Tue,  7 Mar 2023 01:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678151928; x=1709687928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4NpBUGGUQePL6GJjj8k/fr2bug027Z96fb8yh1szO8=;
  b=I7Xbl5soiO5ua4k0nXct6xqgiI3q2DIEL/Px60j4LZO1wzT5hWRaFXUJ
   PuEEMwZFGyjcCysiL6HzkGz/5lGnQdb633waLRPZWAlyAsxBez5iEFNJ+
   +d/bAogODztymEDad0cMocx9AAE9qoTVJ0860SuKwWimkHhOMDilXo12z
   rWzZocVO9JgYwQooH5PAWcvkxquxqJ5o84NZ9oFM+kIxR+4w/h2cgH+XN
   3cl0F5Ofx0adIvLkctOnwFra4YAWFyaO4kbiisxLqdfpOK0sLkkjRXMTK
   +4VR7aqTRwSglCrDTAmoCRFNKCIH/a9T8B2C8/EMm86Snu6myl38ZfAoE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333199794"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="333199794"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 17:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="626354777"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="626354777"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Mar 2023 17:18:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZLyX-0000qD-02;
	Tue, 07 Mar 2023 01:18:45 +0000
Date: Tue, 7 Mar 2023 09:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dionna Glaze <dionnaglaze@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [ammarfaizi2-block:bp/bp/tip-x86-sev 11/11]
 arch/x86/include/asm/sev.h:222:93: warning: declaration of 'struct
 snp_guest_request_ioctl' will not be visible outside of this function
Message-ID: <202303070918.kuo2MJGH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block bp/bp/tip-x86-sev
head:   9bda6a75b659d5b34bff06c22afee2b9b21d1146
commit: 9bda6a75b659d5b34bff06c22afee2b9b21d1146 [11/11] x86/sev: Change snp_guest_issue_request()'s fw_err argument
config: i386-randconfig-a013-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070918.kuo2MJGH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/9bda6a75b659d5b34bff06c22afee2b9b21d1146
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block bp/bp/tip-x86-sev
        git checkout 9bda6a75b659d5b34bff06c22afee2b9b21d1146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/cpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070918.kuo2MJGH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/common.c:64:
>> arch/x86/include/asm/sev.h:222:93: warning: declaration of 'struct snp_guest_request_ioctl' will not be visible outside of this function [-Wvisibility]
   static inline int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio)
                                                                                               ^
   1 warning generated.


vim +222 arch/x86/include/asm/sev.h

   190	
   191	void setup_ghcb(void);
   192	void __init early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr,
   193						 unsigned int npages);
   194	void __init early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr,
   195						unsigned int npages);
   196	void __init snp_prep_memory(unsigned long paddr, unsigned int sz, enum psc_op op);
   197	void snp_set_memory_shared(unsigned long vaddr, unsigned int npages);
   198	void snp_set_memory_private(unsigned long vaddr, unsigned int npages);
   199	void snp_set_wakeup_secondary_cpu(void);
   200	bool snp_init(struct boot_params *bp);
   201	void __init __noreturn snp_abort(void);
   202	int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio);
   203	#else
   204	static inline void sev_es_ist_enter(struct pt_regs *regs) { }
   205	static inline void sev_es_ist_exit(void) { }
   206	static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
   207	static inline void sev_es_nmi_complete(void) { }
   208	static inline int sev_es_efi_map_ghcbs(pgd_t *pgd) { return 0; }
   209	static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate) { return 0; }
   210	static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long attrs) { return 0; }
   211	static inline void setup_ghcb(void) { }
   212	static inline void __init
   213	early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr, unsigned int npages) { }
   214	static inline void __init
   215	early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr, unsigned int npages) { }
   216	static inline void __init snp_prep_memory(unsigned long paddr, unsigned int sz, enum psc_op op) { }
   217	static inline void snp_set_memory_shared(unsigned long vaddr, unsigned int npages) { }
   218	static inline void snp_set_memory_private(unsigned long vaddr, unsigned int npages) { }
   219	static inline void snp_set_wakeup_secondary_cpu(void) { }
   220	static inline bool snp_init(struct boot_params *bp) { return false; }
   221	static inline void snp_abort(void) { }
 > 222	static inline int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio)
   223	{
   224		return -ENOTTY;
   225	}
   226	#endif
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
