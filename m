Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B246B4F55AC;
	Tue, 22 Sep 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077369; cv=none; b=k8GdhAuxiLb7b3dGaWwSlV9XipqNPJkXy+TmMtmNYyT2JVmk/GqPOz/B/mpE6I4xnRbrpsUvd++3SZfkH1zEwHxznKcCvqADyNLI72lA0XHFc58qMnlm41Bw3XMwPMHjje/mS46hDmWJw2PGKJKUUhcUGw8mU5NpFZ88fkIvjnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077369; c=relaxed/simple;
	bh=S0++69ePo7g/MmsErIJ/Rb3kuTNAbdMFQ4A4zEseqPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GppDW9t6G25pN/+yOpuqsquNZ6b70cyvOA9gF1k7gqRMTtXnFn9ZtUoq1Vl957LYEzDwXTTYVQQ9dhBKpsqh+qMqdCPq7De3qe7dmM+c+feEe0eweI68Gz+xC6nQfvQJcBUj/u25ae2TxSAPx7RHHywT3Xh7OjI248D4qix6Iy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/c040ZC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/c040ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790077366; x=1821613366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S0++69ePo7g/MmsErIJ/Rb3kuTNAbdMFQ4A4zEseqPY=;
  b=H/c040ZCEbTdlhERrFHsbXFxOSXUfeiCCbfMFMRqtRxmZkVulNoNwYZv
   54n7DesxC55LjIAi/Y+KvCINsu+aIiwI15T2oRQvklU8xC7HTosRktjQg
   2Rie9Dj3ACZbKJ8141LyHiAVGTWMDhCrrVRFox3g0YKLNTlfMYJJ0nE8m
   3b4ixfcT0Yh3DKsV2GddFimIBN0/xR5Utc9i0YBo+R4hdIYQIoi2Bk1my
   DM2mp5BrVbXvOmoLZ9hAWUPF9XxyWeFviRA/ZZ8vUibVx7szfITnQw4ej
   XFMNe//xDq7CAhamFPNdnG3JIwKXnEN10LrJxAvy30mTgAb2i5r2Fgr8I
   w==;
X-CSE-ConnectionGUID: W686txEvTn+uQwLTS8tj2g==
X-CSE-MsgGUID: /rbwd/QxTderKXMmv5Zylw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90693781"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90693781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:42:46 -0700
X-CSE-ConnectionGUID: HdBW68K3TISlc0uels9N3g==
X-CSE-MsgGUID: tkw5HldkRAuFuwD+hqUfxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="271655138"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2026 04:42:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8ytV-00000000FR4-3MmQ;
	Tue, 22 Sep 2026 11:42:41 +0000
Date: Tue, 22 Sep 2026 19:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kstrtox: delete saturation in case of overflow
Message-ID: <202609221929.OSikd7q0-lkp@intel.com>
References: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.3-rc4 next-20260921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Dobriyan/kstrtox-delete-saturation-in-case-of-overflow/20260917-191707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/a396f2ea-8de8-4eca-a216-ff69bc40fe85%40p183
patch subject: [PATCH] kstrtox: delete saturation in case of overflow
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260922/202609221929.OSikd7q0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dc57157f12f0ff676e823d9b4d98b45c07e5df2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221929.OSikd7q0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221929.OSikd7q0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: _parse_integer_fixup_radix
   >>> referenced by cmdline.c
   >>>               arch/s390/boot/cmdline.o:(memparse)
--
>> ld.lld: error: undefined symbol: _parse_integer_limit
   >>> referenced by cmdline.c
   >>>               arch/s390/boot/cmdline.o:(memparse)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
