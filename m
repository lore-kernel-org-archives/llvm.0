Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512606;
	b=1dMo9YxdMvFseFo0QrkZqAVwk/DsD2jkQnfM2PHQdBNf7raq6WchnZ5ANcsOxAwRfASy
	 QwjmGH4wTibzoxrApkjavAkNEGxj2ZjH5/3cahncI86MxwWLgXNLrl0GZf74ofhcK2Mlu
	 NcUeBX/FOpGT46ExWzDgTImF8WslTta1tjDcSTHzyyGB7rPK9QiD7+mrYZOpOWts95oSw
	 QLZwQBhdM+oyu/V5gZPwfpYqctFYPQviVrDE8ksVHjeajiJAgiqNSsxe2Xtvbr53GMHlE
	 LnL0mGOWwUyHC0u/90qCe5WmVGTrGQhb/sqmbARf10N1wQFju5/YC29e0u0G6rly3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512606;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rdkjPIPY4vBzPh7Mc/NNVadf3nHfJABF22doreYG/3k=;
	b=iMzvI+qXYZgaiyH2njArc/F1uEAjF0y3wh0j+vCN/jg3ZgO5f/0X+udPMghLHbB0WL28
	 npT2EzFfPkXyIK1CWEssmEGuhIcvSvZjWjgdbPfyG2D+oJUNkowkCd2V9Nd8uQcOPOP7C
	 XLk/e3GFSSx4VSycjxnda3/azcB7VieuRmYnFwBpR0rY8RoKizRxFszt9Abvs7ZhFY+f1
	 Z0ydIfOFu7FcvwhXPe7cZ9nqQR6yD2Ty8RKLHbd9/xvLxQrvdJ5s7tEuAdB6q+ynY65ai
	 34mZdz6kKigUGI2pSsCSAXLfRNnZ5MBNK7uVCLGRW/xjSw1RWKu5IJ0Fy+cIJz2Gpyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TqWeuQBu;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A29606A331;
	Tue, 20 Oct 2026 16:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A29606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TqWeuQBu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792512604; x=1824048604;
  h=date:from:to:cc:subject:message-id;
  bh=3blU56HwKiG0V6GaLNW/havzwqdBH123Jek119nuruk=;
  b=TqWeuQBuqP9O0f+pdgK2TlBP9eBwN5CKcqwCXvNNO6xF9N4SCDFIgzXj
   OJtnadEAITGdcVi/Cgycc4n5Z2k6mmTvE14wTDLXJ3yIER1YbtYFnLUvz
   ZX0jS7srMNXxsxQ/d4+j+0X87atHNmfI9/3E5jyepTKbfakp9JstQ7UcJ
   n1HMC7I/pjpdUkFPdsSc/MfT/zgx0Q+66uNOye4OcJwDWtm3mg7kejxaW
   pndlShwXaC0dpfDR2upV3lQ9PqqzRtSztYknzNQiXyeB4feNTbm5oQTY3
   FIkdbwkaeiGReKHTd7iueTqfm70HTdNNyhtSLMe4vGGYDWXq1otxkHgLo
   w==;
X-CSE-ConnectionGUID: cW39AJbjRbqMz9vWNhNNWg==
X-CSE-MsgGUID: q7kA/fVLSLSYpWS4IHj9og==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1108872"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1108872"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 09:10:03 -0700
X-CSE-ConnectionGUID: h0Wld5UBSx++6EFbpl8iOw==
X-CSE-MsgGUID: 2NUfNR9lTMWd2xtLMjHcHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2854649"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2026 09:10:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJCPV-00000000Nwk-49EP;
	Tue, 20 Oct 2026 16:09:57 +0000
Date: Wed, 21 Oct 2026 00:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: ld.lld: error: call to __compiletime_assert_989 marked
 "dontcall-error": FIELD_PREP: value too large for the field
Message-ID: <202610210041.0ZdmXyB6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f47d223627f80cb7a1eb14c585fe6cb35de5e984
commit: ec98c3b501573fa6649b228b4881cde33f0ae6de iio: adc: ad4130: add new supported parts
date:   6 months ago
config: x86_64-buildonly-randconfig-1005-20261020 (https://download.01.org/0day-ci/archive/20261021/202610210041.0ZdmXyB6-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210041.0ZdmXyB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ec98c3b50157 ("iio: adc: ad4130: add new supported parts")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210041.0ZdmXyB6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_989 marked "dontcall-error": FIELD_PREP: value too large for the field

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
