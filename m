Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3838B390CAB;
	Wed, 24 Jun 2026 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285412; cv=none; b=JIm7mt+xa4Rz4YIB1FrWRGB6zdyKyr+sQEJWrLCsvDmccx/lQVK4hkaM5UrpgyIEJ8sSNi/NBUKVWlnJsM61A7IXiDN/+clXjPgpSZefRxAP3kC77rx9Jnsk3E5rLSQobYgcrY0ahjv5h0j41tiJLtXd5ro9nvmF5BhD72BzhjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285412; c=relaxed/simple;
	bh=SUL6lB0DpNFJ/sQLgopnuIy4TeBvUuvFvAueNcxORtA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vob3/b22X85iFTh1wHg93YRgJ+Gv4QC5tfy0hW8uWryXYJT/iBA4hWMlwCLKhUd/90qf7v4fXcFV9pvuMaH71BsAEzCrmKLKteTV2oDS7ierTMtOck9pBFsUMn+Q4G85Ekdu0dYvxb6TrVHPducJ78EfUaOs6DQRIwpUOFUCF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGpEcBVO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGpEcBVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782285411; x=1813821411;
  h=date:from:to:cc:subject:message-id;
  bh=SUL6lB0DpNFJ/sQLgopnuIy4TeBvUuvFvAueNcxORtA=;
  b=hGpEcBVOwLKkp6I7d1bu5TO/K7oMuqudMGj+WZTwFm+3AW2rgkSzRHYc
   8MlHtkbf3dOIPajbUdJwx0Hml9cBqNJ+c+AM+5tDpH4kqfbrJCSudw7Ak
   N3dclW1yjOKcZiozpvGi3Vzu/494H5N9tRaYKJ0SMFl1sGYGoJrjhrV8e
   kiNFc9pYE0PnLPTppuD8eZIlQ+DfPmp4BQrwgB+2d6pbHhKD5tAQjlHhA
   fKP7V77MS3iOPqCf+bNhApZ8l3lYUUMiwsA0Cyl+BRYsMJZs9Ygx8mrnP
   QN5yO8p/AyMEA40oy+SPWvGjjxLLwDdNGouOJhQILVkUXWADKWOuGjbS0
   w==;
X-CSE-ConnectionGUID: UbCvP9+CQ+WAtSegDoVjwQ==
X-CSE-MsgGUID: PqqFPe3iQjqtOWZc0VFXNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86942729"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="86942729"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 00:16:51 -0700
X-CSE-ConnectionGUID: /FoCYu9SQp+9fYJoXgQu+g==
X-CSE-MsgGUID: /YQyJe7aRLiVk8XHIOAXiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="273451013"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jun 2026 00:16:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcHql-000000003C6-13wW;
	Wed, 24 Jun 2026 07:16:44 +0000
Date: Wed, 24 Jun 2026 15:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmck-rcu:puranjay.2026.06.23a 57/62]
 kernel/rcu/rcu_segcblist.c:666:6: error: no member named 'exp' in 'struct
 rcu_gp_seq'
Message-ID: <202606241542.bgLQweBP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git puranjay.2026.06.23a
head:   6daa08cf676d7c1ff53101073fdedbf3a6762370
commit: 2a07ef0ff9c70d0889e24fd5df792de66c8ae42c [57/62] rcu: Enable RCU callbacks to benefit from expedited grace periods
config: i386-randconfig-017-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241542.bgLQweBP-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241542.bgLQweBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241542.bgLQweBP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcu_segcblist.c:666:6: error: no member named 'exp' in 'struct rcu_gp_seq'
     666 |                 gs.exp = RCU_GET_STATE_NOT_TRACKED;
         |                 ~~ ^
   1 error generated.


vim +666 kernel/rcu/rcu_segcblist.c

   660	
   661	bool srcu_segcblist_accelerate(struct rcu_segcblist *rsclp, unsigned long seq)
   662	{
   663		struct rcu_gp_seq gs = { .norm = seq };
   664	
   665		if (IS_ENABLED(CONFIG_SMP))
 > 666			gs.exp = RCU_GET_STATE_NOT_TRACKED;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
