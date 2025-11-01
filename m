Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A721C194;
	Sat,  1 Nov 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762014350; cv=none; b=c4eSEXqd42GYlH8K8aPazfaPoUZ8TW/OkYCT3BhOW89PGkCdKJKzv9PiTc3b6PLtL2cluYRKeCYQT7jxtBNIq4o5e6lOpg4DNzyr/kTQIrqShgaBLZsPZ8AxwCF/Xju/3JTCRHZEbhOG2d9ZgPMBRC0cEk1mlESTSv1Pd/xKsNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762014350; c=relaxed/simple;
	bh=pPFMBUE3E/n+AfJdNxDIBYoEpsa4YYKIvKgatrJJXhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmuZhXVkK92WMRml5Krz49MaNE1bkmapVFS89kPkQphDOVOcnTmBHFoaOEcJpeRUJBt72B1b/hz9T5jDXv9Jlmwe+qDISjd8d2zPfJt/Hr0perPJKAPIKEFmaUoCcPHonlRaUs5N5GvzKMAOmdZh/DKvkiwjAxshdjOqQzQ+bEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpR4WEZc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpR4WEZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762014348; x=1793550348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pPFMBUE3E/n+AfJdNxDIBYoEpsa4YYKIvKgatrJJXhE=;
  b=IpR4WEZcHM4jZ/EEgbMepxiYQIttyflmQ5HHI2TNQOXaOge0p1ZvHH57
   o7FxEjL8aaV+KQ+ePO7t8RJb3yA+PdAEmieiNxF+zfSpaKFKpPSlEmKk5
   wSpZ37IouerTvmivWGSYilcxaHdKr42QBRUak0W4e76PfNePE56wbJczn
   dQvfZuZXxnXpNAp6v+tTa4JNvhFVatE2/eJPIJDakVY63ERIItn89898E
   DfBFxxGJPy8IIvka+3nC7upnlFaosXEziufaEfF8C59lggQBp47fGluSR
   dD3eSrWpimHpGVv/UU4/nDm4CP41o5ODt+krD+ZbbvX68rIJje6XVTmDe
   g==;
X-CSE-ConnectionGUID: C02mwzQtQHKquruGUAcxZw==
X-CSE-MsgGUID: qD1XUrPiQ8isTH7nf1hqoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64081453"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64081453"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 09:25:47 -0700
X-CSE-ConnectionGUID: /34bxfPXTfi+RPw7sLLQwg==
X-CSE-MsgGUID: 66b9k+8qQo6oJv7sbFfA9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186940434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2025 09:25:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFEQA-000OSu-1r;
	Sat, 01 Nov 2025 16:25:42 +0000
Date: Sun, 2 Nov 2025 00:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: Re: [PATCH v9 3/3] firmware: ti_sci: Partial-IO support
Message-ID: <202511020037.8sAseAYs-lkp@intel.com>
References: <20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c9a389ffad27e7847c69f4d2b67ba56b77190209]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann-TI-com/firmware-ti_sci-Remove-constant-0-function-arguments/20251030-173054
base:   c9a389ffad27e7847c69f4d2b67ba56b77190209
patch link:    https://lore.kernel.org/r/20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b%40baylibre.com
patch subject: [PATCH v9 3/3] firmware: ti_sci: Partial-IO support
config: arm-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020037.8sAseAYs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020037.8sAseAYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020037.8sAseAYs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/ti_sci.c:10:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
      10 | #define pr_fmt(fmt) "%s: " fmt, __func__
         |         ^
   include/linux/printk.h:402:9: note: previous definition is here
     402 | #define pr_fmt(fmt) fmt
         |         ^
   1 warning generated.


vim +/pr_fmt +10 drivers/firmware/ti_sci.c

aa276781a64a5f Nishanth Menon 2016-10-18 @10  #define pr_fmt(fmt) "%s: " fmt, __func__
aa276781a64a5f Nishanth Menon 2016-10-18  11  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
