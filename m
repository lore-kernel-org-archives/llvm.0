Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6341E1E10;
	Thu, 27 Mar 2025 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743060142; cv=none; b=S48bFVcQlMaqcuha5qKIPE6Q6JAllx8Jjmw5KSMGwuarizQY1NsTHsSr0FGsqUw2d0y0PWH81McvIvwlyhqaIJsdqD5layZO8HgdVIXqsXHoNxaPIzzhxesBfLMSPlV/7dafh9hIBtwNM1HaVUXPHTFXONpMDnqkLDCQ2BuEToU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743060142; c=relaxed/simple;
	bh=vxJW2l18axeAXkYulnRPg1B27S05azCpN2XT8ogc1CI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5D/VtRLJK81ORgLLFlpiwFSFMUROpFP1R94KbRe0TFXCZJmhIsLcmHjqD3jbo0HisCSjCzuG4zEQ/95cRpZk5n/PSG2qEjXNkDYfmE3JSoQPMIKJw1q7GInh/UwPjhTbaw5SfcDFpFf5nnmloM2REJr7LxXJYd73B/h/Soe7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBhquX5J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBhquX5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743060140; x=1774596140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vxJW2l18axeAXkYulnRPg1B27S05azCpN2XT8ogc1CI=;
  b=QBhquX5JFlfJsigYKxVuBlyAQsOYGnDsBdZlDr0fUxbabyMGnng2Noig
   uMTLHpLitT+na1EtALFOEnFYws+huP+b53PU1TM6rjtI4J8LgVwH5FEGB
   JVbaVJmBZmPM/og2Od/KaciuhFXvzh3ymD3vmkA/R5ZTp7zCUtW+NUYum
   uJX8PNCLs5J+7aQJV+yklLcDizrTToNQh/0O5ggiTqyq+j8+KCPkTcaQr
   Y/fV2vhC2EqIquiB7BjGuAWCYJdXBMMfCQCCJpoMqmp91YTMHVwmHBCTV
   oVY7AJF4Wc9a+txJ7dhQ/UOQLxjvBfW8glDLZfTlnt7JouxsmSNjJnyvn
   Q==;
X-CSE-ConnectionGUID: 9GWMBXfqQze5+E50UabVeA==
X-CSE-MsgGUID: Z86DIlrkQUaWez7/gQso6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44560483"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44560483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 00:22:19 -0700
X-CSE-ConnectionGUID: DxUY8+3PSBieDHtVcMb2gA==
X-CSE-MsgGUID: xRrEiH4mSQS13bn3sfKTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="124818023"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2025 00:22:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txhZ9-0006Tt-2t;
	Thu, 27 Mar 2025 07:22:15 +0000
Date: Thu, 27 Mar 2025 15:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 25/48] error: cannot find macro `register` in this
 scope
Message-ID: <202503271532.6ZuniB3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   8a5d4dee8e431c4d46aa04b30d0928d29a4d3522
commit: e8b2fbb30d806d93bbd9cede710958aa0b76a843 [25/48] [RFC] rust: add macros to define registers layout
config: x86_64-randconfig-072-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271532.6ZuniB3h-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271532.6ZuniB3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271532.6ZuniB3h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `register` in this scope
   --> rust/doctests_kernel_generated.rs:3748:1
   |
   3748 | register!(Boot0@0x00000100, "Basic revision information about the chip";
   | ^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::register;
   |
--
>> error[E0425]: cannot find value `bar` in this scope
   --> rust/doctests_kernel_generated.rs:3799:26
   |
   3799 | let boot0 = Boot0::read(&bar);
   |                          ^^^ not found in this scope
--
>> error[E0425]: cannot find value `bar` in this scope
   --> rust/doctests_kernel_generated.rs:3807:49
   |
   3807 | boot0.set_major_rev(3).set_minor_rev(10).write(&bar);
   |                                                 ^^^ not found in this scope
--
>> error[E0425]: cannot find value `bar` in this scope
   --> rust/doctests_kernel_generated.rs:3810:15
   |
   3810 | Boot0::alter(&bar, |r| r.set_major_rev(3).set_minor_rev(10));
   |               ^^^ not found in this scope
--
>> error[E0433]: failed to resolve: use of undeclared type `Boot0`
   --> rust/doctests_kernel_generated.rs:3799:13
   |
   3799 | let boot0 = Boot0::read(&bar);
   |             ^^^^^ use of undeclared type `Boot0`
--
>> error[E0433]: failed to resolve: use of undeclared type `Boot0`
   --> rust/doctests_kernel_generated.rs:3810:1
   |
   3810 | Boot0::alter(&bar, |r| r.set_major_rev(3).set_minor_rev(10));
   | ^^^^^ use of undeclared type `Boot0`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
