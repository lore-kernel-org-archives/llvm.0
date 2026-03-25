Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649F29D29E;
	Wed, 25 Mar 2026 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452006; cv=none; b=e/ZHitChvYZOOh/ypcx1zcmuprW7oALUru/AxCzWS4rfRBjuTmKGSyWCVUj0jp5NR0ZpGsTYHBfObG+oSvwS5zK1WhilukxRTNcFI2fL5LQOVgoo3sBEjWgOTaLwvOqrukluAUKqmomVXNQ1zvFiF8COXN8r3JoRpJ1vHV3xWGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452006; c=relaxed/simple;
	bh=iQfUwfGnIaDfVk8ngH5ws6pxFE58eKYjq24QKf2NEyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJNtbGeCuZc+WkriEwD/hMbzUx2uccpVxREZaON+KrgyLMR1Ig2BnXovWNmapIRGEU/d4HOFIGUO1qCLsDIpVP+D4eFKwZgA3LaN5IkHQTpLf1sRaLtTK4QGANcILBthFUqQ/4qbkPn1nlPqPaypLPJoLpiDhX4j2WGnrnIEZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NExywm3J; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NExywm3J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MyrgXGM28qkThnBGYQn+3DitrkLwVUWa6U/r+9hlV+g=; b=NExywm3J5b95X3nlT0U1uk0H2g
	kMxDHtUDXakXfZ3jDFdYskusa6I31tRNdXO9aixSKQX7KkbvV3MwiZDAuyxMO+R73yXJ8GHJouhkP
	3AmX6OqoyusZr9qnaHL5FOfUhbxc+tTgEtS+MPqhs/SEXkyS6wrfgQreJ0Nde1COJi/bVjPQTzXNW
	nHN6lgWLy/DItOc8a2RodUXZWILVgHR4bO6nZOeMNAScpGsEtigW1JMPGluVIIlULCjcPa1jlrOv6
	kqH6rJwpsd7JuTkaqirIPMrPHxJgM2bMgCRBqQ/VAt0ctzek8tR9AZCO9A2j4MIajJmNr8GSGCyB7
	Z3FppkPA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Q1Z-00000006T0X-4Bf7;
	Wed, 25 Mar 2026 15:20:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F1473300312; Wed, 25 Mar 2026 16:20:00 +0100 (CET)
Date: Wed, 25 Mar 2026 16:20:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Add support
 for multi-argument guarded_by
Message-ID: <20260325152000.GG3738786@noisy.programming.kicks-ass.net>
References: <20260323153351.1412355-1-elver@google.com>
 <CANpmjNMo5kX=2B7UTo-gbiBSTAF0JPwWRZNf=KWpRP4tRA2FAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMo5kX=2B7UTo-gbiBSTAF0JPwWRZNf=KWpRP4tRA2FAg@mail.gmail.com>

On Mon, Mar 23, 2026 at 04:39:41PM +0100, Marco Elver wrote:
> On Mon, 23 Mar 2026 at 16:33, Marco Elver <elver@google.com> wrote:
> >
> > Clang 23 introduces support for multiple arguments in the `guarded_by`
> > and `pt_guarded_by` attributes [1]. This allows defining variables
> > protected by multiple context locks, where read access requires holding
> > at least one lock (shared or exclusive), and write access requires
> > holding all of them exclusively.
> >
> > To use the feature while maintaining compatibility with Clang 22, add
> > the `__guarded_by_any()` and `__pt_guarded_by_any()` macros. On Clang 23
> > and newer, these expand to the underlying attributes; with older Clang
> > versions, they fall back to a no-op (false negatives possible).
> >
> > Link: https://github.com/llvm/llvm-project/pull/186838 [1]
> > Requested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Marco Elver <elver@google.com>
> 
> If we want to retain compatibility with Clang 22, we need
> __guarded_by_any, which ultimately maps to 'guarded_by' as well if we
> have Clang 23+.
> 
> The alternative would be to wait a few weeks and then require Context
> Analysis to have a Clang 23 compiler. That'd avoid adding the new
> __guarded_by_any variant and we can just use __guarded_by as-is.
> 
> We likely want to do that when Clang 23.1 is released anyway, because
> there were some other fixes (arrays of lock fix:
> https://github.com/llvm/llvm-project/pull/148551).
> 
> Preferences?

I think we'll be okay just upping the requirement now. But I'll sit on
this a little until Debian's clang-23 build is fresh enough to includes
the awesome :-)
