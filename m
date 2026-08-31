Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ABF3E8C4C;
	Mon, 31 Aug 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164789; cv=none; b=rygbcz5QBRUbirOKGEIozqIcxlW2pZbxqMXaPaicZK45F7C2TDorfohKZcEzu7lAjR5qWu7toAHwhzZRSW1XQiss0oN4UF68ez0+YIMLHZhhy8BUCYc3N2XtNI7sgiBdLZU2NpGBxViVUoQRS79CbEvnZ/SqSCP1owGiowm0b4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164789; c=relaxed/simple;
	bh=yr3/bgbzKbQnda7whRxl1LSe1T1PZ5WfSnxLiPpCFK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l5J7jGE8bDvGaBR75Wg1T4ycIpIJLv64b+Le2U0J4uvBTEKBjoy1QDX1zCBycSZtgqTZRfD84AaftoVReF33r8/i7owDK/ZGtNq85YoFHTj5cN7EkKiEq8wcrUO+7373yo2nDKjX9osZnTFwPDLHz2j5lAdWWgQUfkNUdTsLzzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg+o0BOO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg+o0BOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788164787; x=1819700787;
  h=date:from:to:cc:subject:message-id;
  bh=yr3/bgbzKbQnda7whRxl1LSe1T1PZ5WfSnxLiPpCFK4=;
  b=eg+o0BOORsXjS2FkjlU+zTsypfID/OsSR8pifs+dpnWNmTiwj8P1u1+q
   7j6muksLfCexUkObtbN10SGi9rsCOrQHNStIGTq35MBE8EAcFAvurCFnS
   jr/TciQoJKIA0Lm1oMphR6Izrq0ILLOk9isMGYLWhlzr0QaciLimYb35j
   nBlq1tsLkGf8o64uyC/GBBiHKq86zhY9Y4ldW4CK3Fgypr8cCznykRy9z
   avRgHsqXzYfOVwQe7DDyorDa19hjrrF1rj7MhUPKab6x9FI83riZwSkqL
   UiliuSfua2ZpY/UicpB8WzrBEOhbEKYaSa0dzy2ZRUAJIA/S0kUVd+Xtm
   Q==;
X-CSE-ConnectionGUID: FIJ3AxWOTl+bSXxMoZjMJw==
X-CSE-MsgGUID: SintIo0uTeKL5S/A3IZdbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99227263"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99227263"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:26:20 -0700
X-CSE-ConnectionGUID: sAgLsdTTTQeoNsKv8VBMxg==
X-CSE-MsgGUID: MJr1G7wgSKGoi9tk0YSRlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268177988"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Aug 2026 01:26:20 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0xLN-000000000A5-0825;
	Mon, 31 Aug 2026 08:26:17 +0000
Date: Mon, 31 Aug 2026 16:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/16] Warning:
 drivers/pmdomain/core.c:975 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202608311406.5c4U28Q8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   44bdd75571a96ceb874d46fb943d85c205361d6f
commit: 03b2661310696159c42fc15ba51830ec343b604b [7/16] PM: domains: Add a flag to defer power-off until all consumers probe
config: powerpc-randconfig-002-20260831 (https://download.01.org/0day-ci/archive/20260831/202608311406.5c4U28Q8-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311406.5c4U28Q8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608311406.5c4U28Q8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:975 function parameter 'one_dev_probing' not described in 'genpd_power_off'
>> Warning: drivers/pmdomain/core.c:975 function parameter 'one_dev_probing' not described in 'genpd_power_off'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
