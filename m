Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8F31ED8B;
	Fri,  6 Mar 2026 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772763887; cv=none; b=VyV7ERxCjuGgK7CUqFdkNNCM/vcaqaDLRqqRMBL6elRkGOaQSzgDoE8wBaMJri/IO8Ub/6b2/8OQrF/+8Xh3b7pQHnCQmcCiHPc2EbZDvHf8Sf00uw4/EKJoLQmWWlNTO4YjeHDtWQKmsJ2TzyXsjU2oMVuxQjaSN1/uf6DMfAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772763887; c=relaxed/simple;
	bh=sEhh7J+6Op6fJqXQ41qlmP+Br6OukmjsfzQUidfmUGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ULxNLS/RWieBRo1HoJihgV0w4hmo7uTDBT4QFVGKXltWu01uWf6I+ABWLq6nTz8o0eKrD5jWkVuIqdW3Y2E6my9yKMVYQlvkZ2/006WDvabZi2SVuqT9E8ou+Mi7v+/Y2alO91YxssLCPh+A4ED6ARXW54n1K7UzSKajMjM07ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9bcNroV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9bcNroV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772763885; x=1804299885;
  h=date:from:to:cc:subject:message-id;
  bh=sEhh7J+6Op6fJqXQ41qlmP+Br6OukmjsfzQUidfmUGI=;
  b=F9bcNroVwxLkBjHAUFIpBz+ft7oOTrkluWImRUIGbT083xBUyPb5bJYR
   LSvPI1IJJY4tymv7Jbaqa/pZprPGmu5K74oC9xLdS1OeS6Rf3myE3tHZU
   t8CfeZt17w/jRoJGRP53FvuooD5G9ynbWUCXjy/hZj7FpsumHpn/1UGWh
   npNm/tZR8b6MDa5l4M69NZ2dtYboGGtZMQ46hteWEyEsc7hky3DH+mVXz
   bBg3CduW4cOiwxbx4d+B3q3M9T4ZYtn5e3MvtbHCZVLYbKReLq9KPtvEL
   5/gNbbHTFMi1xyEdhNiLPwIRBPc4Ev/CYr7qdeDKSalpJZI160Jwp/uo1
   A==;
X-CSE-ConnectionGUID: N8lEnukFRziK3A1sBlaL8Q==
X-CSE-MsgGUID: fqRfX5nDQqqsytybtGzAtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91259140"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91259140"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:24:45 -0800
X-CSE-ConnectionGUID: he9ffZLUR8+MTsmtz0SZtA==
X-CSE-MsgGUID: Uvw26Q7ATguu6KI7FyWqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="216662663"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 18:24:42 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyKro-000000000Cr-0sCH;
	Fri, 06 Mar 2026 02:24:40 +0000
Date: Fri, 06 Mar 2026 10:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 441/467] Warning:
 drivers/net/ethernet/intel/libie/fwlog.c:479 function parameter 'iocb' not
 described in 'libie_debugfs_nr_messages_read'
Message-ID: <202603061007.Nfu17vG3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   efeca34a8e5e90b253f0ac73b9fa10aeff4f027c
commit: 1e6629a61ee4af79ce25da0c9e66d30269fd633b [441/467] ethernet: convert remaining fops to read/write iterators
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260306/202603061007.Nfu17vG3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061007.Nfu17vG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061007.Nfu17vG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:479 function parameter 'iocb' not described in 'libie_debugfs_nr_messages_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:479 function parameter 'to' not described in 'libie_debugfs_nr_messages_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:550 function parameter 'iocb' not described in 'libie_debugfs_enable_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:550 function parameter 'to' not described in 'libie_debugfs_enable_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:641 function parameter 'iocb' not described in 'libie_debugfs_log_size_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:641 function parameter 'to' not described in 'libie_debugfs_log_size_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:774 function parameter 'iocb' not described in 'libie_debugfs_data_write'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:774 function parameter 'from' not described in 'libie_debugfs_data_write'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:479 function parameter 'iocb' not described in 'libie_debugfs_nr_messages_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:479 function parameter 'to' not described in 'libie_debugfs_nr_messages_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:550 function parameter 'iocb' not described in 'libie_debugfs_enable_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:550 function parameter 'to' not described in 'libie_debugfs_enable_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:641 function parameter 'iocb' not described in 'libie_debugfs_log_size_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:641 function parameter 'to' not described in 'libie_debugfs_log_size_read'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:774 function parameter 'iocb' not described in 'libie_debugfs_data_write'
>> Warning: drivers/net/ethernet/intel/libie/fwlog.c:774 function parameter 'from' not described in 'libie_debugfs_data_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
