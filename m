Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EC130B513
	for <llvm@lists.linux.dev>; Thu, 11 Dec 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459539; cv=none; b=Nq93SH13yjIK+FOQ0H7M+Mj2i76/Ome0BRCm+jYCt0K2PPZAvfdGgS8JJFavi7XLM8rJ0B1ZdaZgOj+mCOX7WLq08vTS5unwciy+O9IIlHRKh8raQu2skA2zfub1t74ZHQfaPZI+x/hJpdagzURruZU+QTQ1A63bVnwYIqRIN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459539; c=relaxed/simple;
	bh=4koDoOQRFcQ8EnbnmmJvgwasJ9ijqSyJnmmWmgQ4c2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/lBrGkkKNzfMZ8r7NS9XdEhxylaqxznGcKnL0f4FkMYRb2NcfYlVB0fo9SNG0tI/OCmqqqi2+SlD11/MwIVEvos/0BOWLVtFcEOXyEOeMj9pD+y10nPHwWUXPXFXSMj7LTYSxmmPsfTsqMV9h3joJ0Llv6DPKmARhuA0R0Scbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VV5cuqVs; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VV5cuqVs"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6432842cafdso51003d50.2
        for <llvm@lists.linux.dev>; Thu, 11 Dec 2025 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765459537; x=1766064337; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWA/kjxAjN+uRNvgRsuZ3C4JKMpyTL0y62dCZ1FivCw=;
        b=VV5cuqVs3I5ixjXOWF84B1XEqPw47EqU0K+9mV3y1ODaRouUiqFbvli36M4MqWMm7+
         JJ13d+e4wTokzJskZNA9kLcLoBNnlOAmCdWZfIs79D/Zh8efFLH1EchG9Vqo3V4twHcO
         ljlcQgTS9+PYLt+ZKKVYq2IZbwIJY7/Sp7S9pnoVbXXZVG05i5va/fmwqxQt9R+GsX+W
         Fgy37Vk5bnSy2jyJOpGHuGe/nNu7kXQY7iKtKlTg/Bum0C1r2ZM49Yi0v7114rBmMZ2w
         LIzZBbHPz2nMVmLOt9lt52f5G5IdAGPYMPjUDHv65Y5kIcYeswt1mRUO6+bAu5kw05KJ
         e2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459537; x=1766064337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWA/kjxAjN+uRNvgRsuZ3C4JKMpyTL0y62dCZ1FivCw=;
        b=XbJw+Bv8+NE0Fq1rv0qdJ3f7qziSR84/LgnAcDyNH47zD5gDnsoBjmX1MrHCyw0tuq
         DfEh2w2vFBOEquK5xr/QlcavwtUEgNHZsl+eKsKf9GnEUU0JBP7qhF9ed12CHLPlXETj
         D6RwmU31jTpkEcsdmpPsDyNBshdCgbav4RqMNSnOWvx+XvN942WRHwFmkJQymRcKB2NM
         Fbf6NJJnuZ7KEttWERuSKUafI+BjLRozSV6/9VTCbxvGFWPbxRUPG0cBzDjOmXWTmnnq
         PaY/iNQ15cheIiFhnUSHE1UF0WKb+ZmlZvg427E6l/WZzgzkPXcGD/QmczfblFUuoujY
         RmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq93vVV1+cW2DPcGqGVfRN7Di369RkzR7bjv8J0b18pwZi/NL7Nnmz8rhowaTinT03hpwC@lists.linux.dev
X-Gm-Message-State: AOJu0YxB6fyzluJESX6bQtfusu8yFTQMPY3nXCoaDRGrsHa3EJZFzLqZ
	QLwSevWPfT0Zhlt2gbC3LBxxJ6qF8YzQ3C4lePhRtuasmR6xugeyClrE0/QIdaKyo0+qEvgtjox
	NowDDuBr6L/Xya9PrFb9Yg8GoR1CDSKxVGrGeq3P6
X-Gm-Gg: AY/fxX6n8IDx7KYh6EOhyMx5D1U9GtgAC+xDSJ52kFxAxqVTZw8WhJTiaR2DvonI/+M
	mDAgVUJSr8gt6WDXmiT9OdetbtooiyPzkUejYUnyVtTgIOle4/tLiDeCJ6S0XElP8RijO33Ya0M
	Ct6dfGrG0TUB6sJEp8hI+1yxtTkFC6DmsxlOqWLBlBm7hCYvVI0b29bQPnYf5Km6f/73uXXnuo5
	7r5M7o1FeBFNfAkkQLcuPKyFExO8QHWaXTDHyz3LMfIlN4wZZCtD9DnFm0xWu49kQt0kxijoAGq
	Bo9G/QB1aHtQzZd6+7cXAr0HyjJSDjOhNfE=
X-Google-Smtp-Source: AGHT+IGPj4VYuvzobJuySeUtMjR2owpUV9b14snNLjzBypYDLw2+crQYToZkiUGcBVWZIJW//ll4Or+5K7PYShnu4As=
X-Received: by 2002:a53:d01b:0:b0:643:1a78:4492 with SMTP id
 956f58d0204a3-6446eb6016cmr3860639d50.81.1765459536448; Thu, 11 Dec 2025
 05:25:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
 <20251120151033.3840508-8-elver@google.com> <20251211114302.GC3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251211114302.GC3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Dec 2025 14:24:57 +0100
X-Gm-Features: AQt7F2r5KNsATXW8d-J0gXHLFG6W_D0lOL42kIv9mnu54Km1ZPN_9U9TSDd09do
Message-ID: <CANpmjNObaGarY1_niCkgEXMNm2bLAVwKwQsLVYekE=Ce6y3ehQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/35] lockdep: Annotate lockdep assertions for context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, 
	Eric Dumazet <edumazet@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Johannes Berg <johannes.berg@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Dec 2025 at 12:43, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Nov 20, 2025 at 04:09:32PM +0100, Marco Elver wrote:
>
> >  include/linux/lockdep.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> > index 67964dc4db95..2c99a6823161 100644
> > --- a/include/linux/lockdep.h
> > +++ b/include/linux/lockdep.h
> > @@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
> >       do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
>
> Since I typically read patches without first reading the Changelog --
> because when I read the code later, I also don't see changelogs.
>
> I must admit to getting most terribly confused here -- *again*, as I
> then search back to previous discussions and found I was previously also
> confused.
>
> As such, I think we want a comment here that explains that assume_ctx
> thing.
>
> It is *NOT* (as the clang naming suggests) an assertion of holding the
> lock (which is requires_ctx), but rather an annotation that forces the
> ctx to be considered held.

Noted. I'll add some appropriate wording above the
__assumes_ctx_guard() attribute, so this is not lost in the commit
logs.
