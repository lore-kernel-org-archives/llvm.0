Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D469F313526
	for <llvm@lists.linux.dev>; Fri, 14 Nov 2025 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126561; cv=none; b=LhNduIGUUced3HWGVm/BQSG0NXVD3OuqvjHVCMPV5QgycLVXv5Z5JfBiyT169rpdmZE3qsdtxyt0kS/2vwGPVILakoEdMnAEuMmqPFueqykm9VTGSjiBiNr6tQzQqvs42m4KSlKesUjluXxpt32QgESNzUnRAua2bqbV0S1VTjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126561; c=relaxed/simple;
	bh=FuZEuvQ3jmbwZpx7rFiCevGNtHp2p1kTZ05rKerm0EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkfYUzYa0eNvO+C/6puu0IGEDzqUPSPKUlDWlJyAoet7cZmmTyqHH6UAZPEv4EOy2ixiUxOJ0N71KRjNPLsaTGgqEQzhaWmaVbpIR8/3WJLFye0A32Y7v1h7ydjOyq/xVhqDDQPfvGsKAruI8oHjAzWrihfxhavS3F8fxLLQU6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FD/hITAt; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FD/hITAt"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so2264071a91.0
        for <llvm@lists.linux.dev>; Fri, 14 Nov 2025 05:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763126558; x=1763731358; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FuZEuvQ3jmbwZpx7rFiCevGNtHp2p1kTZ05rKerm0EM=;
        b=FD/hITAtamVwjPBZFBwdXHm69+XJk/QGbI1U/zFXoMcel9hTrmaQWVo+qmS9wxwa3h
         8gdgbCXnuCntllqsDLCUcHHhyi3255tkbrb/HASojRaXKYSeCv3pvnRFmA4e5OotmjEY
         LK3HQLicK/88eWDkSVK6ObQd/ux0gkkWh9jk7DlGd3ZAb5Z0QTM5QyCTY9564V3cjiM1
         OmM/jHFQJo3Xu9JBsYthKX7dF+7K9LA+1911qdvDhaHVCiy2dBTBExXtcmmSk+WKQH/D
         co2SksofBOBEunwn1KCMfSwPhWUFWKF+uPfWLxSIGqPWP8bMmHzoK9IPL3mbynjq6Ykm
         zniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126558; x=1763731358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuZEuvQ3jmbwZpx7rFiCevGNtHp2p1kTZ05rKerm0EM=;
        b=G5AZre6it2ckTzHyE98dlTfM2C69qd5FyysXT/UV2p56f9AVYdv0HsNknIpqP4qtMu
         w3K4JdjeDVkKrWUFzJMS1TxGrQE+MP8v/xVCemFusTDERXab320D9ZIlhb04BfL5R6IX
         vjsd/XNb52EnkGLoxHQMIif2/6ilWYdW/bFbx84vDpe7mIdnsSaa3Dm/iFCP0RE3K3tR
         mBQJij1ljc6m8nk6iDQLg1T02IoWLr86vOkHtz9tLIkkn747wRzsYCL5p1K2qImrI6R+
         5H4LNU4AcqRM9c2U1vkqnCwqthvMQiT+fscof588IeESKHX5R9YVpH2MAxgwf2o6RwOd
         UAUg==
X-Forwarded-Encrypted: i=1; AJvYcCXTW01MXEVL7AdCE/gm1SuhwT+lQDS6m/PzQl0uqrywvixFOcGA9qOWWcACN6YiWaIoMsCi@lists.linux.dev
X-Gm-Message-State: AOJu0YzGw7muYMbBk3UyeZezxQg03ABmAFwY6eZjFgU66zUUbD4vsheL
	MaJBKJfp8oAWRyGIHValI8HSM1MyA9zkZCsWD2pxzzTy2WG5KiAKpfTHky5p3Fahb502hUVRc4G
	ruSgqq5SL6Js1YmLWoBIFayzhUG/MGNrTsPsUxFIz
X-Gm-Gg: ASbGnctaLWcg4Eov1f/RUnnYDLZBfB5wtLE+qxb1/7Dy8M6lDs0L9sEyeNDy/uDedgR
	935BNldKB0hOSZOg8g/0VqEyjYhbQgJngqWAG3HCNg/r8+vaeZMvjZfxnukr66cXmcTEJquM2/f
	S1rOtothTAGxZN4sBsqWZnji6Dxdw6+kLChxN6TgIiJg+LJctxZ2OfyArzY4Ww1j9w8zjlFbnTN
	2Ah/FktfwI95KAsY/TSInNB5HqNjQ9gyBr7owEFJlZZNLstNdzAFhhEYyaf4RQ8VzWVpD+/4BGk
	mtcconv83Y9+1VpdxPjvR8GS6NnsnwfEnjyJ
X-Google-Smtp-Source: AGHT+IHRKhpP3vzCADgRzmvW5BbtF22FP7gG7Gcfgimn7ZOifR3jME27ZrJCzM+Xqri+6sVXI0f8t3/Rxc2hYDVrt54=
X-Received: by 2002:a05:7022:6288:b0:119:e56c:189d with SMTP id
 a92af1059eb24-11b40f9ed09mr1186107c88.5.1763126557688; Fri, 14 Nov 2025
 05:22:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com> <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
 <aM0eAk12fWsr9ZnV@elver.google.com> <CANpmjNNoKiFEW2VfGM7rdak7O8__U3S+Esub9yM=9Tq=02d_ag@mail.gmail.com>
 <20251114043812.GC2566209@ax162>
In-Reply-To: <20251114043812.GC2566209@ax162>
From: Marco Elver <elver@google.com>
Date: Fri, 14 Nov 2025 14:22:01 +0100
X-Gm-Features: AWmQ_blyYEkItbzeXoq8SnAQp2jhwPLGdi6tZz7V3PtwgmJC3W4HiUeTEvac_zI
Message-ID: <CANpmjNPniOK9K6q2sx7KRrxckeAdCyVnTi4qwLqoFoYzYb7L2Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
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
	Miguel Ojeda <ojeda@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 05:38, Nathan Chancellor <nathan@kernel.org> wrote:
> On Thu, Nov 13, 2025 at 03:30:08PM +0100, Marco Elver wrote:
> > On Fri, 19 Sept 2025 at 11:10, Marco Elver <elver@google.com> wrote:
> > [..]
> > > I went with "context guard" to refer to the objects themselves, as that
> > > doesn't look too odd. It does match the concept of "guard" in
> > > <linux/cleanup.h>.
> > >
> > > See second attempt below.
> > [..]
> >
> > I finally got around baking this into a renamed series, that now calls
> > it "Context Analysis" - here's a preview:
> > https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=ctx-analysis/dev
> >
> > As for when we should give this v4 another try: I'm 50/50 on sending
> > this now vs. waiting for final Clang 22 to be released (~March 2026).
> >
> > Preferences?
>
> For the record, I can continue to upload clang snapshots for testing and
> validating this plus the sooner this hits a tree that goes into -next,
> the sooner the ClangBuiltLinux infrastructure can start testing it. I
> assume there will not need to be many compiler side fixes but if

I hope so ... Famous last words. ;-)

> __counted_by has shown us anything, it is that getting this stuff
> deployed and into the hands of people who want to use it is the only
> real way to find corner cases to address. No strong objection from me if
> you want to wait for clang-22 to actually be released though for more
> access.

Thanks, Nathan - having ClangBuiltLinux infra help test would be very helpful.
Unless I hear otherwise, I can send v4 next week for review - in case
of a v5 I will wait until ~March (as that coincides with Clang 22
release, and for lack of time on my end between Jan and March).
Could also skip the subsystem-enablement patches for now; only the
patches until the MAINTAINERS patch are the bare minimum, the rest can
be taken later by individual maintainers.

Thanks,
-- Marco
