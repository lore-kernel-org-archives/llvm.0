Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A13016E2
	for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177809; cv=none; b=PELrlQ4Yl2iZicWJmzOrpNfw4Jx2gBhicXpYgHvPZ9P7Lg/jSC/oSKda5iS1XI7fjExqDwk7Y+29f+MrBU5Asg4Q8DoH4Ky6tspARhyboUUsDC8kUY/+cSRDpDz80ZGb7Ysg9xTO+c3s2Q0FA4m6atxQbJtcdKYV2j69AFscfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177809; c=relaxed/simple;
	bh=fCtN5w96eZqrvOBOQUjLqccxmr2pliW0+wGLOTGzIqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx58C3Q3lnlvPOFWCvuASRoS7IC3ttr/mZNT0qdYO4/Fu9+Nid1mcwYCzl21Cn0rEUaoYuigzEMHv7H4MAmDjHbTcxFvwvFi2KWjVbVHmyLJJGdSjF6JEJUklRKLcVwXHNk6mUddh4AT9p3177kuCq7Pz0l/6YGnO5dn5asQJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MwD3cXpl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gA1ab66W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MwD3cXpl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gA1ab66W"
Date: Fri, 23 Jan 2026 15:16:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769177806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtgKc6W7mmonLMIMxfMUARbNVKXr2CYLV3Munfx4+fU=;
	b=MwD3cXpl67Y3Q2Cv4AL5F5CwIFRGnithY7/MHISHBdTabecLy/8Iaa0lV5pIP2Cfjff2Rh
	NDfClY1pj9Ln7gI6sZghMt4aRjdcX2hEn/oDuyXsfKpUFjuhEF/vwfPQ+RFQ1xnTj+/N6n
	mUOiUHykN4w7ORmrQw7DzB9nhlPOht3lskqwsdclC1xscu5evIb688U8I2ajuQEW03cmrW
	dEK4JjwBoaDMH4kXXSCDF2S/6+CS+DV88nESkopTJiB4LV2HaQRIOwQsjKbDaf/8G+SdiB
	f0YAPcpNMF9dvzKzRPOci5ZJ6QzLQL9+g2BpGe+egSJoP1f2yAN7H9RgY6ihMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769177806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtgKc6W7mmonLMIMxfMUARbNVKXr2CYLV3Munfx4+fU=;
	b=gA1ab66WLVNOq8wpbwFs+NOIDFT/zBXcJrN7AQsEW9jvkpzTngv3k4aJSIW/CG5wV50+4W
	Wl/bNPBTENHoZqDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: elver@google.com, linux-kernel@vger.kernel.org, mingo@kernel.org,
	tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
	longman@redhat.com, hch@lst.de, rostedt@goodmis.org,
	bvanassche@acm.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Message-ID: <20260123141644.KJ4HtS8U@linutronix.de>
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121192349.GM166857@noisy.programming.kicks-ass.net>

On 2026-01-21 20:23:49 [+0100], Peter Zijlstra wrote:
> On Wed, Jan 21, 2026 at 12:07:04PM +0100, Peter Zijlstra wrote:
> > Hai
> > 
> > This is on top of tip/locking/core with these patches on:
> > 
> >   https://lkml.kernel.org/r/20260119094029.1344361-1-elver@google.com
> > 
> > and converts mutex, rtmutex, ww_mutex and futex to use the new context analysis
> > bits.
> > 
> 
> Pushed out an updated/fixed series to:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core

I went through what you have there now and it looks good and I did not
find anything while testing. Full ACK.

Sebastian
