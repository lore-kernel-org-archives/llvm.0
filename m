Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982723;
	b=VmwU67A2JynuA0HxT//C5wH1LELu5Bg2n5PxoArfRQfaFVrgWuwrYoRu9sjKChlDbY8f
	 8ezHhEFw5KeLKsOJqyvC1jzC8KjSODILEGERWQUE2LeW56i2KShGK/4EXgh9zJ6La6dkY
	 gEPmsLsD2mLRm2dx8gapqKdExPuccqTPMlwTnbQ38UaubZNa8Y1xeYcGbNhIGsMCcY2ko
	 wrsWEZwK0vyHKvrk5C1BxP5kbe29rDMJ6N2wbFNWQWlnCznxEL/E6qweONq8/b920/m2q
	 zp3QPXku/ApM/BmYlqvM/E5ajSTZvVTj3BEEYfg5Y8cM3XyBzPnMNf/OZAOLt4p4bOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982723;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=u2SCrHOVUXEGOU6PzpfyALRh4zq5mAoi1mG4dsi6uJY=;
	b=LfeqtnDIbqcR12okmpvF+r7pywo20z0TPmnDokAUdy3YNQqkNQAu/9IXdxsIt2TkkfOO
	 71G5Xc7PUOfBe/jhlxDn7k7RQXdtuJzgjLMNN0/tQHAbJNaq0sWJ7JeL68+WiSNj8xFzI
	 OupPtbXh4lCFVn7chE2TlAeAqHRWKGFpp1wGZTNti2TRWyx+XnOSAMTbIOoSGJdZUDxGM
	 jev/8DXGU7UbGncLSwsl5s77RJQdXPJRiGzGNMNKUCkhJZELN6lf1qw/w7paA3C9qRXHW
	 S0veW8cxic3DKMRRsiCVd1zwlaGLDCsRToivAzkp0Q9P+U76Qshems+X26+D3DP0dHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UdYrXMTO;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81572606A329;
	Fri,  6 Nov 2026 16:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81572606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UdYrXMTO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793982721; x=1825518721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOOkyogIN8a4vOErcW4xzAmp9hDHePD6T4i5oTwBmvo=;
  b=UdYrXMTOBJZLXgpnLEP64phLmYMDouvohn6qmjIuqLoZlV2Xwl3UlmPe
   WawVn+t3sJlJfWW5Y5KM1vzFdCGSdRhrl5emyXxGKBL63UVyuR8Xt4IFr
   1kqqOxebMzq/DXPs6kuBLFaWWmCp1CwlD9rPBwFtELgoOEfAAIqCUEEcF
   Wa8nhayPBrEFcZzKDOJ5RYUHZRR0LgpPxbXs11OtTkNEzQgGgYUc+GO6s
   1DMxxMveN4BGMLCMS2QIFslQnstFghOc3zZk7L2NdFNUYooXxT7lvct4m
   3tv4OZW15wBJ2J/A3J05EOCH7HUdxuHVaoD6/e5PubHMQZGwSqfa+qoQr
   g==;
X-CSE-ConnectionGUID: QlLDIhIHQBGDbc8UYtIdWg==
X-CSE-MsgGUID: AmJr1UiJS9KZtgr1+Y790g==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2841123"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2841123"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 08:32:00 -0800
X-CSE-ConnectionGUID: QkItusjTQiyb9564qtZRRw==
X-CSE-MsgGUID: d8a+nk9rQtSLvDGxXHfqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7152479"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2026 08:31:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPMr5-00000000pYJ-1pmH;
	Fri, 06 Nov 2026 16:31:55 +0000
Date: Sat, 7 Nov 2026 00:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Laurijssen <lauserve@gmail.com>, linux-kernel@vger.kernel.org,
	pjw@kernel.org, akpm@linux-foundation.org, jannh@google.com,
	brauner@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurijssen <laurijssen@protonmail.com>
Subject: Re: [PATCH] add utsname_set_field to reuse code in setdomainname and
 sethostname
Message-ID: <202611070006.O8jXXb72-lkp@intel.com>
References: <20261105120751.920311-1-laurijssen@protonmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105120751.920311-1-laurijssen@protonmail.com>

Hi Laurijssen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurijssen/add-utsname_set_field-to-reuse-code-in-setdomainname-and-sethostname/20261105-130751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261105120751.920311-1-laurijssen%40protonmail.com
patch subject: [PATCH] add utsname_set_field to reuse code in setdomainname and sethostname
config: riscv-randconfig-1001-20261106 (https://download.01.org/0day-ci/archive/20261107/202611070006.O8jXXb72-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070006.O8jXXb72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070006.O8jXXb72-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: utsname_set_field
   >>> referenced by sys.c:1424 (kernel/sys.c:1424)
   >>>               vmlinux.o:(___se_sys_sethostname)
   >>> referenced by sys.c:1457 (kernel/sys.c:1457)
   >>>               vmlinux.o:(___se_sys_setdomainname)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
