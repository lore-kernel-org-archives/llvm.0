Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F663D9DB4;
	Wed, 10 Jun 2026 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087076; cv=none; b=QqvKmjQL2akP2d0zifUX3e1Au4DpfxoDSaTKKO5+f8UAS95uvT7ltl5Ewcc2UBpN+sAVOxzZfsaXdkDL3BBNbPEDS5Szs7ga2GAi2bka9KQpm3IHwNesFArdoeutF6Pwl0ky8967Xb0lyDsn+5RxIwGEOCwUlBAxnXgybLxX0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087076; c=relaxed/simple;
	bh=VPIJghQGO9fRx1dNGVr2U/4TQ1mVqFYwuo///L76Zy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rk3voFp1CmU0QK+TYMKEHQLcpzIvZ2EDSxP1ugozRiq/XWXd057EsvwnL1XUk4IjKe7E06eB57SOc0aMhs7MgIyw+ylXZp+6jrvpjfmMK6ZjZrzP8mOJjZeU567GyCKq4BOPXW7XvJFHMk73NjTcX03ix9DuQDpn964eoKjqtWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP2Dc2/K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP2Dc2/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781087074; x=1812623074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VPIJghQGO9fRx1dNGVr2U/4TQ1mVqFYwuo///L76Zy4=;
  b=QP2Dc2/KS+cux8RfPYjpNvFdN1Kf7UKjBRopr9rQxza0x89RSYzQfMjX
   Ie5JQtLMuZDhnlFfNgKNIdRm1Z4ykRTLxud3P+t2WZZxXnUVJnqMDcHTi
   vkGlx60FQTwS7HpM5LL+DqriXGUsr/xucbW2AvZ/GI1UmgRQW97s9/gui
   DPqDXmvSeUlsPxY0OXL7cMlILphKpixEXicBhsJmjzPrTBM0gfzG9YU7Z
   dFeCUJUTPhacXxuogjWTWl8uve4KL3HF+lmVdqrIfRyR1XiNAlT7SiDgr
   uf6aDV+kv2ei25Jq1uL6+XAvBaEhSSlPBYYG1a/8pyVRAoXEpbYnPQmpW
   w==;
X-CSE-ConnectionGUID: ebqduFYYTyq5uXArLVYv9g==
X-CSE-MsgGUID: ywaI/jdeRCqYGMpj9m3iqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92549603"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92549603"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:24:33 -0700
X-CSE-ConnectionGUID: 3Ez8/HUASkKJ39t9fqOP+A==
X-CSE-MsgGUID: Uss+nLKwSyak1Tvukt/jRQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2026 03:24:32 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXG6o-000000003fV-3J3n;
	Wed, 10 Jun 2026 10:24:30 +0000
Date: Wed, 10 Jun 2026 12:23:41 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Yeo <alexyeo362@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
Message-ID: <202606101201.Uas4V2ol-lkp@intel.com>
References: <20260610031756.546459-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610031756.546459-1-alexyeo362@gmail.com>

Hi Alex,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc7 next-20260609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Yeo/platform-x86-panasonic-laptop-add-fan-speed-mode-for-newer-models/20260610-112852
base:   linus/master
patch link:    https://lore.kernel.org/r/20260610031756.546459-1-alexyeo362%40gmail.com
patch subject: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed mode for newer models
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260610/202606101201.Uas4V2ol-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101201.Uas4V2ol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101201.Uas4V2ol-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/panasonic-laptop.c:518:2: error: use of undeclared identifier 'status'
     518 |         status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
         |         ^~~~~~
   drivers/platform/x86/panasonic-laptop.c:519:19: error: use of undeclared identifier 'status'; did you mean 'static'?
     519 |         if (ACPI_FAILURE(status))
         |                          ^~~~~~
   drivers/platform/x86/panasonic-laptop.c:521:2: error: use of undeclared identifier 'status'
     521 |         status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
         |         ^~~~~~
   drivers/platform/x86/panasonic-laptop.c:522:19: error: use of undeclared identifier 'status'; did you mean 'static'?
     522 |         if (ACPI_FAILURE(status))
         |                          ^~~~~~
   4 errors generated.


vim +/status +518 drivers/platform/x86/panasonic-laptop.c

   512	
   513	static acpi_status check_fan_mode_present(void)
   514	{
   515		acpi_handle handle;
   516	
   517		/* check if read (CEFM) and set (SEFM) are available */
 > 518		status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
   519		if (ACPI_FAILURE(status))
   520			return -ENOENT;
   521		status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
   522		if (ACPI_FAILURE(status))
   523			return -ENOENT;
   524	
   525		return 0;
   526	}
   527	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
