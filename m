Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771553D994;
	Tue,  6 May 2025 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575007; cv=none; b=LMnGMvePfSPG2f9ijQ+cN2bbe5cXWG5qRxpPgWPJmyuwxbOqTPSlpCI6Hlk3dK0oAnqFXaJlr+iCfTkV4SEd57X6Zw1xrzifUHO+zcUtwefKrWDAb7siUCrTO49NvgeHGGniISbT7HAbxR1AaTexkigPtyto/2jHxjlk+i179RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575007; c=relaxed/simple;
	bh=HrwlCSbJxv5DjArbahiDnGf3mxYBeVnGOUEOq2uKMgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlnUy8Pmesz+qlJQsMaOmU0AH4ei4xUrx8O2fUu+NF1AJK2H1WRgxO98YptHVRAnvWwceyFTYHmX0RWvzPpBJy+rIAVeDDSzT6D2YTcUZWk0xNPnTlK0Hw5DODEp2EttRDRv5bIG+J3PS3MB6WKnUAeWOexUMqV5meLcqrA2ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwDAWF2U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwDAWF2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746575005; x=1778111005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrwlCSbJxv5DjArbahiDnGf3mxYBeVnGOUEOq2uKMgo=;
  b=EwDAWF2UDAKv1Hy6322IneObBdjDc2/ncpmjdQMVxWqJDdCkoggr4qFf
   tvPDPxJu+2zfH59uZ2nV75uvHdRZzuBLVxVspLgNVpnBDbidGS5+8UoKV
   XPYho6WLxgnn+09QdNQ1H37StZqOqnxAMPdK9rdfDW3WD0frMXZqddahQ
   5KQX3XJ4KQqZ6ZL/kNmOPDXXuWDQzPL1W7+T67v3/i5hqGJCuHtfWKkcZ
   7+4t4wl279OXsyRS3lRQOCfP2BhAUWIu7tqybIOz2+lFXKbFnzxjF5Y79
   Yt5e6BxCFxRQxLuntwKxY1M6Ek9OXLhqYNX+yM1NzhmosmZFj1JxrROMM
   A==;
X-CSE-ConnectionGUID: HSfTPQYnS4ix/8IBCMnP2g==
X-CSE-MsgGUID: /X+UXGLuRM2vZFjEWquZmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59262799"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="59262799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 16:43:24 -0700
X-CSE-ConnectionGUID: M8jOJpX5QmCPQXmGOJBe0A==
X-CSE-MsgGUID: tcE55+YJQc+/AYfYsY+JWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="136288905"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 16:43:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCRwW-0006vn-1G;
	Tue, 06 May 2025 23:43:20 +0000
Date: Wed, 7 May 2025 07:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers
 during register allocation in function 'hyperv_flush_guest_mapping'
Message-ID: <202505070733.osOoFQSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: cacd22ce69585a91c386243cd662ada962431e63 kbuild: make all file references relative to source root
date:   6 weeks ago
config: i386-buildonly-randconfig-006-20250506 (https://download.01.org/0day-ci/archive/20250507/202505070733.osOoFQSe-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070733.osOoFQSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070733.osOoFQSe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping'
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_guest_mapping_range'
   2 errors generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_get_partition_id'
   1 error generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_unmap_ioapic_interrupt'
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_map_ioapic_interrupt'
   2 errors generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hyperv_flush_tlb_multi'
   1 error generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_post_message'
   1 error generated.
--
>> error: arch/x86/include/asm/mshyperv.h:108:2: ran out of registers during register allocation in function 'hv_query_ext_cap'
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
