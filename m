Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA656FBF;
	Thu, 19 Feb 2026 00:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771459399; cv=none; b=j8o4JEfGZxszZKZeFvp0zIdV0MfRHvFsRm7GjuFjbnJ0StS+g9JaM2zoEkLcyq7t/bRbX9Eq4+zU1QaRIC/nyPD90zifHqZVyAqU30ru5oo2k0hTAVCgn63tVCfTHKkff198Atki7it2aslqwfUBrqWeZgmB7z8NH7oie4qRBSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771459399; c=relaxed/simple;
	bh=70C/ZyvTB8MiLKxeNWg3kMOgROmHS3OkM9Wulu5+rUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwqSAg+Q3XIUyWYGMia5tVpdPZwNTMr6j3igOgkku/FeYxZ76uzEYPrPdpwmT96wqBJSl+cZ8/kMapYoxUglad9SHswaA0kZNIrm6robgxdU+WNtL+pUPCK2ig65eQup8ituFu8eILWiTX/xZp0bgaK3/UamypnDERPDmjKedPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bi5dm9xk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi5dm9xk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771459398; x=1802995398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70C/ZyvTB8MiLKxeNWg3kMOgROmHS3OkM9Wulu5+rUE=;
  b=bi5dm9xkFTn1uKplH1Y3PcF1hjKn7b39x3THjiBOqku6Qz29oYhvNpGs
   IQIIo5YBQjtZoD3ux3fMncIDsFw1UkxNM13UvRkrrTQwxBE1Uw+S63SKn
   NGNkOsSJXtrutMCny3DxCvC1Z+Xk0AZ8MrErjzqa/FY351Af5OEpOqlLy
   oXSoDvhG/AMDymhqOmAzyo5NXF38HNC5DjmFgIGFY6UMVoq200j+8foad
   dyvxLQmex0erAB1EzFA1GYk71QohRBkT8hC23KI510y+KvTcgD3VdWHuC
   yfVNmZtU/KmI7a0gNPjQgNRMFAoYQvZIxXoGwH49wj05SLmuEHde1cS6r
   Q==;
X-CSE-ConnectionGUID: M3n2k9ErSGKxdFzHrY6O1w==
X-CSE-MsgGUID: 0a1DtV0hSJWo+naqtZMFEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76380311"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76380311"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:03:15 -0800
X-CSE-ConnectionGUID: 5HV5mDijRRmYvgnhnQSCnw==
X-CSE-MsgGUID: G1orgibKRqylRhtoJHLfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212648261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 16:03:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsrVf-000000012pA-1mUe;
	Thu, 19 Feb 2026 00:03:11 +0000
Date: Thu, 19 Feb 2026 08:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: redacherkaoui <redacherkaoui67@gmail.com>, x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/boot/compressed: Fix signedness of rdfs8()
Message-ID: <202602190815.lFBVk5IE-lkp@intel.com>
References: <20260218150008.28179-1-redacherkaoui67@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218150008.28179-1-redacherkaoui67@gmail.com>

Hi redacherkaoui,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.19 next-20260218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/redacherkaoui/x86-boot-compressed-Fix-signedness-of-rdfs8/20260218-230616
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260218150008.28179-1-redacherkaoui67%40gmail.com
patch subject: [PATCH] x86/boot/compressed: Fix signedness of rdfs8()
config: x86_64-randconfig-002-20260219 (https://download.01.org/0day-ci/archive/20260219/202602190815.lFBVk5IE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190815.lFBVk5IE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190815.lFBVk5IE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: get_cmd_line_ptr
   >>> referenced by ident_map_64.c
   >>>               arch/x86/boot/compressed/ident_map_64.o:(initialize_identity_maps)
   >>> referenced by kaslr.c
   >>>               arch/x86/boot/compressed/kaslr.o:(choose_random_location)
   >>> referenced by kaslr.c
   >>>               arch/x86/boot/compressed/kaslr.o:(choose_random_location)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
