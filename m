Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515771CA8F;
	Sun,  3 Mar 2024 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709499545; cv=none; b=iLTDcma3spcQT/+84X4aEmbRoKLPQnRKMBMRas5+DRpPDlw6Iimoaw57XIam18vF8o39Cer9w2nxqvJDROnbrNZ2GxGGMXXIxwywNkRUEYUVULMExTriwN6IoCK24sPZVWTJd/EdD3f95UDTgiQl3Z6lLMlBdRMA+LtWVZFlWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709499545; c=relaxed/simple;
	bh=Shd2GRwjHJOSLqbTorBQLVaSeB+Z7gQi3myuQxEsO5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrb1IaqlDrBXh1A8ZrN/KIxc9bL51/q/e0U4rPPk0a8WutTjRoxwDty4r+Dyh/9nOX0+U/5efgd00SH9DM4J31rck2iAUsPSerKt7LmPAJceIpXyHFRo42KpfO+ITT+8FL7MXZ51X3ipJdAy67rDES6tD2EJi6lQ5N5gbPoo8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRRQOxeZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRRQOxeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709499543; x=1741035543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Shd2GRwjHJOSLqbTorBQLVaSeB+Z7gQi3myuQxEsO5A=;
  b=SRRQOxeZmSeNVTfXA9746uUOodwxf7O5oPoy+KD5hdkfb3xTFAhJmcgF
   IpG3mhR/RRVQncXjUDH2Zkpt8w2yfQacNhAVXUk5h8rim/2A8UoGbIbc6
   FnU1F6WbwWIVYKnkoVdV1RR5oOLHmi0aZUtHC8ifL8xUBvaVU6BiEISSp
   OWfa3potxjk36UBheDYnSEnX/vfVg+gX7ZWAB6Pehi/CwdY3xjGuJl/jm
   KGQtsfi48afcSTXcnDRn3q8nCWzf1IBkpiP9URFaP15ZvAC3J73hpSnwI
   /YdRQR5jywkLU0VzhO7Y0C9JL9MrqT5CsXxFiVWN+k64b8xX4zbtYi0Er
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3871788"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="3871788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 12:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8848219"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Mar 2024 12:59:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgsvC-00026U-37;
	Sun, 03 Mar 2024 20:58:58 +0000
Date: Mon, 4 Mar 2024 04:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 02/12] firmware: qcom: scm: enable the TZ mem allocator
Message-ID: <202403040445.XAdJO3Ta-lkp@intel.com>
References: <20240303150115.133633-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240303150115.133633-3-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on krzk-dt/for-next linus/master v6.8-rc6 next-20240301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-add-a-dedicated-TrustZone-buffer-allocator/20240303-230933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240303150115.133633-3-brgl%40bgdev.pl
patch subject: [PATCH v8 02/12] firmware: qcom: scm: enable the TZ mem allocator
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240304/202403040445.XAdJO3Ta-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040445.XAdJO3Ta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040445.XAdJO3Ta-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom/qcom_tzmem.c:266:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           case QCOM_TZMEM_POLICY_ON_DEMAND:
           ^
   drivers/firmware/qcom/qcom_tzmem.c:266:2: note: insert 'break;' to avoid fall-through
           case QCOM_TZMEM_POLICY_ON_DEMAND:
           ^
           break; 
   1 warning generated.


vim +266 drivers/firmware/qcom/qcom_tzmem.c

4798c267ce94f6 Bartosz Golaszewski 2024-03-03  250  
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  251  static bool qcom_tzmem_try_grow_pool(struct qcom_tzmem_pool *pool,
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  252  				     size_t requested, gfp_t gfp)
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  253  {
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  254  	size_t current_size = gen_pool_size(pool->genpool);
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  255  
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  256  	lockdep_assert_held(&pool->lock);
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  257  
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  258  	if (pool->max_size && (current_size + requested) > pool->max_size)
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  259  		return false;
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  260  
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  261  	switch (pool->policy) {
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  262  	case QCOM_TZMEM_POLICY_STATIC:
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  263  		return false;
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  264  	case QCOM_TZMEM_POLICY_MULTIPLIER:
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  265  		requested = current_size * pool->increment;
4798c267ce94f6 Bartosz Golaszewski 2024-03-03 @266  	case QCOM_TZMEM_POLICY_ON_DEMAND:
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  267  		break;
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  268  	}
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  269  
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  270  	return !qcom_tzmem_pool_add_memory(pool, requested, gfp);
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  271  }
4798c267ce94f6 Bartosz Golaszewski 2024-03-03  272  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
