Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F753101C2
	for <llvm@lists.linux.dev>; Fri, 12 Dec 2025 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765535913; cv=none; b=Gs6XHnT9/zc9p14c+S4obhPriYDtCjdsj5P7IGNkGvYwoXIUTAFB1/MBlzgwjQwJu6zmx5XYaP2z8s9kCTUd8Uj5+3vcVphzXjf7NmK6EDdRCR4ryOUkZeGYgjEMCHhJju26QXc5ZpAoxCYh5QhIFovwFF35mGDhiON4oz5CAQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765535913; c=relaxed/simple;
	bh=nctQCqtW4QYyeaejz8PEb38w/v2g7uc6tb41WntjKNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXvb4fDjv7LdUOpMv9kOy8cWDtFvbJOUXyhkQM3EKG+kIc3B5G924fccP9bbTGa+WGU9+FPL7M7s1XF9yvuhiDuxeS/X5RUZxMGs7i60GeJ+sDJEeIfRuavbbh6NhAkIYbK+UiHtvVXP1eRF2/LnA5WaJHCJu/AtlfgqQCU8D4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PdRKUYSG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PdRKUYSG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3436a97f092so1577609a91.3
        for <llvm@lists.linux.dev>; Fri, 12 Dec 2025 02:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765535910; x=1766140710; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nctQCqtW4QYyeaejz8PEb38w/v2g7uc6tb41WntjKNI=;
        b=PdRKUYSGwQYWDSgByuzrcYJ0GmGKL8K7FJQPEGj2UxL0EeDjKRMxTMeGtwMBJ9NUAZ
         +AMBCoyoLX/yE056FIfBo7cUpC9oq2SvfDWoxkYVlkPsZcX2Ci7zVMiHur25WkSZnkL4
         U8Ry3xPg21N/Rhb5/0a2ajQqPi1Rtb3/pLeDdkvj43E9ESu95i0jU39QYTLjOoFUYSNt
         Bf1aNFBZEcY5hoChr9BTdnVkXPcAjoafnIhyVgzikIYgpxCG0beTnIBh3Vor7WwUjk6y
         dtqzQU8ozDqt9B/F1lryHzGiUWSKmmRJdiDVBnY0S0a5+oTd1PfQsZJ7YdYZ3ihH9kMo
         V09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535910; x=1766140710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nctQCqtW4QYyeaejz8PEb38w/v2g7uc6tb41WntjKNI=;
        b=GiVXES6SsfBoNOIOzA7T7/J0QY/Gw7NbZ/FxVdJeqRH6q6K5S8QTVvTmazshyIgphJ
         cOJN3FjcBxv4D8widWwKZlb7Iv/TRLT7Cli5thd958eMsKEfpPmQ5B+TBCRgKDhbU9kg
         B/28Awv+q4LHKREI9/AetW8qUOTk67a0AzqGtPcEyDTC5Nes2sWIG52QcOVIlJtAjP2f
         fykP1boobFJcp80dZEOinCwi9U3fY1K//oqvOzIOyJiyltLPAuvYU70yoIpuK0xSWytG
         pdiy5qsL0l5xAyRuC1sB6wlLCTBrd9hvMblakQSNMppoqFQMqQvzXoNBKW9yHntfmYNB
         hT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW09x+OJgMu91sB6jhKxF7mppGonLSZo2xOqKGb8tCmDWZLDlC3xiK3dPUczfG09G0mdURm@lists.linux.dev
X-Gm-Message-State: AOJu0YwQph67iHwUYfue50NL5LKEO/p229cZ37wCWNSw3fZtlSv9ocFM
	TLaMogl6jU5AZ2hVfQO7FS/XuQQgrio2ypqnpGpjyUC2R4WKfyLAK2lEI7in6rnJshg4rKAFrIx
	tPooWMGfsW+ujPn+OP0w3+DPZsG5gNNX8ZN1N+ZEh
X-Gm-Gg: AY/fxX5Qc7EygxGCw7E1qSLTIgrl3UPIs0WmsE0LMCjWRpzva4nUWyvGzk5HdAfLgm/
	X6h+3BZDzmx3XP30frRNsC7EcMK2RgSnd4gWnzzR3SsMQGJ3skHog9pVO78m2pjA5D2f+D+g94L
	2DtGHvULzf6oU1HOw62qRufmIfhoBvcMRrI3Jogt/0JkJPZfa9Nfs2noc2Ee2+gwYWAV1IKUa4p
	PB+TwENJUYHF+ujwzyU9/BEeVjGztVikY0fF+KqeNkW0ujKlgpquSoHb2N6o+HamEeBkRBRS6JN
	SHx8jERQ2b0tlXHLOYIjHkrSmT4=
X-Google-Smtp-Source: AGHT+IHEQqbAgYefprbsSuiVLt7KDiCECxoW496oPYm+Bj8DbPCCV7ccSZXk9zoE7kqarbEHot35Mb+a9uphNkvnkwk=
X-Received: by 2002:a05:701b:2719:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-11f34ac540dmr1125346c88.5.1765535910093; Fri, 12 Dec 2025
 02:38:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120145835.3833031-4-elver@google.com>
 <20251211120441.GG3911114@noisy.programming.kicks-ass.net>
 <CANpmjNOyDW7-G5Op5nw722ecPEv=Ys5TPbJnVBB1_WGiM2LeWQ@mail.gmail.com> <20251212093149.GJ3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251212093149.GJ3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 12 Dec 2025 11:37:51 +0100
X-Gm-Features: AQt7F2qnWyV-H6zf6AeMnZTuFb_nb7UwLLraoghpFqSJ0q6RecRlENqaq0woPuo
Message-ID: <CANpmjNPcw5AnpLpaFvyRee7mH12Ym-NKTx331xXEusK5zpiscA@mail.gmail.com>
Subject: Re: [PATCH v4 02/35] compiler-context-analysis: Add infrastructure
 for Context Analysis with Clang
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

On Fri, 12 Dec 2025 at 10:32, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Dec 11, 2025 at 02:12:19PM +0100, Marco Elver wrote:
>
> > What's a better name?
>
> That must be the hardest question in programming; screw this P-vs-NP
> debate :-)
>
> > context_lock_struct -> and call it "context lock" rather than "context
> > guard"; it might work also for things like RCU, PREEMPT, BH, etc. that
> > aren't normal "locks", but could claim they are "context locks".
> >
> > context_handle_struct -> "context handle" ...
>
> Both work for me I suppose, although I think I have a slight preference
> to the former: 'context_lock_struct'.
>
> One other possibility is wrapping things like so:
>
> #define define_context_struct(name) ... // the big thing
>
> #define define_lock_struct(name) define_context_struct(name)

Note that 'context_lock_struct' (assuming that's the new name) can be
used to just forward declare structs, too, so 'define' in the name is
probably incorrect. And to avoid more levels of indirection I'd just
stick with one name; if 'context_lock_struct' isn't too offensive to
anyone, that'd be the name for the next version.

Thanks,
-- Marco
