Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5332C94A
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763662807; cv=none; b=YemVg8bsiddpGcUUciAJXrK02wCveJuByBogN3yV1XfpULP4CkTW/qGS+bkBeILCVp2fW/jisaAz4Fv7fnEfSKQmgkrxfQveKH/qtnRZWwimTl0S9B+1yImLySo9S0Yxsr36baNkKcGvtVdOQyV4FEhd5qE1xSHl9fyyjavAzkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763662807; c=relaxed/simple;
	bh=wecZEUleM2pVH/ldG6VyoxAP3Tx+t9JIJBh2fst1eeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oM4TTpzvEZxfmbiNi3foQQOaOA2+hpdQ0JUx7xmNPdkli/LOSyvLNfA7U3/e/EDFhCEP9cMHChiKiBUr8CmWh8UMtT4ehfyxas3YqoLJxAoo+qnYfYtVfN1OYd+ai/DDRZ/OGM/Qz+ynfhGWtC+UyojHil5X0QHVPJUX41/cjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H37dZsRM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H37dZsRM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5959da48139so1196264e87.1
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763662802; x=1764267602; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BPfdnrOHpw/8tC+sL0oorkp9gKYtrunKdRWYzTn+GA=;
        b=H37dZsRMk/GhI/UC6/4BsDUOkbHKtk8jUDnPxh5Bb3uP/orWu1TsDj+crVVZ844nv7
         k8Jxj8+gM+wJg2vNv6BGquQa2GkEfnzWbgfaNP7+mW/GFGmtMR1Eq8ivXUC5Wtxv9C20
         sFHuPMGJQzvRenRkkJT97VX6FQrwADwBGugjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763662802; x=1764267602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BPfdnrOHpw/8tC+sL0oorkp9gKYtrunKdRWYzTn+GA=;
        b=sR4o7JbmnFetgdCTVQjd1xMgav0/JxAYbiCUhdcyt6enhdPs4bUHK04dei436f2AP5
         W7IUgiwBR4LXFeR8bJO0o5zcbzik8XhJLIXeKVz6kYckXHCLS8XjrnvWca+mwDAaYoTj
         L4gg0BIRnKesDpYZG0F8xdWWT2vmhzqP/mplmkaP1jShu+McS7RcM86TBQ1fTf5mCOIi
         4wjEM/Jf34KXEGcUeFXVGnj9cWSQwUUw+skGVN4m9VYtWcvVCsL/aPdCyagV0pX9UUIb
         iwrp5dbhJ9Qw/Mn398eAik3YLVZExyA2jExk/FpSCI369kkKZiTIWF50fnFy7dnNLa/X
         pfZw==
X-Forwarded-Encrypted: i=1; AJvYcCUuwBEuPWFMeNpNB1pmOIsYW5BlHLh8wWCPRjtlUj/bWC/BOogyLibD1EWF33dah/HhmDPU@lists.linux.dev
X-Gm-Message-State: AOJu0YxfnmRpwX3v/zqhvSBbnVm5ACPhzyS5xAD5Q6hAjM44msIOCM2d
	OSfrHvBEPEkOIZmTKv6npaztKUs5oTZMviNXwrFL8vwRGBpDKm7oQvnHLICaIjRyw1WflRav/KL
	nFcqoRZg=
X-Gm-Gg: ASbGncs4s79i5cbGfhVM2IhDwfhYBlEnphN4Kc5+qyc38ISTKqqRB46D7IZyWBxHpSl
	wtRcHa2S5YNlzu/Yazpq1nk119M0qLJWnHE8RLegxlUuwPU5Ab4T+CTEfBH/LBCmACc5dou0xgn
	Mdzc1HpHoQiphoCabk+TWriL25ILbMeQjoqUHFGTZrfXVVZnCmKVVLsVwEyc8FIrqC1/p4fjGZ3
	fLT/IRmTQkrgxxqQ0A9Hoo9ip8BvOHIfF0Uyb+kfwMjdneSa0JQnYolZJP4zN2Ww/dBo3MrTF4B
	g3s/RzATEmNB6mqaMRpo16KnDZ/iQoIFax7gwjKhY+Y1CFiBJBIvN3jKbjWMENVEiWv0ZGPBbuY
	hYIoV8MTJ9owYQBBlyafbFOSLjeWXzdRYJQwXh069jMc02YSQXV2L2pdGg4awIV6lPLpYrKnHys
	amvx/xF4MyqEwgObjXZrCo+vxL7AgaFZqTQ85KjKoGGESmHdl87COkJyFn/L8v4lbK
X-Google-Smtp-Source: AGHT+IFAjdVTI/TKVmnIVEanvbKSKTfS/TmMwHtsChGDN9uW1OwHOybMpEaVA7ZRQUzWtDTpHV7o5A==
X-Received: by 2002:a05:6512:3ba0:b0:591:ec0d:3014 with SMTP id 2adb3069b0e04-5969e318f12mr1397067e87.48.1763662802295;
        Thu, 20 Nov 2025 10:20:02 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bbdfcfsm6521031fa.34.2025.11.20.10.20.01
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 10:20:01 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a3d86b773so10710281fa.0
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 10:20:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBpo5d1cS/2bjzhQ6DAf2SZoeuaoP9E+q+7N+NTzS+SOkDw8mzqz1Xrjm9izYt0TRiUwGK@lists.linux.dev
X-Received: by 2002:a17:907:7f0a:b0:b70:b71a:a5ae with SMTP id
 a640c23a62f3a-b7654fe9b97mr482177966b.44.1763662490181; Thu, 20 Nov 2025
 10:14:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120145835.3833031-4-elver@google.com>
In-Reply-To: <20251120145835.3833031-4-elver@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Nov 2025 10:14:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=whyKteNtcLON-gScv6tu8ssvKWdNw-k371ufDrjOv374g@mail.gmail.com>
X-Gm-Features: AWmQ_bk-my8wSL6P8yRhTUREdDraem8VrQQmjD7uS2S9oN6T2mRX46ftlS1ytQU
Message-ID: <CAHk-=whyKteNtcLON-gScv6tu8ssvKWdNw-k371ufDrjOv374g@mail.gmail.com>
Subject: Re: [PATCH v4 02/35] compiler-context-analysis: Add infrastructure
 for Context Analysis with Clang
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Nov 2025 at 07:13, Marco Elver <elver@google.com> wrote:
>
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -6,27 +6,465 @@
>  #ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>  #define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>
> +#if defined(WARN_CONTEXT_ANALYSIS)

Note the 400+ added lines to this header...

And then note how the header gets used:

> +++ b/scripts/Makefile.context-analysis
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +context-analysis-cflags := -DWARN_CONTEXT_ANALYSIS             \
> +       -fexperimental-late-parse-attributes -Wthread-safety    \
> +       -Wthread-safety-pointer -Wthread-safety-beta
> +
> +export CFLAGS_CONTEXT_ANALYSIS := $(context-analysis-cflags)

Please let's *not* do it this way, where the header contents basically
get enabled or not based on a compiler flag, but then everybody
includes this 400+ line file whether they need it or not.

Can we please just make the header file *itself* not have any
conditionals, and what happens is that the header file is included (or
not) using a pattern something like

   -include $(srctree)/include/linux/$(context-analysis-header)

instead.

IOW, we'd have three different header files entirely: the "no context
analysis", the "sparse" and the "clang context analysis" header, and
instead of having a "-DWARN_CONTEXT_ANALYSIS" define, we'd just
include the appropriate header automatically.

We already use that "-include" pattern for <linux/kconfig.h> and
<linux/compiler-version.h>. It's probably what we should have done for
<linux/compiler.h> and friends too.

The reason I react to things like this is that I've actually seen just
the parsing of header files being a surprisingly big cost in build
times. People think that optimizations are expensive, and yes, some of
them really are, but when a lot of the code we parse is never actually
*used*, but just hangs out in header files that gets included by
everybody, the parsing overhead tends to be noticeable. There's a
reason why most C compilers end up integrating the C pre-processor: it
avoids parsing and tokenizing things multiple times.

The other reason is that I often use "git grep" for looking up
definitions of things, and when there are multiple definitions of the
same thing, I actually find it much more informative when they are in
two different files than when I see two different definitions (or
declarations) in the same file and then I have to go look at what the
#ifdef condition is. In contrast, when it's something where there are
per-architecture definitions, you *see* that, because the grep results
come from different header files.

I dunno. This is not a huge deal, but I do think that it would seem to
be much simpler and more straightforward to treat this as a kind of "N
different baseline header files" than as "include this one header file
in everything, and then we'll have #ifdef's for the configuration".

Particularly when that config is not even a global config, but a per-file one.

Hmm? Maybe there's some reason why this suggestion is very
inconvenient, but please at least consider it.

              Linus
