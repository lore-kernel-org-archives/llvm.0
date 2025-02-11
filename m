Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE424C671
	for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282160; cv=none; b=Hsfrf/fRi6jpTxtMjyVba8TMccrd+/S3+zrDxeglcb6X7Rp6A11Uv+RQgWihOqWUylU60ndh4j4mOLnR8H5e0rT4eypcQ3ykz8HSloLqBaEBqOHbHDNF8w/PpABlDlAypKNfy8zUn7jRegSg/xg0Pd0j5FZPF9XHeBRqI5xz7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282160; c=relaxed/simple;
	bh=tvddLOD38SbA+nE14izQGPNoMlGp5ZWiCv7xIdyaTR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWOQLg/iLXJgNC5YUQqjkve/CYANu2D45nHqoDhvk4uXfFEXZ2TCgzXsTNrrTvVhj91rLMBLKZ7DaN8IPjhA5tMoALEanzbhcHJNvbFubxTI1k0F1Gz6w/iOMz3vDwCevJcmmscxDE33LQs3CXSZUMQWX0ec1vRh04b+D48e04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oGTVU2QP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oGTVU2QP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso8162324a91.1
        for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739282157; x=1739886957; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhF+JZnbICstMQ4SyijmaSYDsITfNwFybUAYOWyiZXU=;
        b=oGTVU2QPmHXmb5QoT3AuEOyze3Za4DYfqcYrbsE1udgTnfYd3H83BVwsCv/C4GFoqL
         zQktqm8L7Sg9BHDOsq3Ez8DJ/3dztvFYrmK4N9T30TBRbM4/36jsrCAg9+nmh4/jRDK1
         lfcDcwpQwu6wf3Ni5sw3KKSEp4pqdUHm1t2ZL7OxEPTZHMrTblr3FdDAV6KkpTR5QK4S
         mQHP/JGSXwqCK8suKYCpuk+BVcaSTheQA3d1vE+7lbUz7DYoYfcZ+IXgC6ej7lFiJUkP
         yEv3azp4dz6X5ZJvme5WLznp2iqrYVffVeIV1sC5/fBEur/E7Ba8RMJAdMSZpKgI9Nfz
         RmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282157; x=1739886957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhF+JZnbICstMQ4SyijmaSYDsITfNwFybUAYOWyiZXU=;
        b=GWMYxlAx/iwwWsqlEsFa7QdSKZn0bFucJPgqUWZTEeAhmmBdBBRGHEIW3anpghWUmS
         bUV4bX5wk0e6ZFf6NhKNZvK0xfJBAOl90IF6ofqH4QahK118SqU2VTmncyWKXK9ls903
         c3t6WqFAT+LtdRTupBFR79kqUtLKrn3oUSX6g3CLk9fTTbUWs1cD2naXP+vwh+7/HSIP
         eqx7AXu4n/A0CLrDvad45M10G9GE7Jdj+1B9XACfenhqq4igEO5d/xUpIyiQZdO3tYNS
         X4fXZOIXDrzSPG4TGXTb9Y5ZEpbPGIVbeX05sfuug/KoasRIqY7crVjbiitFKqlPIdey
         PfHA==
X-Forwarded-Encrypted: i=1; AJvYcCVFBYEiaAiehIrgtDapmHCAD0i6/i692PYIcKhEWfA/xECWWiyHKorZ2qN1w0leS5KHQG7i@lists.linux.dev
X-Gm-Message-State: AOJu0YxKSsrH5ElujKZ6aoZOnAv/3Z7q1Q8dFHA6C6gnTN6UGm01Oj06
	jbNcRJK2lQOEOah3OC+x1d+i2KXdWgDXkcJwuXPNslQtvB8iXdoLleOt/YuHe5Bws10FYs+pdqs
	6zsIovFgGjO486nCpu0bpzDub3nK57UDOVsZW
X-Gm-Gg: ASbGncuVnMGQgSf/UUFM3wHfxE/27zqT2ulQPWgJYLDEXRf/l+tnCNKbQyrtN/dVBd3
	3zPo/hwHPnAF9SlBjEzH5xCmH8OxvOHr1LCKJs8WggcHBIJHrvQl0eLrVjR88QyUpyeTjI9yitE
	Ksz50ilAB6LeHtnxVnBQqSuUAi/Hc=
X-Google-Smtp-Source: AGHT+IGroUNVHpMBAUy/bObZea2jE/snBP4iAn1fJ0F8Y+yGqofcGPH5OOKF/rW4Qwm5mzGvQOH1DLn2V2e6J52emRE=
X-Received: by 2002:a17:90b:1d45:b0:2ea:5e0c:2847 with SMTP id
 98e67ed59e1d1-2fa9ee17fb8mr4391611a91.22.1739282157250; Tue, 11 Feb 2025
 05:55:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-9-elver@google.com>
 <e276263f-2bc5-450e-9a35-e805ad8f277b@acm.org> <CANpmjNMfxcpyAY=jCKSBj-Hud-Z6OhdssAXWcPaqDNyjXy0rPQ@mail.gmail.com>
 <f5eda818-6119-4b8f-992f-33bc9c184a64@acm.org>
In-Reply-To: <f5eda818-6119-4b8f-992f-33bc9c184a64@acm.org>
From: Marco Elver <elver@google.com>
Date: Tue, 11 Feb 2025 14:55:20 +0100
X-Gm-Features: AWEUYZkwbHjIdQKR2hqck9okMpxl0TDfWkkc2sBGpPLWquXQ8_lyXjiGcdcjlSE
Message-ID: <CANpmjNPxyWey6v1tj6TwtN6Pe8Ze=wrfFFjuJFzCQTd4XM8xQA@mail.gmail.com>
Subject: Re: [PATCH RFC 08/24] lockdep: Annotate lockdep assertions for
 capability analysis
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 19:54, Bart Van Assche <bvanassche@acm.org> wrote:
>
>
> On 2/10/25 10:23 AM, Marco Elver wrote:
> > If you try to write code where you access a guarded_by variable, but
> > the lock is held not in all paths we can write it like this:
> >
> > struct bar {
> >    spinlock_t lock;
> >    bool a; // true if lock held
> >    int counter __var_guarded_by(&lock);
> > };
> > void foo(struct bar *d)
> > {
> >     ...
> >     if (d->a) {
> >       lockdep_assert_held(&d->lock);
> >       d->counter++;
> >     } else {
> >       // lock not held!
> >     }
> >    ...
> > }
> >
> > Without lockdep_assert_held() you get false positives, and there's no
> > other good way to express this if you do not want to always call foo()
> > with the lock held.
> >
> > It essentially forces addition of lockdep checks where the static
> > analysis can't quite prove what you've done is right. This is
> > desirable over adding no-analysis attributes and not checking anything
> > at all.
>
> In the above I see that two different options have been mentioned for
> code that includes conditional lockdep_assert_held() calls:
> - Either include __assert_cap() in the lockdep_assert_held() definition.
> - Or annotate the entire function with __no_thread_safety_analysis.
>
> I think there is a third possibility: add an explicit __assert_cap()
> call under the lockdep_assert_held() call. With this approach the
> thread-safety analysis remains enabled for the annotated function and
> the compiler will complain if neither __must_hold() nor __assert_cap()
> has been used.

That's just adding more clutter. Being able to leverage existing
lockdep_assert to avoid false positives (at potential cost of few
false negatives) is a decent trade-off. Sure, having maximum checking
guarantees would be nice, but there's a balance we have to strike vs.
ergonomics, usability, and pointless clutter.

Can we initially try to avoid clutter as much as possible? Then, if
you feel coverage is not good enough, make the analysis stricter by
e.g. removing the implicit assert from lockdep_assert in later patches
and see how it goes.

I'm basing my judgement here on experience having worked on other
analysis in the kernel, and the biggest request from maintainers has
always been to "avoid useless clutter and false positives at all
cost", often at the cost of increased potential for false negatives
but avoiding false positives and reducing annotations (I can dig out
discussions we had for KMSAN if you do not believe me...).
