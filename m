Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA33D188A0B;
	Sun, 22 Sep 2024 00:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726964474; cv=none; b=EmR2lAnjpY7k17DnOLlJgILxRvp75zTxlp6iCYGL2GNEL++eWnYoCAELerVwjE+ZHostVNW2dqzsFQVxfGXmcaBt9lZb3aCQbnT/WatJx4np586Jmj5lbSvhFDMh6mGCSLWvSmTHZ5hERFH83hFYkeeS1YoijSOJatEx1oj35yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726964474; c=relaxed/simple;
	bh=GtpDK+uYMVpmXuWjmMvCl5rLi54XtEDLybE0Ub4psQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuRscKg/+lGRp7ZzxJ8C9VG+zpzMOfmGEPEHAKVghplymJ9Tk31bvzD+9Fl/6Lf9xR6DrTphSuNhEqDJvAOvtC0iHGL0WFOQABg82lPsGzO/1TqLU2vMdsOy8SmvGqDzQY2EupI0YCXHMm0V6ucn2IxXec8gBqsZ8GbDwIsNu6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+6tTMp3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+6tTMp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726964472; x=1758500472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GtpDK+uYMVpmXuWjmMvCl5rLi54XtEDLybE0Ub4psQI=;
  b=C+6tTMp3g+cAGuTBJHqBR0oCdKvihwfHMj6TRq2rYD+mYq0RCQMm8D8t
   AXRdU4aZyQIirM1Szq1mhmMvtZKuJg7gA6Qnzxr4oK6W+3aiBsdSqJ5mT
   SJWAv1LSNuyrbrmw1g4/+ubqaOSxSBjLV3ioHMBMyhPFac9IAZNrVdG2c
   fxtACrNFNpcl2OERnG7puCWRgicxIaVqh+Qq7xW8DNRX0TgReXEc3i2z+
   qSegFkiYAYXSw0P4+aTq4MZK4F+FV8kCyJwNc5+ENfZUQxpV0Z2iC8ID+
   vJhGMdk93+Q5mMDZIahzq+MIyL37YZVd5AEEukf44402QlFsZj07mbAEo
   Q==;
X-CSE-ConnectionGUID: cU98SqTAQ8GdNiF+QdHFPA==
X-CSE-MsgGUID: SbjtvZR3Sb6sM825kiFZgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25420893"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25420893"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 17:21:11 -0700
X-CSE-ConnectionGUID: 9O1ckiKtRluQrhbCoa+WjQ==
X-CSE-MsgGUID: 0PxqkILTQGaUT40NNcMBXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="70269683"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2024 17:21:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssALc-000Ftm-0C;
	Sun, 22 Sep 2024 00:21:08 +0000
Date: Sun, 22 Sep 2024 08:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net/smc: Introduce a hook to modify syn_smc
 at runtime
Message-ID: <202409220838.lnpJlKYJ-lkp@intel.com>
References: <1726654204-61655-1-git-send-email-alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1726654204-61655-1-git-send-email-alibuda@linux.alibaba.com>

Hi Wythe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/net-smc-Introduce-a-hook-to-modify-syn_smc-at-runtime/20240918-181133
base:   net-next/main
patch link:    https://lore.kernel.org/r/1726654204-61655-1-git-send-email-alibuda%40linux.alibaba.com
patch subject: [RFC PATCH net-next] net/smc: Introduce a hook to modify syn_smc at runtime
config: i386-buildonly-randconfig-003-20240922 (https://download.01.org/0day-ci/archive/20240922/202409220838.lnpJlKYJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220838.lnpJlKYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220838.lnpJlKYJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/smc/af_smc.c:194:36: error: no member named 'skc_v6_daddr' in 'struct sock_common'
     194 |                 rmt6_sockaddr->sin6_addr = ireq->ir_v6_rmt_addr;
         |                                            ~~~~~~^~~~~~~~~~~~~~
   include/net/inet_sock.h:74:42: note: expanded from macro 'ir_v6_rmt_addr'
      74 | #define ir_v6_rmt_addr          req.__req_common.skc_v6_daddr
         |                                                  ^
   1 error generated.


vim +194 net/smc/af_smc.c

   167	
   168	static void smc_openreq_init(struct request_sock *req,
   169				     const struct tcp_options_received *rx_opt,
   170				     struct sk_buff *skb, const struct sock *sk)
   171	{
   172		struct inet_request_sock *ireq = inet_rsk(req);
   173		struct sockaddr_storage rmt_sockaddr = {0};
   174		const struct smc_sock *smc;
   175	
   176		smc = smc_clcsock_user_data(sk);
   177	
   178		if (!smc)
   179			return;
   180	
   181		if (smc->limit_smc_hs && workqueue_congested(WORK_CPU_UNBOUND, smc_hs_wq))
   182			goto out_no_smc;
   183	
   184		rmt_sockaddr.ss_family = sk->sk_family;
   185	
   186		if (rmt_sockaddr.ss_family == AF_INET) {
   187			struct sockaddr_in *rmt4_sockaddr =  (struct sockaddr_in *)&rmt_sockaddr;
   188	
   189			rmt4_sockaddr->sin_addr.s_addr = ireq->ir_rmt_addr;
   190			rmt4_sockaddr->sin_port	= ireq->ir_rmt_port;
   191		} else {
   192			struct sockaddr_in6 *rmt6_sockaddr =  (struct sockaddr_in6 *)&rmt_sockaddr;
   193	
 > 194			rmt6_sockaddr->sin6_addr = ireq->ir_v6_rmt_addr;
   195			rmt6_sockaddr->sin6_port = ireq->ir_rmt_port;
   196		}
   197	
   198		ireq->smc_ok = select_syn_smc(sk, (struct sockaddr *)&rmt_sockaddr);
   199		return;
   200	out_no_smc:
   201		ireq->smc_ok = 0;
   202		return;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
