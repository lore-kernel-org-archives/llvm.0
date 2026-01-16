Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CCD26B0B3;
	Fri, 16 Jan 2026 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578481; cv=none; b=F1bd+Qkce+cuB23DD86n6M0H5ORt3wVfpAp2W3TzaLn7qo7+Kq2/Ch1qKyI2gju0iU6SwWqNVeWxaYTIr5i9vHzkEUbs55Mm2sPap/dj4jjgm20Y+NqF5SRKdtAgioDkniURbAqwL7QsVCv8nteNr9cggu71Lrvc5GRgeOgHel8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578481; c=relaxed/simple;
	bh=WSi8N0YOGOcsHSVSef6RMQxztPhfFapgkgxT6S7KkcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl8BK3HrYkGU1GEX/AMyalImvAO6E6sEUYFTOMuLjxE/4x6zqTDdI5zugxRzxGdnit5dlxvQgoucavO6+ur/y/0VRa3OgSfXgMm+9qfS7XDOi6U/VYictJBQdNTu+Tr/ISSxaJabyu/Wbcft6mg4oK7b+M8GXjoWbiwptXm58OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WBEkHBSi; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WBEkHBSi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oSjG1d8OZ7OmFUCDFova52CcXzuGRhvK5+mM1zx7v9E=; b=WBEkHBSiCkkoF7Nh5NRjphe7w8
	kRgzblbsb1m2Y/jAcI9JA+eU6SkarKpNIiiXaHaZdjx71viZarMxJOp/69MnhiZzS0lFpmBzivR4b
	GkgViA75PdvlYyZ+cFi2RqjzAQ0zgL4cVxlvGDJhJYbhToGv6WlSNQYAxlQX2afC2HX3dzJVlOLG/
	zK+xUsqilyMxQv3aZv9dxUise2DHHPJI+BirglEu3CDArriPmHFdOpBss1Dx9B5qqW4ReGuWX0Tr1
	PezYwd6a/2LKFR4Ctc4V/JHrHXrPJGFpbwdoLHqIdFM0igzX2fjRChGrHSwEms3SmgJwznP14485j
	Zu1ZqrLQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgm3H-00000009YaU-3M4m;
	Fri, 16 Jan 2026 15:47:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 49E7F3005E5; Fri, 16 Jan 2026 16:47:54 +0100 (CET)
Date: Fri, 16 Jan 2026 16:47:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260116154754.GN830755@noisy.programming.kicks-ass.net>
References: <20260115005231.1211866-1-elver@google.com>
 <20260115213311.GG830755@noisy.programming.kicks-ass.net>
 <aWmRlXZaOOUvU_Nv@elver.google.com>
 <20260116150750.GG831050@noisy.programming.kicks-ass.net>
 <20260116151043.GA18805@lst.de>
 <20260116152016.GI831050@noisy.programming.kicks-ass.net>
 <20260116152741.GA19823@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116152741.GA19823@lst.de>

On Fri, Jan 16, 2026 at 04:27:41PM +0100, Christoph Hellwig wrote:
> On Fri, Jan 16, 2026 at 04:20:16PM +0100, Peter Zijlstra wrote:
> > is *much* clearer than something like:
> > 
> > 	spinlock_init(&obj->lock);
> > 	// init
> > 	spinlock_deinit(&obj->lock);
> > 
> > Exactly because it has explicit scope. (also my deinit naming might not
> > be optimal, it is ambiguous at best, probably confusing).
> 
> WTF is spinlock_deinit even supposed to be?
> 
> I though this is about:
> 
> 	spin_lock_init(&obj->lock);
> 	spin_lock(&obj->lock);
> 
> > Not to mention that the scope things are far more robust vs error paths.
> 
> They are just a really hacked up clumsy way to provide what a very
> limited version of what the capability analys provides, while messing
> up the code.

So the base problem here is something like:

struct obj {
	spinlock_t	lock;
	int		state __guarded_by(lock);
};

struct obj *create_obj(void)
{
	struct obj *obj = kzmalloc(sizeof(*obj), GFP_KERNEL);
	if (!obj)
		return NULL;

	spin_lock_init(&obj->lock);
	obj->state = INIT_STATE; // error: ->state demands ->lock is held
}

So if you want/can take spin_lock() directly after spin_lock_init(),
then yes, you can write:


	spin_lock_init(&obj->lock);
	spin_lock(&obj->lock);
	obj->state = INIT_STATE; // OK

However, if code is structured such that you need to init fields before
taking the lock, you need a 'fake' lock acquire to wrap the
initialization -- which is safe because there is no concurrency yet and
all that, furthermore, by holding the fake lock you also ensure you
cannot in fact take the lock and create undue concurrency before
initialization is complete.

So the fairly common pattern where an object is first (fully) initialized
before it can be used will need this fake acquisition. For this we get:

	scoped_lock (spinlock_init, &obj->lock) {
		// init goes here
	}

Or you can manually __acquire_ctx_lock() / __release_ctx_lock().


