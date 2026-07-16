Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A872F7EF1;
	Thu, 16 Jul 2026 00:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784162002; cv=none; b=ewSR0D/3KSNOlN7YeyIR3oJy+U+V0+3FfUjsMUdEZpGCwWgIKpmYriXKyy8S9kx18vQ81VE7Meoc0bhvcjKhgcLZZRjcQFZ0zrv5SO+4skMsWvaSP0HIKMTLQTF3M1rR938wQHaY2Z16UOEY3HHRBzTWC8a2zbEp2khhPcpdz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784162002; c=relaxed/simple;
	bh=Hpn33NAhjjQ8wbH5bEK+nuLCZZA3wdU6If++WssDAZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g3znyZGdGagfUmJj2WBEnRNstelekIACaqSboqhalsvqpqSsBBUrV2RS5OzXXnrze14Uf/nGAgW/k/wTCl78maNDoxRXHMOKXxaCNrp9f9GKH/LiffmgHUXVNGomxuqg25ryKoOa7yTzO7l0CvEwGkTkTBLTLuPQ1EL3OMvcL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2b/vfjJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2b/vfjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784162000; x=1815698000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hpn33NAhjjQ8wbH5bEK+nuLCZZA3wdU6If++WssDAZw=;
  b=G2b/vfjJcf4K13EjaqS7Iss3T1SZwOoaCn0Y76XmEUc86zDQiTlF980I
   QmgUrlVouk240xNnc/VTTpFEId738ek0f7m3ow+u0Ix5rvCQeunTpaTG5
   gTrNHdLaNpb5s57xifxxQPG1J8NbMgbsy+w8pTj4DfgNXV+CPxBTUVwTa
   cMz0aS7EBURoEE/rH+9Ni6h6pnm6QTbL3iaTGq9D92eIU3ZVJFABOgqlv
   5FaJSv4M9YwjSgYrNtKVXAffK3DYexEJXpFK06s2ueuj5t2epzOQmuKzH
   NI5qrhRRUlzJLqCqF329f+vmuHK2aTeNtEgqD8lgVzNSoaWEaKUWvN8mg
   w==;
X-CSE-ConnectionGUID: yI7xoGfOSG+c1irWcT7vTg==
X-CSE-MsgGUID: Y7g/e4vGSKuwOmOORtXwdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="87361311"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="87361311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 17:33:19 -0700
X-CSE-ConnectionGUID: EJd/NRQXSHKVNODw29TSyw==
X-CSE-MsgGUID: rKRQSY/LSra4kvbNezjj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="260650132"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Jul 2026 17:33:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkA2M-00000000O9R-1taG;
	Thu, 16 Jul 2026 00:33:14 +0000
Date: Thu, 16 Jul 2026 08:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 79/96] ld.lld:
 error: undefined symbol: HRTIMER_BASE_AUX0
Message-ID: <202607160754.kr56lQe2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   aae9c6fcfe1b60e4a63da0fe64f8ffe470b0fa29
commit: 69bfefa1c9bf52492df144e6ad0daf86f82a3727 [79/96] DELETEME
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260716/202607160754.kr56lQe2-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160754.kr56lQe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160754.kr56lQe2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: HRTIMER_BASE_AUX0
   >>> referenced by hrtimer.c
   >>>               kernel/time/hrtimer.o:(hrtimers_disable_clock) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
