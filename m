Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E920C02E;
	Wed,  7 May 2025 07:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601654; cv=none; b=A4zKosB59dC4Yb+SpiirIOLqrZUgcKRD64iiY4T2txde0yTYRKTPKzW3z1xxZC9fIdK7mPjrvcxJ5WIUSMVlVrKmbs0S8Z8cUb2YmNHT0yr/QEp0rxbYql8PsSMLQwKshJ6FE9f5wEzGrZ5EUb71XvGXDjLP/QGqkh3ON5uSkJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601654; c=relaxed/simple;
	bh=dB1VAeBpKBmAnR+MnKelas2k3+GbY7RTGJd7/03VcTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcqsT//r5i9J4/QpBXbzwu68P8X37zw4xsBvb3bld50zh+tC45Ih5KX7Rw6MlChd8m9k+UIX5Xz19QV7EVj2Kl7bM5o+KyXY5QqAagEJHrweGh/HilBsM8usG/b7rK9O7/Nxi/NKLJZ/H1BNh3dNGCfcdWMyyGRO6SrW5ZI13W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNHYyLw6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNHYyLw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746601652; x=1778137652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dB1VAeBpKBmAnR+MnKelas2k3+GbY7RTGJd7/03VcTE=;
  b=YNHYyLw6GodeC3u2Ix+C+uu9a+KSSVaivtIirT1ku7EJMFPdlEzTOYY1
   kzpynG3jzl5aS07dkfkMpm6IduOG2Zx7eB758FpLGnRqUBnSceP/7k1aW
   HqDwKH3Ma7MOp6Zgj/uOCXesApX+aTSnx/06fRqK10U8UTIQI2V0pWx5U
   M4wMaeDlvXPqZmw2q8Dkw3SjCQLH1dy5C2LKi8lsb5gueBCr7NZ3vTJOn
   nf7phhKNXpjsWik27CoDiIPDcT7bIU9fdXbfFaYs21p+SZZJCkOGjpqgR
   pjy4ayKxARjbxZzg0tWPDfCvXjS+jeESbbBRkgVBfgJh5LaqlzVEU7xQf
   A==;
X-CSE-ConnectionGUID: 1d0FtCLARCeKJTsH1OgF5Q==
X-CSE-MsgGUID: no1WQkjoRHWrCA3gXy92WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52127888"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52127888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:07:32 -0700
X-CSE-ConnectionGUID: aZcKHNrCQ0mQnYHYSWS2Dg==
X-CSE-MsgGUID: ITUMoMXoTfmChRr+Z0fpZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135865530"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:07:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYsK-0007G9-1w;
	Wed, 07 May 2025 07:07:28 +0000
Date: Wed, 7 May 2025 15:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/7] sysfs: Remove transitional attribute group alias
 macros
Message-ID: <202505071519.Rg3hK4UR-lkp@intel.com>
References: <20250423175040.784680-8-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423175040.784680-8-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/sysfs-Rename-attribute-group-visibility-macros/20250424-015249
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250423175040.784680-8-david.e.box%40linux.intel.com
patch subject: [PATCH 7/7] sysfs: Remove transitional attribute group alias macros
config: x86_64-randconfig-072-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071519.Rg3hK4UR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071519.Rg3hK4UR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071519.Rg3hK4UR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/usbtouchscreen.c:477:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     477 | DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(mtouch);
         | ^
         | int
>> drivers/input/touchscreen/usbtouchscreen.c:477:35: error: a parameter list without types is only allowed in a function definition
     477 | DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(mtouch);
         |                                   ^
>> drivers/input/touchscreen/usbtouchscreen.c:480:16: error: use of undeclared identifier 'sysfs_group_visible_mtouch'
     480 |         .is_visible = SYSFS_GROUP_VISIBLE(mtouch),
         |                       ^
   include/linux/sysfs.h:223:33: note: expanded from macro 'SYSFS_GROUP_VISIBLE'
     223 | #define SYSFS_GROUP_VISIBLE(fn) sysfs_group_visible_##fn
         |                                 ^
   <scratch space>:95:1: note: expanded from here
      95 | sysfs_group_visible_mtouch
         | ^
   3 errors generated.


vim +/int +477 drivers/input/touchscreen/usbtouchscreen.c

7f787df1ac447e drivers/input/touchscreen/usbtouchscreen.c Dmitry Torokhov 2024-07-11  476  
7f787df1ac447e drivers/input/touchscreen/usbtouchscreen.c Dmitry Torokhov 2024-07-11 @477  DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(mtouch);
7f787df1ac447e drivers/input/touchscreen/usbtouchscreen.c Dmitry Torokhov 2024-07-11  478  
7f787df1ac447e drivers/input/touchscreen/usbtouchscreen.c Dmitry Torokhov 2024-07-11  479  static const struct attribute_group mtouch_attr_group = {
7f787df1ac447e drivers/input/touchscreen/usbtouchscreen.c Dmitry Torokhov 2024-07-11 @480  	.is_visible = SYSFS_GROUP_VISIBLE(mtouch),
7f787df1ac447e drivers/input/touchscreen/usbtouchscreen.c Dmitry Torokhov 2024-07-11  481  	.attrs = mtouch_attrs,
7f787df1ac447e drivers/input/touchscreen/usbtouchscreen.c Dmitry Torokhov 2024-07-11  482  };
1d3e20236d7a56 drivers/usb/input/usbtouchscreen.c         Daniel Ritz     2006-03-29  483  #endif
1d3e20236d7a56 drivers/usb/input/usbtouchscreen.c         Daniel Ritz     2006-03-29  484  
1d3e20236d7a56 drivers/usb/input/usbtouchscreen.c         Daniel Ritz     2006-03-29  485  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
