Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BA21E3B8;
	Wed, 16 Oct 2024 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075752; cv=none; b=fGN2sowwMlzowVkYU7fUSAYLcfkHzwP6AZN+0BZ8xWgGsSR9uavnHaG7+tGFqPoPvENMfXvvB86sAJ5vvVzxm0Pik2RGaZHXCq986vxt8Wn4zZgFhefYmGHi4EdSrVXxMEjhe+WXbIzIn2uC7EJvZ4LDbTR4q+ZEjvZxiiZhWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075752; c=relaxed/simple;
	bh=K2hpFdOELAcSi23TdsYSOw0kMF0mIj3MyS5SsBg0jZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epB+qsyZZ3uCnbNMwexP0pimWmNSo5wB3Y8ETrQEG9HbeCgIk1wGqjQY90UYNATm5TGn3uuahcI/lQ3L8H/hkop0M7hfDMaB5o/c7g2meR8v4VYUuOpUfPPTZBbdDqbkEl/1qrN2stjdwR5jJD+eoKbU75edltGypqT8mjy2pww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8+oueYi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8+oueYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729075750; x=1760611750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K2hpFdOELAcSi23TdsYSOw0kMF0mIj3MyS5SsBg0jZY=;
  b=G8+oueYirYn6mP4TuZQ0SiELuYCkmAkvIQhSrMC7Im+LxYwi4j/ZiuRO
   m+Tfdx4yciBL/tLTGSO5YdCjvijzpvM7YTWJFUBvWV7sUUFbDqO84H7Ti
   aIPWy6SL3cal5zJNDNX3Z9LrbFm087eowayXncbbQyHORGvICRhN6nU6d
   hHlvu9M4B0NtIdqza+0H4++HlmYqm+wkrimUHA/2zXPuqSnIhmRsHL23f
   dhbZ+PI3eSdfzSWcgEs+RY3nx41jzqukqOaoIOKpGGckBRet9+njx6/3v
   vJtq5JgY9/BQH2B5vsYeh5lWcLriw4m45R2he7ndaN1jmkixdk+KtDlm3
   A==;
X-CSE-ConnectionGUID: HATQ22UtT2qmeacN33aQfg==
X-CSE-MsgGUID: gEYz9WZ9Tq6enT2W0UjGCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39063695"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39063695"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:49:09 -0700
X-CSE-ConnectionGUID: wVS2D2ydQPG+vmm4juLAmQ==
X-CSE-MsgGUID: 7PFgu0EfRDqYeVpaROx6Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82998981"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2024 03:49:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11aT-000KnP-2Q;
	Wed, 16 Oct 2024 10:49:05 +0000
Date: Wed, 16 Oct 2024 18:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/447] include/linux/nsc_gpio.h:34:36:
 warning: declaration of 'struct kiocb' will not be visible outside of this
 function
Message-ID: <202410161824.AYHswl4d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   019e5b86faffd0b70c51787fb0e5d430438b1dec
commit: fc9c917af3a60386818b0554243550687e4eb849 [16/447] char/nsc_gpio: convert to read/write iterators
config: i386-buildonly-randconfig-005-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161824.AYHswl4d-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161824.AYHswl4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161824.AYHswl4d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-net48xx.c:16:
>> include/linux/nsc_gpio.h:34:36: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
      34 | ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);
         |                                    ^
   include/linux/nsc_gpio.h:35:35: warning: declaration of 'struct kiocb' will not be visible outside of this function [-Wvisibility]
      35 | ssize_t nsc_gpio_read_iter(struct kiocb *iocb, struct iov_iter *to);
         |                                   ^
   2 warnings generated.


vim +34 include/linux/nsc_gpio.h

    33	
  > 34	ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
