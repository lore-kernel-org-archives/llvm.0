Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB552F2E;
	Mon, 10 Feb 2025 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739166452; cv=none; b=FZpgeM0DXrd3vEzuFiK5bQYkqKXqfNUCTW3K7iqtytw7YoceDCTYQYeI6XU1Gk2FLTGHeTNv8DBaFYShhMFYtbkEMHaQ7WnXiMsLehZ6NHVTl7zVd8hcs/q7T9N56qhc5lT6S3rnCHni4ZGeCzdqyzEu58VTFV2En1DtkhD91IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739166452; c=relaxed/simple;
	bh=cnjco74loFHQnD+KeSx9BLMP4PTTTfvem73VY9+LInQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CABjYEILrv8GDHVFyBEnd/okHrtWk2O3pZYgHOWMo2kK9SYQv7HKIlZZvHpJ1gmahb/FE/YdId6LyfTs68c2Be1e+X0dpoULe9/p23UUJ0gwUPwPZRzyy1aYuxWCj0yEIN6Y0whfXHsWAijpe6rI3U1Z/x285kXhTaSZCFMiGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSwi6Fjg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSwi6Fjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739166451; x=1770702451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnjco74loFHQnD+KeSx9BLMP4PTTTfvem73VY9+LInQ=;
  b=OSwi6FjgEQs8CgMlUoT/PUssJG5/FEc+WbRHy3FF5cmFZlrw+Dhpe/Hp
   xN+OJQKWPpw8tTjCJ7qccjp5/CNnKPnUF5lf9MngZj81lTOOUfvd8Nes8
   nsqufrFIj8DKIRD5s0zu2SVJl1uhjzaMOCfGxjSE7pZ9CdroAq1WDsaxf
   kb0mv07D0uiBMra+H7s7GbVI0cGI68wMivgyGk1u0QTjPgf+cEMW3ASDh
   ca14D76+MPCenHJZ865+OlmxH5CYd056VGbzN4MycNi/uZrwPE3Z/yM5I
   4Vz7TZhWthI8tqF1Az0zLgYFrQQBeLXj17H9pMFI3kSWgH96XNHPkySVW
   A==;
X-CSE-ConnectionGUID: 6FZKIKr4SJOHwD2LJ2MXhw==
X-CSE-MsgGUID: GCMydeePTpCcHqtDhJ0d6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39882224"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="39882224"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:47:30 -0800
X-CSE-ConnectionGUID: 10NRnUSZT8Wgox5hWxphbw==
X-CSE-MsgGUID: TkFPFqCaQxq0CftsXOt2eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142972640"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Feb 2025 21:47:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thMdj-0012KN-05;
	Mon, 10 Feb 2025 05:47:27 +0000
Date: Mon, 10 Feb 2025 13:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 33/35] ld.lld: error: undefined symbol:
 rxgk_kernel_query_challenge
Message-ID: <202502101307.m8LMmsqT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   6385ba8f265471ebf57f38e2bd2e6a4fabac7424
commit: 3b951c84a1a0a64bcd64148f838c699c9abdf8e0 [33/35] afs: Use rxgk RESPONSE to pass token for callback channel
config: hexagon-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101307.m8LMmsqT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101307.m8LMmsqT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101307.m8LMmsqT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rxgk_kernel_query_challenge
   >>> referenced by cm_security.c:194 (fs/afs/cm_security.c:194)
   >>>               fs/afs/cm_security.o:(afs_process_oob_queue) in archive vmlinux.a
   >>> referenced by cm_security.c:194 (fs/afs/cm_security.c:194)
   >>>               fs/afs/cm_security.o:(afs_process_oob_queue) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
