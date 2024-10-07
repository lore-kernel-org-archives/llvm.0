Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F976101C4;
	Mon,  7 Oct 2024 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728300950; cv=none; b=rlEh6mSqg8mz6nk9f5x6+Vwn3epC/fsMfmjunAqfS0a/GtO/k7ywfThL595WM4T9A+5KT3JvXC/M48BPm2VHMsDDUol5sigL4N5m8eSx8QabIJilsZ9RqNR5dPvZkGtd30gwzhBIC/VPdDICoQYnhN4XPVvDGUNu8qkVXhJ7InI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728300950; c=relaxed/simple;
	bh=bk94yNr3SkJqcl81PUx1C+bptsWpnjkREN99Nty+b64=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEGApG0OvY8Y4C7dvIAsdvvNaX/qZXXjZMxYEnGthUn8AXFufsU8AYOOd2/BrzaBue5zV7vUTfMOiXl+KjW3k7ICWlyhCv2IpAk/zk583Gs1tNH9eyYT4sbn7vzWHq1MC+hXsqDT50MsL3hUqt48EH/4YA6uzIsFdqSMeAuxx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mbqj0nVY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mbqj0nVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728300948; x=1759836948;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bk94yNr3SkJqcl81PUx1C+bptsWpnjkREN99Nty+b64=;
  b=Mbqj0nVYaeqsijyUPCUIVt799+9WF5WfYxcLMY646n746hdosMZ0OF0+
   o9x+4QCFCEMntbuARSyJYV7Xo98fKi34F8Odu2tQiy3avdWQbAd1sGlU4
   qMRWOAz8qsaEyEYCq81uZqkxNA9FRQCNx8hQnl8uM3ydJbgVA32uG3EDz
   pKYv6DCngBeGUfclBifgLcR7b9GiIpNuE4bhNJ+oWVJTSAM5FDr6TdYlW
   DL+syoaWTFulsKkWNpndWotWTn3AVGWuyTF5+3+rFWGyYgc3MsDt/UO8u
   oWqsfuymQa044h6ZWWf51QTf5flUVlsAyKKjGnsGDXunC4efDTSHU0JTR
   A==;
X-CSE-ConnectionGUID: vFQtl5+LS8OHXjBN2pfuXw==
X-CSE-MsgGUID: 5uvWEWusS+CynOApBo7Psg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27254768"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27254768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 04:35:47 -0700
X-CSE-ConnectionGUID: GCP40wquTNSxOMC4nRRt0A==
X-CSE-MsgGUID: LO2qCuRcQs2kS0QJWF5ctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="106196766"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2024 04:35:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxm1f-0004vk-3B;
	Mon, 07 Oct 2024 11:35:43 +0000
Date: Mon, 7 Oct 2024 19:35:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [asahilinux:bits/170-atcphy 4/17] ld.lld: error:
 vmlinux.a(init/main.o):(function __traceiter_initcall_start: .text+0x50):
 relocation R_RISCV_HI20 out of range: 534214 is not in [-524288, 524287];
 references '__tracepoint_initcall_start'
Message-ID: <202410071955.WeBWeNeS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Sven Peter <sven@svenpeter.dev>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   38baa13adce4ad51eb53f0d18206d12db085daeb
commit: 4f5b8aa35e68a33a1d20b6ce62014794768af7ad [4/17] WIP: phy: apple: Add Apple Type-C PHY
config: riscv-randconfig-001-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071955.WeBWeNeS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071955.WeBWeNeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071955.WeBWeNeS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_start: .text+0x50): relocation R_RISCV_HI20 out of range: 534214 is not in [-524288, 524287]; references '__tracepoint_initcall_start'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_finish: .text+0x96): relocation R_RISCV_HI20 out of range: 534214 is not in [-524288, 524287]; references '__tracepoint_initcall_finish'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0xf2): relocation R_RISCV_HI20 out of range: 532327 is not in [-524288, 524287]; references '.L.str.24'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
