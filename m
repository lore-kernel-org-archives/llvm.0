Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA818755F
	for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725956214; cv=none; b=XDbNADvC/HBe0RTuFh1eaSmeEfz28v+MfOYd0xbN3uWiuSL7CgxLohO8gfpNlGStYRIC6Ayti9vREWOl5Awm3r7qprBUAl80qMXySF/mtuOYDmzPYWwcAwk7FuqaKNmZLr0yAnO7RZuHVxf+NtyJDwBusJUNsHtewbXCJy/nPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725956214; c=relaxed/simple;
	bh=Gmi0B1WVDp62TSZ8fmfRXolEdSN6lejtPI4cLiqA1yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzVjzoY4T/Ma/Egz51NqnZO+JAuR1NQt7a79oCqKcnJOxfDCy5gdZk7JU+B/xr447GB7NPykM/5kfPqmSkaqvBt5AGo+fhh2nw17TeLOdQdaDh6VyZ1SRbtEbdeY574APaB4u2GEiCMuCEVLa1Zn3lo/psxjfOU3zSQTrpyCAU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ht7bhrVO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ht7bhrVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725956212; x=1757492212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gmi0B1WVDp62TSZ8fmfRXolEdSN6lejtPI4cLiqA1yI=;
  b=ht7bhrVOTE8dSWW0T6GCDikSsCMQRyIEiiCNxjYe+BR/+9F+HUBaKNUy
   8Z5ja8rV4JeLBVWMFLjC57UAE1ezsgv5B3XQ4pVE6Kwdvs5zEVYJ+/9nt
   is5O9GZvpPz0soepEp6vGUvTAmFAON9YdfFEyJ8BMuAIskshvo1wK9VdL
   EH/xzCudhpgDmi+zVQWRx2GxkWWXaTugj4wD5xpPsb2S3Eo4Q31RhVvJv
   0w4PWtnHnGmuf3Nu2C2dMt52nhDpqjc/gQ7SU4NCX3NppovWF5yTqfvQx
   t9eC/mWDoCOmQzCaQMxwNkLYaLAEN8CGRhs/6/eD6ZeYplZskrWsDWrh+
   w==;
X-CSE-ConnectionGUID: q9svevYVQu2NiCxW1ICadw==
X-CSE-MsgGUID: ldJe10H/Sx+H26pBo3gEoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="13452996"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="13452996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 01:16:52 -0700
X-CSE-ConnectionGUID: eapeOKirRjyKR/g/akarCg==
X-CSE-MsgGUID: MAEmedqoQh2vlKL22W52QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="104413303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 01:16:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snw3K-000000077Jh-2U1f;
	Tue, 10 Sep 2024 11:16:46 +0300
Date: Tue, 10 Sep 2024 11:16:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] locking/rwsem: Move is_rwsem_reader_owned() and
 rwsem_owner() under CONFIG_DEBUG_RWSEMS
Message-ID: <ZuAAbi7hRWz2DUte@smile.fi.intel.com>
References: <20240909182905.161156-1-longman@redhat.com>
 <ZuAAOmjTGYEFQJPC@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuAAOmjTGYEFQJPC@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 10, 2024 at 11:15:54AM +0300, Andy Shevchenko wrote:
> On Mon, Sep 09, 2024 at 02:29:05PM -0400, Waiman Long wrote:
> > Both is_rwsem_reader_owned() and rwsem_owner() are currently only used when
> > CONFIG_DEBUG_RWSEMS is defined. This causes a compilation error with clang
> > when `make W=1` and CONFIG_WERROR=y:
> > 
> > kernel/locking/rwsem.c:187:20: error: unused function 'is_rwsem_reader_owned' [-Werror,-Wunused-function]
> >   187 | static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
> >       |                    ^~~~~~~~~~~~~~~~~~~~~
> > kernel/locking/rwsem.c:271:35: error: unused function 'rwsem_owner' [-Werror,-Wunused-function]
> >   271 | static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
> >       |                                   ^~~~~~~~~~~
> > 
> > Fix this by moving these two functions under the CONFIG_DEBUG_RWSEMS define.
> 
> At least this solves my issue,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...and

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


