Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E771581F3;
	Fri, 25 Oct 2024 03:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729827104; cv=none; b=W6KSoSeqhL9eVo6DiRYhH3TTjYmYX1ozGz5IG05ba/xRMdUMZRbCq3vj/Oo555TTW0RJlChKVU3/WtpxKzBBNop86pBM1THOHhexd4wRFTCl7Uzl3aB83dxTD23CJfNjCVIOH+4jXUB5s+UWXgR0UbkfFK/6mIVviqNMI6mYDvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729827104; c=relaxed/simple;
	bh=oyTUIedWaEwyYVgXdA6iVa/ob/1ziEas+tOA7cQjkZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2IHA4asvHAzv3puSe31k4/8buzm/yW4VhIlf1PzICwD8JJGEW5KLrymqhY0LksKBNNSDptDi2yFFmHBKSTYzf5AK8m227z3tK72WkjmOZ6Cv72/vuKoBt+TA//41YI6PyVfIadvYwH9l7Ev7PjYiksQe+L7pcCXBSmHNUqS5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEdxSGLj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEdxSGLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729827101; x=1761363101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyTUIedWaEwyYVgXdA6iVa/ob/1ziEas+tOA7cQjkZM=;
  b=FEdxSGLjRtT44Vy9Iuwpuxig+pFnpc3ETc+ch0fneGfEU4HGWJE405wB
   JQLZdYLGLkKB+OOJcjj+2I6gO3giPILX13wMkfdezuWRFVh/9Gs0T3i58
   l+a26/CUmOYZOERAhPmTRlO7N+HispKV4+kRtMWqGcQkvgmyw3sdin0X4
   lecFQg5OPJJsteNi+mC6XjEVqPXK+sSPswWQ63NE9ztl74H/u2BolkM+1
   AlZGZGsPgpCM0HVrinNDhZEX7FmyN+8RBVjj1B+Ykxd0JYnTQaV9ieUbB
   07M5/Fg1/RBpoAjj+S7bR8hRUDFobWPpSf9hZFTwX9rsv8eC7kMYJsmqm
   w==;
X-CSE-ConnectionGUID: GbQLli8WSDuG/gRZeiyxkg==
X-CSE-MsgGUID: Prk2fp5ETB+VwYsQHpx8HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40031836"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40031836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 20:31:40 -0700
X-CSE-ConnectionGUID: u359s/FBQSqNWITenwkZGQ==
X-CSE-MsgGUID: ZJKNyryJRNCDRcPGtbEumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="118257855"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2024 20:31:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4B31-000XX6-2t;
	Fri, 25 Oct 2024 03:31:35 +0000
Date: Fri, 25 Oct 2024 11:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Gow <davidgow@google.com>
Subject: [uml:next 28/45] InstrProfilingUtil.c:(.text.lprofAtExit+0x1):
 undefined reference to `atexit'
Message-ID: <202410251145.87HDtgK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   d61ac4a7496a7981947b8b894d40b0e35c316fa5
commit: 14d4a7b516e993cf3926758a7ede569d8e119855 [28/45] um: make stub_exe _start() pure inline asm
config: um-randconfig-001-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251145.87HDtgK5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251145.87HDtgK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251145.87HDtgK5-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x109): undefined reference to `fclose'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x110): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x11b): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x122): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x139): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x16b): undefined reference to `strtol'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x17d): undefined reference to `calloc'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x198): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x1b0): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x1c7): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x1df): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x1f2): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_orderfile_write_file+0x20a): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingFile.c.o): in function `__llvm_profile_set_file_object':
   InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x60): undefined reference to `free'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x73): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0xb0): undefined reference to `fflush'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0xe1): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0xf1): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0xfb): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x12e): undefined reference to `munmap'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x14b): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x163): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x186): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x18d): undefined reference to `strerror'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x198): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x1ab): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x1b5): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x1cb): undefined reference to `strtol'
   /usr/bin/ld: InstrProfilingFile.c:(.text.__llvm_profile_set_file_object+0x1dd): undefined reference to `calloc'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingMerge.c.o): in function `__llvm_profile_merge_from_buffer':
   InstrProfilingMerge.c:(.text.__llvm_profile_merge_from_buffer+0x2f9): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingMerge.c:(.text.__llvm_profile_merge_from_buffer+0x311): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingWriter.c.o): in function `lprofBufferWriter':
   InstrProfilingWriter.c:(.text.lprofBufferWriter+0x49): undefined reference to `memcpy'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingWriter.c.o): in function `lprofBufferIOWrite':
   InstrProfilingWriter.c:(.text.lprofBufferIOWrite+0x9c): undefined reference to `memcpy'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingWriter.c.o): in function `writeOneValueProfData.constprop.0':
   InstrProfilingWriter.c:(.text.writeOneValueProfData.constprop.0+0x4c): undefined reference to `memset'
   /usr/bin/ld: InstrProfilingWriter.c:(.text.writeOneValueProfData.constprop.0+0x88): undefined reference to `memset'
   /usr/bin/ld: InstrProfilingWriter.c:(.text.writeOneValueProfData.constprop.0+0x157): undefined reference to `memset'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingPlatformLinux.c.o): in function `__llvm_write_binary_ids':
   InstrProfilingPlatformLinux.c:(.text.__llvm_write_binary_ids+0x5): undefined reference to `__ehdr_start'
   /usr/bin/ld: InstrProfilingPlatformLinux.c:(.text.__llvm_write_binary_ids+0x18): undefined reference to `__ehdr_start'
   /usr/bin/ld: InstrProfilingPlatformLinux.c:(.text.__llvm_write_binary_ids+0x1f): undefined reference to `__ehdr_start'
   /usr/bin/ld: InstrProfilingPlatformLinux.c:(.text.__llvm_write_binary_ids+0x11e): undefined reference to `__ehdr_start'
   /usr/bin/ld: InstrProfilingPlatformLinux.c:(.text.__llvm_write_binary_ids+0x1cb): undefined reference to `__ehdr_start'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `__llvm_profile_recursive_mkdir':
   InstrProfilingUtil.c:(.text.__llvm_profile_recursive_mkdir+0x41): undefined reference to `mkdir'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofGetHostName':
   InstrProfilingUtil.c:(.text.lprofGetHostName+0x12): undefined reference to `uname'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofGetHostName+0x34): undefined reference to `strncpy'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofLockFd':
   InstrProfilingUtil.c:(.text.lprofLockFd+0x1c): undefined reference to `getpid'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofLockFd+0x31): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofLockFd+0x49): undefined reference to `fcntl'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofUnlockFd':
   InstrProfilingUtil.c:(.text.lprofUnlockFd+0x1c): undefined reference to `getpid'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofUnlockFd+0x31): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofUnlockFd+0x49): undefined reference to `fcntl'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofLockFileHandle':
   InstrProfilingUtil.c:(.text.lprofLockFileHandle+0x7): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofLockFileHandle+0x21): undefined reference to `getpid'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofLockFileHandle+0x39): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofLockFileHandle+0x51): undefined reference to `fcntl'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofUnlockFileHandle':
   InstrProfilingUtil.c:(.text.lprofUnlockFileHandle+0x7): undefined reference to `fileno'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofUnlockFileHandle+0x21): undefined reference to `getpid'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofUnlockFileHandle+0x39): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofUnlockFileHandle+0x51): undefined reference to `fcntl'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofOpenFileEx':
   InstrProfilingUtil.c:(.text.lprofOpenFileEx+0x13): undefined reference to `open'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofOpenFileEx+0x35): undefined reference to `getpid'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofOpenFileEx+0x51): undefined reference to `__errno_location'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofOpenFileEx+0x69): undefined reference to `fcntl'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofOpenFileEx+0x98): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofOpenFileEx+0xb0): undefined reference to `fprintf'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofOpenFileEx+0x82): undefined reference to `fdopen'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofGetPathPrefix':
   InstrProfilingUtil.c:(.text.lprofGetPathPrefix+0x12): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofGetPathPrefix+0x21): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofGetPathPrefix+0x4f): undefined reference to `strtol'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofGetPathPrefix+0x62): undefined reference to `strlen'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofApplyPathPrefix':
   InstrProfilingUtil.c:(.text.lprofApplyPathPrefix+0x4f): undefined reference to `memcpy'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofApplyPathPrefix+0x68): undefined reference to `strlen'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofApplyPathPrefix+0x82): undefined reference to `memcpy'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofFindFirstDirSeparator':
   InstrProfilingUtil.c:(.text.lprofFindFirstDirSeparator+0x6): undefined reference to `strchr'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofFindLastDirSeparator':
   InstrProfilingUtil.c:(.text.lprofFindLastDirSeparator+0x6): undefined reference to `strrchr'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofSuspendSigKill':
   InstrProfilingUtil.c:(.text.lprofSuspendSigKill+0x19): undefined reference to `prctl'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofSuspendSigKill+0x4a): undefined reference to `prctl'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofRestoreSigKill':
   InstrProfilingUtil.c:(.text.lprofRestoreSigKill+0xd): undefined reference to `prctl'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofReleaseMemoryPagesToOS':
   InstrProfilingUtil.c:(.text.lprofReleaseMemoryPagesToOS+0xd): undefined reference to `getpagesize'
   /usr/bin/ld: InstrProfilingUtil.c:(.text.lprofReleaseMemoryPagesToOS+0x4a): undefined reference to `madvise'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingUtil.c.o): in function `lprofAtExit':
>> InstrProfilingUtil.c:(.text.lprofAtExit+0x1): undefined reference to `atexit'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfiling.c.o): in function `__llvm_profile_reset_counters':
   InstrProfiling.c:(.text.__llvm_profile_reset_counters+0x3d): undefined reference to `memset'
>> /usr/bin/ld: InstrProfiling.c:(.text.__llvm_profile_reset_counters+0x5a): undefined reference to `memset'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingValue.c.o): in function `InstProfPopcountll':
   InstrProfilingValue.c:(.text.InstProfPopcountll+0x5): undefined reference to `__popcountdi2'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingValue.c.o): in function `InstrProfGetRangeRepValue':
   InstrProfilingValue.c:(.text.InstrProfGetRangeRepValue+0x14): undefined reference to `__popcountdi2'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingValue.c.o): in function `InstrProfIsSingleValRange':
   InstrProfilingValue.c:(.text.InstrProfIsSingleValRange+0xb): undefined reference to `__popcountdi2'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingValue.c.o): in function `lprofSetupValueProfiler':
   InstrProfilingValue.c:(.text.lprofSetupValueProfiler+0xc): undefined reference to `getenv'
   /usr/bin/ld: InstrProfilingValue.c:(.text.lprofSetupValueProfiler+0x4b): undefined reference to `strtol'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingValue.c.o): in function `__llvm_profile_instrument_target':
   InstrProfilingValue.c:(.text.__llvm_profile_instrument_target+0x17e): undefined reference to `calloc'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target+0x1bc): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target+0x1ee): undefined reference to `calloc'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target+0x13c): undefined reference to `free'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target+0x1d8): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingValue.c.o): in function `__llvm_profile_instrument_target_value':
   InstrProfilingValue.c:(.text.__llvm_profile_instrument_target_value+0x178): undefined reference to `calloc'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target_value+0x1fb): undefined reference to `stderr'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target_value+0x22c): undefined reference to `calloc'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target_value+0x13d): undefined reference to `free'
   /usr/bin/ld: InstrProfilingValue.c:(.text.__llvm_profile_instrument_target_value+0x21d): undefined reference to `fprintf'
   /usr/bin/ld: /opt/cross/clang-5886454669/lib/clang/20/lib/x86_64-unknown-linux-gnu/libclang_rt.profile.a(InstrProfilingValue.c.o): in function `__llvm_profile_instrument_memop':
   InstrProfilingValue.c:(.text.__llvm_profile_instrument_memop+0x1d): undefined reference to `__popcountdi2'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
