Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9194625CC68;
	Thu, 27 Feb 2025 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682684; cv=none; b=LcApaKixaM4fSif772Ei2cNr1yeLTFISG4wQqY0b7Aa1LjbZq5vtNma0w4ygP9ck/H449wWRLxnoCtrpnnnmiAbcsFEZrku+xs/p3op/ngLaptxK69YeJ7j77d8xYyo6cBGcZCku/G5a1naDwEBGjOAhsbHEiqjD/zc366zGoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682684; c=relaxed/simple;
	bh=4fD2WY8z3foYtZjpex6DfBxwc3jHGn6rdF8L2GMSLaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPC7GBRWzKLpXPLeFHnw9RqPZLfwYQdmpfu2IvUQtSyRzbZDSrV9KW1z0WnbJfNfazZ/OVooyJopq205x7k6tQgE/cefwbOtkkOeAP8aNzlqJSXZo+geNWes+dThpsfYhmYlN9+W5QR8NwL6/2++IT4tcd6z3x2EWm83VQlx5E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIBFc8Rw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIBFc8Rw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740682683; x=1772218683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4fD2WY8z3foYtZjpex6DfBxwc3jHGn6rdF8L2GMSLaU=;
  b=jIBFc8RwxY/IHT2PgpSxqX3Xd2es4/IzR2xB6S3EL/GG++rHQadFHfWm
   Q/RkZ9NCi0x6NtR2DUH6L8W9qL+ufQMq1MrdVQodEYi9JH5LhJ0tv+KFl
   VXCuMRVKGjzqYZBi8hLizplyKbJ9eYdpASC6fTYrfGyah58j1VPRO05N6
   WJZgP0oAx1gqo5AXOlJDZqqf02IqQk9BsbvIjnrNBNYDwXe2KOzwNSJU8
   2NAeIym9iX0sH44FR2fZjjVUqsDYoDKYCwfdW0ZBr+Lwm4QCgRMaodMew
   nNPSo3tnQErrlQZiorvyYb5rb6O+wgk+ETd/og7WssqBIfXJ3/O3MnxeP
   g==;
X-CSE-ConnectionGUID: IqKk/4s0Te61M6rFdpkLtw==
X-CSE-MsgGUID: gw/Mc2YvRxq5AuUwnD87eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53002999"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53002999"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:58:01 -0800
X-CSE-ConnectionGUID: jPe4dEs/QnK7MHJuIJrLzQ==
X-CSE-MsgGUID: NUbAnwywRCuKv8X7iIUxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="122128313"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Feb 2025 10:57:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnj50-000Dty-0k;
	Thu, 27 Feb 2025 18:57:54 +0000
Date: Fri, 28 Feb 2025 02:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	tomm.merciai@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Message-ID: <202502280247.L8g0SOJE-lkp@intel.com>
References: <20250226152418.1132337-18-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226152418.1132337-18-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/media-dt-bindings-renesas-rzg2l-csi2-Document-Renesas-RZ-V2H-P-SoC/20250226-233919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250226152418.1132337-18-tommaso.merciai.xr%40bp.renesas.com
patch subject: [PATCH v3 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280247.L8g0SOJE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280247.L8g0SOJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280247.L8g0SOJE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:685:66: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     685 |         dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
         |                                                 ~~~~                    ^~~~~~~~
         |                                                 %x
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
>> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:677:58: warning: shift count >= width of type [-Wshift-count-overflow]
     677 |         amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
         |                                                                 ^  ~~
   2 warnings generated.


vim +685 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c

   664	
   665	static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
   666	{
   667		dma_addr_t amnmadrs;
   668		unsigned int slot;
   669	
   670		/*
   671		 * When AMnMADRSL is read, AMnMADRSH of the higher-order
   672		 * address also latches the address.
   673		 *
   674		 * AMnMADRSH must be read after AMnMADRSL has been read.
   675		 */
   676		amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
 > 677		amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
   678	
   679		/* Ensure amnmadrs is within this buffer range */
   680		for (slot = 0; slot < cru->num_buf; slot++)
   681			if (amnmadrs >= cru->buf_addr[slot] &&
   682			    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
   683				return slot;
   684	
 > 685		dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
   686		return -EINVAL;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
