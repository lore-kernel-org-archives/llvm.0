Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB48F266B72;
	Fri,  2 May 2025 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169042; cv=none; b=S1eHCzPiMpuEIQxiSmDhWcJsxFmXzaH69z2PXKqwcQwSw6UOIpAba7q8JZmPByUKin7AJEWRqMcyPrdU+efDKCBuOGHc7gfGHw7NDuGuy/feO7q/pGxHdmfqclrWCQUCkZ6b8FJ3QLEmWlzeQDa5qY1OTjs3ibg0pE4dB6uFexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169042; c=relaxed/simple;
	bh=PC/SkbQ3dEFx2r3i8iXi2iBiLScHRC0ulOjTIrsQSig=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hd9WIw9F4S8WnAsA7T8WjpXEzwVrBiP5WjAMX+jFUuY2RHyEA4hBQMPh02DiUipBHusZ/1AK4n/r4Bioce6/AV8MKWIdmORDPCs5eED2KnollsZFFpdAJe6E06F7IaIMI07dFaOEGZT5mx+6uKhwUKJe06huwdK8FEcO63oIGSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2paXCik; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2paXCik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746169040; x=1777705040;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PC/SkbQ3dEFx2r3i8iXi2iBiLScHRC0ulOjTIrsQSig=;
  b=B2paXCikQ+Ocx//aIPUdtFfBQdsb22uJ+eEbiuNwreNiyIBrzZ/7kR7D
   jF6UbGldwYYCdjd/NC/Ih1WQro6yYV+Q36A0uDoInrhKqZ3Hn1RMYxYgd
   MzaS0OKAXJAx/rvmeYxKyOBFsqgg1jJ7sBZpNdnpUqlUaF33ScVOuHtsc
   gJjjJ75vYG4yuN72XguwJIw/EJmlQIjxBkDL5c9YEEXuiLwQsXqgEgvWH
   9zlt8Q59aScT95dV5c5vsTDxXtwnpt58paH3SOSp9mdUU4NKgSrTUGB1c
   5EeMXJnhBXvsjpUqWqdQclbM7WSaOv662Qm3lM4qibMHdkDlMuhWxG+lq
   g==;
X-CSE-ConnectionGUID: TSpZJvtwTvG+KgKAT1yd6g==
X-CSE-MsgGUID: pxqatJ7VSL6R0HM8cyBPZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="65379535"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="65379535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 23:57:19 -0700
X-CSE-ConnectionGUID: H3ajTV8KQ1GZrBrpI31nzA==
X-CSE-MsgGUID: iCdGPl4ERaub7nMTOOwb9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139722926"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2025 23:57:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAkKh-0004an-2y;
	Fri, 02 May 2025 06:57:15 +0000
Date: Fri, 2 May 2025 14:57:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] randstruct: Force full rebuild when seed changes
Message-ID: <202505021409.yC9C70lH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20250501194826.2947101-2-kees@kernel.org>
References: <20250501194826.2947101-2-kees@kernel.org>
TO: Kees Cook <kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on masahiroy-kbuild/for-next masahiroy-kbuild/fixes kees/for-next/pstore linus/master v6.15-rc4 next-20250501]
[cannot apply to kees/for-next/kspp]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/gcc-plugins-Force-full-rebuild-when-plugins-change/20250502-035038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250501194826.2947101-2-kees%40kernel.org
patch subject: [PATCH 2/3] randstruct: Force full rebuild when seed changes
config: arm64-randconfig-001-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021409.yC9C70lH-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021409.yC9C70lH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021409.yC9C70lH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: cannot specify -o when generating multiple output files
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgettimeofday.o] Error 1 shuffle=1172004315
>> clang: error: cannot specify -o when generating multiple output files
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgetrandom.o] Error 1 shuffle=1172004315
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:224: vdso_prepare] Error 2 shuffle=1172004315
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1172004315
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1172004315
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
