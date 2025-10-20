Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A515CD74;
	Mon, 20 Oct 2025 01:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760922258; cv=none; b=hNKxh4Kyh/tUxZG5Pi76s5N7FL7/GkThHdPwIq+PhneVtStJm8Oy2dpQQi10yipBfR3zoPUsVW0+unIvFDDc/7g0fODRDr32tQuH8Rs1dAbfUVXid+dTOZCA4OJU2XdXY4teqGSUuxh5iCfwhBEhSXncSo+wId5Ug7xTfgL920I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760922258; c=relaxed/simple;
	bh=rLgQP3nOmKiEqvN5xi1vJ2k/8gJA5JSpwAEVzG0O7VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFhRMsVbB7BCx5Np+rLkyouUd8b7NSZ8pF0zH6kwzQUOyIq54vY9+Fc2C6rf5oKNLvjVSaaA5YI3RduRwXW5Kb3y+7n71RoDkdAc5HpjtG11TeEtmzsU3qAAekudf9RFq6zusEZTu+P4TX/9XGnZWfkafQVonUDaDaT2h5Rztgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQuYY91S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQuYY91S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760922256; x=1792458256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLgQP3nOmKiEqvN5xi1vJ2k/8gJA5JSpwAEVzG0O7VI=;
  b=gQuYY91SSRkR3BqxtiKtnsQwenq1AmrZanYfhA+iwlYOCCOcxv149g1V
   FuQbTP4G0IpPk68V3lHCRT/NpNR3dJHNZg1U8Oue0nPk6XK6Ds1z/D97M
   6XQRukRQLMBIjrM/uQhYm7T71p4L/aodYtNgXXv/4p1PKcWv/YXhri+pu
   Pd0xNvnYJE/0icWQhaFliZtaaLHbGHZ0vQZhUQxJ3Byzi2NOtv44sPDVU
   g1DDgSTVHJhLmcPPRFT0RN4VjX0W1xoMhd9O9i7uv8kQ1da7H4WiwydLX
   OjNIPx6CbhhjVwtVYkWg+6DcOTMJTV7/SFhCfV0uLFUyG8TdYvqb3NnU9
   Q==;
X-CSE-ConnectionGUID: Py4CI47/SJaongOfqqziNg==
X-CSE-MsgGUID: xGJk/2EhRjGwfyE/Y+La0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62960871"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62960871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 18:04:16 -0700
X-CSE-ConnectionGUID: LWhOyV7iQ/OJDJW9sjFm4g==
X-CSE-MsgGUID: CUH7w48sS5CwrB2fiq350g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="182759361"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2025 18:04:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAeJm-0009Nt-0i;
	Mon, 20 Oct 2025 01:04:10 +0000
Date: Mon, 20 Oct 2025 09:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rong Zhang <i@rong.moe>, Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/6] platform/x86: lenovo-wmi-{capdata,other}: Support
 multiple Capability Data
Message-ID: <202510200717.19aOSEUP-lkp@intel.com>
References: <20251019210450.88830-3-i@rong.moe>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019210450.88830-3-i@rong.moe>

Hi Rong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/platform-x86-Rename-lenovo-wmi-capdata01-to-lenovo-wmi-capdata/20251020-050849
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251019210450.88830-3-i%40rong.moe
patch subject: [PATCH 2/6] platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability Data
config: i386-buildonly-randconfig-006-20251020 (https://download.01.org/0day-ci/archive/20251020/202510200717.19aOSEUP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200717.19aOSEUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200717.19aOSEUP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:371 function parameter 'type' not described in 'lwmi_cd_match'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
