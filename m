Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E7158A09;
	Mon,  9 Dec 2024 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718560; cv=none; b=pFk1f8Tj9AF1kuBAbxmEe7JK1IfJGvVmNZHz2s4HP3evljnYUZs1gQ5D9A6uA6mc0xkp9G7Xh/mx8nSwxxWE8SzTPY+lp1uz/Yqm6Hdwu2Imdvf4UAKyFU3Uy08PPmUrDOOZprJfCPFMyImTagpmm1plgY28LYn5soi2eFgkBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718560; c=relaxed/simple;
	bh=1xhnE/dr5ycdSIJAuIOMnHp0G8nkkEX2hUdJ8kaswE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/TAA1E2Mno8AF4xK58S3LvXXqCa0vp0T8POrHPM5P0zsp/W3fN3pw4HQJzhqFU32cwiBGKKuv2hwcMZIyzuwgckyC8iVFi/VoJ73uVDsOuSZeFLoD+8TlqM3/E7brW71dMZKNaGkdE/lnzWbpbNYtzPXkuptqNuXkYRbUcpJ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3P7XIP3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3P7XIP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718558; x=1765254558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1xhnE/dr5ycdSIJAuIOMnHp0G8nkkEX2hUdJ8kaswE8=;
  b=G3P7XIP3kHt1sHeVlxevZOSPbrIiuLvttt7gmcshLLZi+82vCPvCyMRx
   o3EKlXHxWJfSNwzAXfqSPR8u3e9Gt8fM6EDwGC8F2C9PmqqoSfiKN/CFw
   hktKjb7SOyOlFZWZx2Ro/20QbZwKt8DAq0cL6pKtpmnTVz25Qwy17bYj+
   thyvINX6y2sy06R8SoSZcxLCX3jBcyamiGx9XwOEPrlBnCS7c+mEqXSYt
   r8OOu1qdkXCaV3qNyB7d2YAlv17KlTkvbz35CP/fSuu1iAKex4Qbg35QT
   KSQ+i9isTIlOwN3pDTFV0cZYn/EAAW+ne6P3dzKRvzejXHdfEh5h5KLdy
   g==;
X-CSE-ConnectionGUID: h/wIYWKGTQe4vUP82+kf8w==
X-CSE-MsgGUID: b+rf5QLcRByCiRXgm+bsSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34236747"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34236747"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:29:16 -0800
X-CSE-ConnectionGUID: 8U3K40MFTd2+YZ9uUvaWYQ==
X-CSE-MsgGUID: FhzA06p/RzatiQZj8x2y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95429283"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2024 20:29:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVOS-0003rD-36;
	Mon, 09 Dec 2024 04:29:12 +0000
Date: Mon, 9 Dec 2024 12:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 16/16] mm: Add basic tests for
 kpkeys_hardened_pgtables
Message-ID: <202412080400.PDGCzZuy-lkp@intel.com>
References: <20241206101110.1646108-17-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101110.1646108-17-kevin.brodsky@arm.com>

Hi Kevin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc1]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything kees/for-next/hardening next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/mm-Introduce-kpkeys/20241206-181928
base:   linus/master
patch link:    https://lore.kernel.org/r/20241206101110.1646108-17-kevin.brodsky%40arm.com
patch subject: [RFC PATCH 16/16] mm: Add basic tests for kpkeys_hardened_pgtables
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241208/202412080400.PDGCzZuy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080400.PDGCzZuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080400.PDGCzZuy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kpkeys_hardened_pgtables_test.o
>> ERROR: modpost: "init_mm" [mm/kpkeys_hardened_pgtables_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
