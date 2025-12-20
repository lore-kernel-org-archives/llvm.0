Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F3D275106;
	Sat, 20 Dec 2025 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766257484; cv=none; b=HgBU7hc5MlEFLIhWf0QxiSMYXjhdLWTz6wlAF4csLu0eXU3Yd9Pmi0IdRuL7uLQmoaBTE3EClgB+Llu2L5kgro4ul6XoF4jiR48hi6138VRynQfeYpeBJQHg5DahvNlz0guWpGbfORbLLvlPp5bovffy4vu9miNNuIOZTvZgTBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766257484; c=relaxed/simple;
	bh=YRwmucy1yBgchurkk7MD3JKcEQ9Jec6r8BLJ4q5S4l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGNF4O3YLOb0/KkRmq0SMkTmQrE0bXqb2Ybr5iNdSQPf2sTPz4agr0ri+xQQpqAYqR6Xy7uAa/n+TrulPNrI/iWkhRPq/GDhK0ij2BKDCFrNRJ3Pdgs1soneQ5/iq7SYal4YcKk0Xk0DehV17X26kWfqrewZTHtlJg3mMAygHtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld1NzM5F; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld1NzM5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766257483; x=1797793483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRwmucy1yBgchurkk7MD3JKcEQ9Jec6r8BLJ4q5S4l4=;
  b=ld1NzM5FoC2qQYtqFWqP93vyZ2qxsa8J9KPNXkalUDTn1AMS31ixSoza
   FdWZKbmR3Wgpg96S+m3nerxIksM5BKr+9WJsbPlw8KChNwCr1LTB14KXb
   /DOXOjq/yRTsGzMgKKzFFrsCAL7YUugoEud2vv4CMaK1OH/yhSj6m2vnQ
   wYzOOtFhAD6uuhJB+0rtsoMGdIJxyL4LXDXoNdVDyVIZlW5GJeAyPvljo
   tm2ZXbspIHvmQD/V+w/hXsXZb8nsXeDSoTwyXvUVGyBmHgGNClKYC+QSa
   /DMjZ2C45phA42zO9RQhXhk/qsOclYYrrkT85syhQ0KNSGSPDCTNlGL9l
   w==;
X-CSE-ConnectionGUID: BIr65LYnShKXpq/JwKJ1aw==
X-CSE-MsgGUID: nsMF0xCPQcixowsTH7IVhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93657353"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93657353"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:04:40 -0800
X-CSE-ConnectionGUID: ra7MClLkS8mrp05Gardlbw==
X-CSE-MsgGUID: 8nzMnuUAQr6B+boev5FvHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198756446"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2025 11:04:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2Fp-0000000052P-0DHv;
	Sat, 20 Dec 2025 19:04:37 +0000
Date: Sun, 21 Dec 2025 03:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <202512210203.ovmdBwli-lkp@intel.com>
References: <20251217102357.1730573-2-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217102357.1730573-2-wangyushan12@huawei.com>

Hi Yushan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc1 next-20251219]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-L3-cache-driver-for-HiSilicon-SoC/20251217-203916
base:   linus/master
patch link:    https://lore.kernel.org/r/20251217102357.1730573-2-wangyushan12%40huawei.com
patch subject: [PATCH RFC v2 1/3] soc cache: L3 cache driver for HiSilicon SoC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210203.ovmdBwli-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210203.ovmdBwli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210203.ovmdBwli-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/hisilicon/hisi_soc_l3c.c:20:10: fatal error: 'asm/cputype.h' file not found
      20 | #include <asm/cputype.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.


vim +20 drivers/soc/hisilicon/hisi_soc_l3c.c

    19	
  > 20	#include <asm/cputype.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
