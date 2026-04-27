Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732093AEF53;
	Mon, 27 Apr 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280499; cv=none; b=dCR1lkp7ZMRw34SNHrr9undzx7Aq+3Nb5QbLytJRgCeTkgEy3oO+sBwBil2C/QyUQGZemetf8o9iqQJm7v8L/O8HdnvwqdKLdtfjCF7gLKElzy6w+ajCqVdDL1W9qGWALcqC06u7ZPHvc6f3nSbSJkaCs9rQj/mFf37RIC4/W8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280499; c=relaxed/simple;
	bh=7TFykww9wbcZcyiqV8OrkgezD/JvoUTM2W0iahiTUHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mQK8MnKk8Nbgn7Xa57epCsWI/7zDzM1p9O7NhGkXCfb5Os/Ka5uzg2nb9HOo3Rfpu2+l3ElDkZhSLoYjRZIxEIgqqWLan6il4mZoCAS1LG0Ij7LWU17hgZoluAh6l69K6GG5UhgINB7kMXDLwKZotD9dUAZ1yknFmKR2BqLEyks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Un/TSCKY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Un/TSCKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777280498; x=1808816498;
  h=date:from:to:cc:subject:message-id;
  bh=7TFykww9wbcZcyiqV8OrkgezD/JvoUTM2W0iahiTUHU=;
  b=Un/TSCKY9xENZdvryIgRlYy1/xN/wkYoJUq2jLrFRLpqGnDs0J/n26rB
   9d0T//W8NuWl2P5DWfjsI7kYqYmFzJcCfA5I/hrohfxN5MtA+3YJ5nRHh
   Q0JmKleVdbB9eP4oq9myLnWT4Kf0zBPj2JTRpceogWCgl0fMBp+kcGPDR
   7GZ82qtK+MPMOrA5sRKKVODtz9HfWLtqksoLJAS4dUDXZZIR36JIdVqcm
   EMHgnIEnHIvWPOygnffvWgkV67V8igJutvf2QuuZL/ZABmVQxV2EL8IJ+
   ILyZIpOZGvL7SffAJLkyHPhXcm6EBP2WDOcN1h66N7ry31Gs/OHhIONjk
   Q==;
X-CSE-ConnectionGUID: CBafH03kQOWG8DkNg5jG5w==
X-CSE-MsgGUID: 3Y5lUWM1TYCoV5TiGDzkzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89246818"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="89246818"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:01:38 -0700
X-CSE-ConnectionGUID: cn5Pbir5T1+Lkugb/jJxoA==
X-CSE-MsgGUID: SUMMSiUjShujXhrKwMxkvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229018397"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 02:01:35 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHHqO-000000008er-36tu;
	Mon, 27 Apr 2026 09:01:32 +0000
Date: Mon, 27 Apr 2026 17:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [arnd-playground:config-gpio-legacy-7.1 10/22]
 drivers/nfc/nfcmrvl/main.c:246:21: error: call to undeclared function
 'of_property_read_bool'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604271603.lIOX6xo2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.1
head:   bbb302c86fdfa7705d8511a74c4b6db205cd2683
commit: e11421cee13b5d2560a2dc660ccb7ab8137bfba1 [10/22] [v2] nfc: marvell: convert to gpio descriptors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260427/202604271603.lIOX6xo2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604271603.lIOX6xo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604271603.lIOX6xo2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nfc/nfcmrvl/main.c:246:21: error: call to undeclared function 'of_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |         pdata->hci_muxed = of_property_read_bool(node, "hci-muxed");
         |                            ^
   1 error generated.


vim +/of_property_read_bool +246 drivers/nfc/nfcmrvl/main.c

3194c6870158e3 Vincent Cuissard 2015-10-26  242  
dc14bdef8762a8 Vincent Cuissard 2015-06-11  243  int nfcmrvl_parse_dt(struct device_node *node,
dc14bdef8762a8 Vincent Cuissard 2015-06-11  244  		     struct nfcmrvl_platform_data *pdata)
dc14bdef8762a8 Vincent Cuissard 2015-06-11  245  {
cc6d85c1cb5ccc Rob Herring      2023-03-14 @246  	pdata->hci_muxed = of_property_read_bool(node, "hci-muxed");
dc14bdef8762a8 Vincent Cuissard 2015-06-11  247  
dc14bdef8762a8 Vincent Cuissard 2015-06-11  248  	return 0;
dc14bdef8762a8 Vincent Cuissard 2015-06-11  249  }
dc14bdef8762a8 Vincent Cuissard 2015-06-11  250  EXPORT_SYMBOL_GPL(nfcmrvl_parse_dt);
dc14bdef8762a8 Vincent Cuissard 2015-06-11  251  

:::::: The code at line 246 was first introduced by commit
:::::: cc6d85c1cb5ccc04c594392339c81227abd1667d nfc: mrvl: Use of_property_read_bool() for boolean properties

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
