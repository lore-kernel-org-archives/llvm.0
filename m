Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A3182B4;
	Sat, 25 Jan 2025 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737814632; cv=none; b=bxKChG6ZPQf75tMc+WV4DOgrasxgWNEhrl0qNf5SGiXLpugsHW/rYKM6IxTvsf/AXjCZjQrtUuatDXu5s13E9TDJ/so4x7BEbrtiqTdgJuboq6MXCBZOMKbK8P2Ni97UXFcunOju+4bP37CuptaTb8tH7hQhOPTx0qbggPCoOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737814632; c=relaxed/simple;
	bh=n061RGa+kaKqL8sBVggcMoEDPZpHwdp/oQgGOd5Ya8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssAiHFHGuQZuM1ArRPqbRSI5WnyCAmab2epxeDqBAzXpsrn0mvQjqFgUgc6dMlT/pD8/OQ/xMYclvr0VUTgkWDOS+QuG68l2WQqNHjloNlNyuU56RcEk7rxGbI9ReyA4YyF7y0ykdoZUCeS6Urp1WfHLaoCV5GxpVswDySq5Lv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haovLgjc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haovLgjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737814630; x=1769350630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n061RGa+kaKqL8sBVggcMoEDPZpHwdp/oQgGOd5Ya8M=;
  b=haovLgjcoGBI1W8Ym1ho79bTpg52QTeAniziCSoZGIJU9VCkNpJRpsRF
   Myr673s7pVxcHFM2HoJiY5AXEb6DgufpKfvAea2WamaBXg4Qfz7zOk4pM
   N5bU3RP147TdCPkax/Tc876fn/hrW3SBKZUcu5gdvaiv80fxanW+J6MbO
   8AFatbA8PoirqSIVeazkL4Nm+PYbwjZ7sxxxsNjvDBBRZA3Yqq2u4MI+i
   NgTjRD5CokJXHmOkeJpZNfYsqf+miAv5zHZXrCsJUtsrpIoROUXjEpBku
   u8BTd2R3ivRt2+8tGXoOuHUwm5JZY9xK9HIFqu4qe0bVtN3JcD70ixNnt
   g==;
X-CSE-ConnectionGUID: r+baPICkSbKUOhOzl77wHw==
X-CSE-MsgGUID: Hz3AsCmiTU28RBtDjI3c5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="41175468"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="41175468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 06:17:07 -0800
X-CSE-ConnectionGUID: rJPDmvVkSoeYACLfVfwo1A==
X-CSE-MsgGUID: FvBR6pg/SU+VRDCGUvCaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="107820529"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2025 06:17:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbgy7-000dsF-2T;
	Sat, 25 Jan 2025 14:17:03 +0000
Date: Sat, 25 Jan 2025 22:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
Message-ID: <202501252218.eaGgSuN3-lkp@intel.com>
References: <20250124105900.27592-4-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124105900.27592-4-dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Fix-pr_err-format-warning/20250124-190232
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250124105900.27592-4-dpenkler%40gmail.com
patch subject: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250125/202501252218.eaGgSuN3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252218.eaGgSuN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252218.eaGgSuN3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/gpib/hp_82341/hp_82341.c:802:35: warning: unused variable 'hp_82341_pnp_table' [-Wunused-const-variable]
     802 | static const struct pnp_device_id hp_82341_pnp_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/hp_82341_pnp_table +802 drivers/staging/gpib/hp_82341/hp_82341.c

6d4f8749cd5da8 Dave Penkler 2024-09-18  801  
6d4f8749cd5da8 Dave Penkler 2024-09-18 @802  static const struct pnp_device_id hp_82341_pnp_table[] = {
6d4f8749cd5da8 Dave Penkler 2024-09-18  803  	{.id = "HWP1411"},
6d4f8749cd5da8 Dave Penkler 2024-09-18  804  	{.id = ""}
6d4f8749cd5da8 Dave Penkler 2024-09-18  805  };
6d4f8749cd5da8 Dave Penkler 2024-09-18  806  MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
6d4f8749cd5da8 Dave Penkler 2024-09-18  807  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
