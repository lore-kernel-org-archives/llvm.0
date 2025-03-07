Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794421C9ED;
	Fri,  7 Mar 2025 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358124; cv=none; b=nzUx2kbunn6NeaSSjHt9bjAV5HDJeImf5W4HeKAt46/TqVYZGQ3gmA/YNMHY7EU3jaRovOUSTSs3XHLB1Q5JoUO7b17Qekdn3zGiZoyBTp//YXOBdLVigjvc8TK0mCxm2FAYqmqGHiXYt9CKCkjLfdMx/ZisQQfPxI8oaIAUnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358124; c=relaxed/simple;
	bh=LY4B4up6sxteu7fODYZ8AR6TCRbAjJjDAfQ2U7F/WXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9GrP29/umCvyYZUZVOudpDWfhRO2BafYeitHGAlKmzmCBoCHNWMDzhWS+ZeauaujL1wavChoKCgr//J54wAfKE3e6CWVBA6K8HiI3ZTf8OYUgbCd6EeFv9qsvjP0FnREwDXCIBSn/VTcAcknOlFCyK6xjZO64lg8JkzhiuCxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ie9QpiCs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ie9QpiCs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1eiEpCHYVNeWuosvIhQ5Qumq79Sf/ue+N3D8Ti65/R0=; b=ie9QpiCsXrFt+a1YoqfCiOrskx
	hdabZtxgP8BrhMKnAgB1m2OSIVbPvWGp5v+30pcmqaEGJZwVjofRmgVT7TWBQQabBq+oQ02T54a0q
	ezZUSdiu2WldAzmjjciPyaD1urDXdaQ3WHo5p9FmTVvXd07zVjrqV6CI2bnvDU6TnFthcGaK4a+pk
	8IyQYRlTZge/Mw2IijmwWyrwQn5rkBtdy2cb+V7joMmb/4MU4dOWWOUC+qDNPWM3GSkPMAOtd1dhc
	1xwAwqXSIBpSPriH9FJOFHsuD/N13sL3Kh9YWx87GmXFvbh0PCxgdUE9c1/o9TMdWZTQLyvgLIMxA
	+8j19ALQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYnG-0000000Cb22-1Awf;
	Fri, 07 Mar 2025 14:35:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 77EB230031C; Fri,  7 Mar 2025 15:35:17 +0100 (CET)
Date: Fri, 7 Mar 2025 15:35:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Puchert, Aaron" <aaron.puchert@sap.com>,
	Marco Elver <elver@google.com>,
	Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250307143517.GN16878@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306103752.GE16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250307085204.GJ16878@noisy.programming.kicks-ass.net>
 <20250307125225.GP31462@noisy.programming.kicks-ass.net>
 <2025030700-research-pueblo-87ef@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025030700-research-pueblo-87ef@gregkh>

On Fri, Mar 07, 2025 at 03:22:33PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 07, 2025 at 01:52:25PM +0100, Peter Zijlstra wrote:
> > On Fri, Mar 07, 2025 at 09:52:04AM +0100, Peter Zijlstra wrote:
> > 
> > > Yeah, so IIRC I once proposed a guard that takes a NULL pointer to mean
> > > not take the lock, but people had a bit of a fit.
> > > 
> > > It would've allowed writing the thing like:
> > > 
> > > 	{
> > > 		guard(device)(parent);
> > > 		device_release_driver(dev);
> > > 	}
> > 
> > So the below does compile... Greg, how revolted are you? :-)
> 
> Eeek!  But why?

Right; I forgot to tell. This clang Thread Safety Analyser can't deal
with conditional locks. Things like:

	if (parent)
		device_lock(parent)
	do_something();
	if (parent)
		device_unlock(parent)

make it quite upset. The above would, once it properly understands the
guards, make it think the parent lock was unconditionally taken. It
effectively hides the condition from the analyser.

But yes, first time I proposed something like this Linus had a wee bit
of a wobble too :-) I figured this one at least has a different name.

Trouble is, this kind of pattern is quite common -- lots of driver code
has it. The alternative is disabling analysis for the entire function,
with the obvious down-side it won't find anything else in there either.

So I'm currently exploring how far we can push changing the code to
suit the analyser, because Aaron (co-author of said clang feature) is
quite hesitant to even consider trying to fix this.

Fixing this in the analyser would be near turning it into an interpreter
and risk running into the halting problem at compile time -- not a
pretty thought either.

> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 5a1f05198114..7c95e7800b89 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -4796,33 +4796,30 @@ void device_shutdown(void)
> >  		spin_unlock(&devices_kset->list_lock);
> >  
> >  		/* hold lock to avoid race with probe/release */
> > -		if (parent)
> > -			device_lock(parent);
> > -		device_lock(dev);
> > -
> > -		/* Don't allow any more runtime suspends */
> > -		pm_runtime_get_noresume(dev);
> > -		pm_runtime_barrier(dev);
> > -
> > -		if (dev->class && dev->class->shutdown_pre) {
> > -			if (initcall_debug)
> > -				dev_info(dev, "shutdown_pre\n");
> > -			dev->class->shutdown_pre(dev);
> > -		}
> > -		if (dev->bus && dev->bus->shutdown) {
> > -			if (initcall_debug)
> > -				dev_info(dev, "shutdown\n");
> > -			dev->bus->shutdown(dev);
> > -		} else if (dev->driver && dev->driver->shutdown) {
> > -			if (initcall_debug)
> > -				dev_info(dev, "shutdown\n");
> > -			dev->driver->shutdown(dev);
> > +		{
> > +			guard(device_cond)(parent);
> 
> This is just so subtle it's scary.  I don't like that.

Yeah, I was afraid of that. It's basically, if parent, take the lock,
otherwise nop out.

I don't suppose its better when written like: guard(if_device)(parent);
? I mean, its just naming, but sometimes that's all it takes.
