Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E881386B4;
	Thu, 18 Jul 2024 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721303079; cv=none; b=jfXKukGASBosnc3H5/IIpPcqd96atHZGMRnOJDCsTuGllIwCLBUCE0vWWR0B1HarKNjnBjqBRKZc7sRikpjND4DwJ3/4BKFi4WWpvgtfku5+8DicbrvW1t9XSrzn0VLvcZ57hRmslpR4r+e+u3VcsjTBZ7Btmg44XVwtlkQYeJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721303079; c=relaxed/simple;
	bh=jimkp0Yh6TY9VdfcsJ2ujhbO4Q3vObO4a8vV6FClA7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqP4Lj/MOZOmb8cSR8Oh4gUzeQs9XnV2DW781qLW9uvE0b72CID+Aph1vkBEv9p2wr4ciXBTROvdW9wKFMsHKH79NlPpmAufaZU7nmt/29S/ZwQxLBLthI+Pc03eeNVHa0qh0kptZ+qgrQ89gVl5cKvMWeGheYoYTic1yNA/RPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j56EVelA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j56EVelA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721303078; x=1752839078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jimkp0Yh6TY9VdfcsJ2ujhbO4Q3vObO4a8vV6FClA7Y=;
  b=j56EVelAEAyLc3vct9bfNfqFSCpiuU/drAgR4K2vOWM99HwJuvv828kZ
   ugAQ54AhFLgpNLws9Yj71K6twJ7I9AdI2Y0ZVdqPa6bFWHkl/F8Lo2+w3
   BT9F+AH4VQomM9EqARwVXMo2pc9h/vKEYsrx581nanXRMoXMI1Dn6Btn1
   F5XC0Ja9Yf83BWmeUt5qBMyi9HXzsnhlJrRy3WACSsiwTUoZfVkE1nAz+
   rEwub4whUkyZs5u3s6JP9C5EVO5ThnQLIiNlcx8OuodIsbtryZ+6sWOQI
   L8cI5eozljBMiiMEBGqEsVY28MJz6qmh8sci/2hG4xXRF1sOKYGefLkq0
   g==;
X-CSE-ConnectionGUID: kuIz0bEGTrK0ybSYD9TwkQ==
X-CSE-MsgGUID: 95MKq6KLRbiOtFpDYQ96JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12607166"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="12607166"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:44:37 -0700
X-CSE-ConnectionGUID: 1lhoSN9nQYCKinXTHlGRHw==
X-CSE-MsgGUID: uuSrpXE0SMOx41KoK/kDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="73962991"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2024 04:44:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUPYo-000hCY-0R;
	Thu, 18 Jul 2024 11:44:34 +0000
Date: Thu, 18 Jul 2024 19:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-static-calls-v3 2/2] kernel/dma/mapping.c:831:21:
 error: call to undeclared function 'dma_is_default_iommu'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202407181924.HKbjSnqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-static-calls-v3
head:   7eb55aeea773a5827b4c6ab06f77beed71254e44
commit: 7eb55aeea773a5827b4c6ab06f77beed71254e44 [2/2] dma: add IOMMU static calls with clear default ops
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240718/202407181924.HKbjSnqk-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181924.HKbjSnqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181924.HKbjSnqk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/dma/mapping.c:831:21: error: call to undeclared function 'dma_is_default_iommu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     831 |         if (WARN_ON(ops && dma_is_default_iommu(dev)))
         |                            ^
   1 error generated.


vim +/dma_is_default_iommu +831 kernel/dma/mapping.c

   826	
   827	static int dma_supported(struct device *dev, u64 mask)
   828	{
   829		const struct dma_map_ops *ops = get_dma_ops(dev);
   830	
 > 831		if (WARN_ON(ops && dma_is_default_iommu(dev)))
   832			return false;
   833		/*
   834		 * ->dma_supported sets the bypass flag, so we must always call
   835		 * into the method here unless the device is truly direct mapped.
   836		 */
   837		if (!ops)
   838			return dma_direct_supported(dev, mask);
   839		if (!ops->dma_supported)
   840			return 1;
   841		return ops->dma_supported(dev, mask);
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
