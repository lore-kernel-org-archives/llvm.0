Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D31BD9C6;
	Mon, 23 Dec 2024 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734971660; cv=none; b=g5Z3SaZuu7Iqwc2/ACB1RM3ERjJlZPjRG3e+T3FynyGonLCLGPX5orEAdX7GYpK8+/3sXh6eylPAvs7i1k4F9qnw/aODrYogpDTc3rKvNaAI77HH3rJZYfBOU9F2vC+Jkl5a/kRkjeEsp5h3JaiewOXiP0onTsd8/DPFijGgaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734971660; c=relaxed/simple;
	bh=lLHUtomYo0uJ2lWl63orMc7OIV1mem3W2iJoTi1vV48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyh/MBaTjRNXYS5ulvVXug1loe/eJwsTDnqaq1uam/7nyNg/z4Tibj89ZQs/DFyMUqx+B6IJotELccjs1SItCtnZfbNOZLaSNabXNU5Z9oyovaPDmjE0zL7bxCVVoA4lGorn00Yio2V8IQfsY9L+RKcoA4ICzNTwHTOPX+rOAIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQRm/EnY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQRm/EnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734971659; x=1766507659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lLHUtomYo0uJ2lWl63orMc7OIV1mem3W2iJoTi1vV48=;
  b=GQRm/EnYlfQX/NvQVIKFPlSVLH8HHGZzlBmANDd2Q4TBxz80N4WVtH9f
   HG1U74Nqag/sl9v3d7B6ILItpfz/qUM1+L9vRijj6U3jn7tno9JkGtGT8
   UuqYPEzwH7EGbEGP+M4L1Hgi0R0Zrj3qkBoZZGXQ/kbKP4pHw28ElkFtH
   OpxEGW7cIk6CdxgRacmlNfcUv3YcdB431KVgtCu+9eh1WptyWz7JfsA4f
   S01atlEi3ahposIWLXFD+l5CTUwnHMucgoybP53SO7LEGsAqhuvYvX144
   MPTGLIm5S+yE+2haiS0pt7U4ILrUXkoPiRG8hFk6qLYRPBJx55ubA5kDk
   w==;
X-CSE-ConnectionGUID: 8vwZi5kMRVKoO2qoX3HIUw==
X-CSE-MsgGUID: Yfn7V9Q0Rr2vWpwYRWyWYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39380470"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="39380470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 08:34:07 -0800
X-CSE-ConnectionGUID: XdRGSdj9Rbq4Wx7Zhu/XFA==
X-CSE-MsgGUID: qBvnqr35TMuOJNi26sfluA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104239275"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Dec 2024 08:34:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPlNW-0000TX-31;
	Mon, 23 Dec 2024 16:33:58 +0000
Date: Tue, 24 Dec 2024 00:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Nelson Chu <nelson@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
Message-ID: <202412240044.wVXW8Eg1-lkp@intel.com>
References: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/kbuild-Check-version-of-objdump/20241217-071632
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b%40rivosinc.com
patch subject: [PATCH 1/2] kbuild: Check version of objdump
config: x86_64-randconfig-003-20241223 (attached as .config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240044.wVXW8Eg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240044.wVXW8Eg1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** objdump is too old.
   ***   Your llvm-objdump version:    
   ***   Minimum llvm-objdump version: 13.0.1
   ***
>> scripts/Kconfig.include:63: Sorry, this objdump is not supported.
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1 shuffle=1831414175
   make[2]: *** [Makefile:733: oldconfig] Error 2 shuffle=1831414175
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make: Target 'oldconfig' not remade because of errors.
--
   ***
   *** objdump is too old.
   ***   Your llvm-objdump version:    
   ***   Minimum llvm-objdump version: 13.0.1
   ***
>> scripts/Kconfig.include:63: Sorry, this objdump is not supported.
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1 shuffle=1831414175
   make[2]: *** [Makefile:733: olddefconfig] Error 2 shuffle=1831414175
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1831414175
   make: Target 'olddefconfig' not remade because of errors.


vim +63 scripts/Kconfig.include

    60	
    61	# Get the objdump name, version, and error out if it is not supported.
    62	objdump-info := $(shell,$(srctree)/scripts/objdump-version.sh $(OBJDUMP))
  > 63	$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this objdump is not supported.)
    64	objdump-name := $(shell,set -- $(objdump-info) && echo $1)
    65	objdump-version := $(shell,set -- $(objdump-info) && echo $2)
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
