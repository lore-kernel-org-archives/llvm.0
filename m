Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13E020C486;
	Tue, 18 Mar 2025 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742318908; cv=none; b=s1zQMqMUQcTuFVHIS46pNPSg1H1y/5tR7D1OCXssH8WjMe7EB+cnyKjgUlJMKmq9cdp4B2JBJvZf4nVTL9i/BdFiYyYOFChjsfTiH0xzOeHK8uhHYqSgwCnupEMMDFUrJGYwJwRmJQfd0h5f5xzUnuZzxtgSklFDCNrr2X+56+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742318908; c=relaxed/simple;
	bh=1gZvIFMx9BZMa+ovEBIfQpNCpPUfJG++3QWLjdrxSPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DRhDY8xgpcbn1BUEpfNaMLRvyoysNV2j7Bt1BjQTix5HwIfuDFXlXeYxtApIGQiyohqZ1RQhu/dxq6h/jECB8GuXO+d9afzDJkHid07az63n8MnJA/q6J9HLHpdxYrnmRR4lV4UK0vC07jt5A+Vns0fkfktpdcgcF0e5syA2nWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOQQ/0Im; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOQQ/0Im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742318906; x=1773854906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gZvIFMx9BZMa+ovEBIfQpNCpPUfJG++3QWLjdrxSPg=;
  b=OOQQ/0ImSB7wrUX+NtTr1ELcnQL+xFXAyReqylgx5quYxr2Mu56PX9p9
   Pjkx8Mrk9LAiZMGZuVa9mkL5j4s1WZPPYnLx798ku+iycoPuRdoBoS+58
   7Hojrb4QpmXRaqUmbZTzeqcevThMKHCTdOU5HW1Qu6+y0wa/2LlGhZt65
   owjf3HLEv0V1qYnR6br/EIyLDN9Ww/YYgrOf4OaXB/2TlSUBiMFRl55Gf
   y4uuG+vdcwEwdR2GHyPnDQbYku9F/yIx1V6Cv3a52k0WfYP11DE/M7Jlb
   GgtOS/ATfI8wjwAqvP0WeKRqswq+OxVOkrQumf+zAw/jm5rcMbbbuYsTj
   Q==;
X-CSE-ConnectionGUID: SxfBOI2nTj+2/lS5gW4hrw==
X-CSE-MsgGUID: zqcaVm+jRCm+PtA9uwI/gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="31058196"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="31058196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 10:28:24 -0700
X-CSE-ConnectionGUID: zfYIt8TzTRW8hY40IGJTTg==
X-CSE-MsgGUID: /oIB9/QmTSGsrb0wPHatdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122345569"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2025 10:28:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuajk-000E1T-2C;
	Tue, 18 Mar 2025 17:28:20 +0000
Date: Wed, 19 Mar 2025 01:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 3/17] ERROR: modpost: "devm_ioremap_resource_wc"
 [drivers/remoteproc/ti_k3_m4_remoteproc.ko] undefined!
Message-ID: <202503190152.01dXS8X1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   533e09a4b2a4e7e9b4170be21d9a34a0871d8337
commit: 9663d85dd47bbe3adb12fd0d9f8cdbe163c889d9 [3/17] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
config: i386-buildonly-randconfig-003-20250318 (https://download.01.org/0day-ci/archive/20250319/202503190152.01dXS8X1-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190152.01dXS8X1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190152.01dXS8X1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_m4_remoteproc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
