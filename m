Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64715E8B;
	Sun, 27 Oct 2024 01:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729991570; cv=none; b=igTyCkjz0CPRPOniy84rr2E8OIFDMG6d02frxYUMqcclg0j1SCD+Mq5ZwFQ+cDzX4IitoTkqHkwUYoCSu7YqeF+yeD1/WhiIdYV3y6sN4BUFnRK6KE8QPviFPwMm/RImmEpcGKxqsLx94L1AswZDsd5VU3+Q2zxyBoJdH4gQ9tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729991570; c=relaxed/simple;
	bh=TjoLrBZb6ukVdCKl3PMQEn/q57oDKoan67W1Yjex5F4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjUV5QFKbExazdNx6pqnJz5OmovRdLgocRF3gyj0KpA0f1oik2sRDhfdauNtLvDk+faLoUpyzeh+i7t9RRLez8Ff5tpfDS6NxPac5DBKaduB8bnW8XNuXL3zxzi63BYLnz6APMj/gy/kWe82fr91sHnddt3xdztd/gIEWAVAci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmpiIDFN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmpiIDFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729991568; x=1761527568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TjoLrBZb6ukVdCKl3PMQEn/q57oDKoan67W1Yjex5F4=;
  b=mmpiIDFN+Is5Sp4r9fKkPHo4xL96f8avUBC6u9P9oBdhTEVwmL5jaVuc
   StYr2ajgqzZEVmEUFuADMLU3L+SSjKC44G3JZojDNnPS26Kedzb3ApCRC
   7Cgl3nt+YObAgdBWstOBBtFYC9Bg1zu3XlXbgw76PvMrRSq8nLfFjvNe7
   9lAbze1P6xcXgnx3FqgLnSex2qojLPq2Fl8jVpMq1HcNmsZI/mwLEOl8Z
   yrKFDNJycL8DabnpEexSn/bN/4BOGGZsCpKECW6g4d50M6QBNHObJIZoA
   q1AFXKnYVsH5b2PB5uNC3W2KIh+PdfOFNzil9nzEf7z63ajMo35aC/yuu
   g==;
X-CSE-ConnectionGUID: uwY5ISYDSoy8RLzCL5gwjg==
X-CSE-MsgGUID: /wOlBhebRxqE6DuP/RVm2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="17257254"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="17257254"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 18:12:47 -0700
X-CSE-ConnectionGUID: 1xW2v/VaSpyi8ALm+3MS6g==
X-CSE-MsgGUID: fqLLjqBlQByg1CX/MJVFog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81425577"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2024 18:12:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4rp3-000aEW-0R;
	Sun, 27 Oct 2024 01:12:01 +0000
Date: Sun, 27 Oct 2024 09:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [linux-next:master 6626/7183] ld.lld: error: undefined symbol:
 __get_vm_area_node
Message-ID: <202410270919.LebQlmxD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: a9c60bb0d0e58ca30b8bfd00bddbe5bf79bd120c [6626/7183] alloc_tag: populate memory for module tags as needed
config: arm-randconfig-004-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270919.LebQlmxD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270919.LebQlmxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270919.LebQlmxD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __get_vm_area_node
   >>> referenced by execmem.c
   >>>               mm/execmem.o:(execmem_vmap) in archive vmlinux.a
   >>> referenced by execmem.c
   >>>               mm/execmem.o:(execmem_vmap) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
