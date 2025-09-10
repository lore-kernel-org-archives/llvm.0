Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2912238C26;
	Wed, 10 Sep 2025 02:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470878; cv=none; b=EWZ4hyXfzhFvWdHxQmr7dIG6Bciac+WVx+vhzk6XCl/1nEiHyA69Z3BFT8nWOUmqUjLOjj58BQhTZV+VKIS2mi3LfllhpVyYIy7AkSs7++k2iB8vpK31WS3faiFUFdSnjotLR/fwdKvEw3Ode9MecHzFktxzywkNNoc4NT1KsZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470878; c=relaxed/simple;
	bh=FYVLBz1vJx7COLh0ejkAJi9Jk84BDM07sdchvSx5EBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgNMx15byN9TcNV5mOCF/9LFVrBkYZzRs4Mq98IRGwrvYEd2ikmhnLcha7a71Wt0ZDawMhu9qQ7HFwwagAA5zW7L74n+Fv5LQZ3pbajrLbBf8/VjuqEM+JteJuEYg3LutlYDRs4jGhAWu0wuyJnwNW8szmKXVOVKo34TilGncSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3wToxDT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3wToxDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757470877; x=1789006877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FYVLBz1vJx7COLh0ejkAJi9Jk84BDM07sdchvSx5EBY=;
  b=J3wToxDTWVK04eks1+KwGcGXhEy2aNtQFe8VGNEynNwSpVwaU5vxfxax
   /Pi9uajvvkLE07+YP2LzFgPfFbwOLz1lDtbZINdsIHIoWUJWHc8IrAbzS
   8rmwuS+5DvGFOyWYS4eO9cNp71gxy9YvEKYmIBbcBoXFKkuydGnftP0I9
   0L2duv37WOMseyFpHIXikDAq+72sL8YxEjYb0pIW3SwB/kQCwSKHk7nRh
   SfJO0vNo2bON2uqEDphU3ga9EAv80Gma2ucL/l/NnfULF8/eyBBvnN2eH
   4nJpbWmkoGplC5uPuCEIz+AmakUZ8XjjMD+azH6VYHeCnM+SV9DVZzfJA
   A==;
X-CSE-ConnectionGUID: Qm56WoXgSXSHu+S0Xn0TGA==
X-CSE-MsgGUID: vIO2pNVMTKK6dFrRCP8Dxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70387519"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="70387519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 19:21:16 -0700
X-CSE-ConnectionGUID: DOgFKZyyRYyrgTggXh/LNw==
X-CSE-MsgGUID: JWwtxHL5RmSjobIBMF5iWg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Sep 2025 19:21:12 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwASL-0005Rv-1y;
	Wed, 10 Sep 2025 02:21:09 +0000
Date: Wed, 10 Sep 2025 10:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
	baojun.xu@ti.com, Niranjan H Y <niranjan.hy@ti.com>
Subject: Re: [PATCH v2 1/4] ASoc: tas2783A: Add soundwire based codec driver
Message-ID: <202509101012.OvT5ytrT-lkp@intel.com>
References: <20250901051144.1112-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901051144.1112-1-niranjan.hy@ti.com>

Hi Niranjan,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjan-H-Y/ASoc-tas2783A-machine-driver-amp-utility-for-TI-devices/20250909-201553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250901051144.1112-1-niranjan.hy%40ti.com
patch subject: [PATCH v2 1/4] ASoc: tas2783A: Add soundwire based codec driver
config: hexagon-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101012.OvT5ytrT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101012.OvT5ytrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101012.OvT5ytrT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas2783-sdw.c:791:8: error: incompatible pointer types passing 'size_t *' (aka 'unsigned int *') to parameter of type 'unsigned long *' [-Werror,-Wincompatible-pointer-types]
     791 |                                           &size, NULL);
         |                                           ^~~~~
   1 error generated.


vim +791 sound/soc/codecs/tas2783-sdw.c

   769	
   770	static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
   771	{
   772		efi_guid_t efi_guid = TAS2783_CALI_GUID;
   773		u32 attr, i, *tmp_val;
   774		size_t size;
   775		s32 ret;
   776		efi_status_t status;
   777		static efi_char16_t efi_names[][32] = {
   778			L"SmartAmpCalibrationData", L"CALI_DATA"};
   779	
   780		tmp_val = (u32 *)tas_dev->cali_data.data;
   781		attr = 0;
   782		i = 0;
   783	
   784		/*
   785		 * In some cases, the calibration is performed in Windows,
   786		 * and data was saved in UEFI. Linux can access it.
   787		 */
   788		for (i = 0; i < ARRAY_SIZE(efi_names); i++) {
   789			size = 0;
   790			status = efi.get_variable(efi_names[i], &efi_guid, &attr,
 > 791						  &size, NULL);
   792			if (size > TAS2783_CALIB_DATA_SZ) {
   793				dev_err(tas_dev->dev, "cali data too large\n");
   794				break;
   795			}
   796	
   797			tas_dev->cali_data.read_sz = size;
   798			if (status == EFI_BUFFER_TOO_SMALL) {
   799				status = efi.get_variable(efi_names[i], &efi_guid, &attr,
   800								&tas_dev->cali_data.read_sz,
   801								tas_dev->cali_data.data);
   802				dev_dbg(tas_dev->dev, "cali get %lu bytes result:%ld\n",
   803					tas_dev->cali_data.read_sz, status);
   804			}
   805			if (status == EFI_SUCCESS)
   806				break;
   807		}
   808	
   809		if (status != EFI_SUCCESS) {
   810			/* Failed got calibration data from EFI. */
   811			dev_dbg(tas_dev->dev, "No calibration data in UEFI.");
   812			return 0;
   813		}
   814	
   815		mutex_lock(&tas_dev->calib_lock);
   816		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
   817						 tas_dev->cali_data.read_sz);
   818		if (!ret)
   819			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
   820		mutex_unlock(&tas_dev->calib_lock);
   821	
   822		return ret;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
