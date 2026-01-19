Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936E825A62E;
	Mon, 19 Jan 2026 19:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852097; cv=none; b=BYK7bahlb8JJHGwJfjzV1HOBzwQ8c5k5Qzz0ea6LX9R1hTjmdNZNchlxITB3jMJa8F7dl8ji0I5FmXIPrw/qCYbxHnBCanD0R5M4pFkku7VdXAepcFM2JFtaLV1OEaWfIdbNAbPhsHq3kdfeSnF1XqoDvm6p4uzGq8J3K5Z8kUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852097; c=relaxed/simple;
	bh=iKZVxB/8oLlHOmiX9jlBbkSdfFKDFyMKrLx56Vm6cB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a7roJKfBpUCsAWcpGIxJg0KolH/pByAhMJZ7Ow7dF4KzkSyMTI/VlMKBIvWrRj7Xe9nqrBm/CpezeGF03Uax8O+w3LFWPPT/p7yrhVMM53ZEatYjuqs5b4GvCL5p9QWpSZ+dz9qO4SqGkkmhBTRLHla9kSRuEq6Zt5cGykUCXIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sy0G+NC1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sy0G+NC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768852094; x=1800388094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKZVxB/8oLlHOmiX9jlBbkSdfFKDFyMKrLx56Vm6cB4=;
  b=Sy0G+NC1BkCzFPnkpR/lUbD8AUX8HCO+FdZmcxcCmdcrFKBAiWTmYXR0
   1XYs5PCn1MuS7K16LuA+gf4Z4Xv8sTiu6N6SoWLhYCjIYHbkrWKc+Ckzg
   rp18PgtqqfP+2Hg7bGuAn3rJfKOqvattutVZ7hbvRfAf0gPaqCVkobeOn
   rt2HZq4rw/V5LoHU1yc4x2UGdaL+k5hJMzddFH9zFG+O1cDkcK2c1kPm1
   0knQFFECNWLFjDaJ51sMB7M52CoO25UOThSjmNScJNOyYr5Rjajl4FZ4i
   V/VEEWU6rjuFpnpT6xYGbAa+5GlxrHaFOigJOachDDjTzHdyxbKYHyFGw
   Q==;
X-CSE-ConnectionGUID: UWXbc8G9RgqofIMbJvFqag==
X-CSE-MsgGUID: JlIhmdjNQHyvmmzQvyHsXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73928209"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="73928209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:48:13 -0800
X-CSE-ConnectionGUID: yczU2/EhRlOrK4UpmgTLyQ==
X-CSE-MsgGUID: Py30EavGRrmd50JU1Xfe1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205964578"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2026 11:48:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhvEP-00000000OF4-3gA5;
	Mon, 19 Jan 2026 19:48:09 +0000
Date: Tue, 20 Jan 2026 03:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 4/29]
 /usr/include/linux/errno.h:1:10: fatal error: 'asm/errno.h' file not found
Message-ID: <202601200338.xQ9HAITG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   fc55af66ff49a263c16fc4ddf9877c91a307edbf
commit: 80643f78e2004b8b389b1200b6a196940afc14e4 [4/29] test
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260120/202601200338.xQ9HAITG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200338.xQ9HAITG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200338.xQ9HAITG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/test.c:4:
   In file included from /usr/include/err.h:55:
   /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from init/test.c:8:
   In file included from /usr/include/errno.h:28:
   In file included from /usr/include/bits/errno.h:26:
>> /usr/include/linux/errno.h:1:10: fatal error: 'asm/errno.h' file not found
       1 | #include <asm/errno.h>
         |          ^~~~~~~~~~~~~
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
