Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D452C81
	for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a/axwY8nWNaBxTRi53jpnhiV68UM1lNZPNWkLRff/vg=; b=ZOpO6pkAKFsKCg4vFi+HjuH2ZL
	gVBb+6WZ8VUdqvqZtfQmTW3eW4xezlhoBE4YmsqILQTFlXY59lGfu3RkfS7flbwzPT8IieTibBP8k
	pKjwuLEr8uKEzhP6D/EhfI+raVKdGX8juPVTAEhfIVYE5WpF3u5KESgkWHSp4Z+HGrpadKUXcfmWn
	RZ7pZuvLMwpx844cZ2CoSJiiftaoxRv9Px5jwSJE4NkrdhGqw6MI7K5MQi6p0mhJtIzZu0M7PqSBm
	9JGTRzVfl0tNs+ClAeL4KVXcDfhHaCbvanj2r4JFYCf19KOIedsePqhAcvyuZg162EPyFQpc/S8AI
	OfQiWcnQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfibw-00CYaa-LV; Wed, 27 Oct 2021 13:04:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B0AE83001BF;
	Wed, 27 Oct 2021 15:04:55 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 906B82C27DC2E; Wed, 27 Oct 2021 15:04:55 +0200 (CEST)
Date: Wed, 27 Oct 2021 15:04:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>, X86 ML <x86@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/15] x86: Add support for Clang CFI
Message-ID: <YXlOd1lyKZKAcJfA@hirez.programming.kicks-ass.net>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211026201622.GG174703@worktop.programming.kicks-ass.net>
 <20211027120515.GC54628@C02TD0UTHF1T.local>
 <CAMj1kXEx10gC8eH7rV-GbZZj2M3uDue6HYsKb+A5J01zOxm_FA@mail.gmail.com>
 <20211027124852.GK174703@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027124852.GK174703@worktop.programming.kicks-ass.net>

On Wed, Oct 27, 2021 at 02:48:52PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 27, 2021 at 02:22:27PM +0200, Ard Biesheuvel wrote:
> > On Wed, 27 Oct 2021 at 14:05, Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > > > Should not this jump-table thingy get converted to an actual function
> > > > address somewhere around arch_static_call_transform() ? This also seems
> > > > relevant for arm64 (which already has CLANG_CFI supported) given:
> > > >
> > > >   https://lkml.kernel.org/r/20211025122102.46089-3-frederic@kernel.org
> > >
> > > Ugh, yeah, we'll need to do the function_nocfi() dance somewhere...
> > >
> > 
> > Sadly, that only works on symbol names, so we cannot use it to strip
> > CFI-ness from void *func arguments passed into the static call API,
> > unfortunately.
> 
> Right, and while mostly static_call_update() is used, whcih is a macro
> and could possibly be used to wrap this, we very much rely on
> __static_call_update() also working without that wrapper and then we're
> up a creek without no paddles.

Specifically, we support code like:

struct foo {
	void (*func1)(args1);
	void (*func2)(args2);
}

struct foo global_foo;

...

DEFINE_STATIC_CALL_NULL(func1, *global_foo.func1);

...

__init foo_init()
{
	// whatever code that fills out foo

	static_call_update(func1, global_foo.func1);
}

...

hot_function()
{
	...
	static_cal(func1)(args1);
	...
}

cold_function()
{
	...
	global_foo->func1(args1);
	...
}

And there is no way I can see this working sanely with CFI as presented.

Even though the above uses static_call_update(), we can't no longer use
function_nocfi() on the @func argument, because it's not a symbol, it's
already a function pointer.

Nor can we fill global_foo.func1 with function_nocfi() because then
cold_function() goes sideways.

