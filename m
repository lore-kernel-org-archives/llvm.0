Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDB2BE7D9;
	Wed,  5 Nov 2025 19:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762370568; cv=none; b=igvdarjyhW9ouuRFneVC5TVE3MVz/7emKvavTTMP4KUYDeslmMci3pBqR9vBIrcN92pY0TcIaUDft5mDtxBxM+CoAcOoPhdX9X+QzMcJSo+9quFhEcPsf2avM6YKHOW0jvxvhQzbSA04mCQz6nXIbgAuJwrEGrq5yFPKSnmNhfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762370568; c=relaxed/simple;
	bh=6RqTAdgehvYEoLtYTtRrpQSW5ejh6oZ7OBOkBDWMLzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTyAMugWp5iz/l1l10aRIxG8kkFd3RxZVL9z7b1DogFPftc5DbIdhht+AI0pa5Br9ydPU5sw/ZGPI6jzeXfzABG/cucenPA/BHtycxSzi92UwP3TS+gP+uR8HGXkJkKrKkziuIb9mkkmQE/q0y49mr31z/0ZUQsbgy2kAvzVIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZa7TGXr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZa7TGXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762370566; x=1793906566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6RqTAdgehvYEoLtYTtRrpQSW5ejh6oZ7OBOkBDWMLzM=;
  b=hZa7TGXruqQVYYxYZJkYNPwxFhMa9NyUBXaQoOLRYrO0p/QGCGo7lAFR
   DfbbCjJF9Kr+EP0MgehNO/MwRdl/GyH6Lxl1PibAKZC5Djp8JuBAWNmWm
   D9nEJVoB/C0W3bh+idDl79Ay5X036fp8aV4R8hYfwJMX4OTPXiH+G/JWK
   2ZeKjRAU4PvR8jX8smhvMY/NcKmItZBOdy1BHcpilH5aK95CFZJdkQE0B
   oNed1hDTTE7RZwMeYqsfWSCGCLLigNtS4Rdk6jHh5VodM05yDtvzZ0jcU
   03KQDzN75TlTNsZozsLKiTufM51UE7CA0GXP2LajQCTuMQYXPKfs8EsG3
   Q==;
X-CSE-ConnectionGUID: ua9nWN9uRwikXWtXcuBexw==
X-CSE-MsgGUID: KG61nTvJQoK19eIjP1O+Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75611935"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="75611935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 11:22:46 -0800
X-CSE-ConnectionGUID: J/HvwXkCRwucjNbdLP/Tvg==
X-CSE-MsgGUID: AcG6GEm/RFGboq2QN67xOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="191646999"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Nov 2025 11:22:45 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGj5X-000T2O-1O;
	Wed, 05 Nov 2025 19:22:38 +0000
Date: Thu, 6 Nov 2025 03:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 11/14] block/blk-core.o: warning: objtool:
 errno_to_blk_status+0x8: ignoring unreachables due to jump table quirk
Message-ID: <202511060304.6kkIL3iU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   c7fed5786f010f873165451834e59467ebc3c0c0
commit: 594278489cfe2a8bce563ee869010b65132eb246 [11/14] x86: Use PIE codegen for the core kernel
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251106/202511060304.6kkIL3iU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060304.6kkIL3iU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060304.6kkIL3iU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-core.o: warning: objtool: errno_to_blk_status+0x8: ignoring unreachables due to jump table quirk
>> block/blk-core.o: warning: objtool: errno_to_blk_status+0x16: can't find switch jump table
--
>> block/blk-flush.o: warning: objtool: blk_flush_complete_seq+0x4c: ignoring unreachables due to jump table quirk
--
>> block/blk-merge.o: warning: objtool: bio_split_to_limits+0x1f: ignoring unreachables due to jump table quirk
>> block/blk-merge.o: warning: objtool: bio_split_to_limits+0x2d: can't find switch jump table
--
>> block/blk-mq.o: warning: objtool: blk_mq_submit_bio+0x105: ignoring unreachables due to jump table quirk
>> block/blk-mq.o: warning: objtool: blk_mq_submit_bio+0x113: can't find switch jump table
--
>> block/ioctl.o: warning: objtool: blkdev_ioctl+0x72: ignoring unreachables due to jump table quirk
>> block/ioctl.o: warning: objtool: blkdev_ioctl+0x80: can't find switch jump table
--
>> fs/open.o: warning: objtool: vfs_fallocate+0x4e: ignoring unreachables due to jump table quirk
>> fs/open.o: warning: objtool: vfs_fallocate+0x5c: can't find switch jump table
--
>> fs/read_write.o: warning: objtool: generic_file_llseek_size+0xc: ignoring unreachables due to jump table quirk
>> fs/read_write.o: warning: objtool: generic_file_llseek_size+0x1a: can't find switch jump table
--
>> fs/pipe.o: warning: objtool: fifo_open+0x7c: ignoring unreachables due to jump table quirk
>> fs/pipe.o: warning: objtool: fifo_open+0x8a: can't find switch jump table
--
>> fs/namei.o: warning: objtool: may_open+0x27: ignoring unreachables due to jump table quirk
>> fs/namei.o: warning: objtool: may_open+0x35: can't find switch jump table
--
>> fs/fcntl.o: warning: objtool: __x64_sys_fcntl+0x70: ignoring unreachables due to jump table quirk
>> fs/fcntl.o: warning: objtool: __x64_sys_fcntl+0x7e: can't find switch jump table
--
>> fs/ioctl.o: warning: objtool: __x64_sys_ioctl+0x10b: ignoring unreachables due to jump table quirk
>> fs/ioctl.o: warning: objtool: __x64_sys_ioctl+0x119: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
