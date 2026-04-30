Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887A2DC791;
	Thu, 30 Apr 2026 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777577111; cv=none; b=rkdHjc441x96vIQkORsQnxXYPYDcx46cHiAhrXAqRhWPpfu5HczQq93AaEBOAds0seWBkMq+L+5pCYMxd6XP6OEbSP02Y+hKuDgFDr0uNExDXngknnGQEdzSW4eh2Kk/Q4G00/31v5tUTyekqOzkyUM532X1Kcop2/cD1jPyntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777577111; c=relaxed/simple;
	bh=c/Y2oacApZo94wOchw3fo4yoz19By5Cpn6cYCyp1n7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRNnOTE8Q/Ji5E1MCRYUaWjpuUZnzrHMXpObZGo+iME3gI14q0d6DGBMEjZxuQeyGhppNQ3wOpFvxN/a9fDJ7Gk/cesYAwomYJLHaft94ZukHg2+pxn7jxQNB+XT82dCPJ4YkD/wGjDCx+FOFz30YowjO1iTfFgTuVGY6QdHwOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFPfJykK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFPfJykK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777577110; x=1809113110;
  h=date:from:to:cc:subject:message-id;
  bh=c/Y2oacApZo94wOchw3fo4yoz19By5Cpn6cYCyp1n7U=;
  b=QFPfJykKxTqnJoeUtvgX6N0hD7b1dsP2os/bfuNQrs+aqqvmKmJn8p4C
   CH+ziG/meYR3M/izmoLAbCsui+easv1v0G3Ps+2xse+qJsGDGKSEoAcmz
   x2vSTnjWv10UZMDubNCt9uEwpSjhHfcgdL7OoxR4iQmdT4rnOpd+k/+6G
   i94y8S6ly45rfH1nSw9RiWb56pXoKNKd/EwnCcG4lG7njNFdi/hLpf5sA
   2/JYvV0zKMi1d9j5gnkEoXg2M1/eadIYApOEGm22u43IgO/rsfeF8r1lc
   naokjarjtpl9ebC0COgLvH19Vnd6XX65uWzNqRiq/C/cpF84z4sFRBUww
   g==;
X-CSE-ConnectionGUID: GKgsWlaDTxGfPigh94Bw+w==
X-CSE-MsgGUID: D0uxqOgXSAWiDuza0P/GCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78594500"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78594500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:25:07 -0700
X-CSE-ConnectionGUID: FOQZWNwmReqZhuTwuxNrig==
X-CSE-MsgGUID: sEC1QqGUQCuJY1XAHYsEzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="232019750"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 12:25:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIX0R-00000000Cqd-0Zm7;
	Thu, 30 Apr 2026 19:25:03 +0000
Date: Fri, 01 May 2026 03:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>, Nutty Liu <nutty.liu@hotmail.com>
Subject: [avpatel:riscv_iommu_irqbypass_v2 3/18]
 drivers/iommu/riscv/iommu.h:24:28: error: field has incomplete type 'struct
 pt_iommu_riscv_64'
Message-ID: <202605010359.0LXLMhKE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: 09919384307f2b09ecee7801e4ef772dc0a52a56 [3/18] iommu/riscv: Move struct riscv_iommu_domain and info to iommu.h
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260501/202605010359.0LXLMhKE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010359.0LXLMhKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010359.0LXLMhKE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu-platform.c:22:
>> drivers/iommu/riscv/iommu.h:24:28: error: field has incomplete type 'struct pt_iommu_riscv_64'
      24 |                 struct pt_iommu_riscv_64 riscvpt;
         |                                          ^
   drivers/iommu/riscv/iommu.h:24:10: note: forward declaration of 'struct pt_iommu_riscv_64'
      24 |                 struct pt_iommu_riscv_64 riscvpt;
         |                        ^
   1 error generated.


vim +24 drivers/iommu/riscv/iommu.h

    19	
    20	/* This struct contains protection domain specific IOMMU driver data. */
    21	struct riscv_iommu_domain {
    22		union {
    23			struct iommu_domain domain;
  > 24			struct pt_iommu_riscv_64 riscvpt;
    25		};
    26		struct list_head bonds;
    27		spinlock_t lock;		/* protect bonds list updates. */
    28		int pscid;
    29	};
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
