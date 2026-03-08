Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC636C0AE;
	Sun,  8 Mar 2026 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772966587; cv=none; b=WurvnkGE2WImf9R/NHXXC0SghhIbTLdf0oBqrCoh1vLfXldteNJ4v+WNs4OF0P2xpK/BWV4Q2aO5f6BoSgAnkd0fIBeh9vlHeDFw4SEMT7eZnJQSkvM8xoL9zngvFRiv1kszQEb4beznfq7fOu0yCBzZPr2W82E5ARXsvh/z210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772966587; c=relaxed/simple;
	bh=ZLn1J3pPOZjzXPfM4/Ly2rEcvg8ZHbBeXi5+Yt1f9Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhR+SxOVbnKh1pnaHUXhilLHziO2v79NZSl7gYWsk0kga0DDKndTMSYkB+uZZ9n8zx6GYwn/XaLId2sy0hzZpGL6SU4YrJUsP18DYaSbHpmET5yh9Q9uUirpz1p1ycyiCibtH+15WmeE2c8UI6kq1DeWVW7hign3VIvBDahTAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6n0bXuR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6n0bXuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772966584; x=1804502584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZLn1J3pPOZjzXPfM4/Ly2rEcvg8ZHbBeXi5+Yt1f9Wk=;
  b=k6n0bXuRZXrr+vfJ2mmUO9udUPWaOqGno9JcWPSAyEOavTNwuKAQz6S4
   QY0/h01JrHQt9DhTIi+Eu9lPY+dDwDr3GG0xKeVMdNDtY1yhb0W9KVf42
   bPxC2ofaMt3LHO6i7WH1LVME0RwxkqbELI9Q/MAHhgu33kZMwWe7+i6QT
   Zuz0FArI36KHXJvvLbvyalGqweU2rbDN9ruWmBCdBdGDrr1oX9H+qBNM3
   0cXztU9+dn9f6CKgYEwiNw3wzLc1WtGDfJsayDgyIi2pTUB3TtO5zkV3z
   WxI6kTpd0hsAwMKIguB44P+J21SsXTnfU/Frhne6nsGN03kVKCKScnBLs
   A==;
X-CSE-ConnectionGUID: /DI5xqgTS6qxzz+Om9Xt0Q==
X-CSE-MsgGUID: u3VVviKwSoynfb42xcPZtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="99483052"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="99483052"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 03:43:03 -0700
X-CSE-ConnectionGUID: IwQ0R9fNT2S9zSofpwEANA==
X-CSE-MsgGUID: kujBofz8Qjy+MTzt6WXWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="224166576"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2026 03:43:02 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzBb9-0000000032P-3xyA;
	Sun, 08 Mar 2026 10:42:59 +0000
Date: Sun, 8 Mar 2026 18:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] drm/ttm: Add EFI variable support for page limit
 configuration
Message-ID: <202603081810.gDFhD5td-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-ttm-Add-EFI-variable-support-for-page-limit-configuration/20260306-135655
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260306055439.1822879-2-mario.limonciello%40amd.com
patch subject: [RFC PATCH 1/2] drm/ttm: Add EFI variable support for page limit configuration
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260308/202603081810.gDFhD5td-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081810.gDFhD5td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081810.gDFhD5td-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module ttm uses symbol efivar_lock from namespace EFIVAR, but does not import it.
>> ERROR: modpost: module ttm uses symbol efivar_get_variable from namespace EFIVAR, but does not import it.
>> ERROR: modpost: module ttm uses symbol efivar_unlock from namespace EFIVAR, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
