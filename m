Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9B3B9956;
	Wed, 16 Sep 2026 05:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535295; cv=none; b=TbnihpSir7Pt0CtuZlyVLPPB0burliUSN+5IOEWA9OqADT2nmVGImpS4BBEYRY1/TMc9zY7glwuMVfNGJX4jlJxd1Mz7Y1bBxRv73/T77kWtnQ5+5+/UevPRPgBwYW1W0SRxIvMYvm0wkXDkPMiAlWAXGWWCWv4uStYOneZVx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535295; c=relaxed/simple;
	bh=/GBGt8QdgyZY2iA+APa8LrCCeKTTOOYJmxzP5034aKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BXdhvsgrPlEV8Jsx8SdKIMKd0zVaILlHkAhHRqIOWk4mEZtdnghyoJNAowwsTABfGjOPhTx3KgAg77AybHwg6tfFInAAsW0MGuhMbGty++DztmFiOlZMIMaFt+oWhM8oKzm2XUYZTiVvlfJv1uYQhNvtUsWg6fPpKGMstZgWorw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PccDyh2J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PccDyh2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789535293; x=1821071293;
  h=date:from:to:cc:subject:message-id;
  bh=/GBGt8QdgyZY2iA+APa8LrCCeKTTOOYJmxzP5034aKk=;
  b=PccDyh2JWpjCpbiHHKrrIWG/FkXurn9pxC+BDQxr2uRZUmClWw+oM7wi
   mkAGgembxTIc2PXMqAH9hkQpRwNoZNK9d2VjJ6dD4JJ1u39BOW8HQu4Of
   tFazJwNi5nRQYA4s3eTDiSBybcrz0X5i3QR/J3JLd0ykV68pqKXNRKghO
   wcRXJgKqNIK7fRTXyHdaDiJ3zhacDqTrgCSwHg9GbxaUCu4DkvtpDvty5
   K3W9lQcSkulK1xI+9oIKWsT7pDdbh/GX4D4aqt3bqUPoXk+enLd6LxX/F
   t/ckARaMgCy/w/p+HCSfCPS8T74mM5zNoJe7fwVCeHeMThUno27b6oc/V
   A==;
X-CSE-ConnectionGUID: r31WkD1CQB+T72fkUCyBgg==
X-CSE-MsgGUID: 9wbmeupmS4mxWcv4pYRVMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89930586"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89930586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:08:13 -0700
X-CSE-ConnectionGUID: HPcmTbRKR96XENYcLKJBpg==
X-CSE-MsgGUID: X1saghMHToKAGdSs+B7njg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271445696"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Sep 2026 22:08:12 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6hsP-000000000wB-00tw;
	Wed, 16 Sep 2026 05:08:09 +0000
Date: Wed, 16 Sep 2026 07:07:03 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-tdx-efistub 1/3] ld.lld: error: undefined hidden
 symbol: __fortify_panic
Message-ID: <202609160637.KQSd1lnI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-tdx-efistub
head:   dbd995955d7cd3afb151e05449c3571295cdef92
commit: 43b4de908d8dc65b83348c0041d879c420ed0536 [1/3] x86/tdx: Share tdx_panic() with the EFI stub
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260916/202609160637.KQSd1lnI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160637.KQSd1lnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160637.KQSd1lnI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: __fortify_panic
   >>> referenced by tdx-shared.c
   >>>               arch/x86/boot/compressed/tdx-shared.o:(tdx_panic)
   >>> referenced by tdx-shared.c
   >>>               arch/x86/boot/compressed/tdx-shared.o:(tdx_panic)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
