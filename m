Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBF51CE0BB;
	Tue,  2 Jul 2024 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949625; cv=none; b=JU1bHwYq0h5bTrZa6M3f6RETmapH2/7ssLPnBjeGfHr/7EzeUqe0S4Cn3p3UgX/CNsOSzXcZU57DhI/eeoqpn56tu+pI+OpjKrJEW5juRI3z4ZX5Hv4xe5TCRx1mf45CknIPV09+DYPtPw7Ua1lyoVQ9MjmLDuewuADeB9O2KKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949625; c=relaxed/simple;
	bh=yy3SsCzRKQUZwyOuCYNrVdIQNpHq/ChDHuuskYQnJbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNbhaJ4kEQzIpgtP+8U1ljW42i+uLOOVfnBxl03xkCdK+yzzdKkR6h/0AKLJKx499Jgo0V5jdRVDawYYt7twKY5NtmHCgfLQvX5LVy9cLkE3L/Shw+iNDogCCUDDCUkJdutBWp+JsU0IH9T0YjdEjN8AI+9ZhV2ST5BHK+5z56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7E7x8u9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7E7x8u9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719949623; x=1751485623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yy3SsCzRKQUZwyOuCYNrVdIQNpHq/ChDHuuskYQnJbc=;
  b=F7E7x8u9VL/Q/lPED3GR/q53xYBVIMCZfZ8Llp0VQwp92A7+ov6rOXmL
   X2SBHHa7r1UcG87aSUQXjYTrnp40B1l8R+BW5TrsBgaWBPin6z0nxKnhs
   6AATfI2lXm06dV+pzhy2fXZAW+EN8UCFpXtEy0C94+BRlPWJAVkYAiYGK
   kKV78xtw4+T80mWNSSY6DwUO++c2rJkOvJGgFGa+ScCo1aKMiYxZarLL2
   PZC3p/KIhdEnK52WVuOk9kixEAcebTBi20aBpkEJpETzIc9ESWlmyVeKE
   PI42wPmKRKAtOeuPDrvd/Z2UOwHzir6S0bO7PcQQOAGegP3IOEsD0sX23
   A==;
X-CSE-ConnectionGUID: oDnhlSXsSTmBWrlCqds2AQ==
X-CSE-MsgGUID: Mum6OMq0Rr2nQujYe/IeJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17284248"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17284248"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 12:47:02 -0700
X-CSE-ConnectionGUID: +q5qIyjHQRO2DEe7+M6RXg==
X-CSE-MsgGUID: +I8QAE3FTaaut0BtkVzaGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46073695"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2024 12:47:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOjSt-000ObC-15;
	Tue, 02 Jul 2024 19:46:59 +0000
Date: Wed, 3 Jul 2024 03:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V2 11/12] mmc: host: tegra: config settings for timing
Message-ID: <202407030541.WoISgpW6-lkp@intel.com>
References: <20240701151231.29425-12-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701151231.29425-12-kyarlagadda@nvidia.com>

Hi Krishna,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on robh/for-next andi-shyti/i2c/i2c-host linus/master v6.10-rc6 next-20240702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Yarlagadda/Documentation-Introduce-config-settings-framework/20240701-235313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20240701151231.29425-12-kyarlagadda%40nvidia.com
patch subject: [RFC PATCH V2 11/12] mmc: host: tegra: config settings for timing
config: i386-buildonly-randconfig-004-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030541.WoISgpW6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030541.WoISgpW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030541.WoISgpW6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tegra_cfg_get_by_name
   >>> referenced by sdhci-tegra.c
   >>>               drivers/mmc/host/sdhci-tegra.o:(tegra_sdhci_write_cfg_settings) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
