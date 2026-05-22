Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5787313293;
	Fri, 22 May 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478718; cv=none; b=THNz5o31ra13a+cZ4d/Nc2EKbrng+lymwoW6FOzVJtEsVCuz7H2+17/UKOiSn3HKLCwr/lS/x+SJpO/wvJKfp4gJym446svVtrwkLEOC3DjsA4Nowow5riKuD/FjPeUKLTGfsW+Jmxr5qRF/HT9LthzR1WcEVNH3A5EekZ8RQ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478718; c=relaxed/simple;
	bh=8j6y4k31E2+1gnl6PaI6hXXGiTFSIV+IqcKYUrso6MM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ItejPB5HPr76BDa2nYQfiwO+l1RsVhenqiR4olrSG1cmslTnXDuRTLU6pXSLOIAd/puHEd1t+rjOLqsjXeJizLpLUwzRHv7uV4vFnLdExsR7QnbrT5PmzTkJwBzO55gA0nYCPk8+jVqzEnDrgu/c9Ck2249UGVyPtB00puQ9mK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACtewDL2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACtewDL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779478714; x=1811014714;
  h=date:from:to:cc:subject:message-id;
  bh=8j6y4k31E2+1gnl6PaI6hXXGiTFSIV+IqcKYUrso6MM=;
  b=ACtewDL2CW8yquhPKsslY8LIDveNLPhT+fgOiJnAf+SXFtYV4jLjU2ct
   p/JjoIWzARf4nHOU2h6dLuVxixt9t0ZjAwJrlPw4bwQImLsmc3dcxNW5h
   X5Qdem4VLDr7zI96CdvwMwRaerIyE+xH5/hZAnasej4Kt3AYY7iUtVvBO
   KZAP6rfLCnq8T85utBkx+VJM7+rrk4imb++wALfomo3O31OVi4tiadSaN
   2AsKqUwiN3RelCDAYqJidjIo8AiAn6D1gfKZ1TTpSHB+kRFO7rFtdsDfg
   t+VsTWfUWtKdyLiLwydSBsVH+58AAOxVfK+GwV+XipChYcUPxO+zAgnfH
   w==;
X-CSE-ConnectionGUID: GsHULINRQwGKGQ2fKuoH1A==
X-CSE-MsgGUID: gd6m9v4ZSsy1pZYHkREisw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="82991438"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="82991438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 12:38:33 -0700
X-CSE-ConnectionGUID: AYH2WMINQ+6iI1DFN/twzA==
X-CSE-MsgGUID: cPNrx4tDQuGlaW3cqZVi4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="264827999"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 May 2026 12:38:33 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQVhV-000000002uf-1SuJ;
	Fri, 22 May 2026 19:38:29 +0000
Date: Sat, 23 May 2026 03:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1063/1130]
 include/linux/cciss_ioctl.h:15:3: error: unknown type name 'compat_caddr_t'
Message-ID: <202605230334.WTxZgkF6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 54fa440c3c9f94a6683ab5e391745d3f64727ef6 [1063/1130] cheri: compat64: scsi: Fix clang-tidy warnings
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260523/202605230334.WTxZgkF6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230334.WTxZgkF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230334.WTxZgkF6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/smartpqi/smartpqi_init.c:21:
>> include/linux/cciss_ioctl.h:15:3: error: unknown type name 'compat_caddr_t'
      15 |   compat_caddr_t           buf;       /* compat pointer to data buffer */
         |   ^
   include/linux/cciss_ioctl.h:25:3: error: unknown type name 'compat_caddr_t'
      25 |   compat_caddr_t           buf;         /* compat pointer to data buffer */
         |   ^
   2 errors generated.


vim +/compat_caddr_t +15 include/linux/cciss_ioctl.h

     8	
     9	/* 32 bit compatible ioctl structs */
    10	typedef struct _IOCTL32_Command_struct {
    11	  LUNAddr_struct	   LUN_info;
    12	  RequestBlock_struct      Request;
    13	  ErrorInfo_struct  	   error_info;
    14	  WORD			   buf_size;  /* size in bytes of the buf */
  > 15	  compat_caddr_t	   buf;       /* compat pointer to data buffer */
    16	} IOCTL32_Command_struct;
    17	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
