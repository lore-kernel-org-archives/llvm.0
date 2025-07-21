Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885E22CBE9;
	Mon, 21 Jul 2025 17:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753118950; cv=none; b=py1MtubFlYt8YhPBx8mY58W3t/mqJeXVuASM+m092N9O75VLOPdvVuWOYGLxOJ8pn9HX02sJJpSROT8bG0RuXrxIiPYZEFTMFFnxqvejCFES0tTUtPl5+Km52AA8fSiF2U+axlmFlrOSVtZlXVZB5SDdr8vpLPk+K9BVPaJa4uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753118950; c=relaxed/simple;
	bh=B8N6WxM+v8XOq0Vq34N67AdT6Tg5qewYqoq0XjzmhMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYX7CXb0S/i9VwZxUJb5lR/XGT31tZqhAar7Uro14a0eN1g2LDIdaSwdl8d7nwAb3IEZyRVazGwSDika1c33z1u+zXdEAZo6ext82ccz/fLZdd1tVMsd9lSrQKFozrJ4A1j1iMO1JK6ij63DReVCE6DiEh+PgOZFvzDCd2a3+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6EONrxQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6EONrxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753118949; x=1784654949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8N6WxM+v8XOq0Vq34N67AdT6Tg5qewYqoq0XjzmhMY=;
  b=B6EONrxQnhfsTChYD+4AWzl2HrFhag/By+PYGncL64XrHe0JecZDe620
   xYZJY4cR0ZjTkCBXInXetM68Q806YBgX8bYtlj5p8Rzq97Fur4ZFeZcyD
   T2+0oi8im2aH8PENMq5JXvp6Oonnorfhs2b1estBKYyK0zjqnP9gqnXbN
   duR9G0m6MsuyYdzJleh6Xihg1gr8DBLFTccuVmSfDdUDCAez56NBvCzl4
   2mCsA3q72caIadA3o1GPXFTXPNz4v1mn7lxFZwKREggc75IHwN+HHSbsO
   Fh3oDoyzBiB0bFcFaY9fWWINjvJHVkl+dghfJ/zEDIbsn7a6iEe7MN+u4
   A==;
X-CSE-ConnectionGUID: mR5CAHa3QpOe0AkeAqsw/g==
X-CSE-MsgGUID: dkG+e2/2SFKtOE5a+uZAqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55286815"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55286815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 10:29:08 -0700
X-CSE-ConnectionGUID: QlR1Fjn/Rf+FBkC9266sQA==
X-CSE-MsgGUID: jyUa+hUEQEivMclXV/4H8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158202195"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 10:29:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uduJx-0000000HOV6-11Cc;
	Mon, 21 Jul 2025 20:29:01 +0300
Date: Mon, 21 Jul 2025 20:29:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10] staging: media: atomisp: fix indentation in aa, anr,
 and bh modules
Message-ID: <aH543MEsDbnhRzM8@smile.fi.intel.com>
References: <20250718-new_atomisp-v10-1-54bdff660058@gmail.com>
 <8f7db034-6b38-44c3-b841-ef4bc1db3973@suswa.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f7db034-6b38-44c3-b841-ef4bc1db3973@suswa.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 18, 2025 at 07:06:10PM +0300, Dan Carpenter wrote:
> On Fri, Jul 18, 2025 at 11:02:14PM +0800, LiangCheng Wang wrote:
> > Fix tab/space indentation and move a standalone kernel-doc
> > comment of the 'strength' field of the struct ia_css_aa_config
> > to the whole-structure one.
> > Align with kernel coding style guidelines.

...

> >  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> >  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> >  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> > -		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
> > +		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> 
> No need to add a comma to this line.  The comma at the end of the line
> is useful when we might add another element to an array.  But here the
> length is fixed.

Still, it's good to have it to avoid any additional churn in case it
might be extended. We can argue if this needs to be a separate commit
from the main topic of this patch.

> If someone were to add a comma here and it was new code, then that's
> fine.  But I don't want to have to review a separate patch which only
> adds a unnecessary comma.
> 
> >  	},
> > -	{10, 20, 30}
> > +	{ 10, 20, 30 },
> 
> Same here.  This comma serves no purpose.  We can't actually add
> anything to this struct.  What would be actually helpful would be to
> use designated initializers.

Here we touched the line, and adding trailing comma just reduces a potential
churn in the future. I can show you plenty of changes when patch touches
unrelated line just for the sake of adding a new one after the affected.

...

> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> index 899d566234b9..3de7ebea3d6e 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> @@ -11,14 +11,14 @@
>  #include "ia_css_anr.host.h"
>  
>  const struct ia_css_anr_config default_anr_config = {
> -	10,
> -	{
> +	.threshold = 10,
> +	.thresholds = {
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4

With the trailing comma it will be better for the consistency in this case.
Otherwise I like your approach.

>  	},
> -	{10, 20, 30}
> +	.factors = {10, 20, 30},
>  };
>  
>  void
> 
> I added a comma to the end of .factors because there is a 1% change we
> will add a new member to the struct and it's the right thing to do.  I
> was already changing that line, so I'm allowed to make tiny white space
> changes like this.
> 
> But notice how I left off the comma after the numbers.  That array is a
> fixed size and nothing can be added.  Leaving off the comma communicates
> that.  Also there was no need to change that line.  It's unrelated to
> using desgnated initializers.  If you added a comma, you would need to
> send a separate patch for that with a commit message to describe and
> justify it.  As a reviewer, I would need to go through the line
> carefully and verify that none of the other numbers had been changed.
> 
> The commit message for the above patch would say, "Use a designated
> initializer for default_anr_config.  It helps readability."  There would
> be no need to mention that "I added a comma" to the end of the .factors
> line because it's a minor thing that we're not really stressed about.

-- 
With Best Regards,
Andy Shevchenko


