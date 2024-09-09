Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7568F1B29B3
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725874014; cv=none; b=GjWHMj4lVdvmHxhDOodgwPAWDiqXDjDfUWDXG+3IByPk4iD3YlVBQK/OaN+5iyith1UAaPjFfdfgRPjgKuZM+dhNN2lYl2dO2nprhIEJfCXnRW5ZDZcv7B2uBYpaa+KaizvqXw/zT/JHsUBiYE/7UNNA203aZVLCR1dSZnjUnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725874014; c=relaxed/simple;
	bh=YMfDOUXP8QWcgZnPeCfOORRIXgzJrJORZJWFxCKAw1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4aQmBfL+qpT+vVte4NlNXPS5MXGJARrYUygGG5Idc1DRNdZ6yfdRCH6T89qT8SxyS01G1uMouig56uQnX4Bu+rKNy4NwiwcVSHCZwthJECqR/2JS3WPDHIWvBWfJXOovPn8PCwWKaRP5P2PoHc3dhcda0ilXM7SJ6/FFo7/HGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTt/3P2v; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTt/3P2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725874013; x=1757410013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YMfDOUXP8QWcgZnPeCfOORRIXgzJrJORZJWFxCKAw1U=;
  b=fTt/3P2vConG40Bvn1ZAhdFF7EHAW9k8d2pICOtAoYKnmnYwEa1qpDLs
   pBsd3L2VEDpHnZjQmImwhRB7pdfusxZ1UPlx4219Hs1vRuYFFoflnVSk8
   7PoOJHOr3oLfC2vldAgTJ6DTEVNLlX18VzafJADxSfMFCEGTk1Xv1c0lr
   zXlLW0RWq/CdcuodGWn/nP5Db1YrrYTuWibphorFa6ZLs23qbtAamNWDZ
   vWwoNkLPZVbAvSu7l0EMC3H4tWc+4UrvkfxDWxVGXHpuHrvdqYNVEy8da
   GD0SYo0Qe3IgJC5WDYitjGq8eJNVmlS2xCXiUt3Fu1dmmSVjSN1PQivOc
   w==;
X-CSE-ConnectionGUID: 7Ihac2oSTA60tlvHWYo9LA==
X-CSE-MsgGUID: ODAu34G4RNKNX52eLjCMDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24718766"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24718766"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:26:53 -0700
X-CSE-ConnectionGUID: 9SN7b16eQ7aeQERUUwenrQ==
X-CSE-MsgGUID: O8pxyOc7S7Gk/VEVAOIJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66324974"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:26:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snafP-00000006jXU-2nYN;
	Mon, 09 Sep 2024 12:26:39 +0300
Date: Mon, 9 Sep 2024 12:26:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Simon Horman <horms@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Felix Huettner <felix.huettner@mail.schwarz>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH net v1 1/1] netfilter: conntrack: Guard possoble unused
 functions
Message-ID: <Zt6_T2INKWSm7YK8@smile.fi.intel.com>
References: <20240905203612.333421-1-andriy.shevchenko@linux.intel.com>
 <20240906162938.GH2097826@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906162938.GH2097826@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 05:29:38PM +0100, Simon Horman wrote:
> On Thu, Sep 05, 2024 at 11:36:12PM +0300, Andy Shevchenko wrote:
> > Some of the functions may be unused, it prevents kernel builds
> > with clang, `make W=1` and CONFIG_WERROR=y:
> > 
> > net/netfilter/nf_conntrack_netlink.c:657:22: error: unused function 'ctnetlink_acct_size' [-Werror,-Wunused-function]
> >   657 | static inline size_t ctnetlink_acct_size(const struct nf_conn *ct)
> >       |                      ^~~~~~~~~~~~~~~~~~~
> > net/netfilter/nf_conntrack_netlink.c:667:19: error: unused function 'ctnetlink_secctx_size' [-Werror,-Wunused-function]
> >   667 | static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
> >       |                   ^~~~~~~~~~~~~~~~~~~~~
> > net/netfilter/nf_conntrack_netlink.c:683:22: error: unused function 'ctnetlink_timestamp_size' [-Werror,-Wunused-function]
> >   683 | static inline size_t ctnetlink_timestamp_size(const struct nf_conn *ct)
> >       |                      ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Hi Andy,
> 
> Local testing seems to show that the warning is still emitted
> for ctnetlink_label_size if CONFIG_NETFILTER_NETLINK_GLUE_CT is enabled
> but CONFIG_NF_CONNTRACK_EVENTS is not.

Hmm... Let me try that. I am using mostly x86_64_defconfig for the testing.
The idea is to have once x86_64_defconfig to be clean with W=1 and since then
it will be easier to enable it unconditionally for CIs for _that_ particular
configuration(s) ("s" in case of i386_defconfig to be at the same level).

> > Fix this by guarding possible unused functions with ifdeffery.
> > 
> > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build").
> > 
> > Fixes: 4a96300cec88 ("netfilter: ctnetlink: restore inlining for netlink message size calculation")
> 
> I'm not sure that this qualifies as a fix, rather I think it should
> be targeted at net-next without a Fixes tag.

Okay.

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko


