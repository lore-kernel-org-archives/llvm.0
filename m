Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3453168E3;
	Fri, 12 Sep 2025 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687148; cv=none; b=AStLVeOUuCMVspKRl8jIQTeuPaMzO0eOa6forWfJI6U7mddDC4Qq4CmhA+WfGj4kcMmjkx/Cw0HAJlRJ+tkyKB9pWnIhb7u/sOgw7y0hKaAS/pUaW3yz7O/rmgpq9vCwHMT1ZanmFovaIbtAY8ztF+cSAeV4QJyFanCeMDguQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687148; c=relaxed/simple;
	bh=dW1pdcLwAKYL2aeBQ/wUZFfl+V5Bk342MwoiSiIxlbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NE5EZIExGmsQRD4MxDFsP+J4+vTmAfrftHbfhKMDWx2vDlGsxwZUmBaTUwwbKvbVM9ukMUEWhJNvJ3oVl2TdoUNf8OlX0Zwizda2czqm/34lapq88iFJlNam4/a5o9XQyGjIZxQ8JaVwLSu5yBNocgGdbv29XPuN7ci8ZgBI7NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crXderS+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crXderS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757687146; x=1789223146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dW1pdcLwAKYL2aeBQ/wUZFfl+V5Bk342MwoiSiIxlbw=;
  b=crXderS+DNpjXfRm63NitPCo9j7Lf7liAABlfk5Bc2G2VFWejF8Iq7P2
   B/tOiRLN9iDR7SQUI7no62eq+oCStpDod1ytg4lNLMCkpyxCsxH8/pFoE
   uLitRiZT3Cu2qXN58BDj/XWnbaOPWgKAcqwjA2w8qEbaKfGwGiBp56+Sa
   Vt7LCXmyYYZIXSb/YMbL/ouJKuhg+Bl8gKtabqzkFqcu7b0kDxXo7ofae
   +7XtRdnN1hJVBaqmcnklV7qdGGUq5LdlDE4Z8Yks0fIinq95Owo+DOVta
   /VKyKXETPVvmc8o/RWWQNQfklsUdDgmn/4S2Qud16N25Bu5STjNv9amMF
   g==;
X-CSE-ConnectionGUID: 4IRY3vHiTbupDRz9nsz3mA==
X-CSE-MsgGUID: IuthUVNUQbi5ILPlJhg+jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59072516"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="59072516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 07:25:45 -0700
X-CSE-ConnectionGUID: 1RUB/WaqRBqD8ijy/uuGBw==
X-CSE-MsgGUID: zBnNbMSvTeWexSFg6S9sHw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2025 07:25:44 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux4ib-00012m-32;
	Fri, 12 Sep 2025 14:25:41 +0000
Date: Fri, 12 Sep 2025 22:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [broonie-ci:clone3-shadow-stack 6/10] kernel/fork.c:1922:13: error:
 no member named 'shstk_token' in 'struct kernel_clone_args'
Message-ID: <202509122223.JXqtT9hZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git clone3-shadow-stack
head:   6b6fc85e7e359c2476189b2b425a8c2553d549b7
commit: aeca5e8dd13822d01832313ea29bcbe9018d722a [6/10] fork: Add shadow stack support to clone3()
config: i386-buildonly-randconfig-002-20250912 (https://download.01.org/0day-ci/archive/20250912/202509122223.JXqtT9hZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509122223.JXqtT9hZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509122223.JXqtT9hZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/fork.c:1922:13: error: no member named 'shstk_token' in 'struct kernel_clone_args'
    1922 |         if (!args->shstk_token)
         |              ~~~~  ^
   kernel/fork.c:1931:40: error: no member named 'shstk_token' in 'struct kernel_clone_args'
    1931 |         addr = untagged_addr_remote(mm, args->shstk_token);
         |                                         ~~~~  ^
   include/linux/uaccess.h:32:16: note: expanded from macro 'untagged_addr_remote'
      32 |         untagged_addr(addr);                            \
         |                       ^~~~
   include/linux/uaccess.h:26:30: note: expanded from macro 'untagged_addr'
      26 | #define untagged_addr(addr) (addr)
         |                              ^~~~
>> kernel/fork.c:2814:15: error: no member named 'shstk_token' in 'clone_args'
    2814 |         BUILD_BUG_ON(offsetofend(struct clone_args, shstk_token) !=
         |                      ^                              ~~~~~~~~~~~
   include/linux/stddef.h:33:3: note: expanded from macro 'offsetofend'
      33 |         (offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
         |          ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |                          ^~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:572:22: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:560:23: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:552:9: note: expanded from macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/fork.c:2814:46: error: no member named 'shstk_token' in 'struct clone_args'
    2814 |         BUILD_BUG_ON(offsetofend(struct clone_args, shstk_token) !=
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
    2815 |                      CLONE_ARGS_SIZE_VER3);
         |                      ~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:33:47: note: expanded from macro 'offsetofend'
      33 |         (offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
         |                                                      ^
   include/linux/stddef.h:24:57: note: expanded from macro 'sizeof_field'
      24 | #define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
         |                                                         ^
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:572:22: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:560:23: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:552:9: note: expanded from macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/fork.c:2859:24: error: no member named 'shstk_token' in 'struct clone_args'
    2859 |                 .shstk_token            = args.shstk_token,
         |                                           ~~~~ ^
   kernel/fork.c:2908:14: error: no member named 'shstk_token' in 'struct kernel_clone_args'
    2908 |         if (!kargs->shstk_token)
         |              ~~~~~  ^
   kernel/fork.c:2911:25: error: no member named 'shstk_token' in 'struct kernel_clone_args'
    2911 |         if (!IS_ALIGNED(kargs->shstk_token, sizeof(void *)))
         |                         ~~~~~  ^
   include/vdso/align.h:13:30: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                            ^
   kernel/fork.c:2911:25: error: no member named 'shstk_token' in 'struct kernel_clone_args'
    2911 |         if (!IS_ALIGNED(kargs->shstk_token, sizeof(void *)))
         |                         ~~~~~  ^
   include/vdso/align.h:13:44: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                          ^
   8 errors generated.


vim +1922 kernel/fork.c

  1909	
  1910	static int shstk_validate_clone(struct task_struct *p,
  1911					struct kernel_clone_args *args)
  1912	{
  1913		struct mm_struct *mm;
  1914		struct vm_area_struct *vma;
  1915		struct page *page;
  1916		unsigned long addr;
  1917		int ret;
  1918	
  1919		if (!IS_ENABLED(CONFIG_ARCH_HAS_USER_SHADOW_STACK))
  1920			return 0;
  1921	
> 1922		if (!args->shstk_token)
  1923			return 0;
  1924	
  1925		mm = get_task_mm(p);
  1926		if (!mm)
  1927			return -EFAULT;
  1928	
  1929		mmap_read_lock(mm);
  1930	
  1931		addr = untagged_addr_remote(mm, args->shstk_token);
  1932		page = get_user_page_vma_remote(mm, addr, FOLL_FORCE | FOLL_WRITE,
  1933						&vma);
  1934		if (IS_ERR(page)) {
  1935			ret = -EFAULT;
  1936			goto out;
  1937		}
  1938	
  1939		if (!(vma->vm_flags & VM_SHADOW_STACK) ||
  1940		    !(vma->vm_flags & VM_WRITE)) {
  1941			ret = -EFAULT;
  1942			goto out_page;
  1943		}
  1944	
  1945		ret = arch_shstk_validate_clone(p, vma, page, args);
  1946	
  1947	out_page:
  1948		put_page(page);
  1949	out:
  1950		mmap_read_unlock(mm);
  1951		mmput(mm);
  1952		return ret;
  1953	}
  1954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
