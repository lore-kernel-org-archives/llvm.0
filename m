Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E133B958
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769045059; cv=none; b=r3GJvgxb9nQ6YzAi7sp3tHSMO5AHY/MflHC+XWxZ6ByKHX02DoAQBmHbCESX76ksy+Qo15XIEa3PIQgXjoA4XKxulTP46IYhfIaaJ0wPeR1fbPvzoMhCj7juS90Xewn/5jTdDkcywYAsu5nbuModgtr7aLcLjulfZ2lvc0d7SWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769045059; c=relaxed/simple;
	bh=1R5o7hgU1nNhRKgWodeNsOonU6zDQsVCerdqg88fxD0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PUMPjgP+h/j8AQBtjqX62Je3vQm8if0hC99BZD9pPI1rtUkfnF9V7hb3Ky0Q9izeiYyVd+MPadsI9jyMcp26js6/DZIw279P9lK5PD+NLkj4tYwZ9kdeRr+bt1A305npnCikKI+4J6jK2OE4wZwxJCYHmkxJuIt7FKHWkkDf8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id F3F521A140A;
	Thu, 22 Jan 2026 01:24:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id ABF9C2002B;
	Thu, 22 Jan 2026 01:24:03 +0000 (UTC)
Date: Wed, 21 Jan 2026 20:24:27 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, Ingo
 Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long
 <longman@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260121202427.099c36ab@gandalf.local.home>
In-Reply-To: <20260116154754.GN830755@noisy.programming.kicks-ass.net>
References: <20260115005231.1211866-1-elver@google.com>
	<20260115213311.GG830755@noisy.programming.kicks-ass.net>
	<aWmRlXZaOOUvU_Nv@elver.google.com>
	<20260116150750.GG831050@noisy.programming.kicks-ass.net>
	<20260116151043.GA18805@lst.de>
	<20260116152016.GI831050@noisy.programming.kicks-ass.net>
	<20260116152741.GA19823@lst.de>
	<20260116154754.GN830755@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: zwoeikqsen36sn43fpbg8yxq5b4r7nf8
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: ABF9C2002B
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+BlnHaS0Vf2TlpMEYCGKgb6+nJ3EKQQpw=
X-HE-Tag: 1769045043-221171
X-HE-Meta: U2FsdGVkX1/3DUVoPsAbNyPfVQKocA6bLnfESobiS8KbwQJPLO0iJuXOfwMc2qmfS39DIu7YmDu0tjpeY05YCpWCXSvqckXvm4+8T8hwo13sSDsY18a/sHVX638WSVkbiGomiS0LPIF3y+VDknrlk6A0S01tvdVLFe+NYBq5my0JKrJAZHnrehIvXkhDJ1sYwphR7mVyJ+J7cQ0SCAD+hYfdzaVykYbcJBAvVO/YXdzxODXsDQ6YLWfZD4t8GnkxzszO/t5rKSK28uIEVOxqMXwYatl+jfOtl2yKrqa7YjG0YhCnw8k5509t20eIAYHXZJlDur9dSxlSRyTJzYYqATY34af0WejeoSrbgk4xkVnX01dngsRzosUntYxhQ1Wr

On Fri, 16 Jan 2026 16:47:54 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> struct obj {
> 	spinlock_t	lock;
> 	int		state __guarded_by(lock);
> };
> 
> struct obj *create_obj(void)
> {
> 	struct obj *obj = kzmalloc(sizeof(*obj), GFP_KERNEL);
> 	if (!obj)
> 		return NULL;
> 
> 	spin_lock_init(&obj->lock);
> 	obj->state = INIT_STATE; // error: ->state demands ->lock is held
> }

I haven't seen all the other approaches, but would a macro be able to hide
it with some kind of obfuscation from the compiler?


	GUARD_INIT(obj->state, INIT_STATE);

which would be something like a WRITE_ONCE() macro. I'm not sure what
tooling there is to disable checks for a small bit of code like this.

-- Steve
