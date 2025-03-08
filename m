Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC415DBB3;
	Sat,  8 Mar 2025 06:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741413988; cv=none; b=S/EJY+cuqlSJ0vA2igGYr4H0LZ/jPe2CeYEUz4r4QpMv9YsZJC+gH43ExFuJL4s0hRi07/DVtpJ2MWPHyLmCO4K1eQgSUbHdv7+BDeCbOWzOdnfNd2wj/hFroAnS6NJtialB3DT8n9JouqyhrFR0ZwnYRkHgNTlvYL8XMlDxtoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741413988; c=relaxed/simple;
	bh=N5TVIulojj8RABs7uqA2SE+J0htISdOTgppjSBSQRmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUCq+qfd8xSD61yxpq1q5iReOp5oLzH52iKawPQXEJtOEDvCqkiPcz2qcd2RancnA88Z6gnCcYoi1WOgFNgXWdkOLsdiD17T/fphX0UB0ASjXWUk2R41xRjkv/kUFEmgEMXKnvccj866mjjoty9Y9ec+DmZfGmVpSjEbGfrHv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lEjHua4d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lEjHua4d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7787C4CEE0;
	Sat,  8 Mar 2025 06:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741413987;
	bh=N5TVIulojj8RABs7uqA2SE+J0htISdOTgppjSBSQRmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lEjHua4djWxYx9DmWAjBBugV2FDwKlaked1WPMwdiPUVhBVUgkzTI032vyfhzd3o9
	 d+E3X9sSPa2v1HOHlJn1G3BdXLw9iBC1+sM3Bt/+VH2+wDBRacbprlMUT81NJ3Dlmy
	 2Jf1sMoZACcKL412UDGGzT6ryxmBgRJdMUUB4vOM=
Date: Sat, 8 Mar 2025 07:06:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Puchert, Aaron" <aaron.puchert@sap.com>,
	Marco Elver <elver@google.com>,
	Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <2025030840-riptide-spearman-f6d3@gregkh>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306103752.GE16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250307085204.GJ16878@noisy.programming.kicks-ass.net>
 <20250307125225.GP31462@noisy.programming.kicks-ass.net>
 <2025030700-research-pueblo-87ef@gregkh>
 <20250307143517.GN16878@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307143517.GN16878@noisy.programming.kicks-ass.net>

On Fri, Mar 07, 2025 at 03:35:17PM +0100, Peter Zijlstra wrote:
> On Fri, Mar 07, 2025 at 03:22:33PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Mar 07, 2025 at 01:52:25PM +0100, Peter Zijlstra wrote:
> > > On Fri, Mar 07, 2025 at 09:52:04AM +0100, Peter Zijlstra wrote:
> > > 
> > > > Yeah, so IIRC I once proposed a guard that takes a NULL pointer to mean
> > > > not take the lock, but people had a bit of a fit.
> > > > 
> > > > It would've allowed writing the thing like:
> > > > 
> > > > 	{
> > > > 		guard(device)(parent);
> > > > 		device_release_driver(dev);
> > > > 	}
> > > 
> > > So the below does compile... Greg, how revolted are you? :-)
> > 
> > Eeek!  But why?
> 
> Right; I forgot to tell. This clang Thread Safety Analyser can't deal
> with conditional locks. Things like:
> 
> 	if (parent)
> 		device_lock(parent)
> 	do_something();
> 	if (parent)
> 		device_unlock(parent)
> 
> make it quite upset. The above would, once it properly understands the
> guards, make it think the parent lock was unconditionally taken. It
> effectively hides the condition from the analyser.
> 
> But yes, first time I proposed something like this Linus had a wee bit
> of a wobble too :-) I figured this one at least has a different name.
> 
> Trouble is, this kind of pattern is quite common -- lots of driver code
> has it. The alternative is disabling analysis for the entire function,
> with the obvious down-side it won't find anything else in there either.
> 
> So I'm currently exploring how far we can push changing the code to
> suit the analyser, because Aaron (co-author of said clang feature) is
> quite hesitant to even consider trying to fix this.
> 
> Fixing this in the analyser would be near turning it into an interpreter
> and risk running into the halting problem at compile time -- not a
> pretty thought either.

Ah, thanks for the explaination, that makes more sense.

> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index 5a1f05198114..7c95e7800b89 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -4796,33 +4796,30 @@ void device_shutdown(void)
> > >  		spin_unlock(&devices_kset->list_lock);
> > >  
> > >  		/* hold lock to avoid race with probe/release */
> > > -		if (parent)
> > > -			device_lock(parent);
> > > -		device_lock(dev);
> > > -
> > > -		/* Don't allow any more runtime suspends */
> > > -		pm_runtime_get_noresume(dev);
> > > -		pm_runtime_barrier(dev);
> > > -
> > > -		if (dev->class && dev->class->shutdown_pre) {
> > > -			if (initcall_debug)
> > > -				dev_info(dev, "shutdown_pre\n");
> > > -			dev->class->shutdown_pre(dev);
> > > -		}
> > > -		if (dev->bus && dev->bus->shutdown) {
> > > -			if (initcall_debug)
> > > -				dev_info(dev, "shutdown\n");
> > > -			dev->bus->shutdown(dev);
> > > -		} else if (dev->driver && dev->driver->shutdown) {
> > > -			if (initcall_debug)
> > > -				dev_info(dev, "shutdown\n");
> > > -			dev->driver->shutdown(dev);
> > > +		{
> > > +			guard(device_cond)(parent);
> > 
> > This is just so subtle it's scary.  I don't like that.
> 
> Yeah, I was afraid of that. It's basically, if parent, take the lock,
> otherwise nop out.
> 
> I don't suppose its better when written like: guard(if_device)(parent);
> ? I mean, its just naming, but sometimes that's all it takes.

Naming matters here, so yes, a better way would be essential if you want
to do this.  This last suggestion is better, but still odd.  How about
something like:
	guard(if_exists)(parent);

