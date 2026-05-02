Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FB186A;
	Sat,  2 May 2026 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777752819; cv=none; b=UKirPit0zpHi5ucdSkxHKgUfqu4pbVxaNUEWd8fH8ojQvFGHpVBvt/WgjHEO4AF2iE/Z08q3wQSh8YIEpqAW7M8kpaJsb87nwKcHjseVmaXLx8ZrmI4y+mcu013PyckIb2NRkzCIxTTtEk/g98Ta+ZIF+voQskmpN8o13By25mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777752819; c=relaxed/simple;
	bh=crnjOZylKZIdCsLAiD1K+t/o75AuQmjBAF9uVmJ6/5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEfuUEMsQGWQKIJ1XuXEL3QyLrUyB4mW/LXwpqIJehL77rSuqQSmbp/zFgVvdNzG2VngS/nsLzbs1TEvwTLIh3V9RZh/v8MGwpyilHCpvdIJv4g3euua1eJGrKgjv+dp6ExrQ9+wRXNbFwujWmrXXBswlDDb6w1wJSGVWYJ4krs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlFinHHs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlFinHHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777752817; x=1809288817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=crnjOZylKZIdCsLAiD1K+t/o75AuQmjBAF9uVmJ6/5o=;
  b=BlFinHHs31+y4IIx2ZXoFv2XkpIGNBvM8yeXBcJ99PzfrPpsHoH52il6
   mm1qx33NrrCCzItyuoJjnwLp3MivFqlf1hYBPaD2z510fQhBKqreggrRg
   /DFYg8T/YyWS3wag8UUQCR3Zeuhm/eByRw3fhfEU3S+p0ybXgcaWtcqAg
   jhmpuowhWsg5iK+6m5yTS9xgngOTbxlT6s2Om1V6oAcz7Q1D6FI5+3GRu
   FwEc21gogVe9WECBvlLD6zKpXe+DRuBhzU8G8Q35dwB1b4h63rlfIwnmF
   cYauIluhs2VAQ5YzH4uMWqL/6YeCmeWjR5nDJklF285+7yPIzqlVghpQu
   Q==;
X-CSE-ConnectionGUID: r6w7MSs8SiSq9+7auoD5lg==
X-CSE-MsgGUID: I5HNCs19QhSDKzzr8DdiBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="96239380"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="96239380"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 13:13:36 -0700
X-CSE-ConnectionGUID: bDay5cGyQi2jtSyfmUdwgw==
X-CSE-MsgGUID: nhn0Qm00REmj7f1chsBLpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="232503192"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 May 2026 13:13:35 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJGiS-000000001mX-41Ps;
	Sat, 02 May 2026 20:13:32 +0000
Date: Sun, 3 May 2026 04:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] net: skb: on zero-copy formatted output to skb
Message-ID: <202605030443.Enw1fif1-lkp@intel.com>
References: <20260423073638.778334-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423073638.778334-1-dmantipov@yandex.ru>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/net-skb-on-zero-copy-formatted-output-to-skb/20260425-175341
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260423073638.778334-1-dmantipov%40yandex.ru
patch subject: [RFC PATCH] net: skb: on zero-copy formatted output to skb
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605030443.Enw1fif1-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030443.Enw1fif1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030443.Enw1fif1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/skbuff.c:7001:56: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'skb_printf' [-Wmissing-format-attribute]
    7001 |         len = vsnprintf(skb_tail_pointer(skb), size, fmt, args);
         |                                                               ^
   include/linux/skbuff.h:4295:5: note: 'skb_printf' declared here
    4295 | int skb_printf(struct sk_buff *skb, const char *fmt, ...);
         |     ^
   1 warning generated.


vim +7001 net/core/skbuff.c

  6994	
  6995	int skb_printf(struct sk_buff *skb, const char *fmt, ...)
  6996	{
  6997		int len, size = skb_availroom(skb);
  6998		va_list args;
  6999	
  7000		va_start(args, fmt);
> 7001		len = vsnprintf(skb_tail_pointer(skb), size, fmt, args);
  7002		va_end(args);
  7003	
  7004		if (unlikely(len >= size))
  7005			return -ENOSPC;
  7006	
  7007		skb->tail += len;
  7008		skb->len += len;
  7009		return len;
  7010	}
  7011	EXPORT_SYMBOL(skb_printf);
  7012	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
