Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D0F1AAE37;
	Thu, 21 Nov 2024 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732184982; cv=none; b=hHdZoQ7C0oIKJQ0Ipa9t2RmS0ltUhquTT1oTPBoyH+TmUniS6qvYZACfxtH//LBNqlPaXN9JRjXpW+2SxrRaVi+eUcwhBoZgOJFvCvJ8UJVmQYZMJFM6A4OxY1N8w89d/6vTZNQj8iBKTcRLV9gzgD9sXlbLA6AHaRcAgT4c1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732184982; c=relaxed/simple;
	bh=rNpn3w9iDyW9Sea/Nz5WXK757qwNEeEMY1BskD0qIk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJFy75Zn/0DFhLxMwxj02Ae09bZPlbZBV0+xYRvbyEfD674KU/SXLfQ8q92oMIxSIqZvfNg+43Yfm0UI9ubMFREPXLVwH6s6Fgowy6S/U0udT+cwitZxNmvA3rC483PuJbpZ3WdvpXiQma48kwMmNHz+m0EEZHsy1gif37YZvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+CtGmER; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+CtGmER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732184981; x=1763720981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rNpn3w9iDyW9Sea/Nz5WXK757qwNEeEMY1BskD0qIk0=;
  b=Y+CtGmERninQYE60+vqXY7Bm7UoAZA6xqooijmE/ZcY4etO3PCOOIkDr
   iRXaTqxCuAWYoNOLMaLzxzX75avg6lgDoKXJCo8IkY7HotSqe1o462Vvn
   E8OzIJPf7Cdn1nMf7ZI3TIwTuD4z4az071Fye6IHmKXKozfTlXY+0ymDO
   HRwT11OEZdYNmEw3JWK18J06cfxvmzHPQ3UO1EB9s/vTbCZexFVAAkk/4
   v6Kn2v63aiy0MprFIDwPWfP2WhZaaJ9a0UpaRWsYcUmpu/+0MtY0/VYfg
   Z1wqBtuH1R4Kja7sfb9B+zV9PN7MoyBKbhIyTKZvD6zRbonLWq7qBR3xB
   Q==;
X-CSE-ConnectionGUID: IdGPd/qWSTe0/Kkd4iusWA==
X-CSE-MsgGUID: UCxZM1vwRGG1aFE8VjUumw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42907124"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="42907124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 02:29:41 -0800
X-CSE-ConnectionGUID: nkcftWq1QKqiYMBPeczDmA==
X-CSE-MsgGUID: 3pWUxmVRTpuRAe9q/MTGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90617917"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2024 02:29:39 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE4RM-0002qh-2P;
	Thu, 21 Nov 2024 10:29:36 +0000
Date: Thu, 21 Nov 2024 18:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
Message-ID: <202411211817.zrnXCVkd-lkp@intel.com>
References: <20241118233757.2374041-3-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118233757.2374041-3-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/dma-fence-Add-dma_fence_preempt-base-class/20241121-124856
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241118233757.2374041-3-matthew.brost%40intel.com
patch subject: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411211817.zrnXCVkd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211817.zrnXCVkd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211817.zrnXCVkd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-fence-user-fence.c:41: warning: Function parameter or struct member 'user_fence' not described in 'dma_fence_user_fence_free'
>> drivers/dma-buf/dma-fence-user-fence.c:63: warning: Function parameter or struct member 'user_fence' not described in 'dma_fence_user_fence_attach'


vim +41 drivers/dma-buf/dma-fence-user-fence.c

    32	
    33	/**
    34	 * dma_fence_user_fence_free() - Free user fence
    35	 *
    36	 * Free user fence. Should only be called on a user fence if
    37	 * dma_fence_user_fence_attach is not called to cleanup original allocation from
    38	 * dma_fence_user_fence_alloc.
    39	 */
    40	void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence)
  > 41	{
    42		kfree(user_fence);
    43	}
    44	EXPORT_SYMBOL(dma_fence_user_fence_free);
    45	
    46	/**
    47	 * dma_fence_user_fence_attach() - Attach user fence to dma-fence
    48	 *
    49	 * @fence: fence
    50	 * @user_fence user fence
    51	 * @map: IOSYS map to write seqno to
    52	 * @seqno: seqno to write to IOSYS map
    53	 *
    54	 * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
    55	 * The caller must guarantee that the memory in the IOSYS map doesn't move
    56	 * before the fence signals. This is typically done by installing the DMA fence
    57	 * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
    58	 * derived.
    59	 */
    60	void dma_fence_user_fence_attach(struct dma_fence *fence,
    61					 struct dma_fence_user_fence *user_fence,
    62					 struct iosys_map *map, u64 seqno)
  > 63	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
