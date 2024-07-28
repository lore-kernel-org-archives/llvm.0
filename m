Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28027462;
	Sun, 28 Jul 2024 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722199645; cv=none; b=Fs+Au22QR5CkFC/j9Z+c4qRNKOhWcMW+HdhPDuqQQqnwJQbnIn2+BDaBMKyaOxCEJ3Bm90nNpP6Dz2mvkq6e0Jnp3eY6XhOUOWI7nLD0bZmeHJcnuang4W4O2G7lW4imJRyuSyRtPgqo62Jn1rU/4e9ezPlTAhYNJs1lnaKDuzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722199645; c=relaxed/simple;
	bh=UUFi6jiMFfvL0XWnhOsW/J/UxlqS8VWFY44Q9REXlEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZO0TB0GkiP8LIbPuU7ss+n/Rk4pa79invEmPaw9OrNfmaA0N1oBjTw4I12rvHNzia5Eu5aziJ7EmoUYUnjEPq9zSU9zolVVT/KrYIEegixV+GiiXhfueZWU1o8z4tJkBJHL68hKtw39pJOaJw1Z1d2rBVP+kIfWBDUA0c9yd20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jj2xxQhb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jj2xxQhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722199643; x=1753735643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UUFi6jiMFfvL0XWnhOsW/J/UxlqS8VWFY44Q9REXlEM=;
  b=jj2xxQhbZZiYj8xQ7F/fVPf5BKXmwjhFQPxOOEmcRlp2LRWbCIxCRZbh
   A6KJsSI0PScz/GvPNiPCRa4n2ur9OemB+YRsxImMyJH+HaBmhTbJL8JWp
   YAmHAvZEXGKDBPeAs/Ur6BAqgmO4WQTCZ2gOdUwN87Ek6+Bwp4gIpq8Rd
   ienXXjr0ZCXZaHClHeLw33G+dPxrrL8qAKihXXlvr7cIWuYlO0jUVP44p
   UDupnrS+lnudJNpY686jDT6m93lOJdaq8RfyWPkl1UQQClqAoM7H+8R6L
   8UKx9V1ycG3ishrKI51n1ShiODNwOBVyuZgD+pcZ2cEpTuaHjDMLwEuBB
   g==;
X-CSE-ConnectionGUID: RvTaGRFdRcyppxm13zx3QQ==
X-CSE-MsgGUID: TrODWi9KQDy35ul5m2mj5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="31338570"
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="31338570"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 13:47:22 -0700
X-CSE-ConnectionGUID: F21C1DOIRSOFxRHcZcMzQw==
X-CSE-MsgGUID: L5YQsrCuRUyGbrSrhWYTIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="53716762"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jul 2024 13:47:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYAnX-000r8o-0H;
	Sun, 28 Jul 2024 20:47:19 +0000
Date: Mon, 29 Jul 2024 04:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.6-dev 282/297] ERROR: Input tree has
 errors, aborting (use -f to force output)
Message-ID: <202407290414.8wyOYC9H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6-dev
head:   89c2aab123595625ced4d7e7b1c66822d503ee2c
commit: 370689558ac9370ca8ad49fa143da77c8aba4ef4 [282/297] arm64: dts: renesas: r9a07g043: Move interrupt-parent property to common DTSI
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240729/202407290414.8wyOYC9H-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407290414.8wyOYC9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407290414.8wyOYC9H-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smarc-som.dtsi:139.10-231.3
   also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smarc-pinfunction.dtsi:11.10-132.3
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
