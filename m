Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729363B9D94
	for <llvm@lists.linux.dev>; Fri, 10 Apr 2026 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843308; cv=pass; b=SGO+oHEyCVvN86Hdb89rtU1qk7MAznAM3Jpr/q4FlAqAX49ROUFmOkcyEffcBVwpjDXRGcxHRzqSLMqugDWuIFG1ifv7+7JJVXw5rFSKUhaw7/vPZi+GYKzLol9CFklYD3CrV9VJsaghLI6KVOn8sVU8rRTz35I7bYFLcRKpwgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843308; c=relaxed/simple;
	bh=fP8aWal1X6Qsox11Ia6GNPWsn7HNwxIrcnSxBo1eXxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbCH2i8jteDm/gAuUSltzBcujbjVHCtkLU2jlH7Zhpyat0Pn/ePo0h6YySlWwZL4fCPct3GJTmgN/rfrDkb3LtMv4OJJ/FpFw7XenT0IbpIcuUtjp0k+1KJtmUagZNR66CcMjPNtBfVFVlaHLkVvAjHFlnz4qzUfgG6NsXqN+cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v6fX/Ze/; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v6fX/Ze/"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-953b7d2c820so767614241.3
        for <llvm@lists.linux.dev>; Fri, 10 Apr 2026 10:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775843305; cv=none;
        d=google.com; s=arc-20240605;
        b=N1kmGW574E+vvzagtsbxTb9qknrAS+QCtDx8MYS7OtEIjNpF+8rCSTFh28ZU10FidT
         A63gRnJ+f/0u+De/qM+ON5sdzlBb08xIWHmDLdzRMGfOVqA/d6YAHTzYE3qhB8qA/9XN
         i+x0YPohyFbS3bbzhzv1AISb8RHkri0+KdWMe0PFcquS8xvLwn5W68JkRq6KB7r357HE
         41fzoBZWjJIZ2kn98M4aNMzmQbRacLIDEaSnDPLbTz1faNCvS+Ek91H1xQ89ER4iUnnK
         P68qjfIGyv2F5lR2qKc6xrJcpq6ILe3HfTD+vE9/78iAXuZQK05+rEaxb7cD8iMlSUTQ
         uteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        fh=+xU/oINOHfRuRRK3g0qUIJsMxnBhm5n7bFW2vVdTuMg=;
        b=S6w3c63HiDdYrSQFHDz4CN640BwFRUHdM7TWLA0InEs9cZr+Z4sLOfWiAGIiibTXr8
         m8nGBy49CKD/sPrJD8O5Cq/zilmC6EqoepiN3YltE9SCaTpQcDlUgAvASahQbX6vqbRt
         PwP+iZu3wJCMtZki6qUpzWyO49ITAoKa9Itqd02A9nhKhUTxC6Xk+Y+1iEAthQkWGKsA
         xzNX3BPNLTDIQWJnp9FFwc5305srJ/NU6zihA8hSBoMg+qIs8dksS3woxj4o8AcVhNhR
         knsM/qW8PACc2DsAfUoN9xKPtoJ60wERSV7ELSkuOiTdixXs+nKjPg9PF0CiTUbru858
         DIKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775843305; x=1776448105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        b=v6fX/Ze/e0xHjtlAT2D8m6JWd3cf/rfvO6I8Bi967LzzzUgTSsDCi50N6/RD+nOGBo
         BjWmW3g1rnQ+WDoD8xpB5vA0p7FPKvECkITahKv8mtu/8nFKv5sgRZnKfNaSEMdfeIfP
         76lIBeHhPCLpNEfC0L4yTndFVfPt4cKZiDTnrXy8pmk9hLmjCFkI7k90q0rhi0/vn6w4
         cxsQYXXohZ522BBTUzMXesLCQH+lZox5+LXWsVTkYUmxqETjx2Co6FQChHfUoXyAGc0l
         jFi9BugB9EB1OydleY9b1hce/p4Cm4uICt5g92wvUMvzEHWjyuxqOKhlf63LVmd8M9sK
         s23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775843305; x=1776448105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        b=HJmkgNgiKNC2Mj/JhjsqTF3PStqPu+b5xkzT+5S7Wy7DveQi9KumMMfmfD6E0Yvqa4
         MZ0G25RHrgToUYjI64n/MERO3ie4JKh//mEfa54bxHVR81bXoBkK/jz+3gq5TBahKQnz
         JVqNBKfSV7c+GVtOmA0QrtjNZP9hN044Lu/HnCIOtUpBZDpIF2gjar5XFf3dYV/g61zg
         ntXLrqp+oBeVVDI0Ak+8X+ixH0DzoerXt0E/CfywX2aHdr4Swvi3wVSjFvSt1X3oKCNM
         m4+B73dsgGuRK8A5XDl2RDvgj0RTW7Tw3a9NireKqTcEVysZK5LjnYMM1h1GvlofrsVb
         QjRg==
X-Forwarded-Encrypted: i=1; AJvYcCUK1CR535//SPXiPvbnENQ0ptPRwW4sDbFJGNCl8S89/FDxfvsctRyvW9TSAUBlOykxz2dT@lists.linux.dev
X-Gm-Message-State: AOJu0YwdtEPZ1LpocbhCAgEgT8xg90qn5NlPS6Ok5HSkiI+rSvoJjcO0
	RZ8sYcTjHfe3+jPfXrXi37OkPiWdgklQFIDZFZW1tLYi/And/djRaeWo8NysM6Xuekq+g9hD5YS
	lKBwGnN57uJMq9pradsSJqVKvEs2woLSIalDl9V7a
X-Gm-Gg: AeBDieso2fc1Jecq3rc9dpIO5UM8mIH5/N1KUSKV177NQu/SobqVQQ7/lT5rnZ7gLsw
	ClhWdMFyZsAGWDr5Qb+XeFkCxqt4CV3U2OJ4GF9m3alEUN0z8CxrZ7m9Ad2CC6AGeKXXnZcIb/Y
	f0ICN8kyB9KYDZCWbVMs2naFznyXb03VxU/5aGLnLZopGCxdiHqcdCSlCWfMCU9qI6ZROJ7JCAO
	qN7p2E/U9idhwvofTS17SgXQo4gfZlTpm00GSjBEgI4Q+K1yuD/HNX1hVJOTss/pXZZv+1ZhUwU
	TUwirnkl9lx1JlV+NQ==
X-Received: by 2002:a67:e7c1:0:b0:607:7991:f02e with SMTP id
 ada2fe7eead31-60a0125a157mr1913972137.26.1775843305006; Fri, 10 Apr 2026
 10:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <20260401083137.GT3738786@noisy.programming.kicks-ass.net>
 <202604011328.D3821379@keescook> <20260402053840.GD3254421@noisy.programming.kicks-ass.net>
In-Reply-To: <20260402053840.GD3254421@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 10 Apr 2026 10:48:13 -0700
X-Gm-Features: AQROBzBa6VKBq4ACJ1_R_EdvKeRsco9AeWVrSeipdWQAbkoYS53l26rCnLm5lXU
Message-ID: <CAFhGd8q_avLPfOsFkOd52eVJ7A50eKZ0HJo8ehqhG9P-s7P4-A@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 1, 2026 at 10:38=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Apr 01, 2026 at 01:52:26PM -0700, Kees Cook wrote:
>
> > (Though I would note that GCC does _not_ refuse the jump when there is =
a
> > cleanup; it only see the other two uninitialized values.)
>
> Yeah.. I know, but since we also build with clang, any such issue will
> get discovered.
>
> > So that makes it not totally broken, but it does make it a bit fragile.
>
> Right.
>
> > Another concern I have is dealing with older compilers and how to
> > "hide" the label and its code. e.g. if I remove the "goto" from above:
> >
> > ../drivers/misc/lkdtm/bugs.c:1060:1: warning: label 'weird' defined but=
 not used [-Wunused-label]
> >  1060 | weird:
> >       | ^~~~~
> >
> > Oddly, the unreachable code isn't a problem, so we could just wrap the
> > label is some macro like:
> >
> > #define force_label(x) if (0) goto x; x
> >
> > force_label(weird):
> >         pr_info("value: %lu\n", value);
> >         pr_info("outcome: %zu\n", outcome);
> >
>
> __maybe_unused also works on labels. Like:
>
> __overflow: __maybe_unused
>         dead-code-here;
>
>

Completing the loop: Here's the Clang RFC discussing obt label handler
design [1]

[1]: https://discourse.llvm.org/t/rfc-linux-kernel-discusses-overflowbehavi=
ortypes/90486

Jusin
