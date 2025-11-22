Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707621F5858;
	Sat, 22 Nov 2025 20:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763844595; cv=none; b=j4VKLJ3bvzCJMCJNmybMXSAOrQGLMu1ma947yUHPzcGyrwxG8dUIt/SJ8Ihu5rkH6ipqNtbzP+EZ15WVfFlGDqCIYqGTou4S/Qpq/5RyLbd3e/+nncs5omZeILUW7+0qpNta2I/6wWWeo7oO5T6lptXJc7BVWPLkv3zbkRMcs1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763844595; c=relaxed/simple;
	bh=uuC+iTXj1SGQjzCuYAvDsSc5QenEj2Rm5FMQnW/gGgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKhDyOHWwIIJApuPCdzV2vskFDVVgtFD5JpHd0fSxgZuPJ+y4kJ4RTi56VRRuYge0IxhUwlH8rzCWd5MpDoP6wjg5HIUgDz5veCaSLxvrjvmbvqaUCwQI9r93+zgcIjdSA0iEOS78qg+641/tcUtq5bSh5ni5Ci7IC7Bb29dN1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLLflXDK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLLflXDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763844592; x=1795380592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uuC+iTXj1SGQjzCuYAvDsSc5QenEj2Rm5FMQnW/gGgY=;
  b=NLLflXDKd9MxsDZphhIIPMO+kPo9k3b2ML8omHtgNkQFjJ0LtgriZVtU
   C7k9xQDhN5D9PDt3nIKW0to4abtbAtZNBCVpAwkm8SvE/q0o7Lr8m/8t3
   QhxE4pKvY9XpfJTrruiznvlsocwG9CBX3SUViWO62dXSAqQVYiaKHvmkC
   J8YYnsM6p1OHm0G02w+Ma1PqOj5W98LewCvwwEpeTxe3w5W5Onmk4DP+d
   Hlm+TeV453AXIAj2+rAb8DJW1bD3qCCLA+M4d5DDS/K/OmjwfeABJ6qUj
   NMdDuPcLvX+WLRiJE2AyPm5j8dver1J15j4sBTR1NufVrPC8Esu0fPo9o
   w==;
X-CSE-ConnectionGUID: Q1X4ZhZfSKybLZsPnAIo6A==
X-CSE-MsgGUID: YDxVlJvQTDG6rtbDxxAhhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65983512"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65983512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 12:49:51 -0800
X-CSE-ConnectionGUID: mjgxcY/PSg+o71gZTVXGpA==
X-CSE-MsgGUID: ojrZvvkxRdy51+eNj3F5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="222612150"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 12:49:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMuYF-0007p1-1q;
	Sat, 22 Nov 2025 20:49:47 +0000
Date: Sun, 23 Nov 2025 04:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Valerio <pvalerio@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 6/6] cadence: macb/gem: introduce xmit
 support
Message-ID: <202511230432.HbfOQLRw-lkp@intel.com>
References: <20251119135330.551835-7-pvalerio@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119135330.551835-7-pvalerio@redhat.com>

Hi Paolo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Valerio/cadence-macb-gem-Add-page-pool-support/20251119-222149
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251119135330.551835-7-pvalerio%40redhat.com
patch subject: [PATCH RFC net-next 6/6] cadence: macb/gem: introduce xmit support
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251123/202511230432.HbfOQLRw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230432.HbfOQLRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230432.HbfOQLRw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:1515:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1515 |                 struct xdp_frame *xdpf = xdp_convert_buff_to_frame(xdp);
         |                 ^
   1 warning generated.


vim +1515 drivers/net/ethernet/cadence/macb_main.c

  1491	
  1492	static u32 gem_xdp_run(struct macb_queue *queue, struct xdp_buff *xdp,
  1493			       struct net_device *dev, dma_addr_t addr)
  1494	{
  1495		struct bpf_prog *prog;
  1496		u32 act = XDP_PASS;
  1497	
  1498		rcu_read_lock();
  1499	
  1500		prog = rcu_dereference(queue->bp->prog);
  1501		if (!prog)
  1502			goto out;
  1503	
  1504		act = bpf_prog_run_xdp(prog, xdp);
  1505		switch (act) {
  1506		case XDP_PASS:
  1507			goto out;
  1508		case XDP_REDIRECT:
  1509			if (unlikely(xdp_do_redirect(dev, xdp, prog))) {
  1510				act = XDP_DROP;
  1511				break;
  1512			}
  1513			goto out;
  1514		case XDP_TX:
> 1515			struct xdp_frame *xdpf = xdp_convert_buff_to_frame(xdp);
  1516	
  1517			if (!xdpf || macb_xdp_submit_frame(queue->bp, xdpf, dev, addr))
  1518				act = XDP_DROP;
  1519			goto out;
  1520		default:
  1521			bpf_warn_invalid_xdp_action(dev, prog, act);
  1522			fallthrough;
  1523		case XDP_ABORTED:
  1524			trace_xdp_exception(dev, prog, act);
  1525			fallthrough;
  1526		case XDP_DROP:
  1527			break;
  1528		}
  1529	
  1530		page_pool_put_full_page(queue->page_pool,
  1531					virt_to_head_page(xdp->data), true);
  1532	out:
  1533		rcu_read_unlock();
  1534	
  1535		return act;
  1536	}
  1537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
