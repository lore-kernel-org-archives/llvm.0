Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2EA38239B;
	Sat,  9 May 2026 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778316086; cv=none; b=GU/dr9ng356mgBjt1p66O6aETSe3ueGog9p2QqRUOiQd4RSKSfxH5eGDP2/pCcw11FhMzKp7PBBo5GeH/cBrAQkwR7pWcPANO13BgbkZ8ooMXMt9G3tpy7iu7fmUWgRfS0WCk1t/tczOJeIo6iD/UuuaVDyfjjbOZbLc3nZhI4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778316086; c=relaxed/simple;
	bh=E1p9oTTSxAEyiH25baFedS15UnN493owKi21bsR2HkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QBVYXM0mGWkSkkoLcJ6PRwCyaQHtk8yiyj9LQs5D+XMzCTplHHgjTR9mV/1ho+S4YEulg9uX6i5BU6moZokWC8NsWKromfLz+C+q805Yw4UtIccdqTsIqWMqtY5io4oKdVMJygenc3Uk829cTiOaJqgjnewiyJriEB7PsKRMfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaBcKP4f; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaBcKP4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778316085; x=1809852085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1p9oTTSxAEyiH25baFedS15UnN493owKi21bsR2HkI=;
  b=LaBcKP4fbQW26xDF8NfLeHGHM/KSxkd4WGaJ2cxpo8wqmGoahSYsLgDq
   USNyBtKvOTbFlQ8muGQsWmKbv4Ae7+k1/1uyAhRPC+t29P4YY5OBaedMV
   03kTjfxiqP6DAtZgvjvcEHPPh+Qzo0GvfA7WnIdWMKbGkycBx6qLVB++f
   K6l5yPlKAF1DBO7nbhV5XhPay5TSwLM/dvCpLy4NZZRtxBod8ZjTUIVYK
   EcGRxpMEGTNID2r7SfcoB1+wQfEjuNPN65bCdtaxkrM4p+hvJb9s3jH4n
   vKtp9mdk/TeoywqbamAhTygW0fyohCTYR9miGzPdZlBs3rcBWKJ36VVNq
   A==;
X-CSE-ConnectionGUID: 17JwhfbWT1CcaLGzam1ceQ==
X-CSE-MsgGUID: U4ilxx1RTHyxiFQGXc13dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90748563"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="90748563"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 01:41:25 -0700
X-CSE-ConnectionGUID: KZNRwdIURgOZzJDSuEvzJw==
X-CSE-MsgGUID: gbGWCraMRMuLlaM/KhcWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="237087464"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2026 01:41:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLdFQ-000000007O1-3cBK;
	Sat, 09 May 2026 08:41:20 +0000
Date: Sat, 09 May 2026 10:41:01 +0200
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
Subject: [axboe:for-7.2/block 1/2] ./usr/include/linux/drbd.h:18:10:
 fatal error: 'sys/types.h' file not found
Message-ID: <202605091052.obLlrWgB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
head:   8098eeb693c4cc4e774c62fbd4875197cb5578ce
commit: a54f499838292c1768f6575ed1ec7cf35f1b6489 [1/2] drbd: move UAPI headers to include/uapi/linux/
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260509/202605091052.obLlrWgB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091052.obLlrWgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091052.obLlrWgB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/drbd.h:18:10: fatal error: 'sys/types.h' file not found
      18 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
