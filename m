Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493DF347B4;
	Mon, 16 Dec 2024 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734341932; cv=none; b=a1/nG3No4q2jG8zGTzzZtGPI/6qKBxT2aG3+icXqnn519T7UqV94ftgG1L+uoVFhv+odTQWuyy/5LFzhr8o8EeXtvxJS3FpZCMJ0P+qMy96S8qArm5qs6agmccfb6Kj+1SorCYEqSpa+71d5k2Mxh59LnLEOOhDM0WL+GDEVSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734341932; c=relaxed/simple;
	bh=p72K7uiGOFzSNok4jC5hzb+oGgWqCT97r+SeICgMD0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBdYBdAd7qvTaA0M0WTSCtxIvwWfCRmSuRegfjlJr6utTemxx1sx9WnZ5FcaH9b1+Hlvujxsq2NbhRYR6Pd2rlndp1xgXTkQjpRpetKHSOdHgHQEM4IIp0pWxJu5B8+6SOlmoBScukjiAQPoSrn2hJqPtjBBGH7SKKG8dqTQgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnQvTOHg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnQvTOHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734341930; x=1765877930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p72K7uiGOFzSNok4jC5hzb+oGgWqCT97r+SeICgMD0U=;
  b=VnQvTOHgnnbt7GojGHNNCRHdrJeLmZ856silXpjmQnpMc89uTUWK7RvQ
   4kBdP/fnRJCbLxA0EUADPxs/2dhYIHgVGogryCFkVxnIePjgl/3oQ2rPi
   ymDVjJ7Zx2Io/pbjQVvjgyWQL7/mZ9/Rwow/kmKzcmW1osk2BP5ujAwEJ
   ofnhqOHsFQKqcbcv6RsvNlcOc72mzygiIbnoIOyr5T8IFrpD5VIYPJPUx
   YMKInHip7rRCe+dnxj9L1/D6JBtbwJdV5ZFjHnwV5LL/+pMTkiZ8YfhZc
   mSLHTXf+M3G3NmTisVOoS1MR5ghUJSPqDmeRO5UJWY+cLZHR06OZFq2DA
   Q==;
X-CSE-ConnectionGUID: S+wUeSDOTXSZaZEk02MBjQ==
X-CSE-MsgGUID: mUsy5WEwSjG6noTpsBDGiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34041284"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34041284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 01:38:49 -0800
X-CSE-ConnectionGUID: IaNEj05MROicPLGIVo4ehA==
X-CSE-MsgGUID: ICS+XOjtQqqHjZjbXotdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97948888"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2024 01:38:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN7Yr-000E8O-1h;
	Mon, 16 Dec 2024 09:38:45 +0000
Date: Mon, 16 Dec 2024 17:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nam Cao <namcao@linutronix.de>
Subject: [thomas-weissschuh:vdso/store 13/36]
 arch/x86/entry/vdso/vma.c:30:55: error: use of undeclared identifier
 '__VDSO_PAGE'
Message-ID: <202412161706.o1XMneTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   8396bbdb0f7357abccd51ab36a9834e607916f0f
commit: da4610ff3ae69ef2ca17ff5836e8d30944641d57 [13/36] x86: vdso: Switch to generic storage implementation
config: x86_64-buildonly-randconfig-003-20241216 (https://download.01.org/0day-ci/archive/20241216/202412161706.o1XMneTv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161706.o1XMneTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161706.o1XMneTv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vma.c:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/entry/vdso/vma.c:30:55: error: use of undeclared identifier '__VDSO_PAGE'
      30 | static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES == __VDSO_PAGE);
         |                                                       ^
   1 warning and 1 error generated.


vim +/__VDSO_PAGE +30 arch/x86/entry/vdso/vma.c

    29	
  > 30	static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES == __VDSO_PAGE);
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
