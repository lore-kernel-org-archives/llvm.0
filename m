Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34B155CB3;
	Sun,  2 Nov 2025 04:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762056800; cv=none; b=hhtt2UecKwvJAed2Azud1bMiThAu6a6IXdQGI/rWfBNBRFkSWMp1XhIxqv0IzEqNa5gDFVctLnL6aFJDybUFUh3pkTMJbLXttPgXWqJlvY6538BuiFvnmw9ZYomSVit36itKotnK/NCEsTTwJ4BO1sKeQxFq1nHVKMdXvOWqnYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762056800; c=relaxed/simple;
	bh=VzaN7kZt0tbi01FWiBiFjSyThxYGk12dcgPiZxOhBdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dX7+MtXgy2DMxnelS0thalDUaQmg6+WKkSnYNgpYGndA6BZVtQKfk7UHmH+dwt8tUri1d5Iad2VNmPYdt9nFo5CElGmtTTXCfLLhEmXxlRiJw/7xgsprEsBzYmjUyIDSGHdiix5kmU4xC8RPBfDJVHST8/Qpa9Jf0ecsDQc1d30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+WI2PcY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+WI2PcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762056799; x=1793592799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzaN7kZt0tbi01FWiBiFjSyThxYGk12dcgPiZxOhBdw=;
  b=n+WI2PcYJI2dkCHcWehYVYJ9RSh8AJKa3IQODpeWtcfc/8fIcZ82n3MB
   A0aSasREkJrOQAezEyVyr0K4QOdtokYi4oGB+t6AAbKu15sdMp6C0AG8k
   ZPJPtaRT6xSkA2EE8tipY+vE+z6UB/gUJmX0OL1ecPojVry1pPsD1eDdM
   FqfiLFKdC1NAtGgr78AnnKeUBp8OE98xF+PJIcQbtpSkbjirnDgiS0xYG
   nXbPyDasma/BZdbGEXx80t32rPh7PKSIfhlRfKJB7iohFQ5bR7XM+To23
   FZ1GBv0wrNx9DppHqPRWSZZ2LSYcDQ8IgD6zOChofnqYbYzuY8bzPYqlf
   g==;
X-CSE-ConnectionGUID: fEebnl8oQjKvjDBwbnUZSg==
X-CSE-MsgGUID: EqlVHNm0SxWt8WnQ+JF10A==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="67825350"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="67825350"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 21:13:19 -0700
X-CSE-ConnectionGUID: +M8OBi0lQs2a3wAJk6rePw==
X-CSE-MsgGUID: rq7GXlm5SDiQgjM2Ipk28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="185849675"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2025 21:13:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFPSs-000Ozg-2p;
	Sun, 02 Nov 2025 04:13:14 +0000
Date: Sun, 2 Nov 2025 12:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/1] fs/rpdfs/block.c:309:6: warning:
 variable 'now' is used uninitialized whenever '&&' condition is false
Message-ID: <202511021227.xepLB50o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   e8e76da7ed715ef67ccc4436f4981a5b39983d9f
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/1] rpdfs: initial commit
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251102/202511021227.xepLB50o-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021227.xepLB50o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021227.xepLB50o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> fs/rpdfs/block.c:309:6: warning: variable 'now' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     309 |         if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
         |             ^~~~~~~~~~~~~~~~~~~
   fs/rpdfs/block.c:312:15: note: uninitialized use occurs here
     312 |         WARN_ON_ONCE(now < 0);
         |                      ^~~
   fs/rpdfs/block.c:309:6: note: remove the '&&' if its condition is always true
     309 |         if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/block.c:307:9: note: initialize the variable 'now' to silence this warning
     307 |         s64 now;
         |                ^
         |                 = 0
   2 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> fs/rpdfs/super.c:160:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     160 |         case Opt_mkfs:
         |              ^~~~~~~~
   fs/rpdfs/super.c:178:9: note: uninitialized use occurs here
     178 |         return ret;
         |                ^~~
   fs/rpdfs/super.c:153:9: note: initialize the variable 'ret' to silence this warning
     153 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +309 fs/rpdfs/block.c

   304	
   305	static void put_block(struct rpdfs_block *bk)
   306	{
   307		s64 now;
   308	
 > 309		if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
   310			free_block(bk);
   311	
   312		WARN_ON_ONCE(now < 0);
   313		WARN_ON_ONCE(now == REMOVAL_REFCOUNT - 1);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
