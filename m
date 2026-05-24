Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909811C5F27;
	Sun, 24 May 2026 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779600090; cv=none; b=NLSqByoWCI/p6S3mlEouI10cflruRnVZFTToVf3HvugFx2dE9wZy1GUBvrFsZn1ErfhiigmSV5j3zwgHkRoGmASEMEoV9U1jm6rjSHgHXh3MPFv/sTXBBDxXGP+x7Npk04l269/xJefqcJZqSYk3hJzTMvzfqcTuKQD0t2LQeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779600090; c=relaxed/simple;
	bh=X5DP8ONVCLenLNfKYqgby+fUALLvQiXhJm8Nqm1UicY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PIBarKxenmtq3FqG7LhkqIcUQcgY+nAdOcL02VjZXrb02KCmYCqpHgwnRxmzgehoKMlbTgMiTbsmFtvvgMkLVt7XoXG4WXEAPnEQir3xatv2YzOwB+vB21vP2hiArZBuzMR7UXSBEAspaPDKPEgySrA1XGWBCxEuhHJCSFiThD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBYQr/iO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBYQr/iO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779600088; x=1811136088;
  h=date:from:to:cc:subject:message-id;
  bh=X5DP8ONVCLenLNfKYqgby+fUALLvQiXhJm8Nqm1UicY=;
  b=aBYQr/iOnQhD74BQ6YWdeE7V85ZIzP1Dfm2kMuxAsYde+sz6liTYsI+v
   Y7hgc3wBIOSPYrlYA/l59KWzZ24sGqexVOb4j8tzkjlpRUAJuCk2xEIF3
   ETK/EsD5Mf3ZgyLqC8QFoBo9p6DjuoUyhnKJFl3B1Wn6oxzZKUFHbcVe1
   h5AZ7iTmMLXO21GfNQfu9KbCBMFvhSaoDy0x/FqnERnJpcDA5gngmfXyO
   xGJ8xn/9e3N2ltZVfdT5QCd57xsYXKhzlbCDEZO6zrtS4olPNGqRtIwzh
   UNe+x/pAQzdT71AjOSBYCyZoJmvwT2N8NCuCc3cHoRekxG29IP+Lyv/ay
   w==;
X-CSE-ConnectionGUID: RHaQAzp3SkmYOGIjFo0w0Q==
X-CSE-MsgGUID: sS3QBvCkRF6P9mul6W52hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91151080"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91151080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 22:21:27 -0700
X-CSE-ConnectionGUID: /2asm0RsTtqH3bVNlNlUVQ==
X-CSE-MsgGUID: jNI4OLczR6GhFayaxTzLEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="271616197"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 May 2026 22:21:26 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR1H8-000000000jh-40Fx;
	Sun, 24 May 2026 05:21:22 +0000
Date: Sun, 24 May 2026 13:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 15/1197]
 ./usr/include/linux/io_uring.h:22:10: error: 'stddef.h' file not found with
 <angled> include; use "quotes" instead
Message-ID: <202605241348.tUsmq9WG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: 14411011f2587579a213bea3e57541f14d492c62 [15/1197] cheri: UAPI: io_uring: Adjust structures for UAPI
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605241348.tUsmq9WG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241348.tUsmq9WG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241348.tUsmq9WG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/io_uring.h:22:10: error: 'stddef.h' file not found with <angled> include; use "quotes" instead
      22 | #include <stddef.h>             /* for offsetof */
         |          ^~~~~~~~~~
         |          "stddef.h"
>> ./usr/include/linux/io_uring.h:868:14: error: implicit declaration of function 'offsetof' [-Werror,-Wimplicit-function-declaration]
     868 |                         __u8    resv[offsetof(struct io_uring_buf, resv)];
         |                                      ^
>> ./usr/include/linux/io_uring.h:868:23: error: expected expression
     868 |                         __u8    resv[offsetof(struct io_uring_buf, resv)];
         |                                               ^
>> ./usr/include/linux/io_uring.h:868:44: error: use of undeclared identifier 'resv'
     868 |                         __u8    resv[offsetof(struct io_uring_buf, resv)];
         |                                                                    ^
   4 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
