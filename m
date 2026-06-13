Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919F92D3ED1;
	Sat, 13 Jun 2026 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781345304; cv=none; b=M8cilun7hVLRlJvZu7Tdzm5k0CN3BkDjt2tmZBog5LOGcLdxga8EQti3KNgbY6ThqczsiXaiOIM3cox1JBu3QeFqUxqygvMabUxAAOdL5VIttbr2VYoHna8jOAJot7eGc6xc7H09108YYuShTA6C7VZ/Y51oFm+q6oa4rt2v3u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781345304; c=relaxed/simple;
	bh=MC2UxVCtPLExQClsMgMVgXsbm6he1D2Z63RHcDeUwNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6WHx0AWcHFALPuTgxyBiIYxo7MD5YtTMbCvzrXumA4182O/kgyRrxtl3UJx+SOhVQvZRx4opRlzMdnhCR6+mvwif3tRCKP742kMgESn50u//N+itVX/J9agoj+Wls4XsI7GWhDEnkPO67LcRt0xxSc9JwQqELApm2CLbLIfBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzZ8H+yI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzZ8H+yI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781345302; x=1812881302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MC2UxVCtPLExQClsMgMVgXsbm6he1D2Z63RHcDeUwNw=;
  b=TzZ8H+yIuiZpid07/l0J+YBMaEfW8Wi+I0i99+mpQrtmSoZfnDvWemv/
   B3W9XdD032DgkgXXjlPNcrnYw5Qxu0FEcWJY6SH/d1IGd9VBPsAf9DbnF
   zF3uX2p0qBdGCPBPWpi9f4aDMZ2gzHYwmuslBkHN1OBXFCMswU50tW4bi
   BFIPySui1vLOPO2YHSovlw2piqO/ycbXxsJwx1A1xM8L0QSCb+SD5outn
   V74fc1BSPctJwW/hVerBR28TflwNCnZZDyiuDo5QNPcbWKvfp8xFLvRPd
   MAULlbxlVVL8v1UCWWwjlL4IGwpjxXvq0k1KhI02ClbFecVRCKPod81Tz
   w==;
X-CSE-ConnectionGUID: ZtR4SXXgQy6t+/T/ra26CQ==
X-CSE-MsgGUID: k+CIm0LCTSmKfmck9eRTNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93655031"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="93655031"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 03:08:21 -0700
X-CSE-ConnectionGUID: FORh8yDISe6BtwRCwDDXiQ==
X-CSE-MsgGUID: Co+XuQe+QTCSFu/Hi9Leqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="252133718"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2026 03:08:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYLHk-000000004TN-3y3G;
	Sat, 13 Jun 2026 10:08:16 +0000
Date: Sat, 13 Jun 2026 12:07:53 +0200
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/3] selftests/seccomp: cover non-cooperative
 pinned-memfd install
Message-ID: <202606131238.sI0qu5os-lkp@intel.com>
References: <20260613001533.314739-4-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613001533.314739-4-xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 28608283615e5e7e92ea79c8ea13507f4b5e0cbe]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/mm-add-__do_mmap-and-vm_mmap_seal_remote/20260613-081932
base:   28608283615e5e7e92ea79c8ea13507f4b5e0cbe
patch link:    https://lore.kernel.org/r/20260613001533.314739-4-xiyou.wangcong%40gmail.com
patch subject: [RFC PATCH v3 3/3] selftests/seccomp: cover non-cooperative pinned-memfd install
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260613/202606131238.sI0qu5os-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131238.sI0qu5os-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131238.sI0qu5os-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/vma.c:2832 function parameter 'mm' not described in 'mmap_region'
>> Warning: mm/vma.c:2832 function parameter 'mm' not described in 'mmap_region'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
