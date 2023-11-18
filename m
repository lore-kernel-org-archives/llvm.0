Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB191E508
	for <llvm@lists.linux.dev>; Sat, 18 Nov 2023 20:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OZ0/kaPW"
Date: Sat, 18 Nov 2023 15:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1700339257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VA30AOH1S8X59z5+gH9XMH61G4JTpYZi9MtnJjii/po=;
	b=OZ0/kaPWfBNmsOcQqEX9CdotDT6zOpq+OIO096PNU5sWp6uWppuOegAry3so+qFKSGIxF7
	bi9S8b6gS1jydeqKJujpTw7Ii2z+GSvxcLxvSUdX1lGY2wmvgQkI0ifKRbSarlLJdhA7T4
	Ngy9Fj/vKxYR+Q/X0bNgjSVCjq4pLqM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: CFI support for type punning?
Message-ID: <20231118202733.cmbpcpbu6zxdemq6@moria.home.lan>
References: <20231118001208.narka6bl3axdpflf@moria.home.lan>
 <202311171936.A19E992@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311171936.A19E992@keescook>
X-Migadu-Flow: FLOW_OUT

On Fri, Nov 17, 2023 at 09:07:06PM -0800, Kees Cook wrote:
> There is no type punning support, though a neighboring idea has been
> proposed to define separate groups of the same prototypes (e.g. so one
> work_struct user can't call another work_struct user's callbacks). But
> that's all future work.

There was a proposal for making container_of() typesafe awhile back (I
forget who came up with it - Matthew, maybe?). Related?

> 
> > The alternatives I'm looking at aren't terribly palatable; we'd either
> > have to increase the size of struct closure with another function
> > pointer (and another indirect function call on every use); or we'd have
> > to patch the workqueue code and add a flag (Tejun won't like that), or
> > I'll have to convert every closure function to take a work_struct arg -
> > with a resulting decrease in clarity of types.
> 
> I think the reason the existing compiler warnings we have in place for
> this didn't warn was because there was no explicit casting; it was all
> hiding in an intentionally overlapped union. :)

;)

> struct closure {
>         union {
>                 struct {
>                         struct workqueue_struct *wq;
>                         struct closure_syncer   *s;
>                         struct llist_node       list;
>                         closure_fn              *fn;
>                 };
>                 struct work_struct      work;
>         };
> 
> ...
>         BUILD_BUG_ON(offsetof(struct closure, fn)
>                      != offsetof(struct work_struct, func));
> 
> It seems the assignment used "fn", and the WORK_INIT used its internal
> func for the call. No casting needed. :)
> 
> The good news is that closure.h _is_ using the common code pattern for
> these kinds of things (container_of() to find the wrapping struct),
> but it's using "struct closure" instead of "struct work_struct", which
> is what you concluded as well.
> 
> Part of the work we did over the last few years now was fixing cases
> like this (where the wrapping function was being passed instead of
> the work_struct), and it just needed a few localized refactorings
> that Coccinelle seemed to handle well. I don't think it should be too
> disruptive here either.
> 
> static void journal_write_done(struct closure *cl)
> {
>         struct journal *j = container_of(cl, struct journal, io);
> 
> Would, I think, become:
> 
> static void journal_write_done(struct work_struct *ws)
> {
> 	struct closure *cl = container_of(ws, struct work_struct, work);
>         struct journal *j = container_of(cl, struct journal, io);

The thing I don't like about this change is that closure fns are
significantly semantically different from a normal workqueue function -
a closure fn runs with a refcount held on the closure that it's
responsible for releasing either via continue_at() or closure_return().

> Usually these kinds of changes resulted in no binary differences (as
> expected). I do agree, though, the ergonomics are a little weird to
> expose the internals of closure.h. I've seen other APIs paper over this
> in their own special ways. For example, maybe something like this:
> 
> #define CLOSURE_CALLBACK(name)		\
> 	static void name(struct work_struct *ws)
> 
> #define closure_type(type, member, name)	\
> 	type *name = container_of(ws, struct work_struct, member.work)
> 
> CLOSURE_CALLBACK(journal_write_done)
> {
> 	closure_type(struct journal, io, j);

Yeah, I think this works.

> And another, which was quite painful, was the struct timer_list work in
> 2018, which touched something like 1000 files. :|
> https://outflux.net/blog/archives/2018/02/05/security-things-in-linux-v4-15/#v4.15-timer_list

Thanks for the links :)

Related to the timer list change - back when I was active in the block
layer I was contemplating getting rid of bi_private, in favour of
container_of(). I wonder if that's something we could start nudging
people to do, less pointer chasing is always good :)
