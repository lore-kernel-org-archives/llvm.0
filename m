Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF5353EDF
	for <llvm@lists.linux.dev>; Mon, 31 Aug 2026 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159789; cv=none; b=AXADlcINtoHxyYEic0CglGDKC4oTu2f1hDrZCkcbM+/zXNNmRJXmX0iktVIMizj31H6DX14W3pHDbgpnsE2bNmhsuvuxFgyP+ACWYA1eVybkc3rVBA/l+EhQFFhlC9aoyLHT8UEf+uxYIgYV1kT2wWAH28on7DLVulhmy4RUMqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159789; c=relaxed/simple;
	bh=tEfPp9moaoAegRWEnHLHmxQWhnps5eCK5n7ek3DwDyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Og7BcolMO21Zobbsfad1gtwRoapt6JDfaJ+bLHKGUUvYd+Pen450zoz5fdEAOFvFJx44GgEmOAV8A9CpE/916kvkNzy/biiyUuAPKy6XZpEE7BiPmFdlGnKpfcktub/ybKFPUT3L0VVjorRR31NxqURkg0JhFvCsubkAVCAi0bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMia7ORf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMia7ORf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788159788; x=1819695788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tEfPp9moaoAegRWEnHLHmxQWhnps5eCK5n7ek3DwDyA=;
  b=hMia7ORfr1cWWOotHbqihPX3smP6cI/n4cwCor9iw3m2DKMTGaud94DV
   fSLjU7RBV+s0tOyjK0qOQCcMtj1GI7P+rZ1jC3vcMWYCUxm/dOjCQfNHt
   M4EXZjmKSVCP9NBo5lvzXULgUGvka8bnn9crfZZcDJNsXnsT8Bty7/tGx
   lsXCyCtZdCSEcyRG3bfC50YlExTPUbg3MVuNKRBeWzIKi5gYUjPQXhZG5
   Z4nvhnKIamI59VxK3hEpj/pbH0my5+Z05R9hqhwOgYN7/vzgn+d2H6DX6
   DXqpOzq9s2S8UspVWesHQr7IGp5XD6xER81mSoUK5Damr/HJSACBQ06Qu
   w==;
X-CSE-ConnectionGUID: z+ouEXuHQJSmCEFzFxdQyw==
X-CSE-MsgGUID: V4E+jsYuRCWSMVKvpyBZ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88412115"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88412115"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:03:07 -0700
X-CSE-ConnectionGUID: pnHNht7mTRGQRpCb233NNQ==
X-CSE-MsgGUID: ZrwiD6Z/QGqGnMbzweiW2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292222694"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:03:03 -0700
Date: Mon, 31 Aug 2026 10:03:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rupesh Majhi <zoone.rupert@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/6] iio: pressure: dps310: add triggered buffer
 support
Message-ID: <apUnJb6jODnbSw42@ashevche-desk.local>
References: <20260824201203.396651-1-zoone.rupert@gmail.com>
 <20260824201203.396651-5-zoone.rupert@gmail.com>
 <ao1bBFkLXIIgNl49@ashevche-desk.local>
 <178813690647.2788519.5367342639957476343.b4-reply@b4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178813690647.2788519.5367342639957476343.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 01:41:46AM +0100, Jonathan Cameron wrote:
> On 2026-08-25 12:06:12+03:00, Andy Shevchenko wrote:
> > On Mon, Aug 24, 2026 at 11:12:01PM +0300, Rupesh Majhi wrote:

...

> > > +struct dps310_scan {
> > > +	s32 channels[2];
> > > +	aligned_s64 ts;
> > > +};
> > 
> > Wondering if using macro here would make sense...
> 
> Do you mean introducing a new one or using the buffer ones?  I'd
> rather keep explicit structures where possible.  They are much easier
> to reead as they make the data layout explicit, including the holes
> (as long as folk remember their c structure alignments!)
> - no holes here obviously!
> 
> We only introduced the IIO_BUFFER macros to cover the cases we
> can't represent as a structure because the timestamp moves
> around as the number of channels enabled changes.  Necessary
> trick to reduce the size of the kfifos.

Yeah, I got it. I need to remember your preference for the future.

-- 
With Best Regards,
Andy Shevchenko


