Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498AF37EFF4;
	Fri,  3 Apr 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206084; cv=none; b=RLwdSmqLpumB9kgEStV8KqRGqXc/YH/GYiAyQCYq4J+n67C0Mkb1aWjxiU+NQbU1U6xUYAXRSOEGxQwIJ3LQaKA3s8TdUK+SRtaeXoyRuxcinNpJaI94vzmrKOb3tuKlVYufBknHMEISguln9tk/tz2qT9k9WOt93PP5bDTxHek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206084; c=relaxed/simple;
	bh=ZJrOlxB9ODhunm/KFNry2MOW4qy/eC1bLxczndnaFMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzvM4XWicmChf8w3kZx0h7Q95CJlF3frVsDnAqlF0UeXn1H1xyr/HZd0LErGUqOiMKecjAC2WB/UzdHhFlY52vIr3umBi9mmIl8b0Mk8393Y1feiLlexyCr8BMpnCV8JOvnDwzo8PJ4+B94ag1X+oFUGB/81eFYq7LmjAA8O/QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlaT5wC0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlaT5wC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206083; x=1806742083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZJrOlxB9ODhunm/KFNry2MOW4qy/eC1bLxczndnaFMQ=;
  b=AlaT5wC0MUcqD7t1jr2FAn96rwEJxpCmSGYojNm2rrgsfuo0oLZc6aTl
   JUG7MrDR2j9uDUHy/hMhWPqknz+3qQiLP22CvhevKE29h6s/3b8DZ0v3z
   hxO1J8ECQh1jw465yKETA9Mt30VAU3HJYs4iUzNifacdPV6mIdXLKMyAx
   l08DH7er/VctGreLVTh/NJMXL7tP0+jmj9jIivVtIjstwCMi95wyvQY4Z
   gAgQaY706IpXcED7P5looIeZAIyX/hTs358pDoRDIQWzakd3LJ9M8p3Tt
   5W9ls/8CuB3xrRB+DJTRWDmtEZkn3MO0VNodi+61AMOxj5+vqTT/dmSZH
   g==;
X-CSE-ConnectionGUID: JIqTgiJqTd+iwFp4OA03SQ==
X-CSE-MsgGUID: e05sJcxOSMGuKEb1tkUd0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76239393"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76239393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:48:02 -0700
X-CSE-ConnectionGUID: Powiq4beT56r4yUrcq0G+Q==
X-CSE-MsgGUID: NtlhvnCVSOKHAd8aQncblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="222355504"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2026 01:47:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aC5-0000000017P-0UZK;
	Fri, 03 Apr 2026 08:47:57 +0000
Date: Fri, 3 Apr 2026 16:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kerneljasonxing@gmail.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Jason Xing <kernelxing@tencent.com>
Subject: Re: [PATCH v3 net-next] net: advance skb_defer_disable_key check in
 napi_consume_skb
Message-ID: <202604031607.o753ScQ1-lkp@intel.com>
References: <20260401033211.44463-1-kerneljasonxing@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401033211.44463-1-kerneljasonxing@gmail.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-advance-skb_defer_disable_key-check-in-napi_consume_skb/20260403-115110
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260401033211.44463-1-kerneljasonxing%40gmail.com
patch subject: [PATCH v3 net-next] net: advance skb_defer_disable_key check in napi_consume_skb
config: x86_64-buildonly-randconfig-005-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031607.o753ScQ1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031607.o753ScQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031607.o753ScQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/skbuff.c:1522:31: error: use of undeclared identifier 'skb_defer_disable_key'
    1522 |         if (!static_branch_unlikely(&skb_defer_disable_key) &&
         |                                      ^
>> net/core/skbuff.c:1522:31: error: use of undeclared identifier 'skb_defer_disable_key'
>> net/core/skbuff.c:1522:31: error: use of undeclared identifier 'skb_defer_disable_key'
>> net/core/skbuff.c:1522:31: error: use of undeclared identifier 'skb_defer_disable_key'
   4 errors generated.


vim +/skb_defer_disable_key +1522 net/core/skbuff.c

  1500	
  1501	/**
  1502	 * napi_consume_skb() - consume skb in NAPI context, try to feed skb cache
  1503	 * @skb: buffer to free
  1504	 * @budget: NAPI budget
  1505	 *
  1506	 * Non-zero @budget must come from the @budget argument passed by the core
  1507	 * to a NAPI poll function. Note that core may pass budget of 0 to NAPI poll
  1508	 * for example when polling for netpoll / netconsole.
  1509	 *
  1510	 * Passing @budget of 0 is safe from any context, it turns this function
  1511	 * into dev_consume_skb_any().
  1512	 */
  1513	void napi_consume_skb(struct sk_buff *skb, int budget)
  1514	{
  1515		if (unlikely(!budget || !skb)) {
  1516			dev_consume_skb_any(skb);
  1517			return;
  1518		}
  1519	
  1520		DEBUG_NET_WARN_ON_ONCE(!in_softirq());
  1521	
> 1522		if (!static_branch_unlikely(&skb_defer_disable_key) &&
  1523		    skb->alloc_cpu != smp_processor_id() && !skb_shared(skb)) {
  1524			skb_release_head_state(skb);
  1525			return skb_attempt_defer_free(skb);
  1526		}
  1527	
  1528		if (!skb_unref(skb))
  1529			return;
  1530	
  1531		/* if reaching here SKB is ready to free */
  1532		trace_consume_skb(skb, __builtin_return_address(0));
  1533	
  1534		/* if SKB is a clone, don't handle this case */
  1535		if (skb->fclone != SKB_FCLONE_UNAVAILABLE) {
  1536			__kfree_skb(skb);
  1537			return;
  1538		}
  1539	
  1540		skb_release_all(skb, SKB_CONSUMED);
  1541		napi_skb_cache_put(skb);
  1542	}
  1543	EXPORT_SYMBOL(napi_consume_skb);
  1544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
