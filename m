Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5007384;
	Wed, 12 Jul 2023 22:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689201136; x=1720737136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EHpR9hLqQ1RirOOyLZTkAXDO8289cdrnJuBn3G8w9T4=;
  b=ljVHeDaVZyZUeoE1eMUThrvhUXlw2FRjL772UpsJ2VOnDVilGOdoUjsb
   xkFYUZCWTBCGywBgJMHqXWEmKvmrW4OuRDIj/gn14u6F5jevV5j/isvkP
   gLSp76L7fq79ct+LgE9zICqabn5L+1h5RIaErZTVvxvKKrfZVz4t2DlQR
   1LnTPHKk2fy3lpPW+tlcpXXBY6LYEgjD6qchtdmtna/gEdYEG3W+triEx
   2UfC+RrrA1bGH4u8+RNmljrt0erVmqymFSMHnBoJp6NtGUX1Fhv1QuZs3
   eWszi/X2Du8YXrwPXWI2F0AyHrBEf1/nqyZsuZz3o8gvSWD0ekspwr3hU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395824635"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="395824635"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 15:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="791772493"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="791772493"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 15:32:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJiNT-00061R-2s;
	Wed, 12 Jul 2023 22:32:07 +0000
Date: Thu, 13 Jul 2023 06:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bobrik:ivan/audit-bitmap 1/1] include/linux/audit.h:595:32: error:
 use of undeclared identifier 'NR_syscalls'
Message-ID: <202307130633.42OnTSb0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bobrik/linux ivan/audit-bitmap
head:   e0fb84ed26c0b014ac537368d3de5f398f2d2620
commit: e0fb84ed26c0b014ac537368d3de5f398f2d2620 [1/1] audit: check syscall bitmap on entry to avoid extra work
config: riscv-randconfig-r026-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130633.42OnTSb0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130633.42OnTSb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130633.42OnTSb0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/auditfilter.c:12:
>> include/linux/audit.h:595:32: error: use of undeclared identifier 'NR_syscalls'
   extern int audit_syscall_rules[NR_syscalls];
                                  ^
   include/linux/audit.h:596:46: error: use of undeclared identifier 'NR_syscalls'
   extern DECLARE_BITMAP(audit_syscalls_bitmap, NR_syscalls);
                                                ^
   2 errors generated.
--
   In file included from security/commoncap.c:6:
>> include/linux/audit.h:595:32: error: use of undeclared identifier 'NR_syscalls'
   extern int audit_syscall_rules[NR_syscalls];
                                  ^
   include/linux/audit.h:596:46: error: use of undeclared identifier 'NR_syscalls'
   extern DECLARE_BITMAP(audit_syscalls_bitmap, NR_syscalls);
                                                ^
   In file included from security/commoncap.c:12:
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/NR_syscalls +595 include/linux/audit.h

   593	
   594	extern int audit_n_syscall_rules;
 > 595	extern int audit_syscall_rules[NR_syscalls];
   596	extern DECLARE_BITMAP(audit_syscalls_bitmap, NR_syscalls);
   597	#else /* CONFIG_AUDITSYSCALL */
   598	static inline int audit_alloc(struct task_struct *task)
   599	{
   600		return 0;
   601	}
   602	static inline void audit_free(struct task_struct *task)
   603	{ }
   604	static inline void audit_uring_entry(u8 op)
   605	{ }
   606	static inline void audit_uring_exit(int success, long code)
   607	{ }
   608	static inline void audit_syscall_entry(int major, unsigned long a0,
   609					       unsigned long a1, unsigned long a2,
   610					       unsigned long a3)
   611	{ }
   612	static inline void audit_syscall_exit(void *pt_regs)
   613	{ }
   614	static inline bool audit_dummy_context(void)
   615	{
   616		return true;
   617	}
   618	static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
   619	{ }
   620	static inline struct audit_context *audit_context(void)
   621	{
   622		return NULL;
   623	}
   624	static inline struct filename *audit_reusename(const __user char *name)
   625	{
   626		return NULL;
   627	}
   628	static inline void audit_getname(struct filename *name)
   629	{ }
   630	static inline void audit_inode(struct filename *name,
   631					const struct dentry *dentry,
   632					unsigned int aflags)
   633	{ }
   634	static inline void audit_file(struct file *file)
   635	{
   636	}
   637	static inline void audit_inode_parent_hidden(struct filename *name,
   638					const struct dentry *dentry)
   639	{ }
   640	static inline void audit_inode_child(struct inode *parent,
   641					     const struct dentry *dentry,
   642					     const unsigned char type)
   643	{ }
   644	static inline void audit_core_dumps(long signr)
   645	{ }
   646	static inline void audit_seccomp(unsigned long syscall, long signr, int code)
   647	{ }
   648	static inline void audit_seccomp_actions_logged(const char *names,
   649							const char *old_names, int res)
   650	{ }
   651	static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
   652	{ }
   653	static inline void audit_ipc_set_perm(unsigned long qbytes, uid_t uid,
   654						gid_t gid, umode_t mode)
   655	{ }
   656	static inline void audit_bprm(struct linux_binprm *bprm)
   657	{ }
   658	static inline int audit_socketcall(int nargs, unsigned long *args)
   659	{
   660		return 0;
   661	}
   662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
