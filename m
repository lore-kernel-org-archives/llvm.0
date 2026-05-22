Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6063BAD95;
	Fri, 22 May 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443992; cv=none; b=EUtEGhRA0442jvGzi2pFP8GjJkiozreC86aP3pRnKZBmXKCmnEVIwTWg5SDZelCkvkw35U0CTvAJneSGcOzbmn9WhWWtp+LJHiyARjMtYTCTOKOa6Jb4TzZlXidLlGjnCLH5RKFzgAQPGMeQv8pX3ap4x9fZq1nYLFy7YSBeMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443992; c=relaxed/simple;
	bh=T3WEIuYunpiFtNrcsozkWvbkSofS8UtMFzcXms+GnLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EXej1OnI5+nvIy6TLFIhiZwGrFzTl6UYYFphkrxotsbRA0L9q+RsXwDWQ8nMvBDjGsOxxoxkqEAm6/jB68794vB4IDo633uMekdHR88cDYDbE+1p5tGyBd6+F9PWxS8X36YGqNWzJ5zYx7oYw5BZ1Hb3Pq/xhAFFwf0z1gDQ0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n937xdlX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n937xdlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779443991; x=1810979991;
  h=date:from:to:cc:subject:message-id;
  bh=T3WEIuYunpiFtNrcsozkWvbkSofS8UtMFzcXms+GnLE=;
  b=n937xdlXaGQ4DwTi52FVeWawtMN1k924D8I3QwnOhrLfBZEWWoXXWZXJ
   TbH252MzcP95xRDDEbRAy2NWtsDLSarq8Rp+FOihEd2+mQqsT3C7ipQyw
   ZmKX86HVAwuG5vR1d5Eg1J0NKLeljSTqJA3heHVYRPApxAaWGjZMHZ4nJ
   xLpWJbM09N+KJxUjPshXPhI9yKA1bu7dCuI59+NfPund/1n8vOS4miHPt
   COrrFDup0tGaqCHKbNMUOWunPf72AFZ8VI21AYr8yCccQKw5tmbn8CBbc
   1OMl68o9P1bklpnMuLjYC8xZChqFT/BX0/AP2K5JKktKD1ZmYgWO/rHtZ
   A==;
X-CSE-ConnectionGUID: ghvQgrHuQY+NK9Jd+5lPGQ==
X-CSE-MsgGUID: E+Q+rQTpThC8EZ0D6S5hhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80552446"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80552446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 02:59:50 -0700
X-CSE-ConnectionGUID: gyzgNfbgT36BXsNdb6fydQ==
X-CSE-MsgGUID: icqPE/4oQSiFShSPKnQRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245146889"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 May 2026 02:59:49 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQMfS-000000002Bt-07NN;
	Fri, 22 May 2026 09:59:46 +0000
Date: Fri, 22 May 2026 17:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 26/1130]
 usr/include/linux/socket.h:25:3: error: // comments are not allowed in this
 language
Message-ID: <202605221710.fzCUhb6F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 0f1728c5a7989963baae90445399623f7fcae35a [26/1130] cheri: UAPI: Add annotations to some fields
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221710.fzCUhb6F-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221710.fzCUhb6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221710.fzCUhb6F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/scsi/scsi_netlink.h:11:
   In file included from usr/include/linux/netlink.h:6:
>> usr/include/linux/socket.h:25:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      25 |                 /// UAPI: NoConvert: Only for alignment
         |                 ^
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/io_uring.h:953:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
     953 |                 /// UAPI: NoConvert: Padding only
         |                 ^
   1 error generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/route.h:27:
   In file included from usr/include/linux/if.h:25:
>> usr/include/linux/socket.h:25:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      25 |                 /// UAPI: NoConvert: Only for alignment
         |                 ^
   In file included from <built-in>:1:
   ./usr/include/linux/route.h:39:25: error: // comments are not allowed in this language [-Werror,-Wcomment]
      39 |         unsigned long   rt_pad4;        // it is actually 8 bytes
         |                                         ^
   2 errors generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/netfilter_arp/arp_tables.h:15:
   In file included from usr/include/linux/if.h:25:
>> usr/include/linux/socket.h:25:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      25 |                 /// UAPI: NoConvert: Only for alignment
         |                 ^
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/netfilter_arp/arp_tables.h:18:
>> usr/include/linux/netfilter/x_tables.h:25:5: error: // comments are not allowed in this language [-Werror,-Wcomment]
      25 |                                 /// UAPI: NoConvert: Kernel only
         |                                 ^
   2 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/dvb/frontend.h:906:4: error: // comments are not allowed in this language [-Werror,-Wcomment]
     906 |                         /// UAPI: NoConvert: Unused in kernel
         |                         ^
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/socket.h:25:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      25 |                 /// UAPI: NoConvert: Only for alignment
         |                 ^
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/sysinfo.h:22:2: error: // comments are not allowed in this language [-Werror,-Wcomment]
      22 |         /// UAPI: NoConvert: Padding
         |         ^
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/cdrom.h:295:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
     295 |                 /// UAPI: NoConvert: Unused in the kernel
         |                 ^
   1 error generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/netfilter_bridge/ebtables.h:17:
   In file included from usr/include/linux/if.h:25:
>> usr/include/linux/socket.h:25:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      25 |                 /// UAPI: NoConvert: Only for alignment
         |                 ^
   In file included from <built-in>:1:
>> ./usr/include/linux/netfilter_bridge/ebtables.h:129:4: error: // comments are not allowed in this language [-Werror,-Wcomment]
     129 |                         /// UAPI: NoConvert: Kernel only
         |                         ^
   2 errors generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/mptcp.h:10:
   In file included from usr/include/linux/in.h:25:
>> usr/include/linux/socket.h:25:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      25 |                 /// UAPI: NoConvert: Only for alignment
         |                 ^
   In file included from <built-in>:1:
>> ./usr/include/linux/mptcp.h:95:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      95 |                 /// UAPI: NoConvert: Convert ss_local instead
         |                 ^
   2 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/aio_abi.h:68:3: error: // comments are not allowed in this language [-Werror,-Wcomment]
      68 |                 /// UAPI: NoConvert: Padding
         |                 ^
   1 error generated.
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
