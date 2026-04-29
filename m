Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BA372EFF;
	Wed, 29 Apr 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777497838; cv=none; b=gjItpbmi69pI/IojwohiQlRFG00U+M9TViUgzf5OtALYtIAr+PjIzTtedgQLvZt005wD0I4uO6P0JOwZfueSHSxzWW2+VX454fQUraB/uJYUz6VJDVxSgwRIyT0s3XYVH9wjRgBK9dN146qUPo0nelV8B2EJnq39HsHViHfeZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777497838; c=relaxed/simple;
	bh=XGfI1KD8DtydVr0FNfE/k4FUZDiwOjIIhcZY5jB1c7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG7eI8IWmlMPdyL1oxqd56lulD224yH3aWSmik8yNsjPtHt6v66cKcBh0/KMMgX3nQ+JJsouoz+ab2s+Jwd2Ym5tLk4Bjbd4rxjzuCAbhw3rRJn9MHWepjZWGGsFIM3CYjmTCJhzTFFClj8z/hV0cA60H+tLl/mU1vagwWmdgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkg/HS3p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkg/HS3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777497837; x=1809033837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XGfI1KD8DtydVr0FNfE/k4FUZDiwOjIIhcZY5jB1c7c=;
  b=gkg/HS3p9UhIFdQtkkp8p2z4REUuxeqsBgOx2n57SHQJhTXpSYa1/Q7h
   SsYkoWxpi8kHtIa0kv9JOqmopmAXPNfWidjaIlhHVBYB4mXXL6h3VHzg6
   PjXWdyyCHs8yzuk0kul+Ejl7AWfQ8r6fu35X2NSUecK5czPQyjD4QsX1A
   ILROe0FTkBL2ndlwlB+Ac6LhhLxH+17/B65dxDa6VabSLPrjiBj1GRXGJ
   C5+geKyeeqa0gMoxapBbrZ/ujAOjnxAc8dN3TptihK2ZBareYo4HWHvnJ
   poSoCd4ESne4QE1ianO2A4eU3vIEterPl4/Blzpha+LSjP/BaiGydbrFz
   g==;
X-CSE-ConnectionGUID: 00ZiODK3S4edpMQNVaRVJg==
X-CSE-MsgGUID: FZrL9ysLT/GQqs6XIZQ1zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78358419"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78358419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:23:57 -0700
X-CSE-ConnectionGUID: LQgLPGanRPa9vXmI1M2ucw==
X-CSE-MsgGUID: n5KkpAWPSc2gy/lnPaiJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="233541641"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2026 14:23:53 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICNp-00000000BYS-3jfU;
	Wed, 29 Apr 2026 21:23:49 +0000
Date: Thu, 30 Apr 2026 05:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>, srini@kernel.org,
	amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	thierry.escande@linaro.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
	stable@kernel.org
Subject: Re: [PATCH] misc: fastrpc: fix UAF and kernel panic during cleanup
 on process abort
Message-ID: <202604300542.cRI7jldQ-lkp@intel.com>
References: <20260427105310.4056-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427105310.4056-1-jianping.li@oss.qualcomm.com>

Hi Jianping,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianping-Li/misc-fastrpc-fix-UAF-and-kernel-panic-during-cleanup-on-process-abort/20260428-043358
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260427105310.4056-1-jianping.li%40oss.qualcomm.com
patch subject: [PATCH] misc: fastrpc: fix UAF and kernel panic during cleanup on process abort
config: arm64-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300542.cRI7jldQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300542.cRI7jldQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300542.cRI7jldQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:437:7: error: call to undeclared function 'FASTRPC_PHYS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     437 |                                   FASTRPC_PHYS(buf->phys));
         |                                   ^
>> drivers/misc/fastrpc.c:437:25: error: no member named 'phys' in 'struct fastrpc_buf'
     437 |                                   FASTRPC_PHYS(buf->phys));
         |                                                ~~~  ^
   drivers/misc/fastrpc.c:465:70: error: no member named 'phys' in 'struct fastrpc_buf'
     465 |                 buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys, GFP_KERNEL);
         |                                                                               ~~~  ^
   3 errors generated.


vim +/FASTRPC_PHYS +437 drivers/misc/fastrpc.c

   427	
   428	static void fastrpc_buf_free(struct fastrpc_buf *buf)
   429	{
   430		struct fastrpc_user *fl = buf->fl;
   431	
   432		if (!fl)
   433			return;
   434		mutex_lock(&fl->sctx->mutex);
   435		if (fl->sctx->dev) {
   436			dma_free_coherent(buf->dev, buf->size, buf->virt,
 > 437					  FASTRPC_PHYS(buf->phys));
   438			kfree(buf);
   439		}
   440		mutex_unlock(&fl->sctx->mutex);
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
