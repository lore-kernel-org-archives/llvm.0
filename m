Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E7413B2B8;
	Tue, 22 Apr 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326412; cv=none; b=dzG8EhkAnx5jF2DZIejiz4/BEsY1NkojaSSfe5ULLDs0f1EJ7DNyWqiSF1V5vBLohCQhV6/FqrEG21R3iFLRNRXPEmdiE3++U1YzOI+s3Ye75IbY9449YY+HUizOCQ1pBFsQqG93+ai+yeC2EeNLtgaxofzwVtUvbr1IzRTtzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326412; c=relaxed/simple;
	bh=Z9CiUl8n3GG0QL53fQ0tbSFIJfT5VW0MonfGETeCdzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/tL6enc1mzzR/rlOPXE7yYQFDzV93Dke8B6DrhlrGC6MQA/B3g+gTJ1oonn7TzjUXnrub0E5rGmPtUUTAGi/aMYBTUrKiI98V4o+L1cCrJL6SCd2y4SVAknCGQyGdYsPeDCXh/Fg4LbyTriF549fOlKxEg0dsGxNElZ7jV8VKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOtOfAr4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOtOfAr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745326411; x=1776862411;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z9CiUl8n3GG0QL53fQ0tbSFIJfT5VW0MonfGETeCdzQ=;
  b=DOtOfAr4YfX0ersQauXC7CoIOOVHK33RvVk/zpf9XeDq7Yj8VRZs2aGl
   7wV/xu9+kR3PzxQ4keqyK3Vb5zFSQdvah46XVE/vgk0d/nuFqd7f/uETK
   QvAwGGZ4mTbwcXxs5FEvohyu4wBd7+JA+5rAFHIeAEoXFIKidKm+cJ/I/
   7J9cZzNOE6ST/ER52Sei22w+fPk7M9q+OX3pD2hJQi2AAVK/1jdRHgrnV
   g5W+GoPfFdrXwmKOih2exDVm8m1IOO1whwoYR5VnwtF221hw82XkT1sz9
   sL/hbEJqyOs9LLBaD6zm6rNuK8yfwkO8XSXX4zhECMrkA9zMeCiqorScx
   w==;
X-CSE-ConnectionGUID: a1IWHinuQ+OmO8jxKf97vA==
X-CSE-MsgGUID: BxZy6O+iQpeGEy0sDBlx/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46770831"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="46770831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 05:53:31 -0700
X-CSE-ConnectionGUID: ph0Ppv6SQVW0sk1gMaYmIg==
X-CSE-MsgGUID: 1sygbuMETxmVJxvyywDFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="162969018"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Apr 2025 05:53:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7D7u-00010t-2Q;
	Tue, 22 Apr 2025 12:53:26 +0000
Date: Tue, 22 Apr 2025 20:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk:next/drivers 7/7] drivers/firmware/samsung/exynos-acpm.c:672:
 warning: Function parameter or struct member 'acpm_np' not described in
 'acpm_get_by_node'
Message-ID: <202504222051.7TqaSQ48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/drivers
head:   a8dc26a0ec43fd416ca781a8030807e65f71cfc5
commit: a8dc26a0ec43fd416ca781a8030807e65f71cfc5 [7/7] firmware: exynos-acpm: introduce devm_acpm_get_by_node()
config: i386-buildonly-randconfig-001-20250422 (https://download.01.org/0day-ci/archive/20250422/202504222051.7TqaSQ48-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504222051.7TqaSQ48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504222051.7TqaSQ48-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/samsung/exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
>> drivers/firmware/samsung/exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead


vim +672 drivers/firmware/samsung/exynos-acpm.c

a88927b534ba18 Tudor Ambarus 2025-02-13  662  
a88927b534ba18 Tudor Ambarus 2025-02-13  663  /**
a88927b534ba18 Tudor Ambarus 2025-02-13  664   * acpm_get_by_phandle() - get the ACPM handle using DT phandle.
a88927b534ba18 Tudor Ambarus 2025-02-13  665   * @dev:        device pointer requesting ACPM handle.
a88927b534ba18 Tudor Ambarus 2025-02-13  666   * @property:   property name containing phandle on ACPM node.
a88927b534ba18 Tudor Ambarus 2025-02-13  667   *
a88927b534ba18 Tudor Ambarus 2025-02-13  668   * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
a88927b534ba18 Tudor Ambarus 2025-02-13  669   */
a8dc26a0ec43fd André Draszik 2025-03-27  670  static const struct acpm_handle *acpm_get_by_node(struct device *dev,
a8dc26a0ec43fd André Draszik 2025-03-27  671  						  struct device_node *acpm_np)
a88927b534ba18 Tudor Ambarus 2025-02-13 @672  {
a88927b534ba18 Tudor Ambarus 2025-02-13  673  	struct platform_device *pdev;
a88927b534ba18 Tudor Ambarus 2025-02-13  674  	struct device_link *link;
a88927b534ba18 Tudor Ambarus 2025-02-13  675  	struct acpm_info *acpm;
a88927b534ba18 Tudor Ambarus 2025-02-13  676  
a88927b534ba18 Tudor Ambarus 2025-02-13  677  	pdev = of_find_device_by_node(acpm_np);
53734383a73888 André Draszik 2025-03-19  678  	if (!pdev)
a88927b534ba18 Tudor Ambarus 2025-02-13  679  		return ERR_PTR(-EPROBE_DEFER);
a88927b534ba18 Tudor Ambarus 2025-02-13  680  
a88927b534ba18 Tudor Ambarus 2025-02-13  681  	acpm = platform_get_drvdata(pdev);
a88927b534ba18 Tudor Ambarus 2025-02-13  682  	if (!acpm) {
a88927b534ba18 Tudor Ambarus 2025-02-13  683  		platform_device_put(pdev);
a88927b534ba18 Tudor Ambarus 2025-02-13  684  		return ERR_PTR(-EPROBE_DEFER);
a88927b534ba18 Tudor Ambarus 2025-02-13  685  	}
a88927b534ba18 Tudor Ambarus 2025-02-13  686  
a88927b534ba18 Tudor Ambarus 2025-02-13  687  	if (!try_module_get(pdev->dev.driver->owner)) {
a88927b534ba18 Tudor Ambarus 2025-02-13  688  		platform_device_put(pdev);
a88927b534ba18 Tudor Ambarus 2025-02-13  689  		return ERR_PTR(-EPROBE_DEFER);
a88927b534ba18 Tudor Ambarus 2025-02-13  690  	}
a88927b534ba18 Tudor Ambarus 2025-02-13  691  
a88927b534ba18 Tudor Ambarus 2025-02-13  692  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
a88927b534ba18 Tudor Ambarus 2025-02-13  693  	if (!link) {
a88927b534ba18 Tudor Ambarus 2025-02-13  694  		dev_err(&pdev->dev,
a88927b534ba18 Tudor Ambarus 2025-02-13  695  			"Failed to create device link to consumer %s.\n",
a88927b534ba18 Tudor Ambarus 2025-02-13  696  			dev_name(dev));
a88927b534ba18 Tudor Ambarus 2025-02-13  697  		platform_device_put(pdev);
a88927b534ba18 Tudor Ambarus 2025-02-13  698  		module_put(pdev->dev.driver->owner);
a88927b534ba18 Tudor Ambarus 2025-02-13  699  		return ERR_PTR(-EINVAL);
a88927b534ba18 Tudor Ambarus 2025-02-13  700  	}
a88927b534ba18 Tudor Ambarus 2025-02-13  701  
a88927b534ba18 Tudor Ambarus 2025-02-13  702  	return &acpm->handle;
a88927b534ba18 Tudor Ambarus 2025-02-13  703  }
a88927b534ba18 Tudor Ambarus 2025-02-13  704  

:::::: The code at line 672 was first introduced by commit
:::::: a88927b534ba18019b0440cf3d7f068407b5250c firmware: add Exynos ACPM protocol driver

:::::: TO: Tudor Ambarus <tudor.ambarus@linaro.org>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
