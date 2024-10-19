Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307418872A;
	Sat, 19 Oct 2024 05:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729314447; cv=none; b=GSt3R6TYLIqa0jAPabKwp8TBoNlq57iHKA4cOJTg4vEkFsj/a5op8DGWfVpIuMqHswKT9/BcS5krlPK1mhVXoyOxvsErFc91wel9ZsNHguvQSRgZyJL0Q5fPv2pTXWc5WmankSPNcQOb9oenSRYa1V96UwYFTIkKs8itPsCp+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729314447; c=relaxed/simple;
	bh=ekwJvoS9EOKrvjqeVVB83tzt9UjSfTtJkCVEn3TzIoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OltZLhbMZqarV8n29PO/J9J2V2Ro9AJOtiYFcb14tuWzUB8fpq3EhMVaOSxUR2G65A1z1QIwRBeHtA26mu/igwCNeJ7t8tlMCyJNiKHVTGxc+eJJcToL0sf543ZxYh00WQ9v+lA5As+Ua1Oeua85Zm+pS9BAZKXiybnEG+HhKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VM0hl4Q+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM0hl4Q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729314444; x=1760850444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ekwJvoS9EOKrvjqeVVB83tzt9UjSfTtJkCVEn3TzIoI=;
  b=VM0hl4Q+HDmfkbqvv92lPa4ci8Gadq3cMEVwCIEGMZEp+Khrj6hxSLUL
   yWVnTOzTOeyaouzUXc/PJNsApYdBGtbtTGz4KVjS3n3q0+NwzRHr1m1BN
   qHsFChB04qXU89hYcCAXAEG0bAWIpQzVrtr6GVzGCXVz7ZRn1Bh4cteJ+
   QE0smh3WsdIIzHonuyfhbUKQmCrZnM2GHbKpLiQl57oPx4fDArv2/dbyz
   +EMvp0mn2JL/v1l9l4ZjtsOpinep6v5f/vIGMTEIaAfHWq89qUG5hw86J
   Nj721mPJauJ7NKx81F2QVTRKSfZpOU5U5qrc/6xi+EGKMHCRt1SVY4tfk
   Q==;
X-CSE-ConnectionGUID: /JvQUmoTSQ6SLZlGwm59yQ==
X-CSE-MsgGUID: lnRC00vqSs2Bco5pDZUKDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="54271231"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="54271231"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 22:07:24 -0700
X-CSE-ConnectionGUID: Fpj153LVSZuUXSHEMwwMVg==
X-CSE-MsgGUID: a2S3fYiESreHaQifAHuy4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79191572"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2024 22:07:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t21gN-000Oht-33;
	Sat, 19 Oct 2024 05:07:19 +0000
Date: Sat, 19 Oct 2024 13:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] um: Fix passing '-n' to linker for stub_exe
Message-ID: <202410191242.MebRsSji-lkp@intel.com>
References: <20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78@kernel.org>

Hi Nathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 41ab5fe7471ff38d2909d1c93b88197a89c6a00f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/um-Fix-passing-n-to-linker-for-stub_exe/20241017-051439
base:   41ab5fe7471ff38d2909d1c93b88197a89c6a00f
patch link:    https://lore.kernel.org/r/20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78%40kernel.org
patch subject: [PATCH 1/2] um: Fix passing '-n' to linker for stub_exe
config: um-randconfig-001-20241017 (https://download.01.org/0day-ci/archive/20241019/202410191242.MebRsSji-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191242.MebRsSji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191242.MebRsSji-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> /usr/bin/ld: warning: arch/um/kernel/skas/stub_exe.dbg has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/um/kernel/skas/stub_exe.o: in function `_start':
   arch/um/kernel/skas/stub_exe.c:83: undefined reference to `memset'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `fileWriter':
>> InstrProfilingFile.c:(.text.fileWriter+0x44): undefined reference to `fwrite'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.fileWriter+0x83): undefined reference to `fseek'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.fileWriter+0xd0): undefined reference to `fwrite'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `getCurFilenameLength':
>> InstrProfilingFile.c:(.text.getCurFilenameLength+0x2c): undefined reference to `strlen'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilenameLength+0x55): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilenameLength+0x64): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilenameLength+0x87): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilenameLength+0xa8): undefined reference to `strlen'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o):InstrProfilingFile.c:(.text.getCurFilenameLength+0xb7): more undefined references to `strlen' follow
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `getCurFilename':
>> InstrProfilingFile.c:(.text.getCurFilename+0x1c0): undefined reference to `memcpy'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilename+0x23e): undefined reference to `getpid'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilename+0x276): undefined reference to `snprintf'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilename+0x43a): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilename+0x455): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilename+0x4da): undefined reference to `strlen'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.getCurFilename+0x4eb): undefined reference to `memcpy'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `createProfileDir':
>> InstrProfilingFile.c:(.text.createProfileDir+0xb): undefined reference to `strlen'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.createProfileDir+0x3b): undefined reference to `strncpy'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `truncateCurrentFile':
>> InstrProfilingFile.c:(.text.truncateCurrentFile+0x3f): undefined reference to `getenv'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.truncateCurrentFile+0x64): undefined reference to `setenv'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.truncateCurrentFile+0x85): undefined reference to `fopen'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.truncateCurrentFile+0x92): undefined reference to `fclose'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `getProfileFileSizeForMerging':
>> InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x14): undefined reference to `fseek'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x21): undefined reference to `ftell'
>> /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x31): undefined reference to `fseek'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x52): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x59): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x6a): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x74): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x82): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0x9a): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0xa1): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0xa8): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0xb9): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.getProfileFileSizeForMerging+0xc3): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `mmapProfileForMerging':
   InstrProfilingFile.c:(.text.mmapProfileForMerging+0xd): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0x27): undefined reference to `mmap'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0x53): undefined reference to `munmap'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0x5a): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0x72): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0x7e): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0x85): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0x96): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapProfileForMerging+0xa0): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `mmapForContinuousMode.constprop.0.isra.0':
   InstrProfilingFile.c:(.text.mmapForContinuousMode.constprop.0.isra.0+0x6c): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapForContinuousMode.constprop.0.isra.0+0x88): undefined reference to `mmap'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapForContinuousMode.constprop.0.isra.0+0xd1): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapForContinuousMode.constprop.0.isra.0+0xd8): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapForContinuousMode.constprop.0.isra.0+0xe9): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.mmapForContinuousMode.constprop.0.isra.0+0xff): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `writeFile':
   InstrProfilingFile.c:(.text.writeFile+0x45): undefined reference to `free'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x58): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0xa4): undefined reference to `fclose'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0xf1): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0xfa): undefined reference to `ftruncate'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x10c): undefined reference to `fseek'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x11c): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x121): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x128): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x13f): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x147): undefined reference to `fclose'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x199): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x1a3): undefined reference to `ftruncate'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x1b3): undefined reference to `munmap'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x1cb): undefined reference to `strtol'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x1dd): undefined reference to `calloc'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x1f1): undefined reference to `fflush'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x248): undefined reference to `fopen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x263): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x27b): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.writeFile+0x286): undefined reference to `munmap'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `initializeProfileForContinuousMode':
   InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x9c): undefined reference to `fopen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0xac): undefined reference to `ftell'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0xb4): undefined reference to `getpagesize'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0xe6): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0xed): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x101): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x10b): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x11e): undefined reference to `fclose'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x17e): undefined reference to `munmap'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x1a5): undefined reference to `fclose'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x1e3): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x1fb): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x223): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x237): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x241): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x248): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x25c): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x266): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.initializeProfileForContinuousMode+0x281): undefined reference to `fclose'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `parseAndSetFilename':
   InstrProfilingFile.c:(.text.parseAndSetFilename+0x4a): undefined reference to `strcmp'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x5a): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x72): undefined reference to `free'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x1a7): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x228): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x23c): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x2ba): undefined reference to `getpagesize'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x2d9): undefined reference to `getpid'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x2f6): undefined reference to `snprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x34c): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x367): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x37b): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x404): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x44a): undefined reference to `free'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x471): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x4ae): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x4c6): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x4d4): undefined reference to `strdup'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x4ef): undefined reference to `free'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x510): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x524): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x530): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x544): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x550): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.parseAndSetFilename+0x564): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `lprofCreateBufferIOInternal':
   InstrProfilingFile.c:(.text.lprofCreateBufferIOInternal+0x16): undefined reference to `free'
   /usr/bin/ld: InstrProfilingFile.c:(.text.lprofCreateBufferIOInternal+0x22): undefined reference to `calloc'
   /usr/bin/ld: InstrProfilingFile.c:(.text.lprofCreateBufferIOInternal+0x3e): undefined reference to `calloc'
   /usr/bin/ld: /opt/cross/clang-7cbf1a2591/lib/clang/16/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `__llvm_profile_get_path_prefix':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
