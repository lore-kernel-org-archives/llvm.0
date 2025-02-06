Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F0119F41C
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867759; cv=none; b=g3V4qWB40g8r5Gp8osmQlP6HjC6Rr7tVheAZZ42WTV+CpwpSuj+0Br7PrT7hqz/hrhi2wcoNuQTZJTArjYTpF8l7er3SUfHA95n0jU3j1FXC5XTz9FzQiIm0loPR7bjNwPMEiVcDaNTP9k0qxfpFkQtNY7dqqYhyzzvKNE6YXvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867759; c=relaxed/simple;
	bh=v+PUw2Q3Yxfuone7yJBVYRyJPvIXK21JmruUcVnGGvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0QmoyzL7T06HClJ0D6wrPGmv/VlavNXhlIjqe8o2RVMmWsI6WudZdHIDFpPr8bvMR56gGEWujXGhFhUkLyeLYjho997EU7wxV5PIq3ExsUWMEQAWu5F6fbemMfQ9nxAFBxgMtzvi9lYsB1WwG9SIDVpvuBKoZsIrtwPYQSgfmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBfKb/PF; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBfKb/PF"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f972c031efso20835707b3.1
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867755; x=1739472555; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nlRt5j/kIPL45Og0/CWS7P0L4BsTBNK9TmluKrchWAg=;
        b=PBfKb/PFev0lGrk/Th7M0VFt6co8kt5J+GUn8TgsLqnJnSDH84wgxJh16Yqeyd4sMU
         +6DOimBtdG3+fved7cB+T/IwhmpsiqwR9YosUL5R/eSCucJNfHW2rqAakLwu6Gh1oX5/
         +W6J0UCmUunboSW9+prRIuoew2wKU2RyvvpG1IKjkSCVlVK4BeM6tolPGQJ79bzRbX3q
         p3in6Wg0/pYdwsXZZ12S1aoLWp41x9EAu17XnXi8e/3GZ1SKOez79yJedzYuR28LyATZ
         cAOdiOwI8VRq1xOVdCwpoicsj3M+t/Y3Q6jBJgVFeAPWZjZmIuMKYhYkcVYq+QD9gfq2
         1O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867755; x=1739472555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlRt5j/kIPL45Og0/CWS7P0L4BsTBNK9TmluKrchWAg=;
        b=QmeKA0BPU4iawsDSpMGhDWPrSKGATDeT62zM2Ep6tmtfsRnWOIyQeETAJBmCpd8i6q
         B89EvDlk/LN16WbE29ZBj/HXMGz7tDpqmQWg+Er07iv4IvPVHop2wX8vbQ0UN8lKNIYI
         YMnoV5qyIcYB8iljGTvDOV0kNwGlC9us8D773p28ZJsIFpE4/qmixUPHd1UxDdlb1ADJ
         Rb6CSNpAQJEZDKEyE8xVccmeO5g3Sogjp/eDHr/XzbCjAKSNjLjuo4V+0qSzc5ZcFqqG
         HR+Gf317r/ERpfI5UXrbhuy/cIE13cCG1s5UbUB11Ksfl2m7f7pnuAdJwRnbHHfSPAh0
         IcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXTvzeYJy3Mln0L//NPFU0lZv33TJNQXq4W+IEoLq4KOLUYSugfLW2HQ67uqcAK4LmOSpo@lists.linux.dev
X-Gm-Message-State: AOJu0YxBwnWEvzCbb28fPrJGSz7drWvpM+0r1bwKVpOmtwboLQXLRRwR
	GayypSIuGua9Qd+uQREaPe/wFd2/NJZ4CsEXp7pn1E4UAdO3T292bXepiKDbVe9JjGwcIaSsjRy
	fc9weoSOHyBXGeaFO2pEN9Uhe3K5fvWqXfo47
X-Gm-Gg: ASbGncuxwz5SIidEP108yfEhvTdx1dcMcIvpXri2WeWdjaCkLCikk7UVgA8rzzIpGqB
	IGtFT/mW1ZLV7Hb1UQIb9+xOfoIqHNzRhaW3Ax8z6vxNRA3zLLZT8FIYdTrcdrTUTKbge5STiYR
	PIvmleobAxqqMMqW0DRjgb/QLTRzU=
X-Google-Smtp-Source: AGHT+IG732MPGs5331pepE+AcF55+6p+ypSgIeWmQCP+V3pUV36KCk1Ozv7+1d7SFih6fjpij0+2+MtlgsbuGXkbOy0=
X-Received: by 2002:a05:690c:7089:b0:6f9:492e:94db with SMTP id
 00721157ae682-6f9b381fca2mr191027b3.2.1738867755278; Thu, 06 Feb 2025
 10:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-2-elver@google.com>
 <552e940f-df40-4776-916e-78decdaafb49@acm.org>
In-Reply-To: <552e940f-df40-4776-916e-78decdaafb49@acm.org>
From: Marco Elver <elver@google.com>
Date: Thu, 6 Feb 2025 19:48:38 +0100
X-Gm-Features: AWEUYZnk9rIG8ZqxXrgEaM8RCQ6m2IyEZ2vODfXrtzceps44fJ5AzWTWAEX80U4
Message-ID: <CANpmjNP6by9Kp0rf=ihwj_3j6AW+5aSm6L3LZ4NEW7uvBAV02Q@mail.gmail.com>
Subject: Re: [PATCH RFC 01/24] compiler_types: Move lock checking attributes
 to compiler-capability-analysis.h
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

On Thu, 6 Feb 2025 at 19:40, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/6/25 10:09 AM, Marco Elver wrote:
> > +/* Sparse context/lock checking support. */
> > +# define __must_hold(x)              __attribute__((context(x,1,1)))
> > +# define __acquires(x)               __attribute__((context(x,0,1)))
> > +# define __cond_acquires(x)  __attribute__((context(x,0,-1)))
> > +# define __releases(x)               __attribute__((context(x,1,0)))
> > +# define __acquire(x)                __context__(x,1)
> > +# define __release(x)                __context__(x,-1)
> > +# define __cond_lock(x, c)   ((c) ? ({ __acquire(x); 1; }) : 0)
>
> If support for Clang thread-safety attributes is added, an important
> question is what to do with the sparse context attribute. I think that
> more developers are working on improving and maintaining Clang than
> sparse. How about reducing the workload of kernel maintainers by
> only supporting the Clang thread-safety approach and by dropping support
> for the sparse context attribute?

My 2c: I think Sparse's context tracking is a subset, and generally
less complete, favoring false negatives over false positives (also
does not support guarded_by).
So in theory they can co-exist.
In practice, I agree, there will be issues with maintaining both,
because there will always be some odd corner-case which doesn't quite
work with one or the other (specifically Sparse is happy to auto-infer
acquired and released capabilities/contexts of functions and doesn't
warn you if you still hold a lock when returning from a function).

I'd be in favor of deprecating Sparse's context tracking support,
should there be consensus on that.

Thanks,
-- Marco
