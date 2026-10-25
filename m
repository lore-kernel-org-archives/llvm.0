Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895903;
	b=WNzKZizzNXfnC/FIUNaB0gff6dS5nYYFCEJuRJMMPAdbPvPk2iSHdVV3x+YZ43bwr5LX
	 TAi0sJl+EVi9uKb0k49GXAcxFoq0fz3D+JVsPZSDXhAmyg4byTYRYpIF4jCN+SUxtoI3B
	 2m36LXqqodaCysT1FH6cFg48rjPHapaVLV+1ZV4WzdR1gAuNLSjrA+YsciWhcgnyBsU+N
	 VzUiWU+euAwhl7Hv1GbHFpP8129K4j7CCQD6EIWTszqfV7PxetJ5nkKgZ0NCHaBBTKUHv
	 NZzNmO4Cf4CmmeM9QQWaUu/bWkX2JlQFGjb/d22kWy2fmHH2ajTfA2TXWQe2FVtHPtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895903;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rbNxiwa4tIWQm49cbrYRKF4GOac2qkrC3vodw3qxtlU=;
	b=Vv3tDoTgLIY9+YTvF2s++WwkzlzCVCuWgAK5nMbzWDiIPne3lA58M4L+ZdoMcyuqQIsS
	 iiryZhMgk9/jixfS5Sq1YnCFai+Aab1cUWAnAPJcj48hSPjO0dSe01WWul/12/WGYci5z
	 7qe6JsqLQrswqZ732N//1QE7qTWpltes7ZREiMoPjkZ3RnF7+0PiXeGwiV+9Wc6ttgyCz
	 +M+vgyz7Y31b5DXUjLijNHLX280+QJhOMJtGj8GV+CovsomE+gFTAg4140jLkH+oLq3u0
	 dFI0m8y4i6ntPxY/tFMzahX6MBPcGUZhEFNZWMHY1Sv1veAgwwRSQMTOn/EsKitU3MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bux9cv4T;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869B606A31A;
	Sun, 25 Oct 2026 02:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A869B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bux9cv4T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792895901; x=1824431901;
  h=date:from:to:cc:subject:message-id;
  bh=Uudf+8vMhexiE247q/J0UAYrhow4gJYsWoY3Xi6bciQ=;
  b=bux9cv4Tc0ZNyPnivIU5hLjOntF5Vk0D9iWeHdfgDBpMUB4TxvK57o9j
   usiR2NT2dC8gk7NV/liid6lOkDRZluzT5ZR91H4gdN2LVmXd3oxbHyaRc
   QXuD1NcedjjmPmv4b6zAPrEWISJg+BQbXlELKuKS3TVx51IinsjQbvcrq
   Vt8Wq1Hveto57WMoFXAOCeoWPCeCB3b/7HqowgJmgkriRI+rbmEsEApAD
   R3Y0UquKgDzv1l2Vo4xgNgwkRlDivPWwBC2eZT8Rm3l1+2WvSSGntiXdQ
   ELwPGXyF8CNd3/2je6xEh+ywUniJNKnW/ta2UgoYIXKWT0IhmApqT0sRt
   w==;
X-CSE-ConnectionGUID: E2OBZFU6Tum3CDEncFX82w==
X-CSE-MsgGUID: bByx2K9SSHWkw07CHzHSSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1493599"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1493599"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:38:21 -0700
X-CSE-ConnectionGUID: UtVgrhT5QDOZb0e24fr++A==
X-CSE-MsgGUID: B+/eSD4NTRuvkRF8tKrwRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="5714041"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 24 Oct 2026 19:38:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKo7k-00000000UTm-3war;
	Sun, 25 Oct 2026 02:38:16 +0000
Date: Sun, 25 Oct 2026 10:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-23 25/25] ld.lld: error: undefined
 symbol: kshstk_build
Message-ID: <202610251242.Kg2ALcW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-23
head:   b6fa923e47fcecf329844fd91ed615de35478ea3
commit: b6fa923e47fcecf329844fd91ed615de35478ea3 [25/25] x86/boot: Add CPU shadow stack bootstrapping
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20261025/202610251242.Kg2ALcW0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251242.Kg2ALcW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251242.Kg2ALcW0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kshstk_build
   >>> referenced by arch/x86/entry/entry_64.o:(kshstk_enable_current) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
