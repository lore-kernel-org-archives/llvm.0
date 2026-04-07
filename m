Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3821137702B;
	Tue,  7 Apr 2026 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534380; cv=none; b=FGsrWVqaanTD8lls0JsJN6Qyex8L23V1yZu1zOVgxCDQzp86kYUxMHmk19jeWG3JzEOrckx/sPUCKgtt5rGCOf5Nr7Wv4wnUCo0/0/aXF1Y4X6STKbhvgiJvtGLJJayKkGuqL8lDz9HKeM5IwdKE9BrF7FTXzvkDs+AWO8T+M1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534380; c=relaxed/simple;
	bh=x2gOK+bWV44XTSVlIzfozhf86yP93+urpxqztNkHNBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Btj2kbdxMstrLnjo8io3/GbZ/COU3zouyLv3kPYwOy/rQkCobd94HZre2TDkHcEJLtEhFR6Ve4JIzmv1FxvOtyPcrPWVw99zp1PDCtntYZjx1Pom4o28PWR/H5JosZXIi7S6zqb1NOwv9jCr5m5u0qZg3V5HglSe/hGkkNZUUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2/lvdR+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2/lvdR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534379; x=1807070379;
  h=date:from:to:cc:subject:message-id;
  bh=x2gOK+bWV44XTSVlIzfozhf86yP93+urpxqztNkHNBA=;
  b=Y2/lvdR+HJWuVRYS5T52i0FSt5GDmlo3EdK85T+uAur1cLcWmNFCuRo/
   hFY50Ewj40HOWccWh30FZ8aXsvFzNbzaiYek4ui1HiXm5seLYLIpe/9ju
   neAFjFz/XIlWBJUz6q0Hba62t8maZEtsroc8N+Tl8dW7KOkW8LbC1xAJL
   Vuqv9Rx+U8rYBWQA9MOWCM3bZr1X6d+e+J9zWI4LeOetm15NR5IEg7C6Q
   gnfloRZMyQqwUhSqCQ6RK9uTSnIKfoOHGKKBfoP3KmS/AwjGzy6aGzLt9
   HgDMQbg6Ur4PDSCwpIQDbYtKcywTYs64UqXm/RALEsix6OJDH288kYH+g
   A==;
X-CSE-ConnectionGUID: S/GavC/gTeuZdU3FlC5o2A==
X-CSE-MsgGUID: Jb1+C3CURcqRV1nu+xtxaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76204322"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76204322"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:37 -0700
X-CSE-ConnectionGUID: j8pMpfMoRQ6puMtFitI4ww==
X-CSE-MsgGUID: QH1EOszlRdC9yzpGD3k9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251193027"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:59:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006l-1KMo;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 07 Apr 2026 11:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 34/68] error[E0061]: this function
 takes 1 argument but 2 arguments were supplied
Message-ID: <202604051411.VGXONaOa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   f7a3080ba37b989ad2fd83054a4b458af97b635d
commit: 92fe4dbd22e7faafad04ddf06d732e336ea7be98 [34/68] Rust: io: Add memcpy_fromio wrapper
config: x86_64-randconfig-073-20260404 (https://download.01.org/0day-ci/archive/20260405/202604051411.VGXONaOa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051411.VGXONaOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051411.VGXONaOa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0061]: this function takes 1 argument but 2 arguments were supplied
   --> rust/doctests_kernel_generated.rs:7240:22
   |
   7240 |     let devres_mem = IoMem::<100>::new(res, device)?;
   |                      ^^^^^^^^^^^^^^^^^      ------ unexpected argument #2
   |
   note: associated function defined here
   --> rust/kernel/io/mem.rs:267:12
   |
   267  |     pub fn new<'a>(io_request: IoRequest<'a>) -> impl PinInit<Devres<Self>, Error> + 'a {
   |            ^^^
   help: remove the extra argument
   |
   7240 -     let devres_mem = IoMem::<100>::new(res, device)?;
   7240 +     let devres_mem = IoMem::<100>::new(res)?;
   |
--
>> error[E0277]: the `?` operator can only be applied to values that implement `Try`
   --> rust/doctests_kernel_generated.rs:7240:22
   |
   7240 |     let devres_mem = IoMem::<100>::new(res, device)?;
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the `?` operator cannot be applied to type `impl PinInit<Devres<IoMem<100>>, Error>`
   |
   = help: the trait `Try` is not implemented for `impl PinInit<Devres<IoMem<100>>, Error>`
   = note: the full name for the type has been written to 'rust/doctests_kernel_generated.long-type-17116501122076988537.txt'
   = note: consider using `--verbose` to print the full type name to the console
--
>> error[E0412]: cannot find type `Device` in this scope
   --> rust/doctests_kernel_generated.rs:7238:18
   |
   7238 | fn test(device: &Device, res: Resource) -> Result {
   |                  ^^^^^^ not found in this scope
   |
   help: consider importing one of these items
   |
   3    + use kernel::auxiliary::Device;
   |
   3    + use kernel::device::Device;
   |
   3    + use kernel::dma::Device;
   |
   3    + use kernel::drm::Device;
   |
   and 2 other candidates
--
>> error[E0603]: struct `Resource` is private
   --> rust/doctests_kernel_generated.rs:7236:22
   |
   7236 | use kernel::io::mem::Resource;
   |                      ^^^^^^^^ private struct
   |
   note: the struct `Resource` is defined here
   --> rust/kernel/io/mem.rs:20:13
   |
   20   |             Resource, //
   |             ^^^^^^^^
   help: import `Resource` directly
   |
   7236 - use kernel::io::mem::Resource;
   7236 + use kernel::io::resource::Resource;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
