Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618227CB33;
	Thu,  6 Mar 2025 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741302912; cv=none; b=JTJKSmHgyJieChsKm65RDHN8uiQOHduZfT/iZDVWK3G8ro4/EtkWsD3g+1z3/Lw81N0I8vhM80Ifn51tyadqru6tn2LlHtffk+rLkcetEsIoNSr/uG+aFDnQsn96smUEdK1Qj7o4Bybr/hKi3odfaQpzb70cY9TwNv7UYSomU40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741302912; c=relaxed/simple;
	bh=JfZaXojfs9dSNcG7NnQC/uuZBxXIc+AcbB/aCKL9Mcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4wtyrL8w6BQahRFdNq4+hAcR42rk3Uy7ozF+eWJ29hutZ3ktGF+tZf17ZP4lXVhEANl46vZS4GhPVoDKJcsTZ/S/gDfVCQAl3rwwLyNJ6Cf+M7oWtPBZxhGPIth76tP81kQbhWlWqihBx+jKBTVY2gpM4qT4+VxUeVX06eyW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsZ/7LWb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsZ/7LWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741302909; x=1772838909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JfZaXojfs9dSNcG7NnQC/uuZBxXIc+AcbB/aCKL9Mcg=;
  b=SsZ/7LWb0V9VwqsLE0BSQfg5cIbDJ0YDf4o7cyEfYsIkKlyWbzqTnMWh
   xBeXMWUQ885JgAN5KNK7Su8Wexrpf8utTlk7smm9c1Osyg0KuGBtx5B06
   ChFCHCOoG8LHA5zra7Z+VVGBbFBjvL/sjif1XrvVfbbcmIQA0Q1J1/5JX
   jEUrm9oWJXlLoqblSIOwugwzkF5LPXyK5LxdLCJw2nT2haNb639MkM99A
   Lb74IUbDtunKYuXQxEd/Lwn8IR5cebzZMQfld8zC8JZKKD4+uabC+XWRu
   lxvU2YQ+W01m/TyqoNKmvyiHo0LSBMvRHOqsnKtW37+ty0vGIuVhcSHZ2
   w==;
X-CSE-ConnectionGUID: 99iUq79JRkaVgo/2BUnMIg==
X-CSE-MsgGUID: 3/ijp9fAQsKkCYdjR141Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46119891"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="46119891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 15:15:09 -0800
X-CSE-ConnectionGUID: p/JzQ1z4SiKa7wdn2qtVIQ==
X-CSE-MsgGUID: oAX/WrtGS6amVNl/waC1MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="149957349"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Mar 2025 15:15:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqKQj-000NkU-25;
	Thu, 06 Mar 2025 23:15:05 +0000
Date: Fri, 7 Mar 2025 07:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: arthur@arthurfabre.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 02/20] trait: XDP support
Message-ID: <202503070654.UlOISlL9-lkp@intel.com>
References: <20250305-afabre-traits-010-rfc2-v1-2-d0ecfb869797@cloudflare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-afabre-traits-010-rfc2-v1-2-d0ecfb869797@cloudflare.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 42ba8a49d085e0c2ad50fb9a8ec954c9762b6e01]

url:    https://github.com/intel-lab-lkp/linux/commits/arthur-arthurfabre-com/trait-limited-KV-store-for-packet-metadata/20250305-224338
base:   42ba8a49d085e0c2ad50fb9a8ec954c9762b6e01
patch link:    https://lore.kernel.org/r/20250305-afabre-traits-010-rfc2-v1-2-d0ecfb869797%40cloudflare.com
patch subject: [PATCH RFC bpf-next 02/20] trait: XDP support
config: arm-randconfig-004-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070654.UlOISlL9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070654.UlOISlL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070654.UlOISlL9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:19:
>> include/net/xdp.h:283:15: error: static assertion failed due to requirement 'sizeof(struct xdp_frame) == (40)': sizeof(struct xdp_frame) == _XDP_FRAME_SIZE
     283 | static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/net/xdp.h:283:40: note: expression evaluates to '32 == 40'
     283 | static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +283 include/net/xdp.h

   282	
 > 283	static_assert(sizeof(struct xdp_frame) == _XDP_FRAME_SIZE);
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
