Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6C1BB69B;
	Fri, 30 Aug 2024 18:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725041608; cv=none; b=jxCaEOUPB5c6GLWqnF6svwRiLHlhCz8lgZmiI6g4hunNzOOx90bqz4tAJrSOrU3qHQEDCJR1x/9G11NWLHUIq5L87MTZUJSPtixstksCoLHIh9haW4tUprIXqKe8dpER3KQ/KsNdWH4WP+780u1AD44sJsDQd8UNw2hox1Vxjrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725041608; c=relaxed/simple;
	bh=1PoT89t/XdmjPTM+XIFdIhJ/W39LbpxLukgemNmf3iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lI1eAffGdaj0wsiIMJ0xdxunlIaIxUZeYP3oUEXfQhZ3dcGrzjoDLYkkrV1bWnqdXe53KvSx85UoNSSqZ5IA8DXDkQCTgiBh+Sb0IK/w6tiGO7i/wrO8HcDwYmlJit2gfbXor7Bi8qoY7TS2wL8J9JHet7ckS6W93nYPxHllFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3gvs65/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3gvs65/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725041607; x=1756577607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1PoT89t/XdmjPTM+XIFdIhJ/W39LbpxLukgemNmf3iQ=;
  b=Z3gvs65/i4PDccWhBfPRVBc+WfgdD76qPmWLRcBpO/BK2LHinWJidxbk
   slTYZwa+tNRYstzTQgqac+cTli/B61brtP9vrND/BJwGypNQcwHffsrDD
   KxFnNsmAFqtSI6gzaQVsbJXrIUKIj2W6XCscVgCu0JSvh8+JiFre9Ncsz
   auBgwuWWEQDm8kOkIRw+64yEZK7upPq197muaL0Ee9ylYe6Pd8+7oYOjj
   Guhxlc6EfW8GXIARFchVWcR8heAfJcUbNubsWK/DU7yyCZxt1ESEgP4CT
   y73p5oHzpdG/MpGcckWYm95bnz1UP4g4xcHHKajM5tETWBPFj2UBWKoww
   w==;
X-CSE-ConnectionGUID: ZLzAyvS3Rzm9LZSMTrg52Q==
X-CSE-MsgGUID: 96cDTwI7SrWz4v6uz6JKIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23831590"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23831590"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:13:26 -0700
X-CSE-ConnectionGUID: /pUVxff5TmGq91P597DCeQ==
X-CSE-MsgGUID: xziq/ljaRCGoJLNKBqfe8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63979374"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Aug 2024 11:13:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk67e-0001nh-2R;
	Fri, 30 Aug 2024 18:13:22 +0000
Date: Sat, 31 Aug 2024 02:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 1/4] firmware: ti_sci: Add support for querying the
 firmware caps
Message-ID: <202408310239.suIrfaIB-lkp@intel.com>
References: <20240829201606.1407773-2-msp@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829201606.1407773-2-msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/firmware-ti_sci-Add-support-for-querying-the-firmware-caps/20240830-041726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20240829201606.1407773-2-msp%40baylibre.com
patch subject: [PATCH v11 1/4] firmware: ti_sci: Add support for querying the firmware caps
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240831/202408310239.suIrfaIB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310239.suIrfaIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310239.suIrfaIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/ti_sci.c:10:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
   #define pr_fmt(fmt) "%s: " fmt, __func__
           ^
   include/linux/printk.h:355:9: note: previous definition is here
   #define pr_fmt(fmt) fmt
           ^
   1 warning generated.


vim +/pr_fmt +10 drivers/firmware/ti_sci.c

aa276781a64a5f Nishanth Menon 2016-10-18 @10  #define pr_fmt(fmt) "%s: " fmt, __func__
aa276781a64a5f Nishanth Menon 2016-10-18  11  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
