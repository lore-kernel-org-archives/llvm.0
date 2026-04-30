Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B366246BC0;
	Thu, 30 Apr 2026 03:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777521341; cv=none; b=bgFguXbymBhnF5j3PsHq68lD58WfZodpVJgZB7fMyXLc0M0bdNW52zXBeoc3FHmFTKXjmP/MO9OnCEpgXb98xDxKyUZYsMZtOiHnjf72/UnAAlvhS29TmwD/3Rri0CY1uVW88Tv65eQmv/JgLA1jRcNqVGBVn9Zsn3rhUSO1HJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777521341; c=relaxed/simple;
	bh=4Znd9rEVLHFrcw8gv4dmAnLMQLspHnxDXOrZyDRs14Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NVgDAHgCh7pHs4JdTOB3bDvm0QN7ewugD6Hr5+cZwkG0rYKqvbpMCd4WlcxAEjWQPVD0t5F9ngMhuabmDfuM8c969TCWmpTRggGiqmTZb0jBP7BiRckk5ocwd2sne5hcdV7H1WjrI+Yb2ue1HIBZ0pDyNLAijj4b7KbgAkuoiEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaMci+6T; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaMci+6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777521340; x=1809057340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Znd9rEVLHFrcw8gv4dmAnLMQLspHnxDXOrZyDRs14Q=;
  b=MaMci+6TQYx4eHm9TbcFBN5Nn9KrINRhtKehKly2IwaR/fYR3WE6tSKZ
   KYkcTJunOeUlae1+bRlkFrMWInAwZuudg0wfRdYQWPj33cVqA+NsCFLjl
   fcYFIFW5csT/hx1oVTnTGYWtD4uRbIUn5suIhKLu/4XQ5vqXhAd9IeKhB
   C1AEQU8weO3KZmCnWNFcsr81aW7WPvGNBcCmoHD6GIELNdryKyK5X8c1V
   LowTYwxXnl2rKPGdRIXVds9umvUyx6b5lAhYT0WGFVsvHPkY45zm7JWVk
   8i3OazPgrMR5V9mIHLfcbmY9STr33Bnshpt3FJNVGXOg8CTV8AmC1h7Kn
   g==;
X-CSE-ConnectionGUID: nVGbY+JsS36gVW5tH9WRAw==
X-CSE-MsgGUID: E0aOWj1fStyT4GL0i8TuDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78451281"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78451281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:55:40 -0700
X-CSE-ConnectionGUID: 6sASKR4wTtOd5TVc+G3UGA==
X-CSE-MsgGUID: 4XlqIMmdRcW+v3uzbdBXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="258041693"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2026 20:55:37 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIUx-00000000BuK-0dkB;
	Thu, 30 Apr 2026 03:55:35 +0000
Date: Thu, 30 Apr 2026 11:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/riscv-cfi-vdso-alternative 2/4]
 arch/riscv/kernel/alternative.c:183:20: error: use of undeclared identifier
 'vdso_start'
Message-ID: <202604301147.qlAxtlut-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/riscv-cfi-vdso-alternative
head:   fa83dca7c15f5aefda0432bda4aa4a802766ca70
commit: 45f16afdf0331f9d95eac2a3d328f715fbe316bb [2/4] riscv: alternative: Replace ifdeffery around apply_vdso_alternatives() with IS_ENABLED()
config: riscv-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301147.qlAxtlut-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301147.qlAxtlut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301147.qlAxtlut-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/alternative.c:183:20: error: use of undeclared identifier 'vdso_start'
     183 |         hdr = (Elf_Ehdr *)vdso_start;
         |                           ^~~~~~~~~~
   1 error generated.


vim +/vdso_start +183 arch/riscv/kernel/alternative.c

d14ca1f8d30399 Heiko Stuebner 2022-05-11  175  
cabfd146b37146 Jisheng Zhang  2023-01-29  176  static void __init apply_vdso_alternatives(void)
cabfd146b37146 Jisheng Zhang  2023-01-29  177  {
cabfd146b37146 Jisheng Zhang  2023-01-29  178  	const Elf_Ehdr *hdr;
cabfd146b37146 Jisheng Zhang  2023-01-29  179  	const Elf_Shdr *shdr;
cabfd146b37146 Jisheng Zhang  2023-01-29  180  	const Elf_Shdr *alt;
cabfd146b37146 Jisheng Zhang  2023-01-29  181  	struct alt_entry *begin, *end;
cabfd146b37146 Jisheng Zhang  2023-01-29  182  
cabfd146b37146 Jisheng Zhang  2023-01-29 @183  	hdr = (Elf_Ehdr *)vdso_start;
cabfd146b37146 Jisheng Zhang  2023-01-29  184  	shdr = (void *)hdr + hdr->e_shoff;
cabfd146b37146 Jisheng Zhang  2023-01-29  185  	alt = find_section(hdr, shdr, ".alternative");
cabfd146b37146 Jisheng Zhang  2023-01-29  186  	if (!alt)
cabfd146b37146 Jisheng Zhang  2023-01-29  187  		return;
cabfd146b37146 Jisheng Zhang  2023-01-29  188  
cabfd146b37146 Jisheng Zhang  2023-01-29  189  	begin = (void *)hdr + alt->sh_offset,
cabfd146b37146 Jisheng Zhang  2023-01-29  190  	end = (void *)hdr + alt->sh_offset + alt->sh_size,
cabfd146b37146 Jisheng Zhang  2023-01-29  191  
cabfd146b37146 Jisheng Zhang  2023-01-29  192  	_apply_alternatives((struct alt_entry *)begin,
cabfd146b37146 Jisheng Zhang  2023-01-29  193  			    (struct alt_entry *)end,
cabfd146b37146 Jisheng Zhang  2023-01-29  194  			    RISCV_ALTERNATIVES_BOOT);
cabfd146b37146 Jisheng Zhang  2023-01-29  195  }
cabfd146b37146 Jisheng Zhang  2023-01-29  196  

:::::: The code at line 183 was first introduced by commit
:::::: cabfd146b371462ed480a968f98eb0c2c80e3c8a riscv: alternative: patch alternatives in the vDSO

:::::: TO: Jisheng Zhang <jszhang@kernel.org>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
