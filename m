Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050561A6806;
	Thu,  9 Apr 2026 02:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775701920; cv=none; b=lwpDvOrJnjR+qvUDL17HjeyH0FzoSdDZQvMweqlA4nSK38nRslkNrZkURnWVF/5Upd21ame+FwzXaOE53wx6rVjvzfwEqAqZaQR3cwx9lz5a3xA3djGlXZDApXXZtHU94fuiDZXhohEe4tGAtMy47420R5FKk4j6oKF41WTVPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775701920; c=relaxed/simple;
	bh=XY/81pqSAGmlTF+EOzaFEZJMqWS0bwE03AwNVPN59vE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rEMZ45GK27dDnzNQ6jtTh/6erGNSeqgPDyK6+RdkVHZ9nFT2FKzNP+pet1WBr91v7WxGelSlY/Ptq7Q7T343Y8fsm8ZPRVFRrfvUdSwjPwloILqsCx7bG9jubhEylySlahDwNeBZGoV+YLf7Em84rVgh7BXEKpk8ZUu6d7K5ra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cm+CcoxJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cm+CcoxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775701919; x=1807237919;
  h=date:from:to:cc:subject:message-id;
  bh=XY/81pqSAGmlTF+EOzaFEZJMqWS0bwE03AwNVPN59vE=;
  b=Cm+CcoxJTNkisT3MpFvjuLziO+RQKIjJKIOfM+naIGqEHZkblOHB2n6J
   JI484DqEFR+1yTzieXfMxCCyBFg8fV0ERYkB43w8Rz7ftSrDnCtN6w7sr
   FvPnZKfzfiV5HBviNCXyVKSRKZtr8ecnaQAKTam1g+rEAGKsrOzeGpivW
   H3DOA3fwUO+pAVUL7OxuEcQmlc1aySdrXWHO5qXfdLZNKX0jLPoZSFIGP
   hPwwZKKlUYUbgfTQtkGnDikedYcdjNFwj6zo3ldNc0br/1USBCRQGaL5D
   ZsH1KZ3uXtz1AJwxnlKe+0kTfhY9c0sdk0p2W5gETtSVSwnNeNOvIqr1g
   A==;
X-CSE-ConnectionGUID: 6OlZfQc5S4aBZelrP2Blew==
X-CSE-MsgGUID: fBmoHS9USn+rkvElqG3JCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88084619"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88084619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 19:31:58 -0700
X-CSE-ConnectionGUID: 2LVmrEQPSaSG6HvT0KjXKQ==
X-CSE-MsgGUID: C6tOZPzpTwSUV1pkYObN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="232682916"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2026 19:31:57 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAfBO-00000000Aa9-3HbI;
	Thu, 09 Apr 2026 02:31:50 +0000
Date: Thu, 09 Apr 2026 04:30:59 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 13/25] fs/nfsd/nfs4state.c:3472:3: error:
 call to undeclared function 'nfsd4_run_cb_notify'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202604090457.tVCDqomd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f46f4f860e384a5bc2c7a8f2fa64872ba4e303a5
commit: c82fe07f3cc730c342db68b5cb4cab81c8f6763c [13/25] nfsd: add data structures for handling CB_NOTIFY
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260409/202604090457.tVCDqomd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090457.tVCDqomd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090457.tVCDqomd-lkp@intel.com/

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
