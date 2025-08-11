Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E672D94A8;
	Mon, 11 Aug 2025 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896427; cv=none; b=L8vRb5zCmnZ7KZsl15giBIefO3zjjmKvjweOTx+1tKQCg1bbfK2CEZ0PWL5OUx630ibP+RkDXRrtiZKWno4vcgABgJ817ikQu5t+8v82v8ItAzYq5m5YxCpNl9HPYRfWbid6ejtwMeyTic23zDoEZ9JZf/5jZp/yOhNw5l14JiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896427; c=relaxed/simple;
	bh=Lzffy5fcjgivNaI8RFUP+WunBH8zFgU8+d56e/JoCnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFgGTh+ctjdN/NPagHP7TydtuW1JnKH/hN2Ec2AMgzrkHZopo7wZXBlDnZItXtzQHJnWw3pve/rYGTYUiHubVgLllQUfv7Wi1T/qI4jABuUcVAVcm1axomr+SiuLU6AeVOx1j1r9bliaNjmZ3wnqAS9iaU7Gw3QCfjkTVTXfcSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ek+DU1Tb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ek+DU1Tb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754896425; x=1786432425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lzffy5fcjgivNaI8RFUP+WunBH8zFgU8+d56e/JoCnE=;
  b=ek+DU1TbXV3/LxRgwuS0XuFSg8D/mbl9yjOUnT+6qU+I/QWOUMSxdLZZ
   wIuksrlzb0aK8TEX7sf4dWPg6t2cu5s1BactvGvS+d5LATva4S/HGjsmE
   sEqEq0LJYCXjXurkCfHfD7Cf5EqHDDGvceFVuV4wLp9iv+9ipe5cotfUo
   JnsUXST1aHRU9r7q62/6xgNn98ofsSLzTTOhddUnE4Bx/7Pc7nDfd23Hm
   Pjndx7V1Qejwytu7bCUIKWzHy7ftH0BM/SPNu/qN2hryxOltB3TZjpmZS
   Jd1fSANlNeNrLUzVEEPICTusTl3iHsRokwrgayVUVg8jyL7HWhkm05u97
   A==;
X-CSE-ConnectionGUID: lz4avyq+R1eTucEU5vq8DA==
X-CSE-MsgGUID: 0fCeeOFbS3qVzGdohBqkyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57014957"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57014957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 00:13:44 -0700
X-CSE-ConnectionGUID: WanqVVYPTOSx2UK3kUMksg==
X-CSE-MsgGUID: yvIRKw+gQ5mgQtoAK2gHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165835337"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 00:13:44 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulMiz-00031f-02;
	Mon, 11 Aug 2025 07:13:41 +0000
Date: Mon, 11 Aug 2025 09:13:40 +0200
From: kernel test robot <lkp@intel.com>
To: Nick Li <nick.li@foursemi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v5_20250723_nick_li_asoc_codecs_add_support_for_foursemi_fs2104_5s
 4/4] sound/soc/codecs/fs210x.c:1563:34: warning: unused variable
 'fs210x_of_match'
Message-ID: <202508110904.wMJ08z7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v5_20250723_nick_li_asoc_codecs_add_support_for_foursemi_fs2104_5s
head:   928092383393eb9b0c55f40f036158aa3b4ca74a
commit: 928092383393eb9b0c55f40f036158aa3b4ca74a [4/4] ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver
config: um-randconfig-2002-20250811 (https://download.01.org/0day-ci/archive/20250811/202508110904.wMJ08z7r-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110904.wMJ08z7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110904.wMJ08z7r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/fs210x.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> sound/soc/codecs/fs210x.c:1563:34: warning: unused variable 'fs210x_of_match' [-Wunused-const-variable]
    1563 | static const struct of_device_id fs210x_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/fs210x_of_match +1563 sound/soc/codecs/fs210x.c

  1562	
> 1563	static const struct of_device_id fs210x_of_match[] = {
  1564		{ .compatible = "foursemi,fs2105s", },
  1565		{},
  1566	};
  1567	MODULE_DEVICE_TABLE(of, fs210x_of_match);
  1568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
