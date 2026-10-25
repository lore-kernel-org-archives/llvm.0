Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792921732;
	b=VgXwGri7t/95n0/Rysi0PNlyUXJjkYEDL2uKz+s6SygkOvk4HCpZ9w+yrKPuWwXDxBAk
	 BS7emxgANOJ291Oji9tff9KsjempKxcIpBGV/JHlMY/GvjNXdtXMgyr6HnELTmvJu2rTg
	 0YW//F16D3JHSL4EFuQlK1Bz6Bn9njFrJ6DKKoBX5hDFOIpErmopDDv/yd54ysNkeDgGf
	 qM1dGKJBP0nNPnjYB7MaA0Uc3+ef7SuwxTwPM7OysAO0yUJ2q6tdzkgBiQV7vIanhCKfC
	 3CyJAoa09CNTpuE+AbfdREejEHto/HJz+c156wfjUkNsdHAWmJnv77N1HDxDjaVZq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792921732;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=kgQ3FbKJprxc3vcZIzoYw5NtolkEXueSdGobmtDOSJc=;
	b=ki+6wws4x/lQ92TfpE1zk3o7DrBxXb9BjGGqzrfFS+qeUs5I862LC1VISYlFigWG0zzB
	 mIQgkypyXTvasuNw+p41Un03ZOgwI8O8+ZNl/ohgExLt058cOxpw7Ntv7RoQyKtFScttc
	 wwAc/CkHf7hyQepJehtCydVnnXjCQdmVKEyvaA2AA0AeIN3e+u25sycVUVGSHjSCt4Fa2
	 fWGANl/sE7DXcafFle2j5DucPTIr4/1vuFYpDBMPsm8UCYxIh7KJ36W1+zCu4FhiDkKa2
	 2b+t7qwlyjdU7ckLImrQLcLPwPe6Ff/lZJlXw8Y2+3SPFJrrGzI+639OPHTIyTiZ7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NzEd/I6+";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C254606A31A;
	Sun, 25 Oct 2026 09:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C254606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NzEd/I6+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792921730; x=1824457730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ajxfWfwQAaedcTF4TPRskwOc5EGNyPBcpOAN46bXcxQ=;
  b=NzEd/I6+h5jE+0Bk8yzQ0267hi7cwljSmuvpZmsSYeGqW6exumR8G5IU
   C9lews2RW9IqhFd2sU5jZBU6x7uWmmrnxGKW4RgP7/8PC+YQCyq2Pq5Vu
   hcgMQ1Up5FtHMpQS8nUm5QwY+Hv+hDEy/NJCpTxQgnUd2i2KUiYfyuDKH
   mKYV//7VMo1mHqmkWESGy1Z+6J0xS5Nfy5SqECczvspCuCYGO3L/bAl9w
   pN5VsPfZQS4rYC9ESNoHcoQRkqAWCuoyYUPSBVwnlN5Z9WjF3A4UrthBz
   aroEDEJYhIMNaPSPxOk06vRpXecS8DjN9hdVa79X0+136Vu3OWm8E4J4i
   w==;
X-CSE-ConnectionGUID: XVwBu3x+ToqkRGOOD/misw==
X-CSE-MsgGUID: sZ0bSqVwRLStiOnNim1Wtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1614584"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1614584"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 02:48:50 -0700
X-CSE-ConnectionGUID: xjPoVInqRUiyi+MX6BGktA==
X-CSE-MsgGUID: 1Q0wmF48SPGT1K5hZem6kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4390057"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Oct 2026 02:48:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKuqL-00000000Uhi-2sOG;
	Sun, 25 Oct 2026 09:48:45 +0000
Date: Sun, 25 Oct 2026 17:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [linux-next:master 19256/19841]
 drivers/gpio/gpio-sim.c:1394:3: error: field designator 'ct_attrs_const' does
 not refer to any field in type 'const struct config_item_type'
Message-ID: <202610251714.Sht9doVs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20a33c6b6cbe7e4805dfb6cd68816937443aa148
commit: b57f502a681296be357e5c9dc72b53b083b26472 [19256/19841] gpio: sim: constify struct configfs_attribute
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261025/202610251714.Sht9doVs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251714.Sht9doVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251714.Sht9doVs-lkp@intel.com/

Note: the linux-next/master HEAD 20a33c6b6cbe7e4805dfb6cd68816937443aa148 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sim.c:1394:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1394 |         .ct_attrs_const = gpio_sim_hog_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1448:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1448 |         .ct_attrs_const = gpio_sim_line_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1509:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1509 |         .ct_attrs_const = gpio_sim_bank_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1564:3: error: field designator 'ct_attrs_const' does not refer to any field in type 'const struct config_item_type'
    1564 |         .ct_attrs_const = gpio_sim_device_config_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +1394 drivers/gpio/gpio-sim.c

  1391	
  1392	static const struct config_item_type gpio_sim_hog_config_type = {
  1393		.ct_item_ops	= &gpio_sim_hog_config_item_ops,
> 1394		.ct_attrs_const	= gpio_sim_hog_config_attrs,
  1395		.ct_owner	= THIS_MODULE,
  1396	};
  1397	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
