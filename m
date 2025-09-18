Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846822222B4
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758232469; cv=none; b=BCf0Mz5vmD0XW/yBOBiENFz9vqz+umyAU27uNIOPCZkm9IzaBLd5HHxgWAvA7m5cefBgU8AorpEqgu4z5I80zWh3NbAYdgaDnWsmzqSt6dvr+9KJV9XvzsJ6BHVW0rezBvHSVd7841yIbJu+sW/jgd+2uz01Z1DIhLxTMwl8/zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758232469; c=relaxed/simple;
	bh=OBdCMGeWv7G/tkOmZiDbcUQKLH/CnWF06gVEbnVu89c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7KAwEN1oHxthjy5DP2gsLyHFz7KzYNtWbNWShHx+fx4zPv8pO8JEx+j1yWa4Q6mGvZZLusZpJIAaxO69B0kVr/mbU3QTFWYXwYgNnrd0KjFGSN9ZuSfSSqh9s9/drU7VyckdFlNeZusRBviKsfiqwbrqQBQ37zlY2NOuK/GN+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IT0wB6kV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IT0wB6kV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5607a240c75so1525387e87.2
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758232465; x=1758837265; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mLiszfQw8YctXWgw7Rv1CzeIAYsEhv/enJDimwborHo=;
        b=IT0wB6kVkKmmiGgtgxMqz9TSSI0Yj9g272nfdB0VEFGgwPhmbEYHI2eh+xBDzI+aET
         qXxCtFJllPVLSaqJdznk1m79SMGrhSsLH3q3H9v5HAuw87XDQXdMWe3rP9faipEMJk0c
         N0DeE/ETQ4QeMv2V78fAUeIaecR3EfB6F/1/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758232465; x=1758837265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLiszfQw8YctXWgw7Rv1CzeIAYsEhv/enJDimwborHo=;
        b=Ly1T65uWrlrPinwTau2IKR2M94vqXomB94m8qZksU3S2ckN3bNZtcGJWV0DgKzMZtN
         9TubHmc2cTVfVF5ImVpOS9LiiA2dFoJyzz547BUWfQihjSIGuOG56OoiS7GSqtEI51IS
         64iLjLKzs68PiADAa/OEF0tELXU76q0899sn6DZDks24AdBYQIfzfVwRIRjIqvWFdcuy
         X2EHuqm/F+u8xyeAMi6yHWD0MniGpXcyw9ggMG1UJAg8wrD3lNm6NNdpQkNG6WlXSfNT
         SXl5giK2jqTbuzz76rG5UJPWtmZWTrMKod3mCd8ajDeecGJtogfduRCP/OhcTIan+yJz
         PwAw==
X-Forwarded-Encrypted: i=1; AJvYcCV0xVChiSyRr/mMeQDBunJ1qe5W9Kd2pkED7z/wA5/n6bLyd+Jc8QGWD3nvFHCUbR8OzGRs@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu+HTWRmrzKGaC/mo2uLyoEMNKlgfdgfhsVWDSjuJcO/6eC/37
	jJ83BFTa64qsITlaP0LGhjjM4te6W/RfOd5dEaVNrP0W11GQjayp/k/rFthNyvSr1ep9KdfYCC6
	NF/BSTjSZ9g==
X-Gm-Gg: ASbGncsKX0/038EfZka154oaDJolpbKlYSjkneDiaGG9ilKjX00TkSxmxAHBEt1y6BC
	I1mcn5+cONyrdjCoEKfyt1LU6YQoM+QWDOLs+3rL62/QNdm1rd1saRgJT5Yruu7gwUAAPSPmEHm
	HnKWli3PmMEpNzs4zDh9uCGU9f9oXbQwh7NOdssaFwIG5WOj5prscn8k5RCbXTE1HZluyE1Cph9
	sWO5u3//5m8oS7rI0lz8G0rScW97SVMOYrxE23vc5GioZ/OpCaTE9i/rKkGnjNtleUEyMtrSQjl
	5IrpEQmzuuqEiu3qmuMe3IE8lRo/Xot0GDjHBtGjunmnkaUrR67U/epzkiNZeHvX6X2w/EgBPG1
	6BrQnw4pooBdBIOljM/mKttW/Z5XrCBflzJbXx+aNMNqO5TnqvQJDOeRd686OVkeCD5FhMRR+MX
	ohQma3Gc9NlOFnhjE=
X-Google-Smtp-Source: AGHT+IHVg7F6SnQMJG5Oqdri4hhirivZjV/3APnrA7izNys5sXyYICSIRRI5uiHaGsUsYnqd9BmxpA==
X-Received: by 2002:a05:6512:1295:b0:55f:44b8:1ecf with SMTP id 2adb3069b0e04-579dfcc8921mr383249e87.9.1758232465340;
        Thu, 18 Sep 2025 14:54:25 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a65070d2sm944464e87.37.2025.09.18.14.54.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 14:54:24 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso1638488e87.1
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWw/E6pp5DKfvA5ZWWeN9uoGOdG4dZxhdCuZ84SWFlCvk1A7FcSELEbnYrYFurMMyoklc/g@lists.linux.dev
X-Received: by 2002:a17:906:dc89:b0:b0f:a22a:4c30 with SMTP id
 a640c23a62f3a-b24f5685fdemr62738866b.47.1758232077501; Thu, 18 Sep 2025
 14:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com>
In-Reply-To: <aMx4-B_WAtX2aiKx@elver.google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Sep 2025 14:47:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
X-Gm-Features: AS18NWBxHuMwwtU-EoNbPFA3uJ1YRJkAKqdurj12n-PWNJgH6ecKwZ8QZrX3P28
Message-ID: <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
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
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 14:26, Marco Elver <elver@google.com> wrote:
>
> Fair points. "Context Analysis" makes sense, but it makes the thing
> (e.g. lock) used to establish that context a little awkward to refer to
> -- see half-baked attempt at reworking the documentation below.

Yeah, I agree that some of that reads more than a bit oddly.

I wonder if we could talk about "context analysis", but then when
discussing what is *held* for a particular context, call that a
"context token" or something like that?

But I don't mind your "Context guard" notion either. I'm not loving
it, but it's not offensive to me either.

Then the language would be feel fairly straightforward,

Eg:

> +Context analysis is a way to specify permissibility of operations to depend on
> +contexts being held (or not held).

That "contexts being held" sounds odd, but talking about "context
markers", or "context tokens" would seem natural.

An alternative would be to not talk about markers / tokens / guards at
all, but simply about a context being *active*.

IOW, instead of wording it like this:

> +The set of contexts that are actually held by a given thread at a given point
> +in program execution is a run-time concept.

that talks about "being held", you could just state it in the sense of
the "set of contexts being active", and that immediately reads fairly
naturally, doesn't it?

Because a context is a *state* you are in, it's not something you hold on to.

The tokens - or whatever - would be only some internal implementation
detail of how the compiler keeps track of which state is active, not
the conceptual idea itself.

So you name states, and you have functions to mark those context
states as being entered or exited, but you don't really even have to
talk about "holding" anything.

No?

               Linus
