Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E113750BC;
	Tue,  7 Apr 2026 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534189; cv=none; b=Uad07+Nu/YDP1AHdk/V6RFbPLVJ3SRkWXN6H7oLAJ60tR4pwOqmpy8PZJuQPIJXIBsOrozkWeRq0F1ieCiKgpZ6EUR2pZu+xvqJ5Fhz3vVBbX+FdJNGsC/g9HfMqnrnvrK1bfTKX9S3EAfxyC3cQ5PJ2/tfd8B4gLt2i0PgeFOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534189; c=relaxed/simple;
	bh=xzQIvZ7APwc24TXrR6DDOWj2wGFZBNMX/LzeLzY7EBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UJODAXd/cYxTdts9MOqMAVlq3B9lB9wK2RQsyYmYIDqJ4U3oqyMQCRnWnIjl3qaFDLKfBOpzZs6whNdeT/IQPAzfYucHZnnfFt39E0HHciAe657AxgaL+pm/GbjbVeh9kNKHrCMbPKh0dRl27WSESQARzICABt8EFl8dncrCquQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bg0EKyZO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg0EKyZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534188; x=1807070188;
  h=date:from:to:cc:subject:message-id;
  bh=xzQIvZ7APwc24TXrR6DDOWj2wGFZBNMX/LzeLzY7EBA=;
  b=bg0EKyZOo4SW0PWjTtbXAb2Okf+slvGBIRMPbqFoJ3XFsgoVgAZEtfoh
   CjSd8mJLiYhqvGeH/0dNXJV/uam5WzNlq5uYBzF0OcrqI/WPGJ5bqwIwm
   zoBGuFBUHXQsPegsI7eLVn6eUwQZgW0HRNVNXA/DnNUdtZWyqwsYmhzvR
   X8eCBlghvuy+X2OiJdEuGc8jE5k69NaKoMqi8PmN474+ntxEqatFcL94W
   TPmsRr7gH23QHSnlfd3KvCb9XQ4HOVyyvTEGQmWi5H2pjXUtSk1tEg5RZ
   pqs9KZW2oIZcXVpRejoo4gO33UiKu2SQcXTVj2H4p9OLH7gnNTxOcduUs
   Q==;
X-CSE-ConnectionGUID: /DmOG02UQmuZmEOA6Fohrg==
X-CSE-MsgGUID: LMTD2rHkTReSZUlUWUcNsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87563824"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87563824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:28 -0700
X-CSE-ConnectionGUID: loklXGm3TYmRQ1FX4zHWMQ==
X-CSE-MsgGUID: 7mMw5A+XQweskTFUzERliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232926674"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 20:56:26 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY7-0000000004f-4AgT;
	Tue, 07 Apr 2026 03:56:23 +0000
Date: Tue, 07 Apr 2026 11:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 31/68] 19 | use
 crate::error::to_result;
Message-ID: <202604041956.aRM3BuI8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   f7a3080ba37b989ad2fd83054a4b458af97b635d
commit: 3fbc0c3a68510319d0b8cd6e63ebe903ec41ef25 [31/68] rust: of: Add reserved_mem_region_to_resource_byname()
config: um-randconfig-001-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041956.aRM3BuI8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041956.aRM3BuI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041956.aRM3BuI8-lkp@intel.com/

All errors (new ones prefixed by >>):

   warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:19:5
   |
>> 19 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
