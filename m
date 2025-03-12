Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4693232;
	Wed, 12 Mar 2025 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741773637; cv=none; b=gnpiVLNrI20DqYAqHGvmSq8VQWYnzfPOIIlVcGQ1Dq5Aq44EhrlJiZflG8sfMp5HL73OkGnrrfIA80jDeZ3dicqTX+jfZSjfPbYz+et3Jgkp0wFLGY+TIyAWhYmYSmpm3TsU48uCAfsY2tqZ2+KhjweSW2QcSTto+nAnrYfklcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741773637; c=relaxed/simple;
	bh=AKF/K8/21vora71Pl0RcSTk/Qi9MsUlaH4iByt4G8xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7+O6zfEqEVmB1pClWVLkJORqp/f9iJqoycbgU7HrYR25RVHYL5UUNmwfbKvzWkS1cd+TXeOKDW8TT7wrLBnfRLNCRWxO5UxdBmhcME1kBr45FBB4CxjEyzGqrJyZ0tqCkKDBO9COXEg16Paj5b3+8K1l90TLH1LixF6H8bfkWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNDNa7TQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNDNa7TQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741773635; x=1773309635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AKF/K8/21vora71Pl0RcSTk/Qi9MsUlaH4iByt4G8xM=;
  b=HNDNa7TQt/rvcWEgnUR7O/p5S2Ftg1hvyyEUUOdeqqUuoiKsLcMAzYX2
   IBtajHfcFaGlUAjy9EXP2KRf9vHVYt8cpFhZszRvn9D8cTAQBB4P/fEao
   cpkG/gFVSmMWG9ZvGEkf0BXxnpzGfnIISPL5KGiCL2vBlumFB9Mw7g39L
   fp5YtN5nG3SeM5Kh3MBMzU4XItsvDdFw4OCKvJZlmykzE/kkcP1hVK3Jl
   NP7w41udCWeuEr3+7SmbbMzAvG72CVGzxgQF/7/W+8B2uSNHrylSzN6E5
   fpWvm3uMgETPYKc0cjzyw+L/fW2/q1sSDYCrjDtapOHZOkya4AxvZU6Rv
   A==;
X-CSE-ConnectionGUID: LclufQ6rTW+VffUjVU86mQ==
X-CSE-MsgGUID: Kv6C378wTyi9aIWJH9YlaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42880855"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42880855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 03:00:24 -0700
X-CSE-ConnectionGUID: ArbX2IeuSwS0EFMcBbl4mg==
X-CSE-MsgGUID: 9vkO3w1KQ9KY7KXbFxlFtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125232396"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2025 03:00:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsIsu-0008Ma-0k;
	Wed, 12 Mar 2025 10:00:20 +0000
Date: Wed, 12 Mar 2025 17:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] io_uring: cmd: introduce
 io_uring_cmd_import_fixed_vec
Message-ID: <202503121708.ZioDSAXU-lkp@intel.com>
References: <20250311114053.216359-2-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311114053.216359-2-sidong.yang@furiosa.ai>

Hi Sidong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250307]
[also build test WARNING on v6.14-rc6]
[cannot apply to kdave/for-next linus/master v6.14-rc6 v6.14-rc5 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidong-Yang/io_uring-cmd-introduce-io_uring_cmd_import_fixed_vec/20250311-194620
base:   next-20250307
patch link:    https://lore.kernel.org/r/20250311114053.216359-2-sidong.yang%40furiosa.ai
patch subject: [RFC PATCH 1/2] io_uring: cmd: introduce io_uring_cmd_import_fixed_vec
config: i386-buildonly-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121708.ZioDSAXU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121708.ZioDSAXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121708.ZioDSAXU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/uring_cmd.c:5:
   include/linux/io_uring/cmd.h:51:42: warning: 'struct iou_vec' declared inside parameter list will not be visible outside of this definition or declaration
      51 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^~~~~~~
>> io_uring/uring_cmd.c:262:42: warning: 'struct iou_vec' declared inside parameter list will not be visible outside of this definition or declaration
     262 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^~~~~~~
   io_uring/uring_cmd.c:258:5: error: conflicting types for 'io_uring_cmd_import_fixed_vec'; have 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, bool,  unsigned int)' {aka 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, _Bool,  unsigned int)'}
     258 | int io_uring_cmd_import_fixed_vec(const struct iovec __user *uiovec,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/io_uring/cmd.h:47:5: note: previous declaration of 'io_uring_cmd_import_fixed_vec' with type 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, bool,  unsigned int)' {aka 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, _Bool,  unsigned int)'}
      47 | int io_uring_cmd_import_fixed_vec(const struct iovec __user *uiovec,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   io_uring/uring_cmd.c: In function 'io_uring_cmd_import_fixed_vec':
   io_uring/uring_cmd.c:273:15: error: implicit declaration of function 'io_vec_realloc' [-Werror=implicit-function-declaration]
     273 |         ret = io_vec_realloc(iou_vec, nr_segs);
         |               ^~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:65,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/uapi/linux/io_uring.h:11,
                    from include/linux/io_uring/cmd.h:5:
   io_uring/uring_cmd.c:278:23: error: invalid use of undefined type 'struct iou_vec'
     278 |         memcpy(iou_vec->iovec, iov, sizeof(*iov) * nr_segs);
         |                       ^~
   arch/x86/include/asm/string_32.h:150:42: note: in definition of macro 'memcpy'
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                          ^
   io_uring/uring_cmd.c:281:15: error: implicit declaration of function 'io_import_reg_vec'; did you mean 'io_import_reg_buf'? [-Werror=implicit-function-declaration]
     281 |         ret = io_import_reg_vec(rw, iter, req, iou_vec, iou_vec->nr, 0,
         |               ^~~~~~~~~~~~~~~~~
         |               io_import_reg_buf
   io_uring/uring_cmd.c:281:64: error: invalid use of undefined type 'struct iou_vec'
     281 |         ret = io_import_reg_vec(rw, iter, req, iou_vec, iou_vec->nr, 0,
         |                                                                ^~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from io_uring/uring_cmd.c:2:
   io_uring/uring_cmd.c: At top level:
   io_uring/uring_cmd.c:285:19: error: conflicting types for 'io_uring_cmd_import_fixed_vec'; have 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, bool,  unsigned int)' {aka 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, _Bool,  unsigned int)'}
     285 | EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed_vec);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:70:28: note: in definition of macro '__EXPORT_SYMBOL'
      70 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:84:41: note: in expansion of macro '_EXPORT_SYMBOL'
      84 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   io_uring/uring_cmd.c:285:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     285 | EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed_vec);
         | ^~~~~~~~~~~~~~~~~
   include/linux/io_uring/cmd.h:47:5: note: previous declaration of 'io_uring_cmd_import_fixed_vec' with type 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, bool,  unsigned int)' {aka 'int(const struct iovec *, long unsigned int,  int,  struct iov_iter *, struct io_uring_cmd *, struct iou_vec *, _Bool,  unsigned int)'}
      47 | int io_uring_cmd_import_fixed_vec(const struct iovec __user *uiovec,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +262 io_uring/uring_cmd.c

   257	
   258	int io_uring_cmd_import_fixed_vec(const struct iovec __user *uiovec,
   259					  unsigned long nr_segs, int rw,
   260					  struct iov_iter *iter,
   261					  struct io_uring_cmd *ioucmd,
 > 262					  struct iou_vec *iou_vec, bool compat,
   263					  unsigned int issue_flags)
   264	{
   265		struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
   266		struct iovec *iov;
   267		int ret;
   268	
   269		iov = iovec_from_user(uiovec, nr_segs, 0, NULL, compat);
   270		if (IS_ERR(iov))
   271			return PTR_ERR(iov);
   272	
   273		ret = io_vec_realloc(iou_vec, nr_segs);
   274		if (ret) {
   275			kfree(iov);
   276			return ret;
   277		}
   278		memcpy(iou_vec->iovec, iov, sizeof(*iov) * nr_segs);
   279		kfree(iov);
   280	
   281		ret = io_import_reg_vec(rw, iter, req, iou_vec, iou_vec->nr, 0,
   282					issue_flags);
   283		return ret;
   284	}
   285	EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed_vec);
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
