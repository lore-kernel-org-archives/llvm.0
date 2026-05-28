Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE9D1BC2A;
	Thu, 28 May 2026 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986423; cv=none; b=U0WKWLNr2ns9Ed+1whGchU7Aib2cKE8w/jG019owZmpPMBS5TKMfMi3tM+xe3W368jq/kwlmTVUNdOB6Wdry2Ed0k8uHJ004/88D2zJGtjF2JBneV5OUWTlUJmWO+0ASbdzLK3htajbDyGV7o1iSnm/IPL+/2zCjb6OpUFKbiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986423; c=relaxed/simple;
	bh=eI7l9gd/axgulgBOtSweIRBCnebGZj+NpWPPoBHHjtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZR4k/h6YNQyR+bAKsZWOS2kSl8G0GEF/aHKeFRudcLFN4vdzK62CVpZFNPGnWehanEoynq775K4Vk/52YArp8ZiD1DgrJOixZonR2oKDmscibmnsu7eqKzE8bwQRvzzgkRS1yhjundTn5bE55lovrPnGBxDf6lJJnJqYksQ8v8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZS/bmhgs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS/bmhgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779986421; x=1811522421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eI7l9gd/axgulgBOtSweIRBCnebGZj+NpWPPoBHHjtU=;
  b=ZS/bmhgshSPkMP9yl/f/Bjppt+A1DuDEc85sihsGM9JF5GPvoRq1+rS/
   ngL+IYd78EVRBajI+r+WViH1ShD8tglDNtU8fC0ZTJ2Qm+myTtLlBcKXg
   yvX9SmZ4YkIOO58t5IuEPxUQ98A4nOxsMwVK1zhExIOpLAHbHf0/35vcc
   wK42KKMyN++UYOfw795fTnHXn2FCxYy1YTF5MLymjjl268zxbdWHaTPGs
   wJ0F3DcdDAQka0HApHTSlWjxH08cxKlf9ty+kY251VO7ehUimcJBPO91a
   sdvpH4GkAOGU7HfruvlbWYrZnTGeEemSUW5w9M5GNEGqOHIVbOayPdH5s
   w==;
X-CSE-ConnectionGUID: B5ZnyxuAQ5WSw8lZvwqqNg==
X-CSE-MsgGUID: NbCON4IcTs2irsJRySbpbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80557684"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80557684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 09:40:21 -0700
X-CSE-ConnectionGUID: cfFxAHexThyRanndquCDSA==
X-CSE-MsgGUID: b2TfR2xvQJa4pArFJpn9sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="272929837"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2026 09:40:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSdmL-000000000Xt-11nv;
	Thu, 28 May 2026 16:40:17 +0000
Date: Thu, 28 May 2026 18:39:52 +0200
From: kernel test robot <lkp@intel.com>
To: Aichun Shi <shiaichun@open-hieco.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 11/11] EDAC/amd64: Harden Hygon Family 0x18 UMC
 SMN base against bad DFID
Message-ID: <202605281827.tz1LJoDS-lkp@intel.com>
References: <20260528035246.526012-12-shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528035246.526012-12-shiaichun@open-hieco.net>

Hi Aichun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ras/edac-for-next]
[also build test ERROR on next-20260527]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aichun-Shi/ras-amd-atl-Add-Hygon-DF1-Data-Fabric-system-information-helper/20260528-121009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20260528035246.526012-12-shiaichun%40open-hieco.net
patch subject: [RFC PATCH v2 11/11] EDAC/amd64: Harden Hygon Family 0x18 UMC SMN base against bad DFID
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260528/202605281827.tz1LJoDS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281827.tz1LJoDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281827.tz1LJoDS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ras/amd/fmpm.c:59:
>> drivers/ras/amd/atl/internal.h:22:10: fatal error: 'asm/hygon/node.h' file not found
      22 | #include <asm/hygon/node.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/ras/amd/atl/hygon/system.c:10:
>> drivers/ras/amd/atl/hygon/../internal.h:22:10: fatal error: 'asm/hygon/node.h' file not found
      22 | #include <asm/hygon/node.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +22 drivers/ras/amd/atl/internal.h

    19	
    20	#include <asm/amd/nb.h>
    21	#include <asm/amd/node.h>
  > 22	#include <asm/hygon/node.h>
    23	#include <linux/processor.h>
    24	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
