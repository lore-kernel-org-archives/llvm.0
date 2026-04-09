Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DD31DE8BF;
	Thu,  9 Apr 2026 04:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775707377; cv=none; b=KOXTJbQf7TdTgH6CKS4vbwOMSI9oYNTGwW2wDy0EtFtqMpVKPZqCuP1B+ABwbk9LQHaOM07cr+uXj2GCKW0ncLYnyd3XStu32yJDyWbDyc8qyDaVvT8BhlMPGmldTeY6zbZVz1b5l07GGcJUKReFxsZzGYMHsXWK1QSMA9CjlK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775707377; c=relaxed/simple;
	bh=4y7Q5beUXmbAi0ES7D7e5AKguIS+JAOHLLALwBTuUZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z0LrYgB8qVk1NWAEA8XYIJAattRq2CbwlQOQshCSu4EtzsTR40tlGRL36vSlyWfV23dbDqrAazm8yWI7/U2AVKP+5CFTbwmzP4CL/8IdySkU3Z9tMpTf7DOVJkAHkMC6pc2fjSG94myXVwAmTDAool7aULtws6zD/eaS8y/N9d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSgEjrhU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSgEjrhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775707375; x=1807243375;
  h=date:from:to:cc:subject:message-id;
  bh=4y7Q5beUXmbAi0ES7D7e5AKguIS+JAOHLLALwBTuUZU=;
  b=SSgEjrhU1j8AAQRL/oM7M93pDe9Yk/8x3gXmDoWzIYbt6ViTk1z6oAVu
   tqncarDI/VLo5FWqkvlUwyjnjmcEmHpIqshTIQE0XZp75IHzLxpSFu6Z9
   Qe9ToND3yJsimf093UY/Tio863D92GB2EUcGE7spDWKIlWeZfBUF7S5v+
   ZOF42duA1GOiS7Qby7b9jEjk52nMinCjo1OkODf1xPlzUcsLU1ke0Sgj6
   /qATOywElRl4AfkOLyOWA/iLd5CL1hOwt7KJoBsfJMC15FA5hGlKgZS1R
   h0ePyqh0K1peFMjnWniv+5hEk+5diNtNQ9QtGBldgitB4lnY7vyccsvQo
   g==;
X-CSE-ConnectionGUID: 1ONylZD9Rm+72jR/CQLXwQ==
X-CSE-MsgGUID: Np7BrUM4RMS2/j+Ew8aNPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75876658"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="75876658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:02:55 -0700
X-CSE-ConnectionGUID: txqYtH/PRj6VSbwa/iRyDg==
X-CSE-MsgGUID: EOu1c28ASaKcUckuKvWNyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="224349455"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2026 21:02:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAgbT-00000000Ab7-2L3L;
	Thu, 09 Apr 2026 04:02:51 +0000
Date: Thu, 09 Apr 2026 06:02:34 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 14/25] fs/nfsd/nfs4state.c:9911:1: error:
 conflicting types for 'nfsd4_run_cb_notify'
Message-ID: <202604090534.tunlxR45-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f46f4f860e384a5bc2c7a8f2fa64872ba4e303a5
commit: 748b5689ecabe0a80846c79cc0b468005b4d7e19 [14/25] nfsd: add notification handlers for dir events
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260409/202604090534.tunlxR45-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090534.tunlxR45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090534.tunlxR45-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4state.c:3583:3: error: call to undeclared function 'nfsd4_run_cb_notify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3583 |                 nfsd4_run_cb_notify(ncn);
         |                 ^
>> fs/nfsd/nfs4state.c:9911:1: error: conflicting types for 'nfsd4_run_cb_notify'
    9911 | nfsd4_run_cb_notify(struct nfsd4_cb_notify *ncn)
         | ^
   fs/nfsd/nfs4state.c:3583:3: note: previous implicit declaration is here
    3583 |                 nfsd4_run_cb_notify(ncn);
         |                 ^
   2 errors generated.


vim +/nfsd4_run_cb_notify +9911 fs/nfsd/nfs4state.c

  9909	
  9910	static void
> 9911	nfsd4_run_cb_notify(struct nfsd4_cb_notify *ncn)
  9912	{
  9913		struct nfs4_delegation *dp = container_of(ncn, struct nfs4_delegation, dl_cb_notify);
  9914	
  9915		if (test_and_set_bit(NFSD4_CALLBACK_RUNNING, &ncn->ncn_cb.cb_flags))
  9916			return;
  9917	
  9918		if (!refcount_inc_not_zero(&dp->dl_stid.sc_count))
  9919			clear_bit(NFSD4_CALLBACK_RUNNING, &ncn->ncn_cb.cb_flags);
  9920		else
  9921			nfsd4_run_cb(&ncn->ncn_cb);
  9922	}
  9923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
