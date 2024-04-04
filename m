Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4B320E;
	Thu,  4 Apr 2024 01:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712194103; cv=none; b=EcxiKe+meA/XyyTLMUxSHaUb/PZNIZ6XzIR0cqEBuKCdA2ZUfvxnIwCxT6DPSVmlwijXL53479ePR9timIR2i/xdBZTzapbtm/aurnPq7RtSkNLoFo9myTUU6CrbT6Y6bqIFsPq84q/RUpNS6ThrVGraAA/TScKyL/7mM8edS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712194103; c=relaxed/simple;
	bh=flsyHisBau6nSC0BLz/LjYmR9eQM6rA0NVZ/AzibTIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6rJTiqkq7XXf1IgnVkTSX9XkB/zvjVmP8T7xvnmPuZg8x2NYL5DtyfJDVu4/IR/ST3rRzp+iuOgHt5DCLANCrcMbCXjFn9lC5LaBxjdUMU0XvhBgCSx0gst79yEiso8dMVNqwLAfeVSH2VNTupjtH1sduPqXhC4oNlycuRU9/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFF5cjg+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFF5cjg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712194102; x=1743730102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=flsyHisBau6nSC0BLz/LjYmR9eQM6rA0NVZ/AzibTIA=;
  b=GFF5cjg+3p6sqaTrYuPr7E+H7E7FEQo5EkEN+MSxZLlDyxCpnphGahrC
   XWdIJ58s4xiIwbiE18fvr2UCJppn9J11hltRp9kNZmWT/7p6E+Fr64DEG
   rbbJBABW7Xovlq0FEb7YWYdqbzoRErcHnZ02Ek3pnOyrwPeobDzuqpHLf
   GfoOnt69z17bPDvLPxBf/UmeYwfXvFHlJzRWknD1pbE/POSSAKi4yQTJG
   PXsI7GEKwaPnuDsyJcnDMP5QvuL+ZdfJPsSjszqCPTCH0TNbp+V0OuOo4
   +0C3IsA8MFI2/iIBhWPIuGJkS5e8CXXBb6AGOG0nkyjYG4Pnx9sGFbi/m
   w==;
X-CSE-ConnectionGUID: Zf5kjeKyRXyKAsJ5eFnC1Q==
X-CSE-MsgGUID: nCddQcPrTEG7uxocSfG5Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7695317"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7695317"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 18:28:21 -0700
X-CSE-ConnectionGUID: 9CW0lQNzRcqoKm6XMnI+ng==
X-CSE-MsgGUID: IS6lswY6R4GBhkj1uFk09Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23320452"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Apr 2024 18:28:19 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsBtp-0000Qs-1d;
	Thu, 04 Apr 2024 01:28:17 +0000
Date: Thu, 4 Apr 2024 09:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next 1/4] bpf: add special internal-only MOV
 instruction to resolve per-CPU addrs
Message-ID: <202404040951.d4CUx5S6-lkp@intel.com>
References: <20240402021307.1012571-2-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402021307.1012571-2-andrii@kernel.org>

Hi Andrii,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-add-special-internal-only-MOV-instruction-to-resolve-per-CPU-addrs/20240402-101450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240402021307.1012571-2-andrii%40kernel.org
patch subject: [PATCH v2 bpf-next 1/4] bpf: add special internal-only MOV instruction to resolve per-CPU addrs
config: x86_64-randconfig-001-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040951.d4CUx5S6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040951.d4CUx5S6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040951.d4CUx5S6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: this_cpu_off
   >>> referenced by bpf_jit_comp.c:31 (arch/x86/net/bpf_jit_comp.c:31)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
