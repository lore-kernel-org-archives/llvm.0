Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595689;
	b=W5KVakJt+POoKwGysTcIfPO0ur44fakF7+QiZIrnA7JA1AuHezsA/oCCH5YZZmODkJDm
	 JM1ShgUfr/GWoj8OM5p/Xmam1ZdsuP+zmUAn9PS58JRgrbTL1W7kGFii889adJHx83xoZ
	 I2hq/1hIkW848ue/bWQnHxCYe7eGV1aGHvCZU01BNMqEcDZnMNm9Kkf4lVyNFFMYee8my
	 x0LjH5v0rwduJRpnT3cZ9G6UwNVPFjSZQ9F2aQOxLXThxTvarMDUqiK+cNlBogdqErrvz
	 cp508RgFDoKiBT7TrEuSz1SrZp5OAIA0OTcQ7g3cvNtGZs69CWr8BgI2mx5V1uhjzMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595689;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0//9TL7rmLS7kfIAheavUiS39Hcdjo0xCiEK3aLtVLA=;
	b=0Z2vh55BGw7xBJYMjScKVnjSOqHP/SsuyP7aL9XX5VoOKEGugIiM4xUEfID2/D5CadCl
	 21Y5qVNfqP6C93aqOlqJDotbaOMBxfeNWGZHrm60muORV9tgr30ldOW/a3xbpQfJ+P2xI
	 6Y7VuNZq/dCe/HnaV/4ZPpJU9uGtcMRAFqkmJM2bYV1pRpw5ltfxm3D5XRxuJ/Da3tEvs
	 +cvWWZiDZiSoZESQNawINwOuk5ADZqY3XcnEKuwCKttE2tb6ixF13kUuh6B3I0qVsG5yW
	 4igDP2dtG27XyPYGI9BK/9Mdkn+zZAFZNvAxUJ7xvBwHv25BzookxmWQYzr5CNIEmAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VlUHVr6l;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11ED606A881;
	Fri, 13 Nov 2026 18:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A11ED606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VlUHVr6l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794595688; x=1826131688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5pTWQcwK0XdPbQxUAxYzfzPYscFmN3lR6bahUqZXGuw=;
  b=VlUHVr6lIuEPWP5r9tRfMmYlOKHVC2ReLF/gcYhyJ/qiNkbQdcU26V6f
   vyNcyJzUDe4/QCC/wsNRoQg6OJEhSXxfGtaIZTjd4hkKeofYfVKLmXmBP
   cVmJA5lSYBW2w4vkHUbuCv5Ff/xmj9Fc+06tw2AH2e5/d4fC7RoblFdR6
   jVslBJ8s1wbL7J/6ofxfB0W7ERDBTW4d9sG/bUkMd1aAFT9bOJ8pcYQ2u
   aQoPu6TrXcm89nXlJd+KjH8iFbLUY038Mhki0mR09jRsCoqF0AFo4JbOO
   HOeU8WjD9IU+MaIXAK7FB0bNYR6h1M5c7SOCyMmjvjrWMkuLnzcRnfmef
   w==;
X-CSE-ConnectionGUID: JWQ6BNJaRG+zSvVjTOA6lQ==
X-CSE-MsgGUID: J9mO4tvYQ2+E2+8z0M9Ayw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3268930"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3268930"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:48:07 -0800
X-CSE-ConnectionGUID: sH069wQqTkaiJrfV5OOMwA==
X-CSE-MsgGUID: ROTh8UYjQLSp3tfMbPV3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9523508"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2026 10:48:05 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRwJd-000000013hF-12E7;
	Fri, 13 Nov 2026 18:48:01 +0000
Date: Sat, 14 Nov 2026 02:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	netfilter-devel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf,v7 4/6] netfilter: nfnetlink_queue: restrict NFQA_EXP
 to userspace helpers
Message-ID: <202611140202.rnnhGYL0-lkp@intel.com>
References: <20261112221106.2278789-4-pablo@netfilter.org>
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
In-Reply-To: <20261112221106.2278789-4-pablo@netfilter.org>

Hi Pablo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20261112]
[cannot apply to netfilter-nf/main nf-next/main v7.4-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nfnetlink_queue-consolidate-access-to-hook-entries-on-reinjection/20261112-231102
base:   linus/master
patch link:    https://lore.kernel.org/r/20261112221106.2278789-4-pablo%40netfilter.org
patch subject: [PATCH nf,v7 4/6] netfilter: nfnetlink_queue: restrict NFQA_EXP to userspace helpers
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261114/202611140202.rnnhGYL0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140202.rnnhGYL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140202.rnnhGYL0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nfnetlink_queue.c:387:32: error: use of undeclared identifier 'NF_HOOK_OP_CONNTRACK'
     387 |         return (ops->hook_ops_type == NF_HOOK_OP_CONNTRACK &&
         |                                       ^
   1 error generated.


vim +/NF_HOOK_OP_CONNTRACK +387 net/netfilter/nfnetlink_queue.c

   383	
   384	#if IS_ENABLED(CONFIG_NF_CONNTRACK)
   385	static bool nfqnl_hook_exp_support(struct nf_hook_ops *ops)
   386	{
 > 387		return (ops->hook_ops_type == NF_HOOK_OP_CONNTRACK &&
   388			(((ops->pf == NFPROTO_IPV4 ||
   389			   ops->pf == NFPROTO_IPV6) &&
   390			  (ops->hooknum == NF_INET_LOCAL_IN ||
   391			   ops->hooknum == NF_INET_POST_ROUTING)) ||
   392			 (ops->pf == NFPROTO_BRIDGE &&
   393			  ops->hooknum == NF_BR_POST_ROUTING)));
   394	}
   395	#endif
   396	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
