Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFAE1C3D;
	Sun, 25 Aug 2024 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724553323; cv=none; b=aVHBDcs34/8hL7bmWB1H+4KWkyfh5GnSeKINi/5uqe0HqkGqA2r9Xd6/qWSL+9bLW7CZsQ/RADGverkWH5Gna+LB82ug9r0X/kDJD7YRQY3BpdTEyyX0eQXnpswYZT3Q0H6+0Q/6zyRRKLzFkfJD+nvC1Z41F2uBQDFFdY1rqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724553323; c=relaxed/simple;
	bh=TiTZ37gh8BuCevxe9GOpbW8zYGrfcTugzKsODcqgI8c=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhaLgb57ZPPP36KdtIwhxD+tlbpASJjdzFY91+982cC5BZi5pL73fId3rzhdAwUv5DN3AxYOqvX8HINiVMmdWCJMerD4ByChE5GG8FlzOwxa03DcO7fsRZn2rFIOUJqnHJDnr8XJIx05C2mjCzY4EneweyAvzIzPPQqAb/+pJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDdfa5No; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDdfa5No"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724553322; x=1756089322;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TiTZ37gh8BuCevxe9GOpbW8zYGrfcTugzKsODcqgI8c=;
  b=KDdfa5NouivJxA+HNxYFMs2W5S8e0DgDJuyJnIgjc7fhnhC5yfoKYYdI
   724CG3toD/13qrfaFXRb17ZpBd7/I8Mxn285s4F9BauU4BspI2RHOqStd
   uF7P9zzr2G+S6gysxfmpp8czNMJBIKt2DMalf9PdEWYFTuzwKkRH7Mf4a
   CWZUHqesUTem2CW6yVywJHwQM0lhnXKMFFXMnpgu6KgKybEcFRhEYCtNI
   X8WsV+H5CfFUKVCdRVTz4LVKDDebPmOQjGYwZYQVgR/cpo4zi8/FvdQ23
   ffNnzAzji32N21zjnqv5V/JMFe5IMhKdswnrPtai5kfVpEROkSjeC1eC/
   g==;
X-CSE-ConnectionGUID: syugElZlQ7enB9SHdaX2jA==
X-CSE-MsgGUID: NNrgoLyrTFqtIhqrI1jTPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="48388743"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="48388743"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 19:35:21 -0700
X-CSE-ConnectionGUID: IjayFyK2SI+xnEFfj7wn8g==
X-CSE-MsgGUID: zKdPu92VQEykbWyikRbqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="62222890"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Aug 2024 19:35:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1si366-000Etv-1v;
	Sun, 25 Aug 2024 02:35:18 +0000
Date: Sun, 25 Aug 2024 10:34:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [broonie-misc:spi-6.12 19/21] vmlinux.o: warning: objtool:
 .text.wpcm_fiu_probe: unexpected end of section
Message-ID: <202408251028.hjY7PYx8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git spi-6.12
head:   91232b00b1a5d2486770c72c51a752a77c7601b2
commit: 3bf2a5359b0bde22418705ec862ac5077312e4c2 [19/21] spi: wpcm-fiu: Use devm_platform_ioremap_resource_byname()
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240825/202408251028.hjY7PYx8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408251028.hjY7PYx8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408251028.hjY7PYx8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: .text.exynos_sysmmu_irq: unexpected end of section
>> vmlinux.o: warning: objtool: .text.wpcm_fiu_probe: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
