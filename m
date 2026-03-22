Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609D17A31C;
	Sun, 22 Mar 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774188967; cv=none; b=p3AIGd6worloJhBeC/7EJyNoA8j8sO5E0k6xHjbd8NcI104MP2dCdZOXokVTiMZFxrlL7jRMUHY2s1xq5foaCONQ7GECjHIAA6AcTwY/a74oKog0D8HN2sAyKpWrwDrgDni+d7afqwQfjPrC1WUx1fcIw6eSic9+nYZMp6FZAFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774188967; c=relaxed/simple;
	bh=IigGF6U3blVwl7+mttTv8ABlCNI5lUMx+1rU3nKGGxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVd1hdvuuCtzjPZyW+ORZAZIsYzKRfSGjOroI2jB6u8JUdPtOYsICIL/If95Vl+6SuhWpfM4n3FRNmRPqQqXcBlT2Y+8bnT9SAASN2FAtQuVKufy/QBBsAMyCAYsNfWYxciAfYErHEP7oFUNvUGBeQVhsfz1QgDgPurVK8pS+gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMrZqHVJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMrZqHVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774188965; x=1805724965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IigGF6U3blVwl7+mttTv8ABlCNI5lUMx+1rU3nKGGxA=;
  b=IMrZqHVJZjaR/bflI2oII5lxH9nN5Zx5BVl7azFfZo+mqa8zpR77xY2S
   THH3eFQMiy42y/AIVSpINQI6OoOYjr5h8H7OMSQ+OzbneO0WCmxr4ZhxN
   +yA16RdMXvcDECc9QnYBiztwHm+guVSiB02d0CRt/uCFJUc5ahk/XC4OY
   pVLRC4bxX9C3GH5Tu+bQsQNf2SZvGhZL1aB7uGQQsibks5g6BLS5SLE4V
   3LfLgRqbmLwuSMUrNZWozYW8G955qX35sCp0gS8oRAAtSHMLCiTJ6m9+8
   gWEICpCPAiC/bQKsfQLu3AiLF3bUKilkz32d6f+anSqikc6NXWvDQJJys
   w==;
X-CSE-ConnectionGUID: /oNXoiaVRPqfye7kywRfBg==
X-CSE-MsgGUID: kdEb+iN0TkmWQopYLgxWlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="62765359"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="62765359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 07:16:05 -0700
X-CSE-ConnectionGUID: JRLBnVVlSqa6fLyDLAUY4Q==
X-CSE-MsgGUID: qbzVjqmzRUKzhYMJv9+fAA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2026 07:16:00 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Jav-000000002Dx-1Ld7;
	Sun, 22 Mar 2026 14:15:57 +0000
Date: Sun, 22 Mar 2026 22:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Klimov <alexey.klimov@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
Message-ID: <202603222239.JTuBxs7K-lkp@intel.com>
References: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Klimov/dt-bindings-clock-exynos850-Add-APM_AP-MAILBOX-clock/20260322-085441
base:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
patch link:    https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc%40linaro.org
patch subject: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
config: x86_64-buildonly-randconfig-004-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222239.JTuBxs7K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222239.JTuBxs7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222239.JTuBxs7K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_value' not described in 'exynos_mbox_driver_data'
>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_value' not described in 'exynos_mbox_driver_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
