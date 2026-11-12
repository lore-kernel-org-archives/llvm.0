Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444790;
	b=rIjbkTAPz8b0+nauJTnlKd8w71AXNx3FUPjrZ0LYwWdoyAr74UnxvzpBgWxLKVveWCIE
	 epCFTBuEUU7QtAfcbrRhWJ5TK1swxJ3eiI7SuBVqU12l4pN7xWKHn1pmUh1pxxO49oV0T
	 FHo4acMxib02QGydwaYkIDyQnSwjGqTsmT6JljWdrBzPXj+x/677JzUYPbedBoD3AhVfu
	 oZbcj29flKv50cN9hbS25fcznLW6RkKF98iTXMDcs8/377GHGOh3mqKHl4mip7/M6laVn
	 ZhqU7iRbSwJHtbmtwNq3sO0Q8ghhQNijsWj7kM6mGkqpHRIOK1JtSJtsIxqaV9fvsmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444790;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iD8gEYMa7aezRDbx7s0Ws+d6QV40K0gj3exnM+Jq/zk=;
	b=GKFNkRJxv/sLnCG8bjrm8UG+VewRfhL859D7V1q5c07JHAevwTcRRSgOGOPUsrR344yY
	 NZi9YYGRC59d/YCwwcxWQ2rFKYXZiot81KM1o+ekVnmsRLnsrmVvd06LyuZU69BHs19mL
	 9AjhT+ii6u6rpy0G1KtJXasQQEUAEs7vfevumjSSgEjvRs0gVC/vtAKMILR4cZX/kUIQv
	 xpRRCFK8DXardeEOuXbHLlIl01lU5yUX30bq8x3hGvHMeSYLrhLb5X5rfbdAjpkaiSTuL
	 8t974lx1HTGBl+qLYltZ3FDbj24/C2Vpyy9srdeFkHwzySR0MclFDDL3oRIti7i5Xmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZ29GMVA;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB814606A321;
	Thu, 12 Nov 2026 00:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB814606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZ29GMVA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794444790; x=1825980790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uAv1mAw5VrJsp32PDyNJJFRm/pbdZzyTcUPptdm3kG0=;
  b=jZ29GMVAwsGCL2FKKuAjboZu9cH58qO3W0VbWV9F4jxeq6EHzZJ382gt
   7i66Eq3bD3EfXKpaRSNmaaM6yYqkedVp3q+Idkl2130O3XEeEXZzdokM7
   3Gv9ZV9RREa2B3Jejeh6nWXJggmtxo9biUz3fbrVRkgSDsjYHzRenWFyN
   9Y9zWSzb4Jo7F5a6P13TpqJ3Qr8Vm64pQjfkSH8BzdJF6YmeVVHfVOgOt
   +zGuJ0GqYUIyEMzaFkZUmzJ9FJmeuYB/GDDbp8qFHPFZwZr5VeiVnonKP
   mvtcpDEU3OB7L5rof93vzS4EPDl1X3HpHmdZbT9u14sud6rOEfGFG8s/b
   w==;
X-CSE-ConnectionGUID: l3uUD/TbSj+2WMoi9ZCxlQ==
X-CSE-MsgGUID: qFmh+hWQS2OW2aephkDcOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3126739"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3126739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 16:53:10 -0800
X-CSE-ConnectionGUID: VNAKFKV5RqmeW/1om21oxg==
X-CSE-MsgGUID: 3WARz+26RjOx6m4HuxOLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8692475"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2026 16:53:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRJ3p-0000000108V-3Kv6;
	Thu, 12 Nov 2026 00:53:05 +0000
Date: Thu, 12 Nov 2026 08:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	netfilter-devel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf,v6 7/7] netfilter: nfnetlink_queue: do not skip ct
 confirmation with userspace ct helpers
Message-ID: <202611120823.rM19cAnh-lkp@intel.com>
References: <20261110215439.1958120-7-pablo@netfilter.org>
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
In-Reply-To: <20261110215439.1958120-7-pablo@netfilter.org>

Hi Pablo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20261109]
[cannot apply to netfilter-nf/main nf-next/main linus/master v7.4-rc2 v7.4-rc1 v7.3 v7.4-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nfnetlink_queue-add-helper-function-to-retrieve-hook-entries/20261110-225434
base:   next-20261109
patch link:    https://lore.kernel.org/r/20261110215439.1958120-7-pablo%40netfilter.org
patch subject: [PATCH nf,v6 7/7] netfilter: nfnetlink_queue: do not skip ct confirmation with userspace ct helpers
config: i386-randconfig-1006-20261112 (https://download.01.org/0day-ci/archive/20261112/202611120823.rM19cAnh-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120823.rM19cAnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120823.rM19cAnh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nfnetlink_queue.c:529:15: warning: unused variable 'verdict_mask' [-Wunused-variable]
     529 |         unsigned int verdict_mask = verdict & NF_VERDICT_MASK;
         |                      ^~~~~~~~~~~~
   1 warning generated.


vim +/verdict_mask +529 net/netfilter/nfnetlink_queue.c

   524	
   525	static void __nfqnl_reinject(struct nf_queue_entry *entry,
   526				     const struct nf_hook_entries *hooks,
   527				     unsigned int verdict)
   528	{
 > 529		unsigned int verdict_mask = verdict & NF_VERDICT_MASK;
   530	
   531		if (!nf_bridge_ports_valid(entry))
   532			goto drop;
   533	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
