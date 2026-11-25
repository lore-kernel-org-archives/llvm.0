Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572376;
	b=GBvSHa5E1XgrGuqIwOB7bYZfPH6LSybkyHyAuE2eYFl4/U53eBL18G7UifW1Fr10oy9b
	 yxhnhqvo4A+iw1uAIUKTUQar9UGDQjvYV5rrsYf6rdE7i+f04KxESjzL0bkVjZWvIDExa
	 BHoOoOWINxDhoGN2J3MfPJR5eNmQvXkhxbos90tPXYja0woFtdq71UVWRZofnydN1Ulwx
	 0AfcgPU9jTfu6miUKVkA1o3R2LbOWJ0KG3iCyvI0rMIg0wfdYS+6eOnlhuPhndxl15v9q
	 uoSpo96KPleM8rUJSNIedVNMh8smPBD5FJ1xirOflBYqhf/X7ZfFfq6rb8gczYk/0ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572376;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YqHrQYvYK1mTiBdyQkyNMnJO6MOU5pDaqra27f6WUYg=;
	b=us4UEshrLdZrFEfHp8xw0GTiW6AAUVD4TrW12RwybhdKo/o2Vh7mNIpnVXfgX/Ug1jXD
	 4G/U8g2SZD9nyugSG64DO7bjzifhFXbR12BcSMjQGAem/d8TbQCuvvPx2vojwO+To5Xa+
	 FlPNwbk0IzsjFv6B0DI79Fmh3yg/4yCo2vTd2UrTRGJ9AfzwmbKqAEjcIZCW+VA/sCjV3
	 eCMaIS2UTP4wOEtyAC6Im/9N5dTcpJUr2lS93vEsIjT6HKEh9mVtecWFJk3czSuwL5KVU
	 aO3iLO7qelcuJjymiDfaQqGeqkt0wRwUvYhzQwuZUN8WPRts+ZeUa6liTwqYyxwnm0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="e2z6iw7/";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A65606A330;
	Wed, 25 Nov 2026 02:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A65606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e2z6iw7/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795572376; x=1827108376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J6tI0oNu5ipgac+ZyULfo7Y10gS1m3hJ23/QN8OCwxg=;
  b=e2z6iw7/1cdQZI85GYFGKKAe6m3elnm5OLbjsTKffby5Vsw6F4tApD8f
   0vbhpPt5a+GCfxDkehn4cNTleryNu8d2Wsbd5BeF5Jf+OcwDsG3oKmq9B
   JgezIUqnUcaNPUmr/I6uaD+c1Gz0YQA/lMfwHGGPvyo+edLoJQPcptH/P
   YEF1Ts96GK5BFDMSsUYa1pC55Tfs1b9NosBxTbskclTWGzcqMaEWBwH71
   SXxgiLGN7onuVctp8teNDUZAEeKiXzxvx9Rs3k4uMuOgDReqXuWZ/xUU3
   YCihdce6nPTsw5tP4woNMGKnBqAFR+eufEL7s5j9GSzQLMTnDsy1Trhy4
   w==;
X-CSE-ConnectionGUID: 3rTtSGbWTcmArHBRBWsSgA==
X-CSE-MsgGUID: c5lCRMWVS3u2eX0JvR4o2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4322167"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4322167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 18:06:15 -0800
X-CSE-ConnectionGUID: puKRDXZcRYeLkoNKbfjorw==
X-CSE-MsgGUID: ClHvdapeSayvNMoP7nMyIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12161971"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2026 18:06:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW2Of-00000001Qg2-44Mj;
	Wed, 25 Nov 2026 02:06:09 +0000
Date: Wed, 25 Nov 2026 10:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20261125095513.u60l5aJo-lkp@intel.com>
References: <awXJ__-grexFFPb4@sirena.org.uk>
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
In-Reply-To: <awXJ__-grexFFPb4@sirena.org.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261123]
[cannot apply to drm-tip/drm-tip linus/master v7.4-rc4 v7.4-rc3 v7.4-rc2 v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-drm-misc-tree/20261124-173143
base:   next-20261123
patch link:    https://lore.kernel.org/r/awXJ__-grexFFPb4%40sirena.org.uk
patch subject: linux-next: build failure after merge of the drm-misc tree
config: arm64-randconfig-1002-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125095513.u60l5aJo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125095513.u60l5aJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125095513.u60l5aJo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:217:3: error: call to undeclared function 'dma_buf_unmap_sgt_unlocked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     217 |                 dma_buf_unmap_sgt_unlocked(buffer->attach, buffer->sgt,
         |                 ^
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:217:3: note: did you mean 'dma_buf_vunmap_unlocked'?
   include/linux/dma-buf.h:596:6: note: 'dma_buf_vunmap_unlocked' declared here
     596 | void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
         |      ^
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:437:8: error: call to undeclared function 'dma_buf_map_sgt_unlocked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     437 |         sgt = dma_buf_map_sgt_unlocked(attach, DMA_BIDIRECTIONAL);
         |               ^
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:437:8: note: did you mean 'dma_buf_vmap_unlocked'?
   include/linux/dma-buf.h:595:5: note: 'dma_buf_vmap_unlocked' declared here
     595 | int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
         |     ^
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:437:6: error: incompatible integer to pointer conversion assigning to 'struct sg_table *' from 'int' [-Wint-conversion]
     437 |         sgt = dma_buf_map_sgt_unlocked(attach, DMA_BIDIRECTIONAL);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:552:3: error: call to undeclared function 'dma_buf_unmap_sgt_unlocked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     552 |                 dma_buf_unmap_sgt_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
         |                 ^
   4 errors generated.


vim +/dma_buf_unmap_sgt_unlocked +217 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c

   208	
   209	/*
   210	 * Cleans up imported dmabuf.
   211	 * Should be called with mutex held.
   212	 */
   213	static void vc_sm_clean_up_dmabuf(struct vc_sm_buffer *buffer)
   214	{
   215		/* Handle cleaning up imported dmabufs */
   216		if (buffer->sgt) {
 > 217			dma_buf_unmap_sgt_unlocked(buffer->attach, buffer->sgt,
   218						   DMA_BIDIRECTIONAL);
   219			buffer->sgt = NULL;
   220		}
   221		if (buffer->attach) {
   222			dma_buf_detach(buffer->imported_dma_buf, buffer->attach);
   223			buffer->attach = NULL;
   224		}
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
