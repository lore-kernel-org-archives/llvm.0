Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C93E485;
	Tue, 20 Feb 2024 03:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708398517; cv=none; b=GnowUI4019fQdmrA4uu2sw9r1xFAnmcf/LDY8JE7uFEIENwRBjF/RiAZOBmaDQPpTUJ3hexJSy42ZTw0yj1ZflfMErzsk55IijZFe3h4tRq1ZpDQTOdp/4NEzWK5tTi01G5i8dTBAVqdibjb3isKwUS8peMCBBqXW6ipx8+iXnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708398517; c=relaxed/simple;
	bh=VZAPcDq9YZLsosZSE60DcuJ1hzOIdM3hOOxYZj2r2R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rebw8hUu+q7SMvAWSsp4m3/JsRfNLSkOsx5qq40UMj8dIWGyS0deD57fyG7+w7vf5ppJ44m9DWPk6fU8/zPJtFLBm+CMjUSWPT/n7+v4yxgBMA0LxivXS3CTfKashZehW1Nn/0/HKH8l1POLdwRzB9eJ/gUdE+/hntZe5yV4tzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5nBuczg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5nBuczg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708398516; x=1739934516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZAPcDq9YZLsosZSE60DcuJ1hzOIdM3hOOxYZj2r2R8=;
  b=j5nBuczgIpUXVl1uQnspwGNnvaSf0M1JzTnPmOaLpon0M9Tg52UUczSr
   lUURvfqYmQXOHbRvReHYALV+59yFPOwfm0y1ttELwx630pJa5YSjskF+L
   wMIAjTJoOSaaTwEH+F8l4PPXwtimulfyG9lBRU+IFIPS3rfDSWOLw1qt8
   WdZ+yrcV+t2nFYPqLQN9K1/00wAWzFFglejlfTq3kZdcnBOxJZn5j2BUG
   P0RlBSE0unnuXz35wpwjphIOBz1JMecZU5b2jpJJHZ3ve37eXpKXsC+0d
   57gBkbvM8xnvz1oaeL63HKNxXJKX2wWiI4MffdqxI07587OTDCVJ3vF0E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2350973"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2350973"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 19:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9340168"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Feb 2024 19:08:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcGUg-0004Dc-1S;
	Tue, 20 Feb 2024 03:08:30 +0000
Date: Tue, 20 Feb 2024 11:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.pidfd 21/21] fs/libfs.c:2036:14: error:
 incompatible pointer types initializing 'typeof (*(__ai_ptr)) *' (aka
 'struct dentry **') with an expression of type 'typeof (old)' (aka 'struct
 dentry *'); take the address with &
Message-ID: <202402201038.QgndybeN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.pidfd
head:   b5273dc51b5b5843659d6b3ee930ac10ff3ad816
commit: a211767b02e79fa1984d8014a35932b7683db40b [21/21] libfs: improve path_from_stashed() helper
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240220/202402201038.QgndybeN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201038.QgndybeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201038.QgndybeN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/libfs.c:2036:14: error: incompatible pointer types initializing 'typeof (*(__ai_ptr)) *' (aka 'struct dentry **') with an expression of type 'typeof (old)' (aka 'struct dentry *'); take the address with & [-Werror,-Wincompatible-pointer-types]
    2036 |                 if (likely(try_cmpxchg(stashed, old, dentry)))
         |                     ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:191:19: note: expanded from macro 'raw_try_cmpxchg'
     191 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                          ^
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   1 error generated.


vim +2036 fs/libfs.c

  2018	
  2019	static struct dentry *stash_dentry(struct dentry **stashed,
  2020					   struct dentry *dentry)
  2021	{
  2022		guard(rcu)();
  2023		for (;;) {
  2024			struct dentry *old;
  2025	
  2026			/* Assume any old dentry was cleared out. */
  2027			old = cmpxchg(stashed, NULL, dentry);
  2028			if (likely(!old))
  2029				return dentry;
  2030	
  2031			/* Check if somebody else installed a reusable dentry. */
  2032			if (lockref_get_not_dead(&old->d_lockref))
  2033				return old;
  2034	
  2035			/* There's an old dead dentry there, try to take it over. */
> 2036			if (likely(try_cmpxchg(stashed, old, dentry)))
  2037				return dentry;
  2038		}
  2039	}
  2040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
