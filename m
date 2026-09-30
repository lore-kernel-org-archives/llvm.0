Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE936B91A;
	Wed, 30 Sep 2026 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790737996; cv=none; b=KVCEyl06uiqqG19vDs5sk2eL1QpJV4Cgtc8DKZ4ocp2dgC1kwWDyX9AGawd/EwPxHtFUy62M+QGBUeRhQoaV18JGhdDABZozYy/IDIn2V3l2eT+VkNjeLwOBd4QFpmPAhNe/RBN1ZH3cZNSPr4z7xSkdZmFaFb2Lm+s1hU6mxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790737996; c=relaxed/simple;
	bh=Y8sMSiM0CwHjELQY+48fl+cPz4X1ku8Gic5rLpc8v8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CcM3wvYRr8EqHb1Gx1GO8pqkIa7dj4BitDk+VyN+qlF/C9tC6l3EnZ63d/4LtajywUKS4wC+0upFtrYGaLEyKjrzR7T/7/ePIGciH4JE4jQyQFRa9JHeidD171rgsrZMQ7xfHbrd4iSSYWC0M16XH0XC9Wz3gl/xXgTkFscU8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJwjybPe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJwjybPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790737995; x=1822273995;
  h=date:from:to:cc:subject:message-id;
  bh=Y8sMSiM0CwHjELQY+48fl+cPz4X1ku8Gic5rLpc8v8k=;
  b=cJwjybPedQmHaRdsSohGlG1avqESrcSuxFPwfQFqA4i/3yYdv8cH7Qnx
   DG6imZplr1SmBpyOTG2L+tAQoKHGwXTzlJ1ON/1rnExLqH61Mq4MNtgnS
   iYmofLHbuNLulNFDQLRqSjK8sUCUhKrH4p0GUgHsUMOqcOKRcVe3VLn0i
   I7/8h7xZ6nPHyUWpBeslGHplPqnUAYgzDl++alH/MC3kFjPE7B/cIeihw
   OsYR3JKeYMCtK6WJCDtcpjHhaDZYMX1NvBrIRI0DHLz7cY8q2I5gHrZvE
   0Ud3TSk8CYIvgj6VixCy61xENrzzILfqQXkJAeomeJ2BXIxjSbEFkIhtQ
   A==;
X-CSE-ConnectionGUID: eGeTO+4eT/OQn5j2Zs5/Ag==
X-CSE-MsgGUID: IeoeddcmTIGJ47dQGn0MbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90329125"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90329125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:13:15 -0700
X-CSE-ConnectionGUID: TqOBY+PHTLGK1XIeg29r9g==
X-CSE-MsgGUID: pJ4FUA8yTriJ/Qz0jhfnrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="301809559"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2026 20:13:13 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBkko-000000001ia-43st;
	Wed, 30 Sep 2026 03:13:10 +0000
Date: Wed, 30 Sep 2026 05:12:25 +0200
From: kernel test robot <lkp@intel.com>
To: "Abd-Alrhman Masalkhi" <abd.masalkhi@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/md/md-ctl.c:47:26: error: call to undeclared library
 function 'isdigit' with type 'int (int)'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202609300507.5HFYs9aS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Abd-Alrhman-Masalkhi/md-make-mddev-lookup-and-ioctl-helpers-non-static/20260928-201223
head:   6b0c58a68cb9e72a888a76dac60d49a88d347118
commit: 6b0c58a68cb9e72a888a76dac60d49a88d347118 md: add a control device for array management
date:   31 hours ago
config: s390-randconfig-2000-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300507.5HFYs9aS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300507.5HFYs9aS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300507.5HFYs9aS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/md-ctl.c:47:26: error: call to undeclared library function 'isdigit' with type 'int (int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         if (name[2] != '_' && (!isdigit(name[2]) ||
         |                                 ^
   drivers/md/md-ctl.c:47:26: note: include the header <ctype.h> or explicitly provide a declaration for 'isdigit'
   1 error generated.


vim +47 drivers/md/md-ctl.c

    38	
    39	static struct mddev *get_mddev_name(const char *name)
    40	{
    41		unsigned long minor;
    42		struct mddev *mddev, *ret = NULL;
    43	
    44		if (strncmp(name, "md", 2))
    45			return ERR_PTR(-EINVAL);
    46	
  > 47		if (name[2] != '_' && (!isdigit(name[2]) ||
    48				       kstrtoul(&name[2], 10, &minor) ||
    49				       minor > MINORMASK))
    50			return ERR_PTR(-EINVAL);
    51	
    52		spin_lock(&all_mddevs_lock);
    53		list_for_each_entry(mddev, &all_mddevs, all_mddevs) {
    54			if (mddev->gendisk &&
    55			    strcmp(mddev->gendisk->disk_name, name) == 0) {
    56				ret = mddev_get(mddev);
    57				break;
    58			}
    59		}
    60		spin_unlock(&all_mddevs_lock);
    61	
    62		return ret ? ret : ERR_PTR(-ENODEV);
    63	}
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
