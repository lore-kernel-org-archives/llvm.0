Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B7B66F;
	Sun,  3 Mar 2024 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709471632; cv=none; b=b/p3XIO6GZ45m2ZVj5c6jnSMYa7XciHhPYp9leeEv22cDgpSk+wLSda4qLvWWWNseDfpEtBt5WsKaUKWzolFGvTvp3/DsiCADR6sS5k8NgE9XGzlHwQm+25jSls0VTFLP0QbZ+KYjML98bmOuxseMSon8SiE4kGbXbwhHxWW2yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709471632; c=relaxed/simple;
	bh=m/yXCkcN6oOhoRMyXfkQ/SuedEu4kXt7zsCvoGBhUIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MftOgPxSgtB2tO+XgF0HwUhv+QVPGEluew4JdhBphTtcwIoJBLxIB8L2582mtxFvA2T57UoJ7ChKXp53us+7pipLEAISNltn9RxhkDd0BsfGUM6xw8omYHNCf7gEQQdHURSY+qxg8LkIscRqBfeHLQfDJT0oABS5SvMuAgdkNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUCtE2uj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUCtE2uj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709471630; x=1741007630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/yXCkcN6oOhoRMyXfkQ/SuedEu4kXt7zsCvoGBhUIk=;
  b=WUCtE2uj5jQpYiUhNzP7lhIeIudSb2ig5AyOVw6R+dPNgvZbE7Hco0I7
   yPUHAxFgAxeNT3Uyg37YAy453LJ8NjbwuPZ6K1QiBS2+kfQA4/uOq+sX0
   k9LSZ8f7MD5miXF93EpgAn9oQe1p5Lzr1xKEC520nG/UiJmMUqCQV8B2S
   nfCwPRH5rmf38jw2z+9dytBnKHIwUyZQq3QJQdoZXHaclX0xTZ+ZT5sdc
   MGXEQInnT8b4IT7jlPSsFGNXvdtFYGDo9YsN1FHz2/gvefOsdo1Qw33Dn
   x71pL5YnCdBKA1rH9vxwvqjIyr8rWcR5e61s6MtTTFEVxy7+F69pWTKxB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14676187"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14676187"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 05:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8655248"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2024 05:13:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rglf0-0001mb-0F;
	Sun, 03 Mar 2024 13:13:46 +0000
Date: Sun, 3 Mar 2024 21:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:notmuch-cover.1708709155.git.john@groves.net 9/23]
 drivers/dax/bus.c:1442:9: error: call to undeclared function
 '_copy_from_iter_flushcache'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202403032136.MEDHWXbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux notmuch-cover.1708709155.git.john@groves.net
head:   c8318dd2a63c230e5e731bc14750a466d7891ddc
commit: b1dbe325e1e88d07cf2f245da33393842ff842bc [9/23] dev_dax_iomap: Add CONFIG_DEV_DAX_IOMAP kernel build parameter
config: i386-buildonly-randconfig-002-20240303 (https://download.01.org/0day-ci/archive/20240303/202403032136.MEDHWXbG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032136.MEDHWXbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032136.MEDHWXbG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/bus.c:1442:9: error: call to undeclared function '_copy_from_iter_flushcache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1442 |         return _copy_from_iter_flushcache(addr, bytes, i);
         |                ^
   drivers/dax/bus.c:1437:9: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1437 |         size_t len, off;
         |                ^
   1 warning and 1 error generated.


vim +/_copy_from_iter_flushcache +1442 drivers/dax/bus.c

2e58e20034e6b0 John Groves 2024-02-23  1433  
2e58e20034e6b0 John Groves 2024-02-23  1434  static size_t dev_dax_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
2e58e20034e6b0 John Groves 2024-02-23  1435  		void *addr, size_t bytes, struct iov_iter *i)
2e58e20034e6b0 John Groves 2024-02-23  1436  {
2e58e20034e6b0 John Groves 2024-02-23  1437  	size_t len, off;
2e58e20034e6b0 John Groves 2024-02-23  1438  
2e58e20034e6b0 John Groves 2024-02-23  1439  	off = offset_in_page(addr);
2e58e20034e6b0 John Groves 2024-02-23  1440  	len = PFN_PHYS(PFN_UP(off + bytes));
2e58e20034e6b0 John Groves 2024-02-23  1441  
2e58e20034e6b0 John Groves 2024-02-23 @1442  	return _copy_from_iter_flushcache(addr, bytes, i);
2e58e20034e6b0 John Groves 2024-02-23  1443  }
2e58e20034e6b0 John Groves 2024-02-23  1444  

:::::: The code at line 1442 was first introduced by commit
:::::: 2e58e20034e6b0d8e6f04e6002c6f684dd1a35bd dev_dax_iomap: Add dax_operations for use by fs-dax on devdax

:::::: TO: John Groves <John@Groves.net>
:::::: CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
