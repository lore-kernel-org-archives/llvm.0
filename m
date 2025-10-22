Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91ED35B131
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151619; cv=none; b=iSCPwyt+rFR4s3RrWXK2ikYiDObrNatTyHLmtuQx+2F/6jQrfUlxbaM2i/8fIeLFTrOOVnoANBpUNd5KUkdxODCdXNGVXUSNPMxdvU4HbbAIT6mtpFa58VIp23Ny1V7Xq9lTqIRbODJzpLhbZxtbtyhbq/JVsQYJQJu8PJDAT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151619; c=relaxed/simple;
	bh=Z2XJiNmkuJ0fIw4QCMTv+KndSSTCiyYTnR4KJCWszJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXSFFJOU5f7IFp43cDVH3N4Ka1TolhEtCk2Go2zOf8lpAco9rPDZLxWQMABnupZNiNJB/M9XMudx3sluGwbi+BYDYZJSQSiRii3PKlyb6/0cmRhlRQGal0o4F3qh+dZul66qEFHCrsMOa2esYv5ugYIy92bvIa72ACE5ayrgyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9DByUEc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9DByUEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761151618; x=1792687618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z2XJiNmkuJ0fIw4QCMTv+KndSSTCiyYTnR4KJCWszJo=;
  b=L9DByUEcXdSKFuBVD7B+SCRE52aOdikNyJkTtIoydarS6sp1ENKj27Tg
   WkOkIDVKnj1m3FlgIBQmNXJQM+1vi7sPYMGl89Up+F75vsZlv34YJVbGj
   0HABUTO4u4NTKweYImYGGW02PZ+YO/sNKDOQ+PoVbo4rteIM4M8ARzXW5
   pC0SUVAGegsbqJnNFbL1NlnKzxPDgxhSPU+Bb4G2FPaJ9EEuld0e6NoVA
   Ctz/JUAfhkjK3b7jdB7oyQ7UL/3yRi82NNWLheWN9YU1C41UxgRIEpmb+
   A4dkxL68mcWAl8ThvUH7/IG45e8uyDZdnJ4rck+dIk/INrfHAp2mJ7iez
   w==;
X-CSE-ConnectionGUID: MlMMMWDOQMa1+x+6lasJqw==
X-CSE-MsgGUID: HuFUZX5KRRC54WIHPApbTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74746407"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="74746407"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 09:46:57 -0700
X-CSE-ConnectionGUID: QhzpkzgrRuqRtAsUZ26e/A==
X-CSE-MsgGUID: 0Um1dRhZQYaJ33aPFS6DFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214863158"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 09:46:53 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBbz8-00000001kNv-1QFe;
	Wed, 22 Oct 2025 19:46:50 +0300
Date: Wed, 22 Oct 2025 19:46:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] sched: Remove never used code in mm_cid_get()
Message-ID: <aPkKei1uy8k1xnha@smile.fi.intel.com>
References: <20251015091935.2977229-1-andriy.shevchenko@linux.intel.com>
 <aPYKpJ4MdjlGeILa@ashevche-desk.local>
 <20251020104934.GQ3419281@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020104934.GQ3419281@noisy.programming.kicks-ass.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 20, 2025 at 12:49:34PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 20, 2025 at 01:10:44PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 15, 2025 at 11:19:34AM +0200, Andy Shevchenko wrote:
> > > Clang is not happy with set but unused variable (this is visible
> > > with `make W=1` build:
> > > 
> > > kernel/sched/sched.h:3744:18: error: variable 'cpumask' set but not used [-Werror,-Wunused-but-set-variable]
> > > 
> > > It seems like the variable was never be used along with the assignment that
> > > does not have side effects as far as I can see. Remove those altogether.
> > 
> > Anybody to apply this for fixes?
> 
> Why? W=1 and WERROR is very much you get to keep the pieces land, no?

The builds I have almost W=1 clean, I have only a couple of patches which I try
to push forward (already for a few releases). Your patch to move static inline
unused function warning to level 2 would drop them, leaving the above the only
culprit so far.

-- 
With Best Regards,
Andy Shevchenko


