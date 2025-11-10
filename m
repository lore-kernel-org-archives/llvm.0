Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CCA32E124
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 19:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803793; cv=none; b=JjcZwwKG/NY9JYIapTi4hr20hortwNL3RiJivyqrNqyQJlPD3OhXimkalbTn50N6Tph93/3Cf6mrHveITnmOzr/cgHcaI41Mm9U4ig07rUU2CUkvX73odGJX/NIVNhoqiTMT8Qy9PPXjZZZOi48X3R2Mn6rhTFUf438vg7tq3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803793; c=relaxed/simple;
	bh=QSHlFYoUKaLYnTB/yrqv01KDjYzpun+I67rGHfCKgfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRNWLPiJ4uM+17CiDBrUiGSstwCC9H+Gol/z1CqowZlRRGurdVod3DVM5aiTQ5aEMRa5KO+Gu6PpqaM/kX5ATsawGjlTllKNPAHOgA/jcwNp3Ey5bvkQnAwksDZx/Zc+U4bXtOtxBFsFFjOYqE4T3l0YgFtmNwKRJc1iwntVB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/sPhGgG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/sPhGgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762803791; x=1794339791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QSHlFYoUKaLYnTB/yrqv01KDjYzpun+I67rGHfCKgfk=;
  b=d/sPhGgGlIEg4kHeNUYqiBuA49wxUEunFtq7WM7FCRVy8LDi9I04O1g2
   jQ/OwHtDdfKEr1ra5LTHe6YPQsSDvS2cB9a70oOBba6VAyuLqQMMXzBES
   pD3F/okhsueHP8yI5qULgA5ZPZY1y9BRI0ueJ73jR4lz3L8d6n3rQKIcq
   xQbbMtYl7fBipLsxJuojUm8mBb2/MBYPvptuoWqxNdfxr1btSMmeY+eEW
   87sZX+c2ksNKvfNaygUMzHrnmcC3aCoeUkpVN0FDrbbs8dUwfFhajNApW
   eweB69kNYoBgVpgxL9IMMkN2dG5C3ZrWu3APdOtxjOb6u3xG9mSHr6S1j
   w==;
X-CSE-ConnectionGUID: Mtyt1kr5Sx6zt3uLAqs1Eg==
X-CSE-MsgGUID: uU8OAgclTxSLz97THg3dKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82488869"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="82488869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 11:43:10 -0800
X-CSE-ConnectionGUID: qhNizqkaTJei3WuDmBt06w==
X-CSE-MsgGUID: TLvjl9ytTOSBcZfMcFMTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="193944553"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.235])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 11:43:08 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vIXn7-00000007YoE-0hIS;
	Mon, 10 Nov 2025 21:43:05 +0200
Date: Mon, 10 Nov 2025 21:43:04 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"justinstitt@google.com" <justinstitt@google.com>,
	Xiubo Li <xiubli@redhat.com>,
	"idryomov@gmail.com" <idryomov@gmail.com>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"morbo@google.com" <morbo@google.com>
Subject: Re: [PATCH v1 1/1] ceph: Amend checking to fix `make W=1` build
 breakage
Message-ID: <aRJASMinnNnUVc3Z@smile.fi.intel.com>
References: <20251110144404.369928-1-andriy.shevchenko@linux.intel.com>
 <9f7339a71c281e9f9e5b1ff34f7c277f62c89a69.camel@ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7339a71c281e9f9e5b1ff34f7c277f62c89a69.camel@ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 10, 2025 at 07:37:13PM +0000, Viacheslav Dubeyko wrote:
> On Mon, 2025-11-10 at 15:44 +0100, Andy Shevchenko wrote:
> > In a few cases the code compares 32-bit value to a SIZE_MAX derived
> > constant which is much higher than that value on 64-bit platforms,
> > Clang, in particular, is not happy about this
> > 
> > fs/ceph/snap.c:377:10: error: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
> >   377 |         if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> >       |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Fix this by casting to size_t. Note, that possible replacement of SIZE_MAX
> > by U32_MAX may lead to the behaviour changes on the corner cases.

...

> > -	if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> > +	if ((size_t)num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
> 
> The same question is here. Does it makes sense to declare num as size_t? Could
> it be more clean solution? Or could it introduce another warnings/errors?

Maybe. Or even maybe the U32_MAX is the way to go: Does anybody check those
corner cases? Are those never tested? Potential (security) bug?

...

Whatever you find, in case if it will be not the proposed solution as is,
consider these patches as Reported-by.

And thanks for the reviews!

-- 
With Best Regards,
Andy Shevchenko


