Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC017E1;
	Wed, 24 Jan 2024 02:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706062612; cv=none; b=hXLN+1nfFgHcs2iIY2g8T8zMnfXpLHoHlatkd2UrBxDG8MTA+X1o6DpdevIDgEsMbEPMNZgr0G5vMe2yGTjFa3dmwfBzDzVdN33uhVQSaEyzNR5DKkj8YUFwqTer9lVQ4xbXtGXSOWlKyLE8ktsNhB4ZUhSYRpZ0bWEvfeCk0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706062612; c=relaxed/simple;
	bh=MQRdZmBRBYxwRSH7rH+cRLNQr3sqzSXuGdoRlo4twks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJuges4I5XwdIx7PQHvMMouLk4Sqrk8bFx80lj7h/ShBwSnWmUEl+qUkIKQDcgivIdiZQrx75vYYyWYLkLD5FEE59nlVot9Mo6Y4RTsxNzDhkqy1foS/TA537hstDToCKD+YBO5Pj/BwHKWrjtpa3SzoPgsvZeAW9rxSHGLjFKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2ZHwESB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2ZHwESB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706062611; x=1737598611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MQRdZmBRBYxwRSH7rH+cRLNQr3sqzSXuGdoRlo4twks=;
  b=m2ZHwESBOOzwUUH/9ik1KVVEkJU8nqDUIgwoUuCCw6hQnhuU1z8pvAnR
   PinvqACISJ/Pn6sDLWs5OYO0cB29tWe7EE1OTtKKFLvLKO12Q6tCetlFv
   YpqA1CggxAGnEKq3MVTB7ZkHR+ON0b+SpYc0H4BPdhG8xcMTm722VvZep
   nb0bFK4lySHtUfD8GWznWxDlzZN12yquwoc7HQ0Ox2+wukdwUZ0WEmYJG
   4gPyu/VKnJLDDuhxfVmGEci7ibKQD5ZBhUrwtA3G1nmTIKl2KjedZDzS4
   ilbXwszOIzl79l4NJAdFUxIR8QtO7E9Gc96qwxinY89V+AqVu7BShpCwj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8474538"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8474538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 18:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="27950650"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2024 18:16:47 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSSom-0007ng-26;
	Wed, 24 Jan 2024 02:16:44 +0000
Date: Wed, 24 Jan 2024 10:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file 31/35] block/fops.c:866:56: error:
 initializer element is not a compile-time constant
Message-ID: <202401241034.sSm707gY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file
head:   86d0fab9651f2edb5dc7094c36ce414bf2c407ff
commit: d200dd4d01b253bf3964c013247dfea89baef880 [31/35] block: use file->f_op to indicate restricted writes
config: arm-randconfig-001-20240124 (https://download.01.org/0day-ci/archive/20240124/202401241034.sSm707gY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241034.sSm707gY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241034.sSm707gY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/fops.c:866:56: error: initializer element is not a compile-time constant
   const struct file_operations def_blk_fops_restricted = def_blk_fops;
                                                          ^~~~~~~~~~~~
   1 error generated.


vim +866 block/fops.c

   864	
   865	/* Indicator that this block device is opened with restricted write access. */
 > 866	const struct file_operations def_blk_fops_restricted = def_blk_fops;
   867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
