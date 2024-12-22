Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC700632;
	Sun, 22 Dec 2024 03:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734839844; cv=none; b=A6la8Kh/+eJXQzKTKbi4XhUHsaEOWd4yK+WOFSZR0LYA+uap/9mobxHle44XkYLE1ReIRTz5hjmKbZ5E6N/828ig8zAXJMdgsHvD83T3KlmhDfNopGOmuvfxNTlBhccHcOIrdJHwTzQBLXuSwB9jkxWERRqcPiCBXNzbuZvy7aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734839844; c=relaxed/simple;
	bh=oPX3o8xN/AnPuLeuFoXUHYIy3UBbSwq9kg9te0nf8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8V/BfzKQ3fYCWkad33E/8zK34D2IrtEPGRUCpcUQmkmSHZ50evlajmzuIpelpGA18ji0gQV+deb5hR5C7G6IZ1gGWx5sf9FsrXR2Qk1e//2d8jPFDQOtg3F1GymbBUMJHHZd7am36rP9puCy01fM1peYbs7wINrNTiNtfXoQvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imu8hcBX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imu8hcBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734839842; x=1766375842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPX3o8xN/AnPuLeuFoXUHYIy3UBbSwq9kg9te0nf8Ik=;
  b=imu8hcBXjhLsItJurulj5mrf3LBPuUdtwlroz+ZhNfiOrfIKpGuegG2D
   md1z54VE/7FYXmewnh245Xa1JQGLhxB9kF8Et4y5kG9jreB9ro0hkOJUW
   TZTfuH6G9zvF1GM0s7gkNeoGuA8fWU/+8YQfcYIzUVDnMOUNQTjHJWwLA
   kCmcKwQTx0ChmFDpu4r5Mb6w01io21MeOY9g+2Sfo9VGaVTDDnFxh48lE
   ghkrZ2lmHEP9RGoFS4p/rXjlXdkRMKqyWX7x7RMLNRBlY0pAyDZG9oKvj
   b7kuqLKD8mZgsiZLyDPHdU/ppkQUqr0IsKWrmgYa+bfUrdErRRFbqPeJf
   A==;
X-CSE-ConnectionGUID: alm23JZeSku7F19+Dnvyhg==
X-CSE-MsgGUID: OIfBhXPQRgSsskAOofp59A==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="22931514"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="22931514"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 19:57:21 -0800
X-CSE-ConnectionGUID: vdrtwFX9S86WTC/wTcK43A==
X-CSE-MsgGUID: rlWO8bmKT9+RoLjpe8OKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="103855277"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2024 19:57:20 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPD5h-0002iL-2t;
	Sun, 22 Dec 2024 03:57:17 +0000
Date: Sun, 22 Dec 2024 11:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 29/32] kernel/rcu/srcutree.c:779:39: error: use of
 undeclared identifier 'idx'
Message-ID: <202412221140.QFrkcI2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   61a0b92b3a3cfef69e3848806e51d1b99a9e9406
commit: 2d83ec26a0f96c719fdc81b54f75d7b924dcd6bf [29/32] srcu: Make SRCU readers use ->srcu_ctrs for counter selection
config: powerpc64-randconfig-001-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221140.QFrkcI2w-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221140.QFrkcI2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221140.QFrkcI2w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/srcutree.c:779:39: error: use of undeclared identifier 'idx'
     779 |         atomic_long_inc(&ssp->sda->srcu_ctrs[idx].srcu_locks.counter);
         |                                              ^
   kernel/rcu/srcutree.c:795:18: error: incompatible pointer types passing 's64 *' (aka 'long long *') to parameter of type 'atomic_long_t *' (aka 'atomic64_t *') [-Werror,-Wincompatible-pointer-types]
     795 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_unlocks.counter);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:3589:32: note: passing argument to parameter 'v' here
    3589 | atomic_long_inc(atomic_long_t *v)
         |                                ^
   2 errors generated.


vim +/idx +779 kernel/rcu/srcutree.c

   768	
   769	/*
   770	 * Counts the new reader in the appropriate per-CPU element of the
   771	 * srcu_struct, but in an NMI-safe manner using RMW atomics.
   772	 * Returns an index that must be passed to the matching srcu_read_unlock().
   773	 */
   774	int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
   775	{
   776		struct srcu_ctr *scp = READ_ONCE(ssp->srcu_ctrp);
   777		struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
   778	
 > 779		atomic_long_inc(&ssp->sda->srcu_ctrs[idx].srcu_locks.counter);
   780		smp_mb__after_atomic(); /* B */  /* Avoid leaking the critical section. */
   781		return scp - &ssp->sda->srcu_ctrs[0];
   782	}
   783	EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
