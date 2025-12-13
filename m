Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A351212B0A;
	Sat, 13 Dec 2025 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765654879; cv=none; b=uIXd3Vxa3HV4U9FkdBfp97EHVHup91vkQnZ5i1+X0cDV5VkQ0SLeS4UUh4eXYrmQf5oh8mhsZkf9w61yGzjnu/jt4zgfWhIvd65XUDFjXfPpT6yhN2zv5osKsX5vhZeONO3MgoUKmy7hLwzOv9SAsGtZGlfsFqR+VIzNViY+2wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765654879; c=relaxed/simple;
	bh=uKJebKKK82+r1hFK5pMYImmy0A83wB1+btiep6Ij3K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvu2q16vFVQJAGbgh1di84gFY/ivGpN5+9zpR5pHykXonPT1A7xxaIt0M0f6W0ZvOEmCLkRJGltpOgJHxvKofocrcUO9o1Q4nf64XGewzj42rU+gxtzs/S44AZqtBdzQ+zUcb+pqbHJyTMf/u5KxdhqxhtLWfxEpMJarmS47d2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0gJ8wKr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0gJ8wKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765654878; x=1797190878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uKJebKKK82+r1hFK5pMYImmy0A83wB1+btiep6Ij3K8=;
  b=R0gJ8wKrYqsiBdnxnfQaFS9sOD/BUfh1MDb7jaPsZEGx5nC2rUcbdZrH
   Q+x1rPYQc5e3ap083EMCjQgKidE6D5Ey9w2uRm87cfDnkRZdS7AELX0Ow
   qwxN+312Am/qFE752dUrAYP9P6qkowaBi4XVOXylRWwO3W4O1yMidA62+
   0XEwyncS+Aq+Bmh2rNFu41u+FXEnwRk0IikbROs6oXVTdE7X0qJEyxyoS
   MMULBxtDr1gJZ9oL0PPviOYLIlIadTv5Yp4Dvxm0Mv1RtugRW7D2BPXNu
   JO0FwOwnhSCBBi+tXKyWf0IHA8CxZWy/GywXDm3R71rrzgeqhuqaHQZ1d
   w==;
X-CSE-ConnectionGUID: WVxrEX9bTeiwubVAyewGmg==
X-CSE-MsgGUID: eOrbw4j2To6bXw5Dv6FZ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78736350"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78736350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:41:18 -0800
X-CSE-ConnectionGUID: Oh6xyTNiREeet21mcUOK/Q==
X-CSE-MsgGUID: oz28/mJJTfGKh2Mi3LgnWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201776735"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 11:41:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVUO-0000000087F-1tUM;
	Sat, 13 Dec 2025 19:41:12 +0000
Date: Sun, 14 Dec 2025 03:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Silicon Labs Kernel Team <linux-devel@silabs.com>,
	Gabriel Beaulieu <gabriel.beaulieu@silabs.com>,
	Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
Message-ID: <202512140305.VFN3KkVr-lkp@intel.com>
References: <20251212161308.25678-15-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212161308.25678-15-damien.riegel@silabs.com>

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20251213-010308
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212161308.25678-15-damien.riegel%40silabs.com
patch subject: [PATCH 14/14] greybus: cpc: add CPC SDIO host driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140305.VFN3KkVr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140305.VFN3KkVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140305.VFN3KkVr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/greybus/cpc/sdio.c:166:59: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     166 |                 dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
         |                                                                 ~~~     ^~~~~~~
         |                                                                 %zu
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/greybus/cpc/sdio.c:172:60: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     172 |                 dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
         |                                                                  ~~~     ^~~~~~~
         |                                                                  %zu
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   2 warnings generated.


vim +166 drivers/greybus/cpc/sdio.c

   156	
   157	static bool cpc_sdio_get_payload_size(struct cpc_sdio *ctx, const struct frame_header *header,
   158					      size_t *payload_size)
   159	{
   160		size_t gb_size;
   161	
   162		gb_size = le16_to_cpu(header->gb.size);
   163	
   164		/* Validate that the size is at least as large as the Greybus header */
   165		if (gb_size < GREYBUS_HEADER_SIZE) {
 > 166			dev_dbg(ctx->dev, "Invalid Greybus header size: %lu\n", gb_size);
   167			return false;
   168		}
   169	
   170		/* Validate maximum size */
   171		if (gb_size > (GB_CPC_SDIO_MSG_SIZE_MAX + GREYBUS_HEADER_SIZE)) {
   172			dev_dbg(ctx->dev, "Payload size exceeds maximum: %lu\n", gb_size);
   173			return false;
   174		}
   175	
   176		/* Size includes the Greybus header, so subtract it to get payload size */
   177		*payload_size = gb_size - GREYBUS_HEADER_SIZE;
   178	
   179		return true;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
