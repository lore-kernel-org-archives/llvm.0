Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B72116F4;
	Wed,  6 Aug 2025 06:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754463230; cv=none; b=trpwGPgT0vUGy+BROqXONIvAgfOV/5bZKFqLd1T/+LECM3dohFrookczMao/pk82XCL7NwKVq0gek7P8RJOFzVgLM1Sysa0atHb4ZV5+3F+iUmqOr6630ALpepzNMhyTXKG2TY0sg5W88RcaLhs9jUz1YqBcX0gJ+Z5qapPhICk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754463230; c=relaxed/simple;
	bh=crE24hj8Eoik0NSSJPzl9GnH8mFS5y7oD6aiLP9y3gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOH0BzXZNC6YPUosQK5dtSKaYKpjG/zO+99efx0LRjpjotRyoaJAOVw8qCcE8z7emnPiq4vjd/J1M25oAoisc7l1iaxYDIf4ma/sHUG9We+O7LWenAN1Z6hgg5DX8+TF5PsjDdhus2t2gtxCOtqFrUMLjU6z1wo7ZqD0x1IX3Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7T7HHFU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7T7HHFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754463228; x=1785999228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crE24hj8Eoik0NSSJPzl9GnH8mFS5y7oD6aiLP9y3gw=;
  b=A7T7HHFUBFi1Y4/03H1CpulyT2n/duARc0DRruEWQPBTr8/neQ4+h+F+
   pS1Tc8MyY0yQAHZIRwA5EnWfNMpJLH7SPou+Obnc0jHpvSuWBNGpUjM4l
   w2T3Sr+HRHDJ0CRMRRz8Go+6OztJet1TumCyxMuK4RUIbEXZpwxesgFYX
   vJX4UqGlTLxcq4pIvU7OppA/acbEwXJkV/BhPjxcBv0qRT8y7QUGn1u9X
   1zxlEYRoSgj8hcLtGf9ZnJWtlP+MylqIIrtNcRltQdcW2b6BAdMX+/ngn
   TqKfkZjtFikEoc5uJQ27ICca/5JGnrz6YvUSM89AgIokDyV1p6Zh/IYER
   w==;
X-CSE-ConnectionGUID: dRM/yu4wR1K/AzapQgVnqg==
X-CSE-MsgGUID: GOP1C2PqQnulUIHBS3L/qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56483664"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56483664"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 23:53:47 -0700
X-CSE-ConnectionGUID: KnsRGmvWTNqD/C0Fgt9nVg==
X-CSE-MsgGUID: qVf3xPHpRASgTz2qLA1v5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164711262"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Aug 2025 23:53:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujY1w-0001M6-14;
	Wed, 06 Aug 2025 06:53:44 +0000
Date: Wed, 6 Aug 2025 14:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 59/85] 14 | use crate::error::to_result;
Message-ID: <202508061455.8ckVeMVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: b8387350530fcbed7c4d7d7840a789fd09501b68 [59/85] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250806/202508061455.8ckVeMVh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061455.8ckVeMVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061455.8ckVeMVh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:14:5
   |
>> 14 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
