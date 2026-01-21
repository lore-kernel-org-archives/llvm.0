Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382E2D541B;
	Wed, 21 Jan 2026 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022166; cv=none; b=iheIT6fpZBrxLpjy/zk28frdyNPiVEaBYKcKZ5v2yEvvZ7jC0sXFLzrClhLbhaTDq+gPp6spwmgMhhmnH1NZhO1z6VMFHmbNl1dp4HGR2D/fSRKcC4WM/fbgcxdWvNB7Z97j/HmiL4t5XwE9nczXU9y+i1EA8b6vUAjtfhbLezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022166; c=relaxed/simple;
	bh=b486CEg2+8kGJDC+hVd7N0BjFKOyyvPSg2Y8mF/K2uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0PrAkvSkIuJlBquiM2nD2yO6+Yfda5a4ZieCndxb49HLyAc25vjrUCd47LQ9hYODRJb94/acOGKUvXfBWmp4/1HzHoW8NCCRCXh5O0VwMEN3luBe0oKCxY2TzLDZBUhrwY33WnXIWvQR5v2EtluBrgd9C1nrkuez1VcwZyB30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d+zk2gzO; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d+zk2gzO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iQU3EJmhAb4SFmVk2iSClo2MBj4VIJTcgmlIdz+ssQM=; b=d+zk2gzOHej2NCoAEl+yHL+t9c
	6/Z9eWEuc3YIZhrUE7lJ24aMxO+FcDswmsoM5yqgGv0UZrkwwy4GOakgBcy229EqAMGOYBVBX5Epr
	M3+zcEFoA3e8AE2Wiu1QVx1Eb4MJ98UdYqEXAdjKxXfimyO8JD7qpuM/hSQKba4UUEy8Cvo4VEufJ
	87mgGrUvVTlKWrsWwINh4Vwl+qfysCjHp/Q/sWuA7cD8DEigFQ6OJI28POCd61Tm74QqDgX8mrp3+
	FjMsYxtrSDxDIAZ8+skIC4PUR7s1MedLo9rvLZ+qWSsKc1o6l78nLJWQZ3uF0AiATrNqWaZt2fDtD
	C/qBDkKw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidTV-0000000GeVT-0eig;
	Wed, 21 Jan 2026 19:02:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BD50F300328; Wed, 21 Jan 2026 20:02:40 +0100 (CET)
Date: Wed, 21 Jan 2026 20:02:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org,
	bigeasy@linutronix.de, mingo@kernel.org, tglx@linutronix.de,
	will@kernel.org, boqun.feng@gmail.com, longman@redhat.com,
	hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 1/4] compiler-context-analysys: Add __cond_releases()
Message-ID: <20260121190240.GL166857@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
 <20260121111213.634625032@infradead.org>
 <88eb6e92-446a-496b-a27b-a50e4ceb57eb@acm.org>
 <CANpmjNOBJ12xUY9+tXx5ezFoFqo4BU4SLK7xofMGexvGNQR7tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOBJ12xUY9+tXx5ezFoFqo4BU4SLK7xofMGexvGNQR7tA@mail.gmail.com>

On Wed, Jan 21, 2026 at 07:35:14PM +0100, Marco Elver wrote:
> On Wed, 21 Jan 2026 at 18:55, Bart Van Assche <bvanassche@acm.org> wrote:
> >
> > On 1/21/26 3:07 AM, Peter Zijlstra wrote:
> > > +#define __cond_releases(ret, x) __releases(x) __cond_acquires_impl_not_##ret(x)
> >
> > Since we have __cond_acquires() and __cond_acquires_shared(), how about
> > also adding a __cond_releases_shared() macro?
> 
> Since I'm a fan of less code, another option is to introduce it when
> needed. It's unlikely to be needed, and until then I'd prefer fewer
> lines of code to be included and maintained. Up to you.

Right, this was an on-demand thing. Lets add it when it becomes needed.
