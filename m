Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC2DDA3;
	Sun, 16 Jun 2024 00:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718499129; cv=none; b=W2TWZfAk1Rlv9oymzVZWlUX198aImmjkVajhbacyy3TBTbUX6ek+8+ETBc5j5Xry2u/5jtghaqcJkgDen/EQTJlavQA2eWfd1ZyrhKz7TY6E0kngjEFom8lNEp+/qoHve4hhEdxsBQRgihTwnXAU0b5jgTpyUd+PxfQkBylv/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718499129; c=relaxed/simple;
	bh=Ijcw3WXu407Fw08aKLf9PrB+OBdJM8B5pAJf6buZ+d4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQV24r4hSTeFbSbinrDXv8/ugJjpkOiQcBHQ+DcNFc0HIwLY0Z/OXE7pXjPk57WCqkHjOHDq0DqyDd9w/kSWhurYCHg8v1tLMbR6+Kchopl8vxOptOiZFBgo6zwaXUYpodVLIU9otdGMoh+cPmZWV84mnosCsqIPruC0cmnNDWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atnkn92G; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atnkn92G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718499127; x=1750035127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ijcw3WXu407Fw08aKLf9PrB+OBdJM8B5pAJf6buZ+d4=;
  b=atnkn92Gm2kofFQSmAtPynjZgnV8Yh6zZz7g4q5Hksh5qFTkTyOAqPUP
   QUnKZH5S5YvqGE08Dz6Df1C9HkUhrtLuIgJHSWJE3Im33stDSN5iHj+1t
   93wbVIcmof4Ks5M/KGYYY9+w+e9M50b5XLqDHCblsfuU1Cn8qdMbTRa3n
   YeRWkpGd36uqaU56X0ZpuFdQDQTWWJo+4dzNjyx87HXb61hnNQBuu/zjQ
   KqXpL1HpX1w4IeO7GpGIBCdov+rWDKJz0rlN1ECebGyZbnnBra/8fvmtn
   oL33dM2uhu2PkM2f/anEyzSC4CmcldXIEe2vKEC3exwPi8mzipyHQVDzK
   Q==;
X-CSE-ConnectionGUID: ubxK+ZTpQHeW3x1ijPQPyQ==
X-CSE-MsgGUID: Fl1JOngXQAuGB9m1/3VZ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15236850"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15236850"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 17:52:07 -0700
X-CSE-ConnectionGUID: BLzwb2ToQO6BnjX+UPZEtg==
X-CSE-MsgGUID: b/g8TsmDQl29Fm22siBtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40962010"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2024 17:52:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIe7n-0000fm-0Q;
	Sun, 16 Jun 2024 00:52:03 +0000
Date: Sun, 16 Jun 2024 08:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>
Subject: [rust:staging/rust-device 11/12] error[E0425]: cannot find function
 `ioremap` in crate `bindings`
Message-ID: <202406160832.0FU0NbZ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-device
head:   6530ecc4ac729a040a955a5e2d13c37d671b6e5c
commit: 564a5aba91749daa7cd969c482d0ccc49f247395 [11/12] rust: add `io::Io` base type
config: arm64-randconfig-003-20240616 (https://download.01.org/0day-ci/archive/20240616/202406160832.0FU0NbZ6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160832.0FU0NbZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160832.0FU0NbZ6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `ioremap` in crate `bindings`
   --> rust/doctests_kernel_generated.rs:2200:39
   |
   2200  |         let addr = unsafe { bindings::ioremap(paddr as _, SIZE.try_into().unwrap()) };
   |                                       ^^^^^^^ help: a function with a similar name exists: `iounmap`
   |
   ::: rust/bindings/bindings_generated.rs:43009:5
   |
   43009 |     pub fn iounmap(addr: *mut core::ffi::c_void);
   |     -------------------------------------------- similarly named function `iounmap` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
