Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D220764C;
	Fri, 10 Jan 2025 23:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736552151; cv=none; b=D7jmoSaL9mvqHOBYrJhCGuobrQXVd8L6lhzQRjuBXMIKDLVXUUKCtg2Zhy2gQ+89eFU2zZ5U9gdaATRFmvbBmUIyKrWIfwUOZTzqKYDdtduLwah/nIaRuJgNiAjS5JnBOEGTwhLvyqMtb0lQc7wpIUSaDM5QsgPX8kjJm6p79cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736552151; c=relaxed/simple;
	bh=gk1ii41uDS6rbYGxwNhSgkuPVl96zUiN/YbbqoElL0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ES7PKuMWzQ/BsNUM13v8g4FvDCG9TeME2+19KU9fa9LvmrePd8j8ATIZMIuhgzXsYDadE1orTa7jaQf/By91B3YflIc4YIAKlTI+Sy2/pQR2ZAXPLfDNjR8osRgY4f/KkNU7Woeo6NRKHzIT3KApHQxTj5Bc8rUBBRI8lV+DGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xn4ygbd6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xn4ygbd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736552149; x=1768088149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gk1ii41uDS6rbYGxwNhSgkuPVl96zUiN/YbbqoElL0c=;
  b=Xn4ygbd62Lnrdlbz/L+xXe6U8I6jeMXnxAKkNh9uWN0SUsA+XMLmej93
   hCiM1ee7mH/lfKt34jbubteEJBOrhuwNR3aj3bju6y45PQld34XLobmbX
   o6BlMpAFcMrOA0POZStUy84KcTQBj4q1Iefd/cXSKH8l6GRSlEXz4+g+a
   wbGsxjL4Y/RZvtswwXmumpw5WudBI6c4iKRDZyh9M5DobfSE8to+ytLyn
   HSleuYeqnpmgOhiIZFrdsIl0WamvdNu1PB+OP0MellHVRVWnUDjZ6GBdX
   ripI70boE9Ib1ZtEtA2cEAh3W1EeR9UwJkAjpd1Z4HTKAGJqSN69eUhAR
   Q==;
X-CSE-ConnectionGUID: L7jaPNVGQWGD0WPrw+ijSw==
X-CSE-MsgGUID: aLrz6CyTRvKyup5R8sAX2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54279289"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="54279289"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 15:35:48 -0800
X-CSE-ConnectionGUID: P/tBW3wxSSSWm5Cj4ygqTQ==
X-CSE-MsgGUID: apulpcyhR46c9Cb2dYrCTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="108779070"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jan 2025 15:35:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWOXZ-000Jt9-0H;
	Fri, 10 Jan 2025 23:35:45 +0000
Date: Sat, 11 Jan 2025 07:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20241224_miquel_raynal_spi_nand_spi_mem_dtr_support
 20/20] drivers/spi/spi-mem.c:580:5: error: conflicting types for
 'spi_mem_calc_op_duration'
Message-ID: <202501110755.JT9rdfyf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20241224_miquel_raynal_spi_nand_spi_mem_dtr_support
head:   136b0c14632e8cff0003f63d0555ce73eaed5220
commit: 136b0c14632e8cff0003f63d0555ce73eaed5220 [20/20] spi: spi-mem: Estimate the time taken by operations
config: i386-buildonly-randconfig-006-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110755.JT9rdfyf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110755.JT9rdfyf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110755.JT9rdfyf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-mem.c:580:5: error: conflicting types for 'spi_mem_calc_op_duration'
     580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
         |     ^
   include/linux/spi/spi-mem.h:427:5: note: previous declaration is here
     427 | u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);
         |     ^
   1 error generated.


vim +/spi_mem_calc_op_duration +580 drivers/spi/spi-mem.c

   564	
   565	/**
   566	 * spi_mem_calc_op_duration() - Derives the theoretical length (in ns) of an
   567	 *			        operation. This helps finding the best variant
   568	 *			        among a list of possible choices.
   569	 * @op: the operation to benchmark
   570	 *
   571	 * Some chips have per-op frequency limitations, PCBs usually have their own
   572	 * limitations as well, and controllers can support dual, quad or even octal
   573	 * modes, sometimes in DTR. All these combinations make it impossible to
   574	 * statically list the best combination for all situations. If we want something
   575	 * accurate, all these combinations should be rated (eg. with a time estimate)
   576	 * and the best pick should be taken based on these calculations.
   577	 *
   578	 * Returns a ns estimate for the time this op would take.
   579	 */
 > 580	u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
   581	{
   582		u64 ncycles = 0;
   583		u32 ns_per_cycles;
   584	
   585		ns_per_cycles = 1000000000 / op->max_freq;
   586		ncycles += ((op->cmd.nbytes * 8) / op->cmd.buswidth) / (op->cmd.dtr ? 2 : 1);
   587		ncycles += ((op->addr.nbytes * 8) / op->addr.buswidth) / (op->addr.dtr ? 2 : 1);
   588		ncycles += ((op->dummy.nbytes * 8) / op->dummy.buswidth) / (op->dummy.dtr ? 2 : 1);
   589		ncycles += ((op->data.nbytes * 8) / op->data.buswidth) / (op->data.dtr ? 2 : 1);
   590	
   591		return ncycles * ns_per_cycles;
   592	}
   593	EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
   594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
