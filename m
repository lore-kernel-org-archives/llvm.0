Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C55386C0A;
	Thu, 21 May 2026 23:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779407291; cv=none; b=OwJhqpxywHLuzjEb0d5j0ERLb66qJiz/h5Amr9ai1p8OvsJd2e0f7YZOkp/VGRE0EBNbOthstJE8fdT2++lYt6WzYDDylmdkruGqAlrZTneqsTKACl7Yw0218GyJRYbTyjG39WsbDz14kyjqNFlP7lXGi3FfAu/QGaKMARxIe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779407291; c=relaxed/simple;
	bh=fC1rnaTbkMtjbBQjRLnKSineXwEbVC4G9KSmlxuP3/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ofwoowQ0OD2oDNfh2MtJpFXJ8ML3nTPYAeRRQw+xkV3jqUgwTwjMTVQO/imgm9OfgGtLi9TZQZwwCBTY++yPLCRpZPecwASEnug6aXR4s1PvSJ6ZJ5xMsB74rVjEtNmOAWstfntcklVR6wDx1j6PxI+Y/nSOZNq8rstaoJWKnXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAMhIB7Z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAMhIB7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779407285; x=1810943285;
  h=date:from:to:cc:subject:message-id;
  bh=fC1rnaTbkMtjbBQjRLnKSineXwEbVC4G9KSmlxuP3/k=;
  b=UAMhIB7ZAHuhmuY+ts1rDsu8x/HYhnmlbbqwq+Xcw8kAwuDT6Cmq03Nk
   a5vV7yW1Eqw1Ga2G+mzVkZq1/4LBEIzCXmCf2cuoc7YQ+s4iy+qGBfzsS
   HJfBPmxingeVeSyvFJYQqRV5nZtHFomfaBQhKVWyOaxp/ztMWXWOoBxla
   zdFxIqEYUR6TuDy5isLgsTccYCP2HNkp/+QLgUSjjWnFYl/vlFURmg5fS
   ZQ2+q+BpaoCzo/IPUqTuSdDYHI5mtLnigUL7U2/XSJjdGrZ/63vBNhIzf
   yTglUDdXXmphJhiy34+Ft89GQ/RJ4JwWZWJLmu5h/f1BpweN1r3c0K5tO
   w==;
X-CSE-ConnectionGUID: hz5ZQy/ITra7yqlJkSHydg==
X-CSE-MsgGUID: jIFObYleSj+wg9C5Qc+9kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80370153"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80370153"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 16:47:52 -0700
X-CSE-ConnectionGUID: o26abdyQStOLiGu6Ebd0KA==
X-CSE-MsgGUID: NCeDT2w1R8y+H8re0eWZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="244976959"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 16:47:51 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQD7D-000000001O7-3jpI;
	Thu, 21 May 2026 23:47:47 +0000
Date: Fri, 22 May 2026 07:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 11/1130]
 usr/include/linux/atmapi.h:29:25: error: use of undeclared identifier
 '__u64ptr'
Message-ID: <202605220741.ysVbhmII-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: d7248704a9e61a04dbe3289ba19e99273d16504e [11/1130] cheri: UAPI: Make sure we can store a user pointer in atm_kptr_t
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605220741.ysVbhmII-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220741.ysVbhmII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220741.ysVbhmII-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/atmlec.h:11:
>> usr/include/linux/atmapi.h:29:25: error: use of undeclared identifier '__u64ptr'
      29 |         unsigned char _[sizeof(__u64ptr)];
         |                                ^
>> usr/include/linux/atmapi.h:30:2: error: expected ';' after struct
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |  ^
>> usr/include/linux/atmapi.h:30:19: error: unknown type name '__CHERI_POINTER_ALIGN'
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |                   ^
   3 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/atmapi.h:29:25: error: use of undeclared identifier '__u64ptr'
      29 |         unsigned char _[sizeof(__u64ptr)];
         |                                ^
>> ./usr/include/linux/atmapi.h:30:2: error: expected ';' after struct
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |  ^
>> ./usr/include/linux/atmapi.h:30:19: error: unknown type name '__CHERI_POINTER_ALIGN'
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |                   ^
   3 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
