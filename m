Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03699428482;
	Thu,  7 May 2026 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167756; cv=none; b=jO6utQGjX/98rGAfQJKh3QggCqnacaBsSfFHotGdCMFqV9Up4o+BcYsWNa5JV8RW689FX5kkV+38S6wVznoQjxzlqmWbjPrDn5z3kyVVcxN+kKMZ5UzdOU6NNfB2oG6kz5Omz2XiZT41Toffv235x0Xho2s/r3z6MUxF2RJbkto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167756; c=relaxed/simple;
	bh=tiM0Ivnmtg97+dsWlj/uSn9Z9wxgcewimRXiAVjKEbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hesLIPEwxuI1UHQlPYxMnHMQ1WmcPSifI/4zZT4kDDULSpdvNHlE7H5H3iCww+5SydLV7FL8m+YeSGs7ycOJUtA1DNjBycvRFsOdWrTVtWYMR5XljpUPct6y9IGzORr3dXIBPW71VJFC7K+0G4lJkOy7ZCUrXXRKdgVZNMcQCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6MDXQ4O; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6MDXQ4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778167755; x=1809703755;
  h=date:from:to:cc:subject:message-id;
  bh=tiM0Ivnmtg97+dsWlj/uSn9Z9wxgcewimRXiAVjKEbk=;
  b=L6MDXQ4ORefe4/px8SlU87eFVeBsd+ZCoo6+h+mBDM4CpL1OunW4Q15n
   li1cdjaJdBGjrA5xYp1EGd9LOoWFYEdg+IqLProDfzBMD83owl/7dBoqG
   V8CGZI26jqSv32dINZt6nY/jNgAYyow68xalhkAI/SID/D5NVnSxTPLCA
   7o2lJ1jlkNQoQdZwgyJzTM2WSsZVwB88iFacmjOPk7S0nMrd4fpBeDqPd
   O9mWZy/T/GIcnT3sDVb7Zya1NRo+SZ4UYNF/Um9C0p2rMTsHhyyUAz6P/
   v+74ObRWqWVt07xuBMXZpjNz8zpIs3E38+RARzKSyuE6LeytEenB4B6HG
   w==;
X-CSE-ConnectionGUID: 7D1afWqET+ywY+0JyMCGdQ==
X-CSE-MsgGUID: ytULVQalQ2COP85r4K/QVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="66649592"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="66649592"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 08:29:14 -0700
X-CSE-ConnectionGUID: CjdDRL+aQ4mwNwPrdcV//Q==
X-CSE-MsgGUID: WtWJNzG4R4OLo6jKay4UbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="238292191"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2026 08:29:13 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL0f0-000000000Dd-4BbQ;
	Thu, 07 May 2026 15:29:10 +0000
Date: Thu, 07 May 2026 23:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Fred Treven <fred.treven@cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cirruslogic-drivers:v6.18-cs40l26 36/692]
 include/linux/mfd/cs40l26.h:38:10: fatal error:
 'linux/firmware/cirrus/cl_dsp.h' file not found
Message-ID: <202605072301.79xAQtDG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/CirrusLogic/linux-drivers v6.18-cs40l26
head:   215fc5a27de5a5083e55bfb43ce5e3de6df52c93
commit: affd439f8b33ecb889c674e08c4ab6a5e1ce37e2 [36/692] ASoC: cs40l26: Add CS40L26 Stub Codec Driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260507/202605072301.79xAQtDG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072301.79xAQtDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072301.79xAQtDG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs40l26.c:7:
>> include/linux/mfd/cs40l26.h:38:10: fatal error: 'linux/firmware/cirrus/cl_dsp.h' file not found
      38 | #include <linux/firmware/cirrus/cl_dsp.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +38 include/linux/mfd/cs40l26.h

351140f7d5d63ea Fred Treven 2020-05-28  37  
3cae9b2fa130a1e Fred Treven 2021-01-07 @38  #include <linux/firmware/cirrus/cl_dsp.h>
351140f7d5d63ea Fred Treven 2020-05-28  39  

:::::: The code at line 38 was first introduced by commit
:::::: 3cae9b2fa130a1eb3fc597c2b32e0edaeda6ca00 input: cs40l26: Change include location of CL DSP

:::::: TO: Fred Treven <fred.treven@cirrus.com>
:::::: CC: Fred Treven <ftreven@opensource.cirrus.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
