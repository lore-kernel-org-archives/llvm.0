Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CCC286A4;
	Sun,  9 Nov 2025 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762687599; cv=none; b=sKPiMJNPrqidusvL/80HUQoh+Pt4eWmYcggYrF0+W/49170NJLYdvMbBCru4STfE85Zc71Ieq//uGmdDoiQ2BEKa4O9g6BuY4W9oLmtR7A5UR/dvHeKJhN9fWofOCjTL6iNfOYGis4LUx6A+wgQZfc5vrd4TkvuO/8RHQa2tqVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762687599; c=relaxed/simple;
	bh=lP1AJJZByp+udhWC8qKXLGnr7sJYljHWFHGNVr+tDXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfeUCpysWXX79ToGaqfcSYo/NulUowDS1GAW+j4PcDBa7gzZQEWNQJx59xw+1X2japbEd8kTGtAL3GxXOazXtwdQ8d5gFqu8a9KWWuWldGNDehYVjLpA3iPRrAdyQnqXDQmxe0jZtGxTsrF9VOJitnwtNLGsr/gn2DgmcamzqQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlL3PMKh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlL3PMKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762687598; x=1794223598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lP1AJJZByp+udhWC8qKXLGnr7sJYljHWFHGNVr+tDXo=;
  b=OlL3PMKhABMFMsFSlydJkNu6q1jj+77p5/6oFjOaPbPSG7IPAXqRGZ/4
   LRdV04w+pJPEKmOpP3hR9OMiJqNqwJa+7aimp2vOs4/pJgvscZPx9sFze
   sBV59WjZci8ryZf3Xq9AHkj3kW99k7eW6yBXJjuoONso6c6c7rPURNLw0
   tHdjFyS+OGe8X27SW5D5fCzCiJE4PajgVPxq4fa5IQeM2X+Apt3yqlPdr
   bNdeWEo05SG2PoZ4qFtefjEQyIRBZKu0IbJUex+JjbyBMOUaMGC9GPFLe
   b0eh8wy8x7oWRiWPL+gnNQZXq4frqylEoTRlHgG146aQIbosNstfnFk3V
   A==;
X-CSE-ConnectionGUID: rQFapwBUSj2grEW9wGMP3w==
X-CSE-MsgGUID: DWs9tqnjSYaDxhKdNDswxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="68410900"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="68410900"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 03:26:37 -0800
X-CSE-ConnectionGUID: +lIP9VrxS2C8UgufPe2R0w==
X-CSE-MsgGUID: c4TzhwPVTbO5zSgLe1Gxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="187694937"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Nov 2025 03:26:36 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI3Z4-0001xP-0q;
	Sun, 09 Nov 2025 11:26:34 +0000
Date: Sun, 9 Nov 2025 19:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] vfs: remove the excl argument from the ->create()
 inode_operation
Message-ID: <202511091933.pB0rBzbA-lkp@intel.com>
References: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 76ddfe7d66d631e5e31ef4e5dd59797fa03acbf7]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/vfs-remove-the-excl-argument-from-the-create-inode_operation/20251107-230938
base:   76ddfe7d66d631e5e31ef4e5dd59797fa03acbf7
patch link:    https://lore.kernel.org/r/20251107-create-excl-v2-1-f678165d7f3f%40kernel.org
patch subject: [PATCH v2] vfs: remove the excl argument from the ->create() inode_operation
config: x86_64-randconfig-074-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091933.pB0rBzbA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091933.pB0rBzbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091933.pB0rBzbA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/vboxsf/dir.c:303:56: error: use of undeclared identifier 'excl'
     303 |         return vboxsf_dir_create(parent, dentry, mode, false, excl, NULL);
         |                                                               ^
   1 error generated.


vim +/excl +303 fs/vboxsf/dir.c

0fd16957664845 Hans de Goede     2019-12-12  298  
6c960e68aaed33 Christian Brauner 2023-01-13  299  static int vboxsf_dir_mkfile(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner 2021-01-21  300  			     struct inode *parent, struct dentry *dentry,
695fb862eadb82 Jeff Layton       2025-11-07  301  			     umode_t mode)
0fd16957664845 Hans de Goede     2019-12-12  302  {
ab0c29687bc7a8 Hans de Goede     2021-01-21 @303  	return vboxsf_dir_create(parent, dentry, mode, false, excl, NULL);
0fd16957664845 Hans de Goede     2019-12-12  304  }
0fd16957664845 Hans de Goede     2019-12-12  305  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
