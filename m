Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAEA159574;
	Wed, 10 Apr 2024 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712746790; cv=none; b=C/IGJLK2whI6M7VD9Y3tKBD0mqvG0hC5Kzr2kgRrkMW7tSkBJua47lVsxn1s2ujFSmipZPlywxKHABIpEoP67pon+CMxKmwyGQ9oG6ocFGDD7/R5ZptaC7R+PZbyaLTvvu0Oo/bP2KjYzy/Ao372Csf0VaMrlxkA1O/Py+3TITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712746790; c=relaxed/simple;
	bh=5dJNhJlh54tdcDVrOnuGLFin/Qika690mjYAxP3punE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDmXLjZOQOyeIWhv7JrNxGPzhb8zRm2q1HTWpM/tPDbQl4xVM9ub5ya5dOEJ4W3ynJ8XweBYWJuUOTFyeNBqv+IUCcU/ZPmTtH79do1o+mBJEZVS+FUpyrXEGuL1RoViyfCTc01tKciXPplOgX1tVRG+S/pOdE47TJRYNNnlCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqNc/z4D; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqNc/z4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712746790; x=1744282790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dJNhJlh54tdcDVrOnuGLFin/Qika690mjYAxP3punE=;
  b=LqNc/z4DjcaFnEVfVvJE30VoNIZ4G6snwk3n+eQJQlG2lnEzpkBYHiiK
   5GHnBl6D93WGkKJiy4u0SEbkN84gQSj9TVv7o5o9hke1iHdHPMGKYD2uK
   btJ6YrWv8Wqm/otyr4hnHzU8z1H1GwQPFRMex0/qTC2Xd8cfK6zTbF186
   ruzhZyNQxTjhUxaORU4G6tTJ7oxjVcXsqrSA0Pulsx30Y/3reHQNw6N/Q
   3MljelsyGjwgDb4xuLXav/0U4mkm0bvoRQmkR7R9XKHL0Pf375Yq8Hwcy
   tRkPbhfSrE/IDuuYMHPiQpxSQ9nSvvrwJJvK817UuHu2/Qwt1uytT3j3R
   g==;
X-CSE-ConnectionGUID: 47VuuvMcT1W3d6czQHgTKw==
X-CSE-MsgGUID: ixFNeOwYRm2qYuINVQVuVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7973824"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7973824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 03:59:47 -0700
X-CSE-ConnectionGUID: sQVqvQRCQqmhYSRSw3zEaQ==
X-CSE-MsgGUID: m2erkXDuRK2hYSUCefqqdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51745346"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2024 03:59:46 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruVg7-0007EY-2V;
	Wed, 10 Apr 2024 10:59:43 +0000
Date: Wed, 10 Apr 2024 18:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 18/23] mm/execmem.c:69:undefined reference
 to `text_poke_copy'
Message-ID: <202404101816.ZH1POam3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   d64e0751d3a13178009bd0a72f04f4b90f7ef961
commit: 95eac503c326322a5414c81b8c55e1a43bc19371 [18/23] module: prepare to handle ROX allocations for text
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240410/202404101816.ZH1POam3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101816.ZH1POam3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101816.ZH1POam3-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: mm/execmem.o: in function `execmem_update_copy':
>> mm/execmem.c:69:(.text+0x17d): undefined reference to `text_poke_copy'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +69 mm/execmem.c

    66	
    67	void *execmem_update_copy(void *dst, const void *src, size_t size)
    68	{
  > 69		return text_poke_copy(dst, src, size);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
