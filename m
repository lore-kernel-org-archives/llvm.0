Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC972622;
	Thu, 11 Dec 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459928; cv=none; b=bkM1FZKnFv72VikYLMU0FIJ8WNTNL+E/746sXzO21MoJneTn0iyPpc1PpIQG8OsmmfZVm+7Ppy3s13ohYEcziFJHq+C1Dq2GEVtcwCdEAGTwqwGo5oyeoaDafINTQ7t8XZYqee/3VOJ61kQpt8Z0iJPuoLIRrvxzMdSlqqdp2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459928; c=relaxed/simple;
	bh=0oE00T8cEder3OO8l9MGY0x/su/VYMkaJDFv7hAHgx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Guv/pB4vmVF1LBu2rWh690EZpmL37ZjTxNh7EHKOvlQrQy0Mz3vVg3Adb40vaFFlR4O8vn2cp9ssASbAXaVVBEKf6nH1++kIv6QzlCo4ejrBRN/Uw4lqCOoP9TTUYq5+5hE7PgmfhMkgU0XwVc+7yrXK+wsTOGg91IY/gWCbmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4sYsTW9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4sYsTW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765459928; x=1796995928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oE00T8cEder3OO8l9MGY0x/su/VYMkaJDFv7hAHgx0=;
  b=g4sYsTW9uvpMJ0ngHkYb/3f2QPa+j4FuZvz/W+nNqdIS+WmgMT4al+rv
   DJeTijhW4fLSXA0LlIHA52lTVn68Li31mX49AJp01qNni2LyopELj4ApZ
   KgvRNuHRt08CCKaAajhayHRwIq9RsimP1Xau/1v8xAujJI2SyZmm1lvCR
   9/1Npn/tK6GOoqsjJB9FpLTezKLWx8flOeYwAc3buH00j+38fF1llsh57
   LGgAFLnjWA/DHGUxcM+hcz49Dq+vJQDrs1k8Rgg+KQCspBPc7jTOA75IR
   yu50HhftQESe9xoPaL6qd+SEk293nVUU94Qt9bLf0aakA79+uGavgFCQy
   A==;
X-CSE-ConnectionGUID: VuSS/iySTGizMuB//DBC3Q==
X-CSE-MsgGUID: IG/CQ4PbTIemUbT7PmTfTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67398059"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67398059"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:32:05 -0800
X-CSE-ConnectionGUID: QJ3F+vlERGWJrglXq0s2Wg==
X-CSE-MsgGUID: 7c5xt2PNT3mZBS9R7VtlKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201226361"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 05:32:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgm1-000000004iH-1oHm;
	Thu, 11 Dec 2025 13:32:01 +0000
Date: Thu, 11 Dec 2025 21:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 12/16] drivers/reset/reset-imx7.o: warning:
 objtool: imx8mq_reset_deassert+0x39: can't find switch jump table
Message-ID: <202512112128.RZYiXRMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   a8811acb11ba01eb88a548d40735773355424255
commit: 3ba70776dd9c02b64ba2b9dd8541be5da1126f4e [12/16] x86: Use PIE codegen for the core kernel
config: x86_64-buildonly-randconfig-003-20251210 (https://download.01.org/0day-ci/archive/20251211/202512112128.RZYiXRMj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112128.RZYiXRMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112128.RZYiXRMj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-imx7.o: warning: objtool: imx8mq_reset_deassert+0x39: can't find switch jump table
--
>> kernel/bpf/helpers.o: warning: objtool: bpf_bprintf_prepare+0x23a: sibling call from callable instruction with modified stack frame
--
>> net/sctp/socket.o: warning: objtool: sctp_setsockopt+0x1a1: can't find switch jump table
--
>> drivers/tty/serial/sh-sci.o: warning: objtool: sci_set_termios+0xf5d: can't find switch jump table

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
