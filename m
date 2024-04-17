Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B842AA3;
	Wed, 17 Apr 2024 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713327627; cv=none; b=GeBd6Cp3L9E/aRnCGVGhd167MebWzbpjpAPcv46uLR169sWXJEPnVnHG2KXKmtRci+EdKZrsZhdGodIobV7NxICioL3sJYIB/4oKBV+btfyGqxrsKoebMP/9GqQVVSvgFviC4ffad0oxy+qs1dzJoE8NlnGgSwJcAHAP0CvfM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713327627; c=relaxed/simple;
	bh=eP9CiB0rVmK0Jtt5Y4CBVHAELD9KxtAHPblOt+Tr8S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWuXgxlh4rJ8Gsw7455W3wkpmjdDLwctMtkteKB3DZJWAqT3yjL1Mkdr3ONSUOtxIPoYWTMI/AfIxQ1hJBhehJQGOnfF1Sk5VVO1+hYUsN3m29vHC/MfoHHfJCNaTGAcuS7YnS1ens+GCcmxv1kFynTLLRZqFuTGsnHfZ0jH4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GW74/1SU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GW74/1SU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713327626; x=1744863626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eP9CiB0rVmK0Jtt5Y4CBVHAELD9KxtAHPblOt+Tr8S8=;
  b=GW74/1SUWphaWpUwtKuvQfmVb+lXQeXfC8+H9J37FiNaB7gLAlT7cpEY
   u8Xr3RfRpPzeI49oi825ZyQ8jKId3d0AIZVTOInpGgpp/qjuu8TMjCHXn
   zqVsKkixp2b9PbA18NMipVqc7McKlTQNAQlFfvauOa6QOpW/37sRNvlLg
   KFDFl2O+O0Bx/bBXwY8HL+dyO8Q3cZh3u+YEhakkUkDLpzJd+AQh1cMqQ
   l0ATDk9eGdUgTDmM2D2+Xx61vJPMAEhZwILp9SWY99iI+uPht3U2lD6CF
   86wGyZQpiMJqujZiJ5kByt7AZegEZWs6s49TgD2dop/JVEXJVLJYwL2My
   w==;
X-CSE-ConnectionGUID: r0lATCRQRxaeCXNdJ12UbQ==
X-CSE-MsgGUID: kCV1eowvQtimGiW7H0asTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8727248"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8727248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 21:20:23 -0700
X-CSE-ConnectionGUID: yy0uzlT5T06h2v68mKmbig==
X-CSE-MsgGUID: 76kdptNeS0ilm+ZYkDwsFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="59912377"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Apr 2024 21:20:22 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwwmS-00067e-0O;
	Wed, 17 Apr 2024 04:20:20 +0000
Date: Wed, 17 Apr 2024 12:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 4/4] kbuild: use $(src) instead of $(srctree)/$(src) for
 source directory
Message-ID: <202404171200.q4osYsl7-lkp@intel.com>
References: <20240416121838.95427-5-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416121838.95427-5-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[cannot apply to masahiroy-kbuild/fixes wireless-next/main wireless/main linus/master v6.9-rc4 next-20240416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/arch-use-obj-instead-of-src-for-preprocessed-linker-scripts/20240416-202308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20240416121838.95427-5-masahiroy%40kernel.org
patch subject: [PATCH 4/4] kbuild: use $(src) instead of $(srctree)/$(src) for source directory
config: arm64-randconfig-004-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171200.q4osYsl7-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171200.q4osYsl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171200.q4osYsl7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: couldn't read rust/doctests_kernel_generated.rs: No such file or directory (os error 2)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
