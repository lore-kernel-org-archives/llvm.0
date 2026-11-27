Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786479;
	b=A7Q/8dksOPMgDJZRr6gairiksf8MjYGOAbUHOLtaYWqJdL3jVWTurpSXHoo3y7H7P5nD
	 eDQ9pZiCKxyXKymcw8VMGdbaql8EJ6WFJEtkvdHK7TlntxZh1hgRMCUYMRnuQq3MDBVH4
	 VM4WdimZbur6wY+GV6XUuNxHQvb2+SoWaQcdGsCm9HqdhKKhwYkdRyyG9GyMlIUr28NXD
	 DPJER4C2nDgH13cVX4bJv6aX3UOzHEpCR0lIZa+FAHgprJMnHbdlarwnPbqL7u7K17OPk
	 ZWEE9KOD2p1Vdp+Tb8UYNy+s+6+tm/He7UtNtELAx6RhVNgfd07diqk2AXE5lxe+xZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786479;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2SK1Xgbf6fyj1hdX4K1PB4cnKvLC5vu/Pgi2aCMB8is=;
	b=RZpX588yVuDRUq531Zv6Kfu81F50VeTSmK92CbvCwSzxU5h1or9QnUUWOMKrK96GB14S
	 KpeKL51zUfGoW7aNqtA5nFwdZ90FJzMVGo1T2BUJWVXEEQdhwSQBJldd8Z1kJqS/ZPU5o
	 BcnJCItUqwPwwLa0uE9XFBteAki8Ln0CIBE1y6ZsaDBozjd/CGtdPdxeE5PaiX15mHImG
	 u5qJU5x84hDA0ORcXAp68FAKI6KB863/85Yw8qzjoKvkdwwPQm/nuaDKfQroBpHaqmYwA
	 PexVX3zF0nGsVpSpHLUizH+dmRAvh+IVbRx00e7voUquFMh/UV13KuOKVRkLxdBhc/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YAYgIpi6;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40940606A323;
	Fri, 27 Nov 2026 13:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40940606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YAYgIpi6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795786479; x=1827322479;
  h=date:from:to:cc:subject:message-id;
  bh=IOXUtQNmfHlpd9W66NXKEWCS5XcE25gMYMutlohsmZo=;
  b=YAYgIpi6rLOPElZ8tKUf1gl56c0iGsMh4I7JXoHK2pIKsvW+ebjRr1Yw
   Oph21PEaGcxS12M3Q8X8UbGqSp/UmR82VvopknNOlSVjWdkRqXTJeLnOu
   FoN2YGTwsLnfzVmo0lAVLgjsMFRQmk0nYrYuJYcTTwVpMX/INs3NH3yHH
   jSoI1m0bY0uEDf+fr8mvkQb+/jzQoZd/WwOJ7RkFsJqfaiLMx+uG+ezF5
   hluizcIGJFZePGJnYNl3ScCe8C+GqaGwiLXHCMgbIu5L1wAQDRXrF1YID
   KAdVXmjM2PrKelr4ZrEkEW+5spaJQIW+WvLHdFNahPuK+nyZ7PsmbauPb
   A==;
X-CSE-ConnectionGUID: 0cXlSqvLRkGdD58yMqXmSQ==
X-CSE-MsgGUID: Ca0JlNWkSZKLs3mXINj89Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4704695"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4704695"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 05:34:38 -0800
X-CSE-ConnectionGUID: WECBWC3oRoapoGDmhNcaqA==
X-CSE-MsgGUID: G+p0duVoQUS9eH+1pbiz4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12916792"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2026 05:34:37 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWw5z-000000000CR-1YKH;
	Fri, 27 Nov 2026 13:34:35 +0000
Date: Fri, 27 Nov 2026 14:34:34 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 19/50] 19 | use
 crate::error::to_result;
Message-ID: <20261127142830.dn5dzTxW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: 546597bebe363b65904233afc69ea24b1983bca0 [19/50] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-randconfig-2002-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127142830.dn5dzTxW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127142830.dn5dzTxW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127142830.dn5dzTxW-lkp@intel.com/

All errors (new ones prefixed by >>):

   warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:19:5
   |
>> 19 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
