Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1053C140E;
	Tue, 23 Jun 2026 23:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782257034; cv=none; b=NShj5rRrik0a9fwKLF0M5FLOuV1yikNTAPFhIjrETQaRAHz2qK24K4ENkyhpxJJN/4dTGm2WjdENOhAlr8m1dwZv/VJqQNbPquLBfaQzvR8QanBskn3WIc8+RKWjZ1vyIkhq47hpoMw1w+8RC1rIbYXSBWs0oircY9f/HipHDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782257034; c=relaxed/simple;
	bh=ghFYTLu21sb9/PNifFuiJL+BBwo9OsvkC6YBD2LGwHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NG1OOMVyqqSilDDT1v5sVBDTMhIpjPFowZ6g+/R0A7AKrZxIQzrYDqcznhAUNpTkAF0mwo4J627a/aoawUvAsJbRCGSuhnSURYflX5HXggUiHdb4wDXhVzkMDS3sLT7DCAqE6sH9FvM5KXex1WBu+xDks23f2YbkBScOUfKdeh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xfrafyqz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xfrafyqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782257033; x=1813793033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghFYTLu21sb9/PNifFuiJL+BBwo9OsvkC6YBD2LGwHY=;
  b=Xfrafyqz7iWn3ysmRwNWIGEhi4Y2Dwj954YJcOgGld7yH4SSVkWwLWiw
   fQKiggcjGOjNDDl2nasXyx4WjKh0734ROKMSl7XedIhd8hzcBMVmO3Z4y
   IN9oSptydr5v0V2ki9TSALWaqlLlEJFkOZwyzXv3j7DxOMQaEl8ef83ks
   xmY05Mxa9sq97Cl3aQajJo2GuWbd0iz6AdYwHdrUIFDQ3SMqt1WNp1JMw
   db7diWX8pYJSn0ol88O4HTAPuh+TEdN/IuuxpDL/RYb4PUy5ycke7R1/d
   kuaJkL0ms70AOJNmEyMXXTY5B3pXEbjVBOrLDyyZ0wtFo3zHd3FB9Ko1g
   A==;
X-CSE-ConnectionGUID: mfoIGiZbQPuJohVbMc4uRA==
X-CSE-MsgGUID: HG8gOXXMQt+RRvFvZ4ZdLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93664739"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="93664739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:23:52 -0700
X-CSE-ConnectionGUID: OUIeiLXIQa2G9YvW1c5gyg==
X-CSE-MsgGUID: XHcAfzroTgOla+6v8xcRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="273349246"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2026 16:23:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAT5-000000002xP-2EEn;
	Tue, 23 Jun 2026 23:23:47 +0000
Date: Wed, 24 Jun 2026 07:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [linux-next:master 14136/15099]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: warning: objtool:
 amdgpu_vm_handle_fault+0x12d: sibling call from callable instruction with
 modified stack frame
Message-ID: <202606240753.kYjobJVl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Mikhail,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: 14682de8ad377bf13ea66e47c26dcfea0b19a21d [14136/15099] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
config: x86_64-randconfig-003-20260622 (https://download.01.org/0day-ci/archive/20260624/202606240753.kYjobJVl-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240753.kYjobJVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240753.kYjobJVl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: warning: objtool: amdgpu_vm_handle_fault+0x12d: sibling call from callable instruction with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
