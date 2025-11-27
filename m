Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDE22F363A
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266591; cv=none; b=WNmJmUmN4/r3dEES1auMMpdl+g5z9SgPlbc/ASkc7qaUBDA4Zap+Vl9nX8RaF1ucHuxX81pN6b+6/OuCVZtAL3ZpH+5zHBtuSexDpB6InQ9NYuHHf0ilIyPOEiQ/Q+RyVGEtyfywdPVRG/gi1cESPWBMXaax+OHVQHO2SBmCgXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266591; c=relaxed/simple;
	bh=jr+sar5T/+6hulJrsWce23uDbzalLgb+DGFiRtA+CIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6iNXiXHitzyg1reyMbZj0C8WKtnZhfIqtHw32DdjVGLqB7/sdy50RuFHONdwqsCIRmSOM8CsJ7DeTJBmoXzgaDoXumAot0aAiERj4jF2ioRsntrC3Hfi6k/NeSftHWTpboMP9lmQxTBj9Cuthw132utIrApeLP0i0emdW+Jthw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8VeK/p3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8VeK/p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764266589; x=1795802589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jr+sar5T/+6hulJrsWce23uDbzalLgb+DGFiRtA+CIk=;
  b=n8VeK/p3faCdkZdASPwFGBQWeWyHmlaoifjxmmPWFbQDZ6S4BRg5fbXv
   qvctq/8ENU/O58E/b7lJguBoLdLHK9B0RPrt6nxz73K5vsaHvOzAJv31W
   trkdxYp4C0f9FhzP1W7MyJBOwRPhiJGhIXjYis3/kc+PVR3aCOgo8PiqU
   Gst7je+kc9sOGSP/RdxdvWP7Zv0leifd43ertGnahbn0yl4g6DosLEymU
   9FJJmOTl4wHfWU8rwiQYAPk8aUETEjMstUk4NDt4c3S6CqEM8ftjr89Tc
   HBG7L1IqUp2oxay7vw7kgjMJ2BkOqVE2sk0TjVDEOruLwEa3x8mzcBAR2
   Q==;
X-CSE-ConnectionGUID: oJZrCOPMQkajV/6su/WyVQ==
X-CSE-MsgGUID: 1uT5zsKUQ/Gh4SPRBywdlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53883641"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="53883641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:03:08 -0800
X-CSE-ConnectionGUID: zpGF1I0AQLON/Z81+MDeiQ==
X-CSE-MsgGUID: FKQWafcdRV6ii16yoaZUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="193179100"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:03:05 -0800
Date: Thu, 27 Nov 2025 20:03:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] nfsd: Mark variable __maybe_unused to avoid W=1
 build break
Message-ID: <aSiSV9SKClTZAVjy@smile.fi.intel.com>
References: <20251113083131.2239677-1-andriy.shevchenko@linux.intel.com>
 <176338731878.4204.10224670039692915729.b4-ty@oracle.com>
 <aSgCyqR72Zu6TSSI@black.igk.intel.com>
 <087f6258-a605-4e8c-9fa7-420ec12bef6f@kernel.org>
 <aSiCg0i4wMXk6QxV@smile.fi.intel.com>
 <52260b53-9ed8-400a-aaed-b1dc9e7910e9@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52260b53-9ed8-400a-aaed-b1dc9e7910e9@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 27, 2025 at 12:08:09PM -0500, Chuck Lever wrote:
> On 11/27/25 11:55 AM, Andy Shevchenko wrote:
> > On Thu, Nov 27, 2025 at 11:20:16AM -0500, Chuck Lever wrote:
> >> On 11/27/25 2:50 AM, Andy Shevchenko wrote:
> >>> On Mon, Nov 17, 2025 at 08:49:29AM -0500, Chuck Lever wrote:
> >>>> On Thu, 13 Nov 2025 09:31:31 +0100, Andy Shevchenko wrote:
> >>>>> Clang is not happy about set but (in some cases) unused variable:
> >>>>>
> >>>>> fs/nfsd/export.c:1027:17: error: variable 'inode' set but not used [-Werror,-Wunused-but-set-variable]
> >>>>>
> >>>>> since it's used as a parameter to dprintk() which might be configured
> >>>>> a no-op. To avoid uglifying code with the specific ifdeffery just mark
> >>>>> the variable __maybe_unused.

[...]

> >>>> Applied to nfsd-testing, thanks!
> >>>>
> >>>> [1/1] nfsd: Mark variable __maybe_unused to avoid W=1 build break
> >>>>       commit: 56e9f88b25abf08de6f2b1bfbbb2ddc4e6622d1e
> >>>
> >>> Thanks, but still no appearance in Linux Next and problem seems to be present.
> >>>
> >>
> >> The usual practice is to keep patches in nfsd-testing for four
> >> weeks to allow NFSD and community CI processes to work, and to
> >> enable extended review before it is merged. Both the community
> >> CI processes (eg, zero-day bots) and the availability of
> >> reviewers are not something I have control over.
> >>
> >> It will be available for upstream merge after December 11. You
> >> seem to be suggesting there is a sense of urgency so I will
> >> direct it towards v6.20-rc as soon as it is merge-ready.
> 
> Oops:
> 
> s/v6.20-rc/v6.19-rc/
> 
> 
> > Since it's (not so critical TBH, but still) a build breakage I supposed this to
> > go via the respective -fixes path.
> 
> Yes, what I meant above was I will submit it just after the
> v6.19 merge window closes in a few weeks.

Ah, that's wonderful, thanks!

> > But okay, your call.
> 
> It's just a build warning, but I know such issues affect the
> Fedora and Red Hat kernel build pipelines, as they enable the
> "warning => error" compile option.
> 
> However, those distributions enable SunRPC debugging, which
> means they won't see it. So I think this problem is not likely
> to be pervasive.

-- 
With Best Regards,
Andy Shevchenko


