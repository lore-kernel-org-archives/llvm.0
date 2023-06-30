Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC1D522E;
	Fri, 30 Jun 2023 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688107603; x=1719643603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=48q1NTvqt0qgKBQfVueuQcWYPjiExBBEJFG3i8T9p1k=;
  b=Xox8ql/i4LXN4fVcFO0qanb4MvY/ZuGY/IbkizKUmHnNuxZ2ODTj3aZu
   a8RoeK+QKL9dFUFZcWfNW56ZCM45xf1hoKFdICyviMx2+Js/oZAzXGOcc
   Y216jDZk4OiOMBt5z0P76yAtmQadHTbEgWaxV7wUNMQWQRok0icxFv3Gy
   qjxwYW1T6lD74YxUCCOUgLwQP6gu++oR8lqkzDlnX5XMYlQ3DG66ROZNr
   Ba00arLoIez0qsllW7XFIlVT67sRrvfDAzWCwX5bwmBS6n5YmNQhF+47O
   HzfNpHSV/VO0hTP3HPM4VQ8vQcFUffPIBlE/2H9boratJG/T8NW5uZ4kT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="365814575"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="365814575"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 23:45:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="717686999"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="717686999"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Jun 2023 23:45:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF7sa-000EmB-0I;
	Fri, 30 Jun 2023 06:45:16 +0000
Date: Fri, 30 Jun 2023 14:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: jeffxu@chromium.org, skhan@linuxfoundation.org, keescook@chromium.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, dmitry.torokhov@gmail.com,
	dverkamp@chromium.org, asmadeus@codewreck.org, hughd@google.com,
	jeffxu@google.com, jorgelo@chromium.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, jannh@google.com,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v1 1/2] mm/memfd: sysctl: fix
 MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED
Message-ID: <202306301413.VtwSCI1F-lkp@intel.com>
References: <20230630031721.623955-2-jeffxu@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630031721.623955-2-jeffxu@google.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/jeffxu-chromium-org/mm-memfd-sysctl-fix-MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED/20230630-111827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230630031721.623955-2-jeffxu%40google.com
patch subject: [PATCH v1 1/2] mm/memfd: sysctl: fix MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED
config: riscv-randconfig-r042-20230630 (https://download.01.org/0day-ci/archive/20230630/202306301413.VtwSCI1F-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301413.VtwSCI1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301413.VtwSCI1F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memfd.c:273:15: error: use of undeclared identifier 'MEMFD_NOEXEC_SCOPE_EXEC'
     273 |         int sysctl = MEMFD_NOEXEC_SCOPE_EXEC;
         |                      ^
>> mm/memfd.c:311:17: error: use of undeclared identifier 'MEMFD_NOEXEC_SCOPE_NOEXEC_SEAL'
     311 |                 if (sysctl == MEMFD_NOEXEC_SCOPE_NOEXEC_SEAL)
         |                               ^
>> mm/memfd.c:321:36: error: use of undeclared identifier 'MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED'
     321 |         if (flags & MFD_EXEC && sysctl >= MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED) {
         |                                           ^
   3 errors generated.


vim +/MEMFD_NOEXEC_SCOPE_EXEC +273 mm/memfd.c

   270	
   271	static int sysctl_memfd_noexec(void)
   272	{
 > 273		int sysctl = MEMFD_NOEXEC_SCOPE_EXEC;
   274	#ifdef CONFIG_SYSCTL
   275		struct pid_namespace *ns;
   276	
   277		ns = task_active_pid_ns(current);
   278		if (ns)
   279			sysctl = ns->memfd_noexec_scope;
   280	#endif
   281		return sysctl;
   282	}
   283	
   284	SYSCALL_DEFINE2(memfd_create,
   285			const char __user *, uname,
   286			unsigned int, flags)
   287	{
   288		char comm[TASK_COMM_LEN];
   289		unsigned int *file_seals;
   290		struct file *file;
   291		int fd, error;
   292		char *name;
   293		long len;
   294		int sysctl = sysctl_memfd_noexec();
   295	
   296		if (!(flags & MFD_HUGETLB)) {
   297			if (flags & ~(unsigned int)MFD_ALL_FLAGS)
   298				return -EINVAL;
   299		} else {
   300			/* Allow huge page size encoding in flags. */
   301			if (flags & ~(unsigned int)(MFD_ALL_FLAGS |
   302					(MFD_HUGE_MASK << MFD_HUGE_SHIFT)))
   303				return -EINVAL;
   304		}
   305	
   306		/* Invalid if both EXEC and NOEXEC_SEAL are set.*/
   307		if ((flags & MFD_EXEC) && (flags & MFD_NOEXEC_SEAL))
   308			return -EINVAL;
   309	
   310		if (!(flags & (MFD_EXEC | MFD_NOEXEC_SEAL))) {
 > 311			if (sysctl == MEMFD_NOEXEC_SCOPE_NOEXEC_SEAL)
   312				flags |= MFD_NOEXEC_SEAL;
   313			else
   314				flags |= MFD_EXEC;
   315	
   316			pr_warn_once(
   317				"memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=%d '%s'\n",
   318				task_pid_nr(current), get_task_comm(comm, current));
   319		}
   320	
 > 321		if (flags & MFD_EXEC && sysctl >= MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
