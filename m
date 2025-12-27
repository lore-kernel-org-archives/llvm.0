Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594D8821;
	Sat, 27 Dec 2025 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858450; cv=none; b=Vg3XPUlhxir81mDfoC078sgHeDu5LQS9Fxe67v51gGHm1oiO6iClyGHEzOU8mVWdrU2FF29Xj0CpyFDbfbpL6iLUSeQUwnTMhYVzk1y3ql0sHPgXCx2fPtDzMQXiQR/JIbvdxduXjvQFQ/faovH8+Wo3XxMabUy1UtAQhPWSjHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858450; c=relaxed/simple;
	bh=dfMzVbUsUWI/Up7Epdsz4KniuUIfKHXlQdyRBHdUDDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F+x/fFN2BfbLIfu0Eew8NAK2mRWvPydZt7GF0f0VFaJZG6QYLUVBvjn5XqroGmfhmiPDoUOWQDmNssKH9AU5L9lb5mvs0VwmOLYLb/AOI1G6N+eZ3XzGz/vDcIu9OzH+xOcyh6gKi/RDlaDpINkh1m/YcjlmzHzDvzwjJ56QRaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWWaASGL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWWaASGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766858448; x=1798394448;
  h=date:from:to:cc:subject:message-id;
  bh=dfMzVbUsUWI/Up7Epdsz4KniuUIfKHXlQdyRBHdUDDY=;
  b=gWWaASGLf/dExSU9CFnZdKo1Ryi8cmKg5c7/FCinCkAJZre8GQe4NDfX
   Ns1hJkytdLbHV0s2PoSvo5SSMzevP8rbX72wv75B6jMOmBrvKwVB5OwN/
   5dNSNqao9jVO1aQkexyaj+4lyJyUGmu5z9feC/IAdnbhdXqfYmjlDZUCa
   ckHecXjc2rm9Y4sLC05CmWMa/uydGmJyy51Z/NeFMSgXZ5D1+M2qX+8n5
   hwLhjgucVwlzWvs0fosOkm4RFHId9zzW7Po6kko2fvc6c5bI4BNane3Ol
   niHxRN5lEyMvNF1/46fQew2LeVx4HRY5qr1AFvMD1dEarRr052t+HoUp2
   w==;
X-CSE-ConnectionGUID: Ot/rHGrRTS6LcWbwWC00/w==
X-CSE-MsgGUID: VG/G8q5jT+WwSBgeA0VcqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="72403115"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72403115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 10:00:47 -0800
X-CSE-ConnectionGUID: YUFIY6X4QAy+s115kP+qWg==
X-CSE-MsgGUID: W+rHEYOvR8OLOfGGvNATPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200885767"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2025 10:00:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZYap-00000000601-3EhM;
	Sat, 27 Dec 2025 18:00:43 +0000
Date: Sun, 28 Dec 2025 02:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 12/12] ld.lld: error: duplicate
 symbol: f2fs_simulate_lock_timeout
Message-ID: <202512280117.JBZPJlQ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   a9004baf110bf87f6a75b023c26616d966c93733
commit: a9004baf110bf87f6a75b023c26616d966c93733 [12/12] f2fs: sysfs: introduce inject_lock_timeout
config: x86_64-buildonly-randconfig-004-20251227 (https://download.01.org/0day-ci/archive/20251228/202512280117.JBZPJlQ0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280117.JBZPJlQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512280117.JBZPJlQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: f2fs_simulate_lock_timeout
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/dir.o:(f2fs_simulate_lock_timeout)
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/file.o:(.text+0x8)
--
>> ld.lld: error: duplicate symbol: __cfi_f2fs_simulate_lock_timeout
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__cfi_f2fs_simulate_lock_timeout)
   >>> defined at file.c
   >>>            fs/f2fs/file.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: f2fs_simulate_lock_timeout
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/dir.o:(f2fs_simulate_lock_timeout)
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/extent_cache.o:(.text+0x8)
--
>> ld.lld: error: duplicate symbol: __cfi_f2fs_simulate_lock_timeout
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__cfi_f2fs_simulate_lock_timeout)
   >>> defined at extent_cache.c
   >>>            fs/f2fs/extent_cache.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: f2fs_simulate_lock_timeout
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/dir.o:(f2fs_simulate_lock_timeout)
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/shrinker.o:(.text+0x8)
--
>> ld.lld: error: duplicate symbol: __cfi_f2fs_simulate_lock_timeout
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__cfi_f2fs_simulate_lock_timeout)
   >>> defined at shrinker.c
   >>>            fs/f2fs/shrinker.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: f2fs_simulate_lock_timeout
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/dir.o:(f2fs_simulate_lock_timeout)
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/recovery.o:(.text+0x8)
--
>> ld.lld: error: duplicate symbol: __cfi_f2fs_simulate_lock_timeout
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__cfi_f2fs_simulate_lock_timeout)
   >>> defined at recovery.c
   >>>            fs/f2fs/recovery.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: f2fs_simulate_lock_timeout
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/dir.o:(f2fs_simulate_lock_timeout)
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/segment.o:(.text+0x8)
--
>> ld.lld: error: duplicate symbol: __cfi_f2fs_simulate_lock_timeout
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__cfi_f2fs_simulate_lock_timeout)
   >>> defined at segment.c
   >>>            fs/f2fs/segment.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: f2fs_simulate_lock_timeout
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/dir.o:(f2fs_simulate_lock_timeout)
   >>> defined at f2fs.h:4945 (fs/f2fs/f2fs.h:4945)
   >>>            fs/f2fs/node.o:(.text+0x8)
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
