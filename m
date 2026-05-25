Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAD30149F;
	Mon, 25 May 2026 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729921; cv=none; b=BdV7cAx+F9J2aYlWHwceZ0NnSzBzWwheh1Wzz6q0zAadTr7P5BXH22sfx0zmy8T14JX/wnWK55SSyDWBfT2tvfEqIZkFjCWUjtMLBbdPpuSDNGUi9YSKNLVvsoZzvluMiG/Mkkg3sLMZpJwaMBKgizeYxHrEEpUOCGfFbHCruAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729921; c=relaxed/simple;
	bh=DjzYQkJI9q+buCggGLXcTVtkSSzAbctB14Bq3ZurYKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jUZhSOWCZqzLgp+b1EY85mpAZwkaeq0ODAYbY5kG0QLKBg7BkPWySVlvxqIvE0qqmNdExnosYnjFGXEAgWgACeAvrIoa0hl6MSYLDxssDQdESlX8OMaMu9VwUhRksdtig4pZM7CmIZoxF63EDSgPq3KvYuN6Mjd1jdj5Wpla7YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyxL+WTs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyxL+WTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779729919; x=1811265919;
  h=date:from:to:cc:subject:message-id;
  bh=DjzYQkJI9q+buCggGLXcTVtkSSzAbctB14Bq3ZurYKI=;
  b=kyxL+WTskaKSa2Id9HlQHcSXv+d/lg1Q7Nos+hixQXORXJQGFI0UhCCM
   wOBuMcgX2z5iVp/tiFSbVQL0FgDjygOacL3aDWP+3QiytSAmZUc0h03Dx
   4aDZAutzN6Xmmco7JtCGVgrKWi4Fk9ufhMwBwUueRXy7xYylOnSoaX6ON
   8uQLOjxCmjF99oCe+poTEBzOa3e9DDj2vXeUwbs3YaAK/ZI8zZ76NGvpU
   5nsSG2v3hUp8hRobsQvyQlX6afoUyCOYfinDaB6EGn7jicmVrcBAmgkfI
   fnpUpSUNeB46A4ePioa0hw/0qzhjLicWww1RFkXdzbnv0qZxyp4BNUl+C
   A==;
X-CSE-ConnectionGUID: IsyOO3CpSXC+ZEdV/wzH1w==
X-CSE-MsgGUID: BIL6GEAtT9OED+eE9SLPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80608034"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80608034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 10:25:17 -0700
X-CSE-ConnectionGUID: kIT4GOS4QFSIiHVUUMfzGw==
X-CSE-MsgGUID: Mzty2ISvTGqMojlPCQIWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="241507860"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 May 2026 10:25:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRZ3B-000000001hY-2tWE;
	Mon, 25 May 2026 17:25:13 +0000
Date: Tue, 26 May 2026 01:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: vmlinux.o: warning: objtool: csio_ln_fdmi_rhba_cbfn():
 unexpected end of section .text.csio_ln_fdmi_rhba_cbfn
Message-ID: <202605260130.anS2FFur-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: 11bb4944f014d756f35261f5afcb346901ef1efa x86/bug: Implement WARN_ONCE()
date:   6 months ago
config: x86_64-buildonly-randconfig-005-20260525 (https://download.01.org/0day-ci/archive/20260526/202605260130.anS2FFur-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605260130.anS2FFur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 11bb4944f014 ("x86/bug: Implement WARN_ONCE()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605260130.anS2FFur-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: csio_ln_fdmi_rhba_cbfn(): unexpected end of section .text.csio_ln_fdmi_rhba_cbfn
   vmlinux.o: warning: objtool: jme_check_link(): unexpected end of section .text.jme_check_link

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
