Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7486814A4C9;
	Fri, 23 Aug 2024 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404351; cv=none; b=emfNiGZ8/Tw5QGOVBSh39eMxLd0X4P/CGq780y/bD8PboMffTnLVlxWRk49EkoNwZexXQCSVl+NWJYBZazyRZ4/qx08sXZytev6PefyA3IcScFiVwbde87cCJCh2mqPcYcHoBrH6zw+hLWEncLA2S/5Nn0INwJAveE/3kFEBpKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404351; c=relaxed/simple;
	bh=rqMnk9GmhcNAVCG6epjotsW/7sJ7uzNa1wYYzCeaEDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpFH4mWs6tvI+IRPDHIwz/xTlNavUVDy5I+FQCa+5ytCawJBG6QMzb/9pLplgRYIV2HFYSyHBTxITj4CFT7TNJl70H+UZPiipwWSpv+oWfSNeiwQcozXzGlLnIhq51pkmwidqsnnzXXqBUH2+i6epGuYKiA/oY7k7a8oIm1xOxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Chyo0s6N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Chyo0s6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724404350; x=1755940350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rqMnk9GmhcNAVCG6epjotsW/7sJ7uzNa1wYYzCeaEDA=;
  b=Chyo0s6NZETakuINnijVkz7saTQRW+cF6tSypJ/6yJC2otGMt9XNXj90
   sdZgshl9RtVm3ZsHHIdU7wrEnfx5GuFnZNBEWjSpRlWk72hMnUfmfS1op
   nKRH0lHSwR3r2whjZneiPN0qfEaBzhXaOfKLigmBeo2j/norV8BBi3U9N
   BQ3WYblA3Rs15NS0sNVrfnlH9AJjURlzm550AorxkNRMZ1atpBicI/U1L
   eM51xNHoeYGe0eVCGffr42UAxe51fUaQpWGuqQW/bvDZ5OEjc3335+Vi2
   vCJEaF2K217EJcRb//lz+al2gE6z+8dm0Cew2WF1oHwD9YbM4yupGVhjW
   Q==;
X-CSE-ConnectionGUID: l6HYTIL0Tf6q9CHNIocQ1g==
X-CSE-MsgGUID: PdTRSHGqSWi9K7OMa1m+Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33429072"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="33429072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:12:23 -0700
X-CSE-ConnectionGUID: gDTeodghS52aSv0fjd6pbA==
X-CSE-MsgGUID: fuGU11nlTh+EQKPAWqMCfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="61756700"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Aug 2024 02:12:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shQLD-000Dbl-2n;
	Fri, 23 Aug 2024 09:12:19 +0000
Date: Fri, 23 Aug 2024 17:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yufan <chenyufan@vivo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] ceph: Convert to use jiffies macro
Message-ID: <202408231856.tX6WbWIH-lkp@intel.com>
References: <20240822063941.11635-1-chenyufan@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822063941.11635-1-chenyufan@vivo.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on ceph-client/testing]
[also build test ERROR on ceph-client/for-linus linus/master v6.11-rc4 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yufan/ceph-Convert-to-use-jiffies-macro/20240822-144157
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20240822063941.11635-1-chenyufan%40vivo.com
patch subject: [PATCH v1] ceph: Convert to use jiffies macro
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240823/202408231856.tX6WbWIH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231856.tX6WbWIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231856.tX6WbWIH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/caps.c:20:1: error: expected external declaration
      20 | +#include <linux/jiffies.h
         | ^
>> fs/ceph/caps.c:20:2: error: expected identifier or '('
      20 | +#include <linux/jiffies.h
         |  ^
>> fs/ceph/caps.c:1667:23: error: call to undeclared function '__get_oldest_flush_tid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1667 |                         oldest_flush_tid = __get_oldest_flush_tid(mdsc);
         |                                            ^
>> fs/ceph/caps.c:1878:12: error: static declaration of '__get_oldest_flush_tid' follows non-static declaration
    1878 | static u64 __get_oldest_flush_tid(struct ceph_mds_client *mdsc)
         |            ^
   fs/ceph/caps.c:1667:23: note: previous implicit declaration is here
    1667 |                         oldest_flush_tid = __get_oldest_flush_tid(mdsc);
         |                                            ^
   4 errors generated.


vim +20 fs/ceph/caps.c

    13	
    14	#include "super.h"
    15	#include "mds_client.h"
    16	#include "cache.h"
    17	#include "crypto.h"
    18	#include <linux/ceph/decode.h>
    19	#include <linux/ceph/messenger.h>
  > 20	+#include <linux/jiffies.h
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
