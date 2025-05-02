Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF8254876
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194706; cv=none; b=X8A9fxyzA16xw3VXyhnzavw45KRti/dFUuVnpNThmTRm3n++449G//vjbYbyaayMgXeBHviEASDGtzCIu445A83gyPWc0/QeSrwEa1DeZ5jO54iAnX/Grm+TQO2UPB6K2kwHQytC0mnQKpq5+nnCJfbovQx9aLINhP8sg7oldx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194706; c=relaxed/simple;
	bh=2jBbUmVOB62hHyKFi47tXceA9+6d1vaBcgdLP5N/4fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYgGygVU+SA4M5SkGNlherHWgNUPkTeYeXVM/exI88Yfm520cHoZzx/60r6KXdhlFMw/tZ9O1et0GPTcpwsc3rALVJ3JFRqyO2Z6rlXZQK7JBhBznWo9XbNs7d9fIXvGSdBXqdZM7Zd2T8VjMcV6IoKvPHQJnFzYe9xum+uFlM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jo4tS0eE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jo4tS0eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746194705; x=1777730705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2jBbUmVOB62hHyKFi47tXceA9+6d1vaBcgdLP5N/4fE=;
  b=jo4tS0eEXX5oIZEJ83EbU42Sm+2K1KrWfn/NdEgIL83ugEaJgnY+aBln
   FW+p4B2thEps9wyzLdk2i0hhiggAUHXRCn1wshiTNB3VpTKWS5zJ1qIRo
   QhLWuMg1+bf182ThgV19G9Liwnad5ChQR2j8XADlIwOp7vA2+ofisi4hF
   Z6UUQWswlFdFy0doD5lMXslwruuwa64KkVzqjCeuYmr9djyclQ0ZUTUBi
   JcbWT0jav8MWzqZdT9htv1xIR3XjPCdKMoLCvhrPOV7TFG2pbtqX4BwJW
   cBZdDwGStUmh7Gjf6/zy6b6sR5KcIsiZ8puVvjMj1GT0t99RxQyk6QCBG
   Q==;
X-CSE-ConnectionGUID: bxpsaQoOSkqttgu4P5KgmA==
X-CSE-MsgGUID: vt3Jew+ASr65R45uPBzj7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="70377084"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="70377084"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:04:39 -0700
X-CSE-ConnectionGUID: 4pNeTD7QQ82JG1z/2N940Q==
X-CSE-MsgGUID: Gqq/pudgSIiV3jOC/4Kytg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139826385"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:04:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr0B-00000002Dab-3W5P;
	Fri, 02 May 2025 17:04:31 +0300
Date: Fri, 2 May 2025 17:04:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2 1/1] x86/reboot: KVM: Guard
 nmi_shootdown_cpus_on_restart() with ifdeffery
Message-ID: <aBTQ7-L-bUwzYbKM@smile.fi.intel.com>
References: <20241008191555.2336659-1-andriy.shevchenko@linux.intel.com>
 <ZwbazZpTSAn9aAC7@google.com>
 <ZwcT149jx-iOmEfl@surfacebook.localdomain>
 <ZykbvVZ32FKCRT_q@smile.fi.intel.com>
 <Z_UUXOe61BwVkGob@smile.fi.intel.com>
 <f670905f-f14b-4482-83ee-568234647f46@intel.com>
 <Z_U0Vn0V18KYGjkP@smile.fi.intel.com>
 <d40efb68-eb4e-4158-9dc6-5de101adefd1@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d40efb68-eb4e-4158-9dc6-5de101adefd1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 07:56:58AM -0700, Dave Hansen wrote:
> On 4/8/25 07:36, Andy Shevchenko wrote:
> > On Tue, Apr 08, 2025 at 07:17:51AM -0700, Dave Hansen wrote:
> >> On 4/8/25 05:19, Andy Shevchenko wrote:
> >>> Any news here? Build error is still reproducible.
> >> In the end, adding the #ifdefs leads to worse code, less maintainable
> >> code. I'll take the occasional actual unused static inline in a .c file
> >> over a mess of #ifdefs to make the compiler happy.
> >>
> >> I really think that warning needs to go away in some way, shape or form.
> >> Either get rid of it entirely, or kick it out of -Wall somehow. It's a
> >> super pedantic warning that leads to worse code most of the time.
> > Does it mean you can take Sean's approach?
> 
> It looks fine at first glance.

Can it be applied, please? The problem still persists as of today (v6.15-rc4).

-- 
With Best Regards,
Andy Shevchenko


