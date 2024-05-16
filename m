Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF86157E73;
	Thu, 16 May 2024 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715893093; cv=none; b=TUbRu78y0TCcE2feoi08qQaxMTT4/3FVUMA3VBZTTHct6vr37M4+KYMzf+A0pNd68uNryvNUuC/mP2Tmb/ledRaSehX8Mbxt3zsjcAZdgKxub6GhZcyIdAIirl/nDc7cw/eAa1vy2679I6Sc62FYCorJ12NOcxJfvXZ01JQOPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715893093; c=relaxed/simple;
	bh=ctWB/dFDLpYDVoZ2Jy6AFmL4gx6JFcg93o7Aw7dtoqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uiq/dQWtvpruXJHR6gUwzL5asf2dUOgsSSQ7b2eunflExAe/Ef0fiPJT3C1ZNU3DVpj/QJy7svZiQwfvv9WyMboVFHNRgxU8pzNMHvWnudoX4HbKbiOGPdN9XSOVG38NXWQ3z/IRJ0rYyyfLb7KjItgv6ZI8Jg4Kk8n+0AzEsZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdRqyIjt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdRqyIjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715893093; x=1747429093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ctWB/dFDLpYDVoZ2Jy6AFmL4gx6JFcg93o7Aw7dtoqs=;
  b=OdRqyIjtwm/fXNP7Fd2lUEgxc/NECY9DMb+3+cNO8mz/Qbj0m/l72qm8
   1A+oUhCGBXLkPttA+N6fLuO+b2b5GpkEFT6EH8rQlLA7kwi5XYrnuPnlf
   8Ac/1gEs69BWMQYfRA1GTWkcWQNHdl2KSVheULnm0+gtScKJi3GTE0Ft5
   2dKr7xin0bYfOAhE27IycZPF+2IIHE3FrOK95RoM4lQfPnyMeBNG9pqKL
   dJbMvibXGr3asLd/gy0QVzEjVEN+wRTcD5C4MVPwzbzmSUadkeYmGvUUy
   7B0/Qoend/7q6BwzfXK+xbhqvPAGdMBCvnFOTQ6ByncHhyvefymPXkpDr
   g==;
X-CSE-ConnectionGUID: LUlpo4gbSzmaMXl92sNKMg==
X-CSE-MsgGUID: ACTqZQqMRjut1/+BDhVz+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11890973"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="11890973"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 13:58:11 -0700
X-CSE-ConnectionGUID: GdxwgKv7RJ2AMMyvEVt5dQ==
X-CSE-MsgGUID: 6KluEpYARt+n2hgkZHdDqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="31687972"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2024 13:58:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7iAw-000Emn-26;
	Thu, 16 May 2024 20:58:06 +0000
Date: Fri, 17 May 2024 04:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuaki.Tsunashima@infineon.com, marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: Patch for CYW4373 hci up fail issue
Message-ID: <202405170433.qYUNBTtS-lkp@intel.com>
References: <6267800d70ae4344acaba3486b54bc0c@infineon.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6267800d70ae4344acaba3486b54bc0c@infineon.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nobuaki-Tsunashima-infineon-com/Bluetooth-Patch-for-CYW4373-hci-up-fail-issue/20240516-131000
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/6267800d70ae4344acaba3486b54bc0c%40infineon.com
patch subject: [PATCH] Bluetooth: Patch for CYW4373 hci up fail issue
config: x86_64-buildonly-randconfig-003-20240517 (https://download.01.org/0day-ci/archive/20240517/202405170433.qYUNBTtS-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405170433.qYUNBTtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170433.qYUNBTtS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btbcm.c:453:33: error: initializing 'struct bcm_chip_version_table *' with an expression of type 'const struct bcm_chip_version_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     453 |         struct bcm_chip_version_table *entry = &disable_broken_read_transmit_power_by_chip_ver[0];
         |                                        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +453 drivers/bluetooth/btbcm.c

   440	
   441	struct bcm_chip_version_table {
   442		u8	chip_id;
   443		u16 baseline;
   444	};
   445	#define BCM_ROMFW_BASELINE_NUM	0xFFFF
   446	static const struct bcm_chip_version_table disable_broken_read_transmit_power_by_chip_ver[] = {
   447		{0x87, BCM_ROMFW_BASELINE_NUM}		/* CYW4373/4373E */
   448	};
   449	static bool btbcm_is_disable_broken_read_tx_power_by_chip_ver(u8 chip_id, u16 baseline)
   450	{
   451		int i;
   452		int table_size = sizeof(disable_broken_read_transmit_power_by_chip_ver)/sizeof(disable_broken_read_transmit_power_by_chip_ver[0]);
 > 453		struct bcm_chip_version_table *entry = &disable_broken_read_transmit_power_by_chip_ver[0];
   454	
   455		for( i=0 ; i<table_size ; i++, entry++)
   456		{
   457			if( (chip_id == entry->chip_id) && (baseline == entry->baseline) )
   458				return true;
   459		}
   460	
   461		return false;
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
