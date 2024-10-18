Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF9205132;
	Fri, 18 Oct 2024 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729277167; cv=none; b=aq461/XWt3LDMld1Tp4ABHLFih/QFoaJNfqPmiI65zXnySqVsuRes8bAvdENv66EwWOQZ8AOI3Z7EpYbHorgVJAdnfEu7lkOwGhHrkZCVZPKD683X9ErrP8tYxK2wEEjR+5z1e/45tmfKJZacCgGtLWrwSognY9FQO8gzz0sUcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729277167; c=relaxed/simple;
	bh=hhnA/YPn+ZYS6jHFvDtwSH23zI1zQIo3jP9zrP6+kWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJidImWb0W56Gs5TQ7bblltedWkHAdiqErn6d7WNleKURx9VqgT5Z524+0qzKinglXa1zBtzX0ju+FdUO+kugreHWZoXC6EJINTxzP6PO6BQZARQSFbnsgwwDIBs/TbVd05+IAh54fNrvwwILR24LNJVBxS44qVl5llj/eRljho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcKgZ5Lg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcKgZ5Lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729277166; x=1760813166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hhnA/YPn+ZYS6jHFvDtwSH23zI1zQIo3jP9zrP6+kWo=;
  b=YcKgZ5LgQLju3CMyTEU0o9Ikf6c5CMUsi/9xlhy5PJR9tOqodKClROR6
   yevRV15ezS36txy7bxGP0KvTzATd0r1HqgeKhH0U2hY9xmOKWxrQa2se2
   2koE0zV/5RE6wEMbMaltTRiLfoUZOdXPIp7gMJ2MqHczoYDlTegzXKQTv
   LLyQSG8jc56Em1+TB0ZXxaGsHcQTSUMVSs6rnpE97DK1hj0gzHaUu0YJT
   h4FpfvSoF3jaiQYOYhniyjVi/POBIFTBpwK0BSix7f8aZSMJYFbLrpPvx
   1b0Y63MzafblsUmy3b9cDcD3uaQWusEm92zD9d7GHAcDumRYbTK9ZQ+rw
   w==;
X-CSE-ConnectionGUID: H8R2q9uiRV+u+Wo7wrcIyQ==
X-CSE-MsgGUID: 6z0xN5z5TLGdyUv/rwsZrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40182412"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="40182412"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 11:46:02 -0700
X-CSE-ConnectionGUID: rTaJe69eTFeoS9dDHVIEqw==
X-CSE-MsgGUID: aF8o4rsESfiI8g3cWEwhag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="83571245"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2024 11:45:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1rz1-000OBl-1s;
	Fri, 18 Oct 2024 18:45:55 +0000
Date: Sat, 19 Oct 2024 02:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: chia-yu.chang@nokia-bell-labs.com, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, dsahern@kernel.org, ij@kernel.org,
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Olga Albisser <olga@albisser.org>,
	Olivier Tilmans <olivier.tilmans@nokia.com>,
	Henrik Steen <henrist@henrist.net>,
	Bob Briscoe <research@bobbriscoe.net>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: Re: [PATCH net-next 1/1] sched: Add dualpi2 qdisc
Message-ID: <202410190238.xwFjIctf-lkp@intel.com>
References: <20241018021004.39258-2-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018021004.39258-2-chia-yu.chang@nokia-bell-labs.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/chia-yu-chang-nokia-bell-labs-com/sched-Add-dualpi2-qdisc/20241018-101154
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241018021004.39258-2-chia-yu.chang%40nokia-bell-labs.com
patch subject: [PATCH net-next 1/1] sched: Add dualpi2 qdisc
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410190238.xwFjIctf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190238.xwFjIctf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190238.xwFjIctf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sched/sch_dualpi2.c:536:12: error: call to undeclared function 'skb_sojourn_time'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     536 |                 qdelay = skb_sojourn_time(skb, now);
         |                          ^
   1 error generated.


vim +/skb_sojourn_time +536 net/sched/sch_dualpi2.c

   527	
   528	static int do_step_aqm(struct dualpi2_sched_data *q, struct sk_buff *skb,
   529			       u64 now)
   530	{
   531		u64 qdelay = 0;
   532	
   533		if (q->step.in_packets)
   534			qdelay = qdisc_qlen(q->l_queue);
   535		else
 > 536			qdelay = skb_sojourn_time(skb, now);
   537	
   538		if (dualpi2_skb_cb(skb)->apply_step && qdelay > q->step.thresh) {
   539			if (!dualpi2_skb_cb(skb)->ect)
   540				/* Drop this non-ECT packet */
   541				return 1;
   542			if (dualpi2_mark(q, skb))
   543				++q->step_marks;
   544		}
   545		qdisc_bstats_update(q->l_queue, skb);
   546		return 0;
   547	}
   548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
