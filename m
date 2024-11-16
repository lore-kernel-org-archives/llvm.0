Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F24198E90;
	Sat, 16 Nov 2024 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731793035; cv=none; b=c/IYGk/CFSMCNgsH64kmCuResr+tMiOabKVSOBFitB/fqG0QMHJg8qEXG2hn8vZPGq1LDMeo1rXYBZD4qDG0QYPqCxp2t+tGmf4ZeyN9pbe0MTdpEqnQGDZs9M7UkH9BQqXa004Cc3vmN/uHDIhJIjL4HXD0RZe5P1tva2SJsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731793035; c=relaxed/simple;
	bh=fOOqS+XdAjiLPzPO7onEy8gi6sBaWkHpXJWKOKRQB80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMb84TGSmm1eXGdNwQPY1Go0gHsdPBZQ7JXNPGoKHv5ydp8dC0Yl2d4ULNWieSi83huP1UMLg1MUHLpN1Sn4Zs/+AKSI4vlrNoWcNHzygg4/UIWDZtMEkX8nnwkYUEbvLSbOEVuIk+bOg3CAvlC4qPExRzycWVRMuD3sbEWDiUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTztPZQ+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTztPZQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731793034; x=1763329034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fOOqS+XdAjiLPzPO7onEy8gi6sBaWkHpXJWKOKRQB80=;
  b=PTztPZQ+dEb3uR0enQIcda2Z/Ha0gARnKIvj8xjWCtQ9WdbfJ80xQwPN
   SzT+uSufu6m/AQPEh4PRSgZ++QkhE02jcYwJyWFM86YhMMQ0F4gG8WVQB
   mYcE5B9cxwxxZVe8PIgLH4f7vMxAQLdwcYCttlKWiuHBqiH1OZ1KnqKjg
   lX0R7rPg9aMiEnElhd7AQgCqX4CH5ZZXLhfwUYWipCel4aYY+tOU3/KXn
   qdu/uCtH9Ph0okjeZ+qXJTr/1IsBHw7S8A31SUEuul8zXbxRnJdn6W0hm
   lQmSe1BtJy3zGc7jTim3OUcr26Cxu8GW+rKYj5dUW4Fr19pRKNKLXoaF2
   A==;
X-CSE-ConnectionGUID: FlS2JaAWQEG5PerzEe9k7g==
X-CSE-MsgGUID: UAzK93KRTe6HETUSsILOXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="19385230"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="19385230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 13:37:11 -0800
X-CSE-ConnectionGUID: 7gYdEQjLS2uQX3Y1MqYJ7w==
X-CSE-MsgGUID: JYxCdwLjThOl6ErTw8YytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="119803238"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2024 13:37:11 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCQTc-00018D-1m;
	Sat, 16 Nov 2024 21:37:08 +0000
Date: Sun, 17 Nov 2024 05:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 18/28] drivers/fwctl/cxl/cxl.c:47:9: error: call
 to undeclared function 'kzalloc'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202411170548.QqeyNm1H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   81cb57f64be6af29f39bde3b3ca4203975a84377
commit: fc15cf9afd1f6032da9292154d0c14ba4b7e9fd4 [18/28] fwctl/cxl: Add support for get driver information
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411170548.QqeyNm1H-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170548.QqeyNm1H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170548.QqeyNm1H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/fwctl/cxl/cxl.c:47:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^
>> drivers/fwctl/cxl/cxl.c:47:7: error: incompatible integer to pointer conversion assigning to 'struct fwctl_info_cxl *' from 'int' [-Wint-conversion]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/kzalloc +47 drivers/fwctl/cxl/cxl.c

    40	
    41	static void *cxlctl_info(struct fwctl_uctx *uctx, size_t *length)
    42	{
    43		struct cxlctl_uctx *cxlctl_uctx =
    44			container_of(uctx, struct cxlctl_uctx, uctx);
    45		struct fwctl_info_cxl *info;
    46	
  > 47		info = kzalloc(sizeof(*info), GFP_KERNEL);
    48		if (!info)
    49			return ERR_PTR(-ENOMEM);
    50	
    51		info->nr_commands = cxlctl_uctx->nr_commands;
    52	
    53		return info;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
