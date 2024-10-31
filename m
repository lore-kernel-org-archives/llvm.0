Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0AF12C473;
	Thu, 31 Oct 2024 02:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730341192; cv=none; b=LPevgGMj4KRHWtu8/QWoXSMTDVRmAQSLQcNH3ci4pwo/+s4h0prm87GhJmfOuaEsud6nEfFy8LtvfLj5DL4l83G0mSnUyp6hLlnY5kx2mquHqDZx8N/mKifqDblhNXdz0AB9zoLLlIFpL0oPHw+1WMk1c9tvaAnZv0f82Ekwd80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730341192; c=relaxed/simple;
	bh=YH+r+Dbnbl3Hh+y/hm/qgXZvFD8Qdh/Re1nEgUi7fU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdYmECmR+tsvm6+ypNRxQpZ4R34NYhJNwyhwXREoObFJENAIYlt2dudRIYjU4mnzeSjooUgj5M2N9XwSf5EMAO7kX+rgnr22x8UumZivpQMmahU8FTtegt0g9Kv5CZtz/OzskwK2ftnY5ydy43qyyyZHWUTBV/TNJd4ESHI0SxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEZYtP1b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEZYtP1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730341191; x=1761877191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YH+r+Dbnbl3Hh+y/hm/qgXZvFD8Qdh/Re1nEgUi7fU8=;
  b=LEZYtP1bMgr/M9cD7XmrcPn7Zq0b4RH7CEQ4iJrrYoMYKV6NuwabmLQP
   k2F0Fk2uX31BdnLll6iEnEAzqWukE984mZLBVkNOt8SDAi7jS07efhaAa
   kMjDqNngujbc8MQRckrVQbWGp+cgNnfHcd3KUr6/HAgU5eThphZiZxgpI
   TguS1sX7TQ5kQmzBqHpAF56X1Fhhj+itHqKuVbZrTJys7wg7r/QeGY+gm
   zED3dPK7cI9F63t3MzDgsd1nurGxpF1eKu+MM0iZlj0YfA4uRDx7R+LKt
   yh3LT35934vrLWCy4C+0r2cCF64lTGNkT+XpGnQHnJY9gQg+aUYFZkcu4
   A==;
X-CSE-ConnectionGUID: d3Kkwju3RdeY7AnzullChA==
X-CSE-MsgGUID: eyxHcuoEThqUh9UpGk6DNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47528332"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47528332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 19:19:50 -0700
X-CSE-ConnectionGUID: mI53XOwBRq+BGEaUiyP8pg==
X-CSE-MsgGUID: Ce3NF40AQsq8i8qE4BOJKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82039774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2024 19:19:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Kmm-000fY8-1k;
	Thu, 31 Oct 2024 02:19:44 +0000
Date: Thu, 31 Oct 2024 10:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: alice.guo@oss.nxp.com, alexander.stein@ew.tq-group.com,
	wahrenst@gmx.net, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v3] soc: imx: Add SoC device register for i.MX9
Message-ID: <202410311056.PBPPOYmg-lkp@intel.com>
References: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030091336.3901440-1-alice.guo@oss.nxp.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/soc-imx-Add-SoC-device-register-for-i-MX9/20241030-171525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241030091336.3901440-1-alice.guo%40oss.nxp.com
patch subject: [PATCH v3] soc: imx: Add SoC device register for i.MX9
config: hexagon-randconfig-001-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311056.PBPPOYmg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311056.PBPPOYmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311056.PBPPOYmg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:84:34: warning: unused variable 'imx9_soc_match' [-Wunused-const-variable]
   static const struct of_device_id imx9_soc_match[] = {
                                    ^
   1 warning generated.


vim +/imx9_soc_match +84 drivers/soc/imx/soc-imx9.c

    83	
  > 84	static const struct of_device_id imx9_soc_match[] = {
    85		{ .compatible = "fsl,imx93", },
    86		{ .compatible = "fsl,imx95", },
    87		{ }
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
