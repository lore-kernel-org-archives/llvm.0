Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493A35DA40;
	Tue, 17 Mar 2026 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750961; cv=none; b=qDdTIqSDhsc66OPJvezlfm9RYBMV126F2D/UE//Zztmndka7nfS/lgLOBmyuFtXiisXAI/jQ1ehz7/ZLtTAMzVgPIeuVhXN6mHBCKVyodBJnFQnWOrerspIDUil0uw9Cde4lg5Bj4tu1UP02oAlml4aQ/dPvePlKT0fIOjVfdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750961; c=relaxed/simple;
	bh=zQkF4aFPpCjumouL76AqCA/45MXGsssqAVQg7werIi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ulHY8uVBRr2YoSNWqgmiSTaCIXWVOHB0kvtqkIlfMDbrBKq0YG1fLqdgY22VL74Po9oK8hEaKrtEpMKtAU51hcuSNqK81JkcyN2ytrBYY3Ht76CYqiEHHhti8Vy4SxVeLsdHdZTY4gT3vC193ytvvXWbYBxP4AOBcobjqjwmW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ns13gIdW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ns13gIdW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773750959; x=1805286959;
  h=date:from:to:cc:subject:message-id;
  bh=zQkF4aFPpCjumouL76AqCA/45MXGsssqAVQg7werIi8=;
  b=Ns13gIdWCO0Dw9VqvRXHzRVB5GkWFJ8/VYfCVI5q+Q+8uiNswbI0ZmQm
   56zW6Cf1MBCSEkSomZY+Rh/oWtSFShq+BrgaqwbFl7jVe7C6rU9iMXz1l
   Hw7NjokCjBaCs7VgfrxVTW2Ozir1LKtTaOO1PVx6FufgvxZDtV7GwOwtT
   mqx87l31CIGctVXXAcFmrurOgGhGwEGOhbslFuS/0rtGiIFJTzfgw5d4p
   swum8R2UncxHssWjwyjNPNRkVumpIUq7r2LAeLbKQ0q9rGgNlIKmv4yr6
   vU2+BljXIN8tkVIPnkK2Au56TRYFpmaW+Nm722ADMNDnmDtE7gpvjIrX0
   Q==;
X-CSE-ConnectionGUID: fzqqvI+IS/Kh0sAZD70WyA==
X-CSE-MsgGUID: +XSQ8wrTROeihluwrOUM8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74963231"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74963231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:35:58 -0700
X-CSE-ConnectionGUID: FcP8cXcXRUu5ana5/xNe9g==
X-CSE-MsgGUID: CoQ9LS8oREOxUBzMJTtpWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="219364165"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2026 05:35:56 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2TeM-000000000Oj-281e;
	Tue, 17 Mar 2026 12:35:54 +0000
Date: Tue, 17 Mar 2026 20:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 1/3] fs/f2fs/f2fs.h:5090:5: warning:
 variable 'stop_reason' is used uninitialized whenever 'if' condition is false
Message-ID: <202603172032.Bqe3qOBm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   8b0a278150d8b381c33a881c61d439905cc90ccd
commit: 42d256b5f9f2e46beb837949272d4374e2a5e859 [1/3] f2fs: call f2fs_handle_critical_error() to set cp_error flag
config: x86_64-randconfig-015-20260317 (https://download.01.org/0day-ci/archive/20260317/202603172032.Bqe3qOBm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172032.Bqe3qOBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172032.Bqe3qOBm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/hash.c:18:
>> fs/f2fs/f2fs.h:5090:5: warning: variable 'stop_reason' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    5090 |                                 f2fs_bug_on(sbi, 1);
         |                                 ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:34:37: note: expanded from macro 'f2fs_bug_on'
      34 | #define f2fs_bug_on(sbi, condition)     BUG_ON(condition)
         |                                         ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:81:36: note: expanded from macro 'BUG_ON'
      81 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:47:23: note: expanded from macro 'unlikely'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:5092:36: note: uninitialized use occurs here
    5092 |                         f2fs_handle_critical_error(sbi, stop_reason);
         |                                                         ^~~~~~~~~~~
   fs/f2fs/f2fs.h:5090:5: note: remove the 'if' if its condition is always true
    5090 |                                 f2fs_bug_on(sbi, 1);
         |                                 ^
   fs/f2fs/f2fs.h:34:37: note: expanded from macro 'f2fs_bug_on'
      34 | #define f2fs_bug_on(sbi, condition)     BUG_ON(condition)
         |                                         ^
   include/asm-generic/bug.h:81:32: note: expanded from macro 'BUG_ON'
      81 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^
   fs/f2fs/f2fs.h:5077:4: note: variable 'stop_reason' is declared here
    5077 |                         enum stop_cp_reason stop_reason;
         |                         ^
   1 warning generated.


vim +5090 fs/f2fs/f2fs.h

  5066	
  5067	static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
  5068					struct folio *folio, enum page_type type)
  5069	{
  5070		pgoff_t ofs = folio->index;
  5071	
  5072		if (unlikely(f2fs_cp_error(sbi)))
  5073			return;
  5074	
  5075		if (ofs == sbi->page_eio_ofs[type]) {
  5076			if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO) {
  5077				enum stop_cp_reason stop_reason;
  5078	
  5079				switch (type) {
  5080				case META:
  5081					stop_reason = STOP_CP_REASON_READ_META;
  5082					break;
  5083				case NODE:
  5084					stop_reason = STOP_CP_REASON_READ_NODE;
  5085					break;
  5086				case DATA:
  5087					stop_reason = STOP_CP_REASON_READ_DATA;
  5088					break;
  5089				default:
> 5090					f2fs_bug_on(sbi, 1);
  5091				}
  5092				f2fs_handle_critical_error(sbi, stop_reason);
  5093			}
  5094		} else {
  5095			sbi->page_eio_ofs[type] = ofs;
  5096			sbi->page_eio_cnt[type] = 0;
  5097		}
  5098	}
  5099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
