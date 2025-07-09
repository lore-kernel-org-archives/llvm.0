Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1821E7C27;
	Wed,  9 Jul 2025 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752041454; cv=none; b=Nm/bkw398ORnfU1nllkLH9PLspY5YFboOpbvZg3oLkzLrD7eyHDWNGFV6xTvlz/yfNcsLdpNzIJwFaXO/wsCC6gYbvPdGYRSqlwq4h+bpfpIJ4SpCLJHuF7HAkt3BYD95Dx1WzLbFE+vx7GYTd945d2c0FXWBxi0hlNOsQA49Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752041454; c=relaxed/simple;
	bh=iYAfPRz2PRj+sG4Tewmi3AaDfT3ypJ2gs15kgu1VCy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYkc+vm4bRXqxN+kNbHDo51qAQmGDVA+WpdXYMjpeQ8fSrSqiCQcZ5zhtUXjpKS8BIwM0YXAY2T8S9UfPLRTTQW4x04DLIwKX7AzqGNe49flaPUmVJ/Uk21s7uSchq65HW3NWoCwmt2nLCx/7J+BgJirogDGBPkBO3SFBhTnP/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWIdDigh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWIdDigh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752041453; x=1783577453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iYAfPRz2PRj+sG4Tewmi3AaDfT3ypJ2gs15kgu1VCy0=;
  b=IWIdDighHNF8hBzR90qG8N/U1AGWsflqPB0evnYVRFaVRPsMFlOCcFln
   VHvP5/fZ68A3fV+ccvnCjypMCBvRfIB4hMrZ3GZHXlelTgTYDyznlk/Kv
   34blQlirUJPcigmIuWmp9jawhbrhtmVbzzNHpPMRBzPmCTrKhBIhfr5jb
   Syr0Kh4eYJ6G85LLpAmm+TEYJZjkT7rXcy0IW43KCGbUcnQkk3cd3v92T
   rv8R5pCYt4nbhFtbhEzZ8wECN5CHLT6Oy7TAMWqzZhegMpH9dJqDlDrud
   Fej1LlxaV7UvfvYBXy2GHXlmpHif7zRNgreHdsNOOqOnwtVoFkSiyQIPt
   A==;
X-CSE-ConnectionGUID: jKD3IfWfTKOhr2NUAbNxfQ==
X-CSE-MsgGUID: dNQV1ZVwQBa6a9j8lsVDVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71873398"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="71873398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 23:10:49 -0700
X-CSE-ConnectionGUID: EXnvabQsTGS/cquBiEygmA==
X-CSE-MsgGUID: BomEpb7FRpe6+ECdj0iSrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155772191"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jul 2025 23:10:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZO10-0003AT-1D;
	Wed, 09 Jul 2025 06:10:46 +0000
Date: Wed, 9 Jul 2025 14:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [efi:next 1/1] ERROR: modpost: "efi_kobj"
 [drivers/firmware/efi/ovmf-debug-log.ko] undefined!
Message-ID: <202507091432.rbbrjGoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
head:   42c68c6e354f71498f9e3e31aa5b0f9243bc1618
commit: 42c68c6e354f71498f9e3e31aa5b0f9243bc1618 [1/1] efi: add ovmf debug log driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250709/202507091432.rbbrjGoU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091432.rbbrjGoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091432.rbbrjGoU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "efi_kobj" [drivers/firmware/efi/ovmf-debug-log.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
