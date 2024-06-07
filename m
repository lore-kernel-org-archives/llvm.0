Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D315444F;
	Fri,  7 Jun 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717745387; cv=none; b=QEDTCy9hTszrfOHrxE7HplFOwH+NyYA4JdjhD8qFlJKQxY6e7yHqAWDiq045NDfRerO4zA+nI95luQny5n9+S/jdNG4mTqEoe3Lj/yECLKLP43LgrGoT/NqIM3ON8sbFRjEd2s/tl0NeKqOMEnr5jirr7FHwU31e9WyZB+BObpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717745387; c=relaxed/simple;
	bh=2zqhKlVxrz3mbaDx+3zFhoMg3wKeoW+Xa3Fjl4ex1ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZSGMBjcX8GhTs/QzFhiwa8YZ3BMDcyFTHrf5dFuSSliA12y86STwiz9ECJz761oCTZm9+aBMG90pMR1TQySuUY0cBlOVzD3+a9vi8HocXEYtrCanLQn48weci9VcGyRfTapXeZeVQyXtl7o7P61fE/enYAl5p4uCZmgwP6Blqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m374OOYZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m374OOYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717745386; x=1749281386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2zqhKlVxrz3mbaDx+3zFhoMg3wKeoW+Xa3Fjl4ex1ps=;
  b=m374OOYZSxrltHsP8cPkm/cqRSxhZR1IzW6tZx19N5k6oYzJ7bSGAiMZ
   NdHymeUkNg5Z2F7d0GIqdc+U3RwsN+B3g3SdMlNN8/lElaVoVsQv35pVc
   0DZ/cx7ls2eJzh05n+hfN7Y+BPJSrUSKq/9w5FBJ810engEQr8lRed3K/
   66EG4Z54qCZrpGIy1LwcADvMqsBFglQpTzAsonCx1sypCrENZvWTK1Dab
   mEdw5yULh9eozChrMlvb37UkyHMbKgmc7EaipvcoyrHMw70a2ptNHGU10
   fOgDyRLCKKEau2Mjgnm6MAOCN4q3yMUk8ydOBEni9YM04ZV9D8zWtNaPZ
   g==;
X-CSE-ConnectionGUID: /jVQf+0mQuas5anKO+CXdQ==
X-CSE-MsgGUID: KY4KzXgLQ1+DGWawbAwXzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14634927"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14634927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:29:41 -0700
X-CSE-ConnectionGUID: dhQ+h4aLSba7BzGhhFJOzQ==
X-CSE-MsgGUID: LkN6+gQpQWOYS9MWDiSS/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="75713087"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Jun 2024 00:29:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFU2X-0004D9-2b;
	Fri, 07 Jun 2024 07:29:33 +0000
Date: Fri, 7 Jun 2024 15:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tao Zeng via B4 Relay <devnull+tao.zeng.amlogic.com@kernel.org>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	Tao Zeng <tao.zeng@amlogic.com>
Subject: Re: [PATCH] erofs: support external crypto for decompression
Message-ID: <202406071506.XHwo54ej-lkp@intel.com>
References: <20240606-erofs-decompression-v1-1-ec5f31396e04@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-erofs-decompression-v1-1-ec5f31396e04@amlogic.com>

Hi Tao,

kernel test robot noticed the following build errors:

[auto build test ERROR on ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Tao-Zeng-via-B4-Relay/erofs-support-external-crypto-for-decompression/20240606-155702
base:   ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
patch link:    https://lore.kernel.org/r/20240606-erofs-decompression-v1-1-ec5f31396e04%40amlogic.com
patch subject: [PATCH] erofs: support external crypto for decompression
config: arm64-randconfig-004-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071506.XHwo54ej-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071506.XHwo54ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071506.XHwo54ej-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/erofs/zdata.c:7:
   In file included from fs/erofs/compress.h:9:
   In file included from fs/erofs/internal.h:11:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2241:
   include/linux/vmstat.h:484:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     484 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     485 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:491:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     491 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     492 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:512:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     512 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     513 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/erofs/zdata.c:7:
>> fs/erofs/compress.h:120:1: error: expected identifier or '('
     120 | {
         | ^
   5 warnings and 1 error generated.


vim +120 fs/erofs/compress.h

   115	
   116	static inline int z_erofs_load_crypto_config(struct super_block *sb,
   117						     struct erofs_super_block *dsb,
   118						     void *data,
   119						     int size);
 > 120	{
   121		if (crypto) {
   122			erofs_err(sb, "crypto algorithm isn't enabled");
   123			return -EINVAL;
   124		}
   125		return 0;
   126	}
   127	#endif
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
