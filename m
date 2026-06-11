Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412EF4F1;
	Thu, 11 Jun 2026 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781137545; cv=none; b=V90MvqLifBkyVH/XDgs2Lv4UsDdvMHFxFTETtcnOKzO2mfGI6jKHVyUldwMdI5kK8rQc2GfEea+XmVRf99bOY01b3/bl7xAupB62yORw18GxS+vQXYBCneGqcAcPUlVvd6tFTEXDQD/ZV3/yc7v6KqeTeYspl7jKVwRdNX2htn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781137545; c=relaxed/simple;
	bh=gmZbWdzIEcJhXHIfN2s+kegfAO97qE7D0Lf2NkrabiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu4RvuCZvDDOi7ZJCu6Hu7vLkfB8tK9AqqZLSaoUoNP2JaoMO0fQmhe64vC/qtr9jHWHu21uFpRA62i4SawMGZcnK+gwxa2QIZDQb6SedIhG3c0+c3gL7OyxdbL6c1CmPxy7HaOf+Zc4Ci/TWVxyz3j93Vqt4MJXyx1OvHcti14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=NZ3GNzI+; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="NZ3GNzI+"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 9ACBE6017D;
	Thu, 11 Jun 2026 02:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1781137541;
	bh=s8O63YswwxlErLKBYDq/8shmH2Zn95OA1SzcTyboniE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZ3GNzI+MMC/BcVRRmQQ3fHrd5yeeYnASvKbBLTLLJvE3kXdVVNbV68RF6+0VSRAJ
	 jsX9dl2ae2qyhS4iRBBrfODBL5+qgxPWbK5oakjq9kmROPzTCOi5hBb/uDWrp6DJMC
	 heulRZc+NOSfDdBoWv8hLaN/wz5D8swUbG6y5goutBgCDIrscPnCK/maauC8ERxSMf
	 AKZKDaNEov4BkPcmCy+eY+dChotUGQm0RuCKKblQEuUpmU78l6JzuV8bYwZOVFhvx6
	 8lX2wvyqfPuT9UWzdKGSh0/J0Lg9jgyOud7DDJz5R9kTByJe3dtGXYnOuCoAiXxhR5
	 UQla0rSoiUjSA==
Date: Thu, 11 Jun 2026 02:25:39 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: net/netfilter/nfnetlink_cthelper.c:227:6: warning: variable
 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <aioAgw4VQVAL78nj@chamomile>
References: <202606110148.Pn8XckYm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202606110148.Pn8XckYm-lkp@intel.com>

On Thu, Jun 11, 2026 at 01:32:48AM +0200, kernel test robot wrote:
> vim +227 net/netfilter/nfnetlink_cthelper.c
> 
>    209	
>    210	static int
>    211	nfnl_cthelper_create(const struct nlattr * const tb[],
>    212			     struct nf_conntrack_tuple *tuple)
>    213	{
>    214		struct nf_conntrack_helper *helper;
>    215		struct nfnl_cthelper *nfcth;
>    216		unsigned int size;
>    217		int ret;
>    218	
>    219		if (!tb[NFCTH_TUPLE] || !tb[NFCTH_POLICY] || !tb[NFCTH_PRIV_DATA_LEN])
>    220			return -EINVAL;
>    221	
>    222		nfcth = kzalloc_obj(*nfcth, GFP_KERNEL_ACCOUNT);
>    223		if (nfcth == NULL)
>    224			return -ENOMEM;
>    225	
>    226		helper = kzalloc_obj(*helper, GFP_KERNEL_ACCOUNT);
>  > 227		if (!helper)
>    228			goto err_cth;

This seems to be running on an older patch.
