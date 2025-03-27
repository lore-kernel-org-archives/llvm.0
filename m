Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F6718C345;
	Thu, 27 Mar 2025 23:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119816; cv=none; b=HINjVDwO9mdQx7KZz9mJ2DLqBfry4VAGKnXkw+RiM6MrnMr5WTOc0uhg5iWfE829Lhnam2a9DzO5ND0zBpqqkfjt8wKSkpu2zJC1RXuglVFNOAh1Jh9lLcnqMzR+bPqPp+6hkD/JQf9ai60amA6YjHLfXrUMH5wMXT9dBx3ReUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119816; c=relaxed/simple;
	bh=U8hrut4e7c/zelG75regQTMHaSOj6OqyRyQaaAwaVhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJIuonxn17KnJeF2ihnXi255WrSoBlFTjQZxkw80tn3hqIUMtpCi1cJMmA66ocnO3KZEUTU3fF8sRykgf2Qb5AzRM6wgRfmyQpDbQcN8NU3fgcFenf6fSD8eUv39VT7VT55j7vjXXExQejNs/JJ3dszU5MrOY7tvTOVbz1OLiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjVVIaj/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjVVIaj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119815; x=1774655815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U8hrut4e7c/zelG75regQTMHaSOj6OqyRyQaaAwaVhY=;
  b=WjVVIaj/5LIiI2Nm3l4gNgX2sPkhjIY49va7w62rY2ooVTSDPB7KDLWF
   gPZDDYDkty+7VIbHmCF3+TRPYpcuXYhyVSF4q59C4A6NvvypGuVyLoQgi
   fo1bShPpHfBt02Sx6/4jGc/ArH2xciRmLW5BQVD3omfwmaEwSfdTGkFJl
   pn7vEXlNA9GO21bnbVrDIQNpAdRwTNa7b4VlGvL8wfqZoVTUehS+Sby19
   zRH4EEWWnLTHwP4xjoNW2uFPWrryAGCcCxpgUf+vERQQdTVq6sreGVRu4
   stnAT7w2q8nxrSUt7YpjUpieCb99QeJb58p8ta6kwbepJbzGuXQ8e43I6
   w==;
X-CSE-ConnectionGUID: GGNAXq52SJW0pEribOYKbQ==
X-CSE-MsgGUID: KdMCK1b1TbCK1twfT3Kejg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61872064"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="61872064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:56:54 -0700
X-CSE-ConnectionGUID: /ckNeIfxSz2GFoVS1oDgOw==
X-CSE-MsgGUID: iB2z3XWsQGSGTg9sh/+R9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125266151"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 16:56:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txx5f-000718-0U;
	Thu, 27 Mar 2025 23:56:51 +0000
Date: Fri, 28 Mar 2025 07:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file3No0df 19/20] ERROR: modpost: "qcom_nandc_alloc"
 [drivers/spi/spi-qpic-snand.ko] undefined!
Message-ID: <202503280759.XhwLcV7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file3No0df
head:   40369bfe717e96e26650eeecfa5a6363563df6e4
commit: d32c4e58545f17caaa854415f854691e32d42075 [19/20] spi: SPI_QPIC_SNAND should be tristate and depend on MTD
config: powerpc-randconfig-003-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280759.XhwLcV7m-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280759.XhwLcV7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280759.XhwLcV7m-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "qcom_nandc_alloc" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_nandc_unalloc" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_write_reg_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_submit_descs" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_clear_read_regs" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_clear_bam_transaction" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_read_data_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_nandc_dev_to_mem" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_write_data_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
>> ERROR: modpost: "qcom_read_reg_dma" [drivers/spi/spi-qpic-snand.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
