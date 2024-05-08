Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9C130E5A
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 23:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715211811; cv=none; b=m6/Caro7eBwbCBTyZTY/X7/xNEeqdg2Ng4wur5QrksZ1/Xzfq9zW12wAa0hOEDB7LyqZs5EUz/V41DWYdoREHdtWNKtrTkrbcgBvxuq54hB26PN6GvdNzQc7+qbVEFGq/oDscijm4nxHN8V1GKftqjKPPFybd9kBPgI1P25uHdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715211811; c=relaxed/simple;
	bh=y1HGQWnW087ryWPapOIDF4ENmKxgHtUhDXYwnbKJErw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5neZeKbGMkZizsGzMAUZ3l1VCL/AcD7C7jqZdTZ3htGh8ebxothZ/In3f0fpRqDa1i0upoDLopkoqT/xTA3Jp1CW/iOJZmd9FeESvh5WMWjI6y0KNZoJhHxdoHELapgmFScUh0HNN1e/kSUCGKzueM6gFtuctspXdIPvaEINtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CZcbUxS/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CZcbUxS/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ee38966529so10435555ad.1
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 16:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715211809; x=1715816609; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4aOUo+Ox29GhQhR4ZuEuFwhEG4wIeHKCaf3AQBwPEAY=;
        b=CZcbUxS/R+H7pi96mwx0DXakv4FwT9TtBTvqwz/XriAvTjciTsVAJO3XMQkTHfkjEi
         Tmwc/6f4zlg6Jhw383UuFG94/F4zPanHiETFRUMMTrym3vS2X7TD8hY/4E/IWf45uglK
         RKRdR2MkwWPw3XBgRA8DQ6rHFA7Yum1aiN6TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715211809; x=1715816609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aOUo+Ox29GhQhR4ZuEuFwhEG4wIeHKCaf3AQBwPEAY=;
        b=LfO+fuIHy4ebaJ6yv2QD6Yhfn2nPOfzLRiaTwzJZ0BPNUmIpKxraj5aanIxP8tOwxn
         Yzk/XXW9rY7tnd1E219BXtJzquIAC4aGGqtki0VMo+RpETlZ66VmbaNeaMXWcxDqyDLZ
         eQJJQPyuZQOPZqekJap81Bm9mweiIj5d2JAa9Dvj51HMT4IHAo8iO21LtsxK+YIruvZq
         PvO8fBak4yX7IG4NJKkfaDPZupuuGmvyhQ0a3HOXQE/8RjFBtUesb65Xlc41L+RqpoZS
         k3s2/e9VwbK33SJ4fsFg3c290MqtCTywdXZlHXtX1UW6fty0V5PuYufyeBJNh67vKjCB
         dRfw==
X-Forwarded-Encrypted: i=1; AJvYcCX+XBdqJXjLzYPYlWvRmiaKMAZvwUKAY6zXidRvQ9/gfjzF+LbOIhuPP0EUSiI/IcUKSnkjJgbVBF742yYIGqpPsi/2bg==
X-Gm-Message-State: AOJu0YwKZ1stTv3UqZwXxEnpRn/+kbJBTCHjuY+p3e0DgoGszDo/Iq5b
	M9wZ9pxcTNfCgez3zTXHHvpFyKC+jPRU00q/ldWPq/xJKnP1IFh9CAWHVurpPQ==
X-Google-Smtp-Source: AGHT+IF8F9eYSrfhWch2mudjIXjyH4c0O/q8Qefji8NxXLaBVZvd08ca3pmytlTZPjibFtmrd/seMA==
X-Received: by 2002:a17:903:32cf:b0:1e0:ab65:85e5 with SMTP id d9443c01a7336-1eef9f4181fmr16879805ad.1.1715211809118;
        Wed, 08 May 2024 16:43:29 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b22sm1013945ad.180.2024.05.08.16.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 16:43:28 -0700 (PDT)
Date: Wed, 8 May 2024 16:43:27 -0700
From: Kees Cook <keescook@chromium.org>
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
Message-ID: <202405081035.6B1A791B@keescook>
References: <202404291502.612E0A10@keescook>
 <e777a057e8d246efbc90381c2988b9b2@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e777a057e8d246efbc90381c2988b9b2@AcuMS.aculab.com>

On Wed, May 08, 2024 at 12:22:38PM +0000, David Laight wrote:
> Have you estimated the performance cost of checking the result of
> all integer arithmetic.

I hadn't included that in my already very long email as performance is
somewhat secondary to the correctness goals. Perhaps that was a mistake,
as it is going to be everyone's first question anyway. :) But yes,
I did have an initial analysis:


Performance Considerations
==========================
Adding arithmetic overflow checks, regardless of implementation,
will add more cycles. The good news is that the overflow outcome can
be pessimized, and checking the overflow bit on most architectures is
extraordinarily fast. Regardless, for many Linux deployments, the cost
of this correctness is seen as acceptable, though all users will benefit
from the fixing of bugs that the mitigation will find.

Looking specifically at proposal #1 below, we can do some estimations. For
a defconfig+kvm+FORTIFY config on v6.9-rc2 x86_64, the signed integer
overflow (SIO) checking is added in 21,552 places. The unsigned integer
overflow (UIO) checking is around 55,000 (though I would expect a good
portion of these to be eliminated as they are shown to be "wrap-around
expected"). Running with SIO enabled is mostly flawless, though a long
tail of false positives is expected. Running with UIO is not ready for
general consumption, and performing benchmarking there is not going to
give useful numbers. However, we can at least attempt to extrapolate from
an SIO build how a full SIO+UIO build would behave. For example, based
on instance counts, we could maybe assume SIO+UIO to be ~3x compared to
SIO. This could easily be an over or under estimation, though. Regardless,
some rough draft comparisons:

Image size
       Stock	60197540
    SIO,warn	60299436 +0.169%
    SIO,trap    60195567 -0.003% (trap mode probably found code to drop)

Kernel build 10x benchmark	Avg(s)		Std Dev
                     Stock	439.58		1.68
                  SIO,warn	444.20 (+1.00%)	1.35
                  SIO,trap      442.10 (+0.57%) 1.52

> If you have a cpu with 'signed/unsigned add(etc) with trap on overflow'
> instructions then maybe you could use them to panic the kernel.
> But otherwise you'll need a conditional branch after pretty much
> every arithmetic instruction.

Yes. This would be true for any implementation. Thankfully in some
places where bounds checking has already happened manually, the added
instrumentation checks will have been optimized away. But yes, turning
such a mitigation on isn't without impact. :) But a significant install
base is interested in correctness within a reasonable performance
budget. And some will take correctness over all other considerations.

> As well as the code bloat there is likely to be a 50% chance they
> are mis-predicted slowing things down a lot more.
> IIRC at least some x86 cpu do not default to static prediction (eg
> backwards taken forwards not) but always use data from the branch
> prediction logic - so the first time a branch is seen it is predicted
> randomly.

Sure, though I think the nuances of CPU design are somewhat tangential
to the overall topic: how do we provide a way for Linux to gain this
correctness coverage? It's accepted that there will be a non-trivial
impact, and I agree we can start to consider how to optimize
implementations. But for now I'd like to solve for how to even represent
arithmetic overflow intent at the source level.

-Kees

-- 
Kees Cook
