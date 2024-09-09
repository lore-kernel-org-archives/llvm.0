Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6DBA4B
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896291; cv=none; b=qx5tJ1b5CUI8gVBQqxQcox+2loatq9iu1Y/SfZCGyZWpA/7qkYqQeVZkCtrzQjRvwLaQfRguwpd+xn95PZfzPhVBJjajfK39VzbPvl5oe5qP09nQlqIpBUWzDG6PntXEUWqD+rhO9Gv5EdxO3M2cnnERsDXKItvrq2lB8Y3P/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896291; c=relaxed/simple;
	bh=lqLuuXa9R/BJfjELxzUvQapnNWsHBC63Gvs0vJ9+DlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLKwoazzUfBMREnefSB2geo9kWFT5kBOyZzBZ+bDZ7Zh3N34jl/5c5pEakYf0napYvRA0zSfvB0HMXYB21xdAmKqkhGDqSwM45BubFMFxINrOnpkkuGbjHB3EuM9olapUI6T2KTixP/lOwtJI67CdlkaZMStezISBfX6E47syXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoLEfsfF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoLEfsfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725896289; x=1757432289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lqLuuXa9R/BJfjELxzUvQapnNWsHBC63Gvs0vJ9+DlY=;
  b=RoLEfsfFHf4jn+IB2UFEpT1SwCXFW86FdccKGlnq/WXOGXXeryp1LvkN
   3GEQy5yGKkYadf6Oj0r0SV42iLcgcr9kaveDrosoJFwWfn9QruUCEMgGC
   K6zrnTrmp8I57+1bmj+b0UPWYPMYORSdIg3vvibBxcV3FPeKTJyISUf37
   U6LebDvXDFiwiKZfLrXOVtOtDUgK54nV+PeRRilvs7v1WbjqOkQH5kErB
   XcJmx7UAIJcXVqvHaSR+hPbijLNZwa3PJ4E7EpVshOemQY/ktdhYsqMsb
   OmE073vjYZVQIrjO5jzcXptY3rwurCZl3ggCTG1t8xmF2ihUoEvuFvT82
   w==;
X-CSE-ConnectionGUID: deNdhlwrTT2TJyxCK2mweA==
X-CSE-MsgGUID: u4X2fFWZSbKW2tr9s08Lig==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24401247"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24401247"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:36:14 -0700
X-CSE-ConnectionGUID: Q8jdKuSbRiGleBHvcNTbBw==
X-CSE-MsgGUID: P1n01+ITRQSUx+NXJv5i0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66678383"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:36:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sngQx-00000006r9G-3voN;
	Mon, 09 Sep 2024 18:36:07 +0300
Date: Mon, 9 Sep 2024 18:36:07 +0300
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
Message-ID: <Zt8V5xjrZaEvR8K5@smile.fi.intel.com>
References: <20240905203612.333421-1-andriy.shevchenko@linux.intel.com>
 <20240906162938.GH2097826@kernel.org>
 <Zt7B79Q3O7mNqrOl@smile.fi.intel.com>
 <20240909151712.GZ2097826@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909151712.GZ2097826@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 09, 2024 at 04:17:12PM +0100, Simon Horman wrote:
> On Mon, Sep 09, 2024 at 12:37:51PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 06, 2024 at 05:29:38PM +0100, Simon Horman wrote:
> > > On Thu, Sep 05, 2024 at 11:36:12PM +0300, Andy Shevchenko wrote:
> > 
> > > Local testing seems to show that the warning is still emitted
> > > for ctnetlink_label_size if CONFIG_NETFILTER_NETLINK_GLUE_CT is enabled

Hold on, this is not related to the patch.
It might be another issue.

> > > but CONFIG_NF_CONNTRACK_EVENTS is not.
> > 
> > Can you elaborate on this, please?
> > I can not reproduce.
> 
> Sure, let me retest and get back to you.

-- 
With Best Regards,
Andy Shevchenko


