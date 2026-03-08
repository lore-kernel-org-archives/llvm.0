Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F83368BD;
	Sun,  8 Mar 2026 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772959563; cv=none; b=DQrTBUN+h6yJGjZzYCE2qFjn1F3wXdX8/i6UA/EOyf+Dy3Fk0sMVJQsnEFUbVN71wyRbPwogII7yJSXa3oTLL/P0OHnWngKp2APEZjzNIirBw2xDNY2YhaVIxdcwS7zMbLDnCt7TOgYhGE3+1nHImVyvI3qYdfqUdl52m/O5kQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772959563; c=relaxed/simple;
	bh=xkwwbLdJFZwC6tNR5uIrYmrHxi4PViblHLy620fHkAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tti3YslLiij/yq1t7XjRo7FIOSKujZmHbMGIhZsN+kdixiRTp3GM98YS7DpfZyF92W/+puEe6sGWy4M+J/O5HGkQ3e5BWHR/Y3Nyr6j0eR7isE0eBb6U+6WNZbORBnK1sw0RFYLJGpfJFcRz5YwSkLMWuwtCu5H54NfhWMkdDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVUaOEnR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVUaOEnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772959561; x=1804495561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xkwwbLdJFZwC6tNR5uIrYmrHxi4PViblHLy620fHkAs=;
  b=bVUaOEnRby7iUXwTo+wnaGI0Q76pUQkAqN4s1ds8CF9LBeMeXS9GLxWv
   iyRcsBWmiTLkAXu+SNKTc9mXvTrW8mEOTr0cjJz2GYbUVZ1Pj+j9642jp
   tUZmfcdSrREpdA0wYeuKOSLkABUDZDjWa+4j3Z6JuphddgLMB5OhHSIKb
   L5C44ZP3iA8t/Ff/6z01b7UaXdCnkMJlwbkENGa2i2yH3x7QZi57TZyLE
   LqKTGZKtuFXpD9uHni9QHJxEezApk8JJ3TVh6RhfilDlvyCQFhP9UfFou
   5wkPgwX3IDcNC1AZoR0YUXPpXrGQIfyJCYlh0COsZqKjqeI6R6RfZURfV
   w==;
X-CSE-ConnectionGUID: LQ7lYePESTKmFiFeWAPqFQ==
X-CSE-MsgGUID: XOHowlXOSkawNESjnCuUMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="85363360"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="85363360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 00:46:00 -0800
X-CSE-ConnectionGUID: zSHwNokTSVqisG/IuH7AHw==
X-CSE-MsgGUID: z34IerAsRemhAfEE4eHbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="217559622"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 00:45:59 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz9lt-000000002zd-03Qg;
	Sun, 08 Mar 2026 08:45:57 +0000
Date: Sun, 8 Mar 2026 16:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] drm/ttm: Add EFI variable support for page limit
 configuration
Message-ID: <202603081613.mnqhlhsZ-lkp@intel.com>
References: <20260306055439.1822879-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306055439.1822879-2-mario.limonciello@amd.com>

Hi Mario,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-ttm-Add-EFI-variable-support-for-page-limit-configuration/20260306-135655
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260306055439.1822879-2-mario.limonciello%40amd.com
patch subject: [RFC PATCH 1/2] drm/ttm: Add EFI variable support for page limit configuration
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603081613.mnqhlhsZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081613.mnqhlhsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081613.mnqhlhsZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module ttm uses symbol efivar_lock from namespace EFIVAR, but does not import it.
>> WARNING: modpost: module ttm uses symbol efivar_get_variable from namespace EFIVAR, but does not import it.
>> WARNING: modpost: module ttm uses symbol efivar_unlock from namespace EFIVAR, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
