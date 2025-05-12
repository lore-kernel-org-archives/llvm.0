Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516BC64D;
	Mon, 12 May 2025 05:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027782; cv=none; b=BVhDAMhnx/PlUW96ZxxpEU9EGlzi917xXMMpOcCOk4szx5Pirt5cul0+cQnl24i/df8EFiURb+4vnB0XQSmFbUJJt+Drtd3oaBYL8kbv4lkokR287/SY0RZ9zAJ8CMjjb3LZl4Qb0ESfjuoe1Hrr65nyS+XmwqnBvO91jqFJ83U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027782; c=relaxed/simple;
	bh=/nfN9aKGsNACNNpw3B/2A6OdAxxurnuETdQZ3fHNOQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GzxQhTl1oU3T5I+fvOuxz4jZfKU3BpsOY+LBoIENFg3P3wDL0oiX4ysydrNMEEGhJ75B67CBXclOsOyIOh2JRL4+koxZZRqiB72K7epCUASb5IKplA9KTlZHABzmvWhjYJ9vlZeFmDPiNYcWS+wMKe/OrvcRrM8z4Ck7vnX54Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMoulTsb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMoulTsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747027780; x=1778563780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/nfN9aKGsNACNNpw3B/2A6OdAxxurnuETdQZ3fHNOQc=;
  b=QMoulTsbrthKTkve/zA48PerOi/sxCOb7ydwph+XJk+GFAMCEjPB4LWj
   Co0GSgelzky2mCdVuaH21TujjxchBbZ3wls2K2baH24imDNuBgB3qKcoQ
   OMJlh6OuFENzO5SbZKxeQjHqOnL/a09XFWC5ISNanF9rsYpTdKy/9+G7N
   WhuY/cmzHXJA8iuuMubZ8/IwIJFGKOAy7HPYhHtSPKPxOvEQqtBGfYrNF
   /hNu5+iNxJZnaZpKX2aTeNj6xl1TgHBco58vg0PRCza7Y89OcKEzbLuEr
   GbrfTuN/oWkF/VbeU1PDzpV9axETJ6+CMSGp7GmybngGnbGcS+BqtMNsa
   Q==;
X-CSE-ConnectionGUID: 083MpJgZQhuLsc+cDHw8OQ==
X-CSE-MsgGUID: dpZKC4EuQNGsraVIMGY0FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59440219"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="59440219"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 22:29:39 -0700
X-CSE-ConnectionGUID: IpRibGUkSui/m0mznbdovQ==
X-CSE-MsgGUID: ptYMUc5cQEuiVhqGqwWd2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="168199309"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 May 2025 22:29:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uELjL-000ECV-1o;
	Mon, 12 May 2025 05:29:35 +0000
Date: Mon, 12 May 2025 13:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 94/99] ld.lld: error:
 duplicate symbol: hsmp_create_sensor
Message-ID: <202505121359.IvDzAbhN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   d5251eef71bab8bd0b9ea3fe0005ad3d2553c3bb
commit: 8957cb9cfa76f95aa05b1da514de9b82f04b5a07 [94/99] platform/x86/amd/hsmp: Report power via hwmon sensors
config: i386-buildonly-randconfig-006-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121359.IvDzAbhN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121359.IvDzAbhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505121359.IvDzAbhN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: hsmp_create_sensor
   >>> defined at hsmp.c
   >>>            drivers/platform/x86/amd/hsmp/hsmp.o:(hsmp_create_sensor) in archive vmlinux.a
   >>> defined at plat.c
   >>>            drivers/platform/x86/amd/hsmp/plat.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: hsmp_create_sensor
   >>> defined at hsmp.c
   >>>            drivers/platform/x86/amd/hsmp/hsmp.o:(hsmp_create_sensor) in archive vmlinux.a
   >>> defined at acpi.c
   >>>            drivers/platform/x86/amd/hsmp/acpi.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
