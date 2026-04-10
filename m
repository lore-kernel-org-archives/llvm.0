Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B183DCDB8;
	Fri, 10 Apr 2026 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838965; cv=none; b=boOLzNI2gglxJ69ElaaTYlCT/8Nmxq0h7VOofX/TKKPz76rJDpmhWk8Xf/RuT5ImsBZ2y/rk+vW/7TNFV9I4zsjgrXt8r/DdOeCU1cNuGog25KbKiTmRTiSbX2/XTqcK4SjW6fvcRQ9j4FG32ruzOEuGLMWPWveUxTOI4ycjypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838965; c=relaxed/simple;
	bh=zs9awAlSF8oKrkkipUS0xMjig6aHD/S5hOf1UWDp0p8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p4o9Al4JZgN+AS6qeM4UZQNVByco6LVY/6GIbsu+HRuzOLdI5ejKuq7RT39yzMTgz58Qx+DWeIBl0OB0Kzt353RJcCETF21Z5xFjkwQ00Isbvv5PjUdTEmXGs30QcQHv1tgJLkNkUWuxXrv3LzNp6sWIEnXOTWKt0uEvV3fBNxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abruuQ6h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abruuQ6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838963; x=1807374963;
  h=date:from:to:cc:subject:message-id;
  bh=zs9awAlSF8oKrkkipUS0xMjig6aHD/S5hOf1UWDp0p8=;
  b=abruuQ6hlUBiIsQ5vaM/D/JeuunAgq0iD8E8KR5XTI17YU97lL2VZdM8
   U7qR4xzZ9rduNmLJpmJhxCY9cq2SWM543gfk8mhuC9mL5aowExi2oQYxP
   8cuxuJtqQE7UvxcpyVx5BAxqPZjC6hqrUYOR5SkWqu97+aCoGk8H1RZyJ
   Z9EgWt2k4uruFX5Y4nWJms7tFdNzgkkH8bMhm2oHI3a/jWeqYvvxd4oha
   z7GgO8/5x3T80QzeazoYlj6EAKONHMod5VqRGAyAkq9quF1isuEcnEv2v
   7HxLbzBHljvthK4ELHyDHex6BlYFa4SE0L1pA3n1lVzMGJRJO9oX0uIVA
   g==;
X-CSE-ConnectionGUID: Vvt0xWJOQPSLBfF83efVPw==
X-CSE-MsgGUID: BsViEGZ0QcuyO4ocz2K8/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87489567"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87489567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:36:01 -0700
X-CSE-ConnectionGUID: w6zdrSgoQD2bgZLpIwSggA==
X-CSE-MsgGUID: zM2e05BXSvuquGMfnTXjnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228278660"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Apr 2026 09:35:59 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBEpp-000000003zD-22OF;
	Fri, 10 Apr 2026 16:35:57 +0000
Date: Sat, 11 Apr 2026 00:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 14/25] fs/nfsd/nfs4state.c:9911:1: error:
 conflicting types for 'nfsd4_run_cb_notify'
Message-ID: <202604110032.FXxIPdFp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   f46f4f860e384a5bc2c7a8f2fa64872ba4e303a5
commit: 748b5689ecabe0a80846c79cc0b468005b4d7e19 [14/25] nfsd: add notification handlers for dir events
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260411/202604110032.FXxIPdFp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110032.FXxIPdFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110032.FXxIPdFp-lkp@intel.com/

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
