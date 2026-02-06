Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F7423A9C;
	Fri,  6 Feb 2026 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399740; cv=none; b=FAQNaiLpcoxvlBJKVbZuOZ7SYV1aMIXpA/yXb5lsH/fvXycIcy4Zb6WOX/6xVSpMb09QQ4RCh+lirt9F+AB2Qx/AOq6dZSNi1GQnGRknB90seFQ4Jo92pmtZGiYjfixj25x3SQ1j76hogLIOehOitZdfdFGEMcDYsZxQ6w8SHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399740; c=relaxed/simple;
	bh=4OpYGUcqd51Ikckroc837TwpMOD0qU46yuTfGkpIFuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WWw/T51ps0ew6m/VsiOZAWL9hlXkuXKmy51rmdCCil+vM1dd4VZraeYjuAaB/D2i7AlXQfWH4cwkB9swm7KNYE+C46wXwQ/HAaceoV/PAdqqgn1Bx4qDJ25o78OJVaz5I5cW/Q6EX7nb7nM2+Sw+3dnH33H/KhuzDSNiiTltHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkK76ugg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkK76ugg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770399741; x=1801935741;
  h=date:from:to:cc:subject:message-id;
  bh=4OpYGUcqd51Ikckroc837TwpMOD0qU46yuTfGkpIFuo=;
  b=XkK76uggwgwXiPHfOLd/VcZ8gkANEeY6p6bqFfIw5zAoc+UOGKHeaXv6
   gXnJOcxMZRmavd5FGviZ1Qk6OWiz/VDyMpu4X5D6xAtOJ1BUWkcW0sgj/
   5kkFV6DKqtOhSnPNuQ1iRMkbVqfET/f3B03y8UAwN7aeArTUaBlxyOXNi
   nO+ulz8J5B4et91FbjroXvVJgyG1SHBCxIAK4O6W+nI2N75XTRjiQP3as
   YneM0X0iqLl5McxUbLDowa8QY+fll39zSikoKqS3urlR1NRU1ufmlAoJ3
   /vUdjuBNxPkIVq4TmslWzsibLxIBYf3j5a3GlDhG8/l2UpBR9qcqxMR0X
   Q==;
X-CSE-ConnectionGUID: KKkVrbpKSaacGuEEfTwMOQ==
X-CSE-MsgGUID: 0lZ5PJdHRMWYjXXRmnzydQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75462371"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75462371"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:42:20 -0800
X-CSE-ConnectionGUID: owE/mCttR5G1QVC51pk1gQ==
X-CSE-MsgGUID: nJ6LKL6lSoGKo3Ql8i/lHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="241354211"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Feb 2026 09:42:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voPqH-00000000ky6-3vJW;
	Fri, 06 Feb 2026 17:42:05 +0000
Date: Sat, 07 Feb 2026 01:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 13/13] Warning:
 drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in
 'imx274_get_fmt'
Message-ID: <202602070144.zjnSVXAx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   1b58854744d17413b2855b20178e63a1c82d58f5
commit: 1b58854744d17413b2855b20178e63a1c82d58f5 [13/13] media: v4l: Add struct v4l2_subdev_client_info argument to pad ops
config: loongarch-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070144.zjnSVXAx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070144.zjnSVXAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070144.zjnSVXAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
>> Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
>> Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
>> Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
--
>> Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
>> Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
>> Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
>> Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
