Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCB93D75B8;
	Fri, 10 Apr 2026 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775833191; cv=none; b=EL6k+z2dY7TiPczqC2I56/VwUJJJUjI3AI2R5IgC1wOh0gECXWLUWWUXyLRetQ0XCDYRovCPKwakAmN4gbesjdeobAP+xqLEP3pad3N7WJpBQmIHPU909N1mfrgNMqjoXegiXfPObkZ5Lfe9hXtMGo4BeFu1tBH+cuk/U8gDy0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775833191; c=relaxed/simple;
	bh=Ln+jh73HmCib4e23m8SsNIZLz2WoV5QgUogQeNKb+jU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eMBIIpONd5A/AmY4jWVtNqRZ1Vmyx4B6SsGS9CpjHnEEeCXZbrE0BTxRLYMHN0opU0RkqWJBcuHoPc6Db9ApiLYs7M8CWdtaJe6bWM9fOMVkcg1GZPggq+TJ3sbxGdHLdlXrI5gn4rWB+rkDNjQsB9Lf9zH6VmooAJbMpsNp8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRJUTIIj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRJUTIIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775833190; x=1807369190;
  h=date:from:to:cc:subject:message-id;
  bh=Ln+jh73HmCib4e23m8SsNIZLz2WoV5QgUogQeNKb+jU=;
  b=aRJUTIIjWlmgfC7xwHLv6PHu0YyKWVcvK67g3NnRh5i63Y91XIFTdBGS
   kfrqUTvRlu7i7KJwJB4+es4jXVivFkVuSlMlqkTmiQXSJJ4xpGVQfVYZf
   Yl2Fmn00WPKpvangMGLU4TaK4TLg8Kqbc6tOdw/jkjsloDTjwU0kNRTcs
   sjKFI8GejqCdP4ch8ga2BB30OaLmg0OlL6lzGIZ0ub0I+qHbaEV7JbhJU
   kagsjdY1M+LGDw51dLIVeV1/hQH+BQtjZV9fUbD87iYL7Xd6yoaukFy3X
   4gPVCJYzOH2oEUyrLkrFMPfZOAJ95EAbSI29eZqC7dic9IfFIoB6CX+jp
   g==;
X-CSE-ConnectionGUID: LvHCKomnR/KmGOa1rezuag==
X-CSE-MsgGUID: r/J2y94aThyWOJL8Vhm92A==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76814792"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76814792"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:59:49 -0700
X-CSE-ConnectionGUID: 5XlnB92HT7m0J7FXw+tRdw==
X-CSE-MsgGUID: +1oSO/Z+S+uD3sjp83xCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252481449"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 07:59:48 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBDKj-000000003qd-22DS;
	Fri, 10 Apr 2026 14:59:45 +0000
Date: Fri, 10 Apr 2026 22:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 13/25] fs/nfsd/nfs4state.c:3472:3: error:
 call to undeclared function 'nfsd4_run_cb_notify'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202604102219.aQ0pLdjc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f46f4f860e384a5bc2c7a8f2fa64872ba4e303a5
commit: c82fe07f3cc730c342db68b5cb4cab81c8f6763c [13/25] nfsd: add data structures for handling CB_NOTIFY
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260410/202604102219.aQ0pLdjc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102219.aQ0pLdjc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102219.aQ0pLdjc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:3472:3: error: call to undeclared function 'nfsd4_run_cb_notify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3472 |                 nfsd4_run_cb_notify(ncn);
         |                 ^
   1 error generated.


vim +/nfsd4_run_cb_notify +3472 fs/nfsd/nfs4state.c

  3461	
  3462	static void
  3463	nfsd4_cb_notify_release(struct nfsd4_callback *cb)
  3464	{
  3465		struct nfsd4_cb_notify *ncn =
  3466				container_of(cb, struct nfsd4_cb_notify, ncn_cb);
  3467		struct nfs4_delegation *dp =
  3468				container_of(ncn, struct nfs4_delegation, dl_cb_notify);
  3469	
  3470		/* Drain events that arrived while this callback was in flight */
  3471		if (ncn->ncn_evt_cnt > 0)
> 3472			nfsd4_run_cb_notify(ncn);
  3473		nfs4_put_stid(&dp->dl_stid);
  3474	}
  3475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
