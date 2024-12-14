Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ADA1AF0A7;
	Sat, 14 Dec 2024 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734209547; cv=none; b=fjs4JD5X1AckPSzqyRgUvw1lUlVrBC0bspwp0fdHIbgsW7clqwqKEpe5Vl+rLIfxNdyxhNJzTAUxW7WjaJ6nZ7hSSrAfutjn4PuBL2KoTW8HHs7QlMFzE7ssdEBJ9SoPefe/nPXvaSyHIqymvLTYUflNKuJZ1hTy5NwXCvhXHOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734209547; c=relaxed/simple;
	bh=CH459Dbo7IabDlztuH5WsZpkbk7zCMya58lFkFQPsac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0ZeAuo3FG3axdE2sKaXp9eJqVmeDmZSlay4Xg+CMjeuLBLGxlgYH+8+rh5JDi3KEhNoTLvixnGhZoFAfdxBw2KT/jvXzRNGxZ0hK6v6htrEGKToUi2BEv6GpDSjHrAVoUJRoNBVjYGcNjX3briX1AOU8dmHAV4XcWEHi1AYEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Esa7YwSl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Esa7YwSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734209545; x=1765745545;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CH459Dbo7IabDlztuH5WsZpkbk7zCMya58lFkFQPsac=;
  b=Esa7YwSlc77q3Zv/8/WiaTVxbvXiiQruWQSDOn2SZR5eFgNavkGrIGt1
   sHgBmoZ0RcNnmXcv+FTx016+54Cl8u7CY2tihuGV3vxpGkM49n0m76Msj
   u6AaLgA9Y0G87dPdGu1UdhbCN0EtArhqVVXb040ztdSSAuyVeCsYmHng5
   tWE+G8zm+22m3nPJBksERPEI5ISrn7EA6spiK27FiIt7VhSsmmFnFX3OT
   9k2tSCFussr5t01O73+27hdTR8l3PPYtk5jAqft1ANRmEZgerL5Es1Jbv
   YkOZOz0X7ztb2tYRA8W1MmlJWLpXVc9SXCUPWECgeeDJCzbdcmC7gkpxM
   w==;
X-CSE-ConnectionGUID: cyjcACfYR/2kF7q2iLJ9MA==
X-CSE-MsgGUID: BWMvMRY9TdeFXei0E/lIPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34542569"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34542569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 12:52:22 -0800
X-CSE-ConnectionGUID: oynWFVaQQfirRdj3eF13UA==
X-CSE-MsgGUID: NsUoNj42SrGRuFYG6SgciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97399861"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2024 12:52:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMZ7a-000DDd-0h;
	Sat, 14 Dec 2024 20:52:18 +0000
Date: Sun, 15 Dec 2024 04:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nam Cao <namcao@linutronix.de>
Subject: [thomas-weissschuh:vdso/store 51/51]
 arch/arm64/include/asm/vdso/compat_gettimeofday.h:165:46: warning: value
 size does not match register size specified by the constraint and modifier
Message-ID: <202412150418.DTevfJM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   bebedce7b4b3dd55df052f7c6c6160aad13d8f39
commit: bebedce7b4b3dd55df052f7c6c6160aad13d8f39 [51/51] vdso: Rework struct vdso_time_data and introduce struct vdso_clock
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241215/202412150418.DTevfJM2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150418.DTevfJM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150418.DTevfJM2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:220:
>> arch/arm64/include/asm/vdso/compat_gettimeofday.h:165:46: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     165 |         asm volatile("mov %0, %1" : "=r"(ret) : "r"(vdso_u_timens_data));
         |                                                     ^
   1 warning generated.
--
   In file included from <built-in>:3:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:220:
>> arch/arm64/include/asm/vdso/compat_gettimeofday.h:165:46: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     165 |         asm volatile("mov %0, %1" : "=r"(ret) : "r"(vdso_u_timens_data));
         |                                                     ^
   1 warning generated.


vim +165 arch/arm64/include/asm/vdso/compat_gettimeofday.h

a7f71a2c8903f85 Vincenzo Frascino 2019-06-21  157  
3503d56cc7233ce Andrei Vagin      2020-06-24  158  #ifdef CONFIG_TIME_NS
808094fcbf4196b Christophe Leroy  2021-03-31  159  static __always_inline
9cc578dc2437109 Nam Cao           2024-09-25  160  const struct vdso_time_data *__aarch64_get_vdso_u_timens_data(void)
3503d56cc7233ce Andrei Vagin      2020-06-24  161  {
9cc578dc2437109 Nam Cao           2024-09-25  162  	const struct vdso_time_data *ret;
3503d56cc7233ce Andrei Vagin      2020-06-24  163  
667440cd4ada160 Thomas Weiﬂschuh  2024-09-11  164  	/* See __aarch64_get_vdso_u_time_data(). */
667440cd4ada160 Thomas Weiﬂschuh  2024-09-11 @165  	asm volatile("mov %0, %1" : "=r"(ret) : "r"(vdso_u_timens_data));
3503d56cc7233ce Andrei Vagin      2020-06-24  166  
3503d56cc7233ce Andrei Vagin      2020-06-24  167  	return ret;
3503d56cc7233ce Andrei Vagin      2020-06-24  168  }
667440cd4ada160 Thomas Weiﬂschuh  2024-09-11  169  #define __aarch64_get_vdso_u_timens_data __arch_get_vdso_u_timens_data
3503d56cc7233ce Andrei Vagin      2020-06-24  170  #endif
3503d56cc7233ce Andrei Vagin      2020-06-24  171  

:::::: The code at line 165 was first introduced by commit
:::::: 667440cd4ada1608be2118918c0f3b907eb7e7f6 arm64: vdso: Switch to generic storage implementation

:::::: TO: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
