Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F42DCBE3;
	Wed, 26 Nov 2025 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181097; cv=none; b=NARSiaSJstaqKlzqwXw4+LDSze+pvb9HqmvnKng3Vemrl7BAzt3W/8CE3EAeYqZoGba7iktLcMZRfMhdKC7WI6RgkohxPH8mt8HbK2Eih8iJDLwpx4vUKAW8aYNMEQbhS4eEHB2PGrKfPYCAHb6MQVq421d0r5qDVtvHp2IPCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181097; c=relaxed/simple;
	bh=4MZ0MIsOmg1hO7QG4cNtDsbOW2oOK8x3D3Qq1ld8uOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZClgMr/dnIKCNizEnOVPxt+kKdf8/o5uNc7rAdx1ZTsL4osQmNCu9/vBkHFz/TbSSHSy5vxEvWaKCigQ1odJo5aAgKwTQQB8E04GPo6dbispzCvH5Ehx8YNFbm+mYjhmz7zic0aGFEk+cOsh/brLyCr7UDpPJ3fmXeFZMUFRpy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCK6QHt5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCK6QHt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764181097; x=1795717097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MZ0MIsOmg1hO7QG4cNtDsbOW2oOK8x3D3Qq1ld8uOc=;
  b=HCK6QHt5h5nb/Vge+s99IR4qqpA9eqif1owU96BuP80X2Og9shP7HIfO
   a7wQkUyZpoRcXWlor+OlaTamwC2roZUEY2wytxmrl2mgjfJ8/GfeWlx0Z
   X8tZDBJTFSNdviMN2MhAzpyq6Kwnl5eRWZGYWUk3gUz9u+tMZXTDQDUFz
   M3xwtFor4IR9eIMqTFf7Y4I0AfpWqcFzvY1Hrfi1ThkZmjozIO3c61rZc
   marfTq1hofmZfNpU5LwH2dNG6T9kvTmzkleVr0d5yNw+GqZwnc9vAsc45
   rjWn0x0N3VXfxQiF8VleP+SFizv7s1qThqUiBRANoSd88g0xgEGRiTMWM
   w==;
X-CSE-ConnectionGUID: pwbHt0i/QkmsTN1pJ01ruQ==
X-CSE-MsgGUID: ydJRddGyRW+NRPViW5OFEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66174029"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66174029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:18:16 -0800
X-CSE-ConnectionGUID: Rs0APqoHRqW3Z9PCk8IwhQ==
X-CSE-MsgGUID: gMLIAmUqQRuxce6knT7yxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193814209"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 10:18:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOK5j-000000003EX-3exv;
	Wed, 26 Nov 2025 18:18:11 +0000
Date: Thu, 27 Nov 2025 02:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, lee@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: mc13xxx-core: Fix memory leak in
 mc13xxx_add_subdevice_pdata()
Message-ID: <202511270127.8j2J6hwF-lkp@intel.com>
References: <20251125171936.98101-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125171936.98101-1-nihaal@cse.iitm.ac.in>

Hi Abdun,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes lee-leds/for-leds-next linus/master v6.18-rc7 next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abdun-Nihaal/mfd-mc13xxx-core-Fix-memory-leak-in-mc13xxx_add_subdevice_pdata/20251126-012428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20251125171936.98101-1-nihaal%40cse.iitm.ac.in
patch subject: [PATCH] mfd: mc13xxx-core: Fix memory leak in mc13xxx_add_subdevice_pdata()
config: x86_64-buildonly-randconfig-003-20251126 (https://download.01.org/0day-ci/archive/20251127/202511270127.8j2J6hwF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270127.8j2J6hwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270127.8j2J6hwF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/mc13xxx-core.c:388:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |                 kfree(cell.name);
         |                 ^
   1 error generated.


vim +/kfree +388 drivers/mfd/mc13xxx-core.c

   364	
   365	static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
   366			const char *format, void *pdata, size_t pdata_size)
   367	{
   368		int ret;
   369		char buf[30];
   370		const char *name = mc13xxx_get_chipname(mc13xxx);
   371	
   372		struct mfd_cell cell = {
   373			.platform_data = pdata,
   374			.pdata_size = pdata_size,
   375		};
   376	
   377		/* there is no asnprintf in the kernel :-( */
   378		if (snprintf(buf, sizeof(buf), format, name) > sizeof(buf))
   379			return -E2BIG;
   380	
   381		cell.name = kmemdup(buf, strlen(buf) + 1, GFP_KERNEL);
   382		if (!cell.name)
   383			return -ENOMEM;
   384	
   385		ret = mfd_add_devices(mc13xxx->dev, -1, &cell, 1, NULL, 0,
   386				       regmap_irq_get_domain(mc13xxx->irq_data));
   387		if (ret)
 > 388			kfree(cell.name);
   389		return ret;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
