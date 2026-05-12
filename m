Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EC249250D
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579517; cv=pass; b=arNgWO3Q89u0Zr4RdB3YXsd1yM8iKqP3uJQcwXodlx1KD95jI7LGJiD10CeOZLSfcnbULyc9O3/w5nXOzkk2/FpFwv7vvjRQY6srM1svc1t/PvnEcU3sc58ZsRDHWbrf+64feZ4l/6BRTvQF6SllmOomFrVut8/FNw3WS7+ZPCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579517; c=relaxed/simple;
	bh=EIsIINGplKZJmp6KyNBZmIyWQAlnRy4EfCcfLd8VLHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ln+ZYJkSiWibCEs9x0xj0IXCAhb5ujZ78rIv2RfnLt4FJ69KeLrmzxo/mslXeerihgR2q50makmIrWOFYs40ah9er8pSJfgNY/3QvBarI5nTNJCjnfGJatAf6XsMspTveYu234NTaesYvZKmRCFTyrM3R9UoHwhXd/d7XdlKTTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=juwJB1qu; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="juwJB1qu"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12ddbe104ccso4848517c88.0
        for <llvm@lists.linux.dev>; Tue, 12 May 2026 02:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778579514; cv=none;
        d=google.com; s=arc-20240605;
        b=HOqXs3qrQBByCy308+L1blZOH4iMANHbkAX3sj4HPQvDx8Sak3HLnBVrNk/9BpwyOr
         35SPZMT07JgbAomEP20swiLOjWO5sCZO6VToSAz0rJst9ZbZGf9YrdQ6YYCC/CYSsBWp
         sVpK0AyoKHTyFcvFIkpVpr3xWvDqk+/w8fQkVkUAPJsrOEh2KKOER91ImHBCH9JJhpBW
         e6YmmxcG9a1JvGovO8T23uTcZIX8EnnDVqi0oWQJuuaMzUMIyKVJJP0CpcXvDKs6K1xj
         093NAKQhmlWTMJLSdzRpcDbFypaCzmDjI4CLLfvVbOb24xQlHQsKbYvsib7Cmfv73iON
         aSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+ec8Gp9KIgloqxfI4Ah9RgcAxU70GC5qHU2EuM04KDM=;
        fh=IgkO1Ut5wGxuPZJVn6g3GXGxV+X5FJ8iyONlW8JhJeg=;
        b=FJBJIye1eP+F8yEjVivQbdHe3r7DVrJ2/QAiYp5HsYrjhhmtrmYm3aIn4/COPsbrfV
         3E9rMrlXNemHuvN+hIZAzhxVqU4Ri8GESgAi4nqubqXniBRJXbZbMwVTzZnLZpRqc/pV
         ncT+JUTWrYpKZ3ZVKrnXdBz2P/b8k7ZRuAC6Bi7JXQrTnRSUpnxYgjKN5AgZuw+nuacT
         gJlHq4P5ukKEAALY+GBZW16uEYFrhaK0Rr1o+vM17owWyGsB4tLSfsorQodBMgNS8ELH
         3ky0CgEhwtLsLXAZLpKaZQSTJEKlzWEEroE6okzwuez3V4t265dhJI6DO0lm4T9szHr2
         9Lmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778579514; x=1779184314; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ec8Gp9KIgloqxfI4Ah9RgcAxU70GC5qHU2EuM04KDM=;
        b=juwJB1qu8aP9eCOpwYG3AZMNrILAYmxcgkznMAsM0MzrbzG16ZjgxmTIb1D73N0yOH
         e3o7EpaCej7zlVvoOVqPTMynlTsUGHnVFFPfN96CjdbPx38O2kQw7zruQ8AU5//0z4Lv
         aw1xasJ2AsuJYwdO88cSwEoADHCjaSvijapX9LolIFds+WgqcTMobrYyMZRcTImfvCUD
         soHmMGB8xJScy3kowquE1Vw4CXAwrKV6QkJzHWB7lh2ZYYLI8FOtiX1uPJ4ZaSPJnOQf
         /9mMFOt4+afVDQQBL+W+0wT9HzYyIKc5sN0qI68TLg7D200gygoBo90raHhhIW1KruWc
         nrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579514; x=1779184314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ec8Gp9KIgloqxfI4Ah9RgcAxU70GC5qHU2EuM04KDM=;
        b=SmewtQOx4DJy+gl6JyLo9WgTMeyRrti8jgoOumkA78/1lwAW7X9cUaR8WggGS3lUl+
         /Az+0jqyECuAQVc0buTNSSqH0SAjiAnqa7mFepj78VAU0DUpKKEriA3qyvZ8JkHsLS1l
         GOtoSlYyzXgjYeMJME1O7apUdlf7vcfUdRhTTm3HkV2mI2fQySzUp24W+EM7He+pez8r
         50Bm2j6Jnbq18Z6SR8q11G25tuxoxpd4H+hz7/RejmAKg++JUZgDGhQVWQOUmWdTxgpC
         aEFD2oYjRG9EnadEGeLemWFC0VSWQKzA8+dc5C2qlkJK1Y00vuBGFjgi37JjxlMFOoVj
         xomg==
X-Forwarded-Encrypted: i=1; AFNElJ9umPYflW7DYUq1QIrKHTZBpJbYBYIYDiCi5CrZyez9p9PIUylqYTilAqLJvAeGhCGdDqwO@lists.linux.dev
X-Gm-Message-State: AOJu0YyOzhWv283zeLd9b5t5sT+5iNqxjMHrNzBRdauEmvwkjhEaRgNg
	qK4trCEDRqdq7VJyFvoaVi2g7k6kI1hVvuH01eciM9dBB2JQbm+SUK4d7pFRLufqAHZrHPdguhE
	LMJtr+YNM6cjRq0rleV0KPgtYQKixBsmojtuVxiRg
X-Gm-Gg: Acq92OEpfTE42gPh6iJWbAa5BNEWpmp0MWTln+cB6frAGD3pdWtd8ugL8Y53k5EDQAN
	A3WR61g8G3PRPigx+pHYbOAamU7TfhmpQRlyTA1dmk2CLKbEzjAQ+YBLr4ef2TJvYNtS2UpnB5T
	QEzCS0EZ0GPqh1Gd7F2KW1Szu1eovfisCMhrVsbU2YFzRqKc5o6fxQf60+5E42sVD24c9nsi4IV
	a0VOQf6gUiECC2CG2mGxa9aXCS0ZFRl/fLltAUTfri4d4Y7phUnXJawVR+xgoUY51b7xEhPGROw
	JNgbmgGvvB4jgVmGEdLk2VG6wolEMB3RPI0ghGc+p93HbgRg
X-Received: by 2002:a05:7022:38c:b0:128:d20a:2f40 with SMTP id
 a92af1059eb24-13344c4307bmr1461470c88.8.1778579513098; Tue, 12 May 2026
 02:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <20260511200136.3201646-2-elver@google.com>
 <3z5unwqxty4qq2siingxdijbk642te7kf26ba4ff2xsmyptgq5@i6bxrvkfbve4>
In-Reply-To: <3z5unwqxty4qq2siingxdijbk642te7kf26ba4ff2xsmyptgq5@i6bxrvkfbve4>
From: Marco Elver <elver@google.com>
Date: Tue, 12 May 2026 11:51:15 +0200
X-Gm-Features: AVHnY4J9rWhb6ZrnXllLEE_U0YQh3r6D8w8ra1G0CJOzHs8wrDs9DHipy-uAw-w
Message-ID: <CANpmjNN-rPHMOGxyfcAGiJKDdDixiB70uYOa0UVCs92QgMNGYQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 07:13, 'Harry Yoo (Oracle)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Mon, May 11, 2026 at 10:00:49PM +0200, Marco Elver wrote:
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> >
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
> >
> > Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> > the address of a local label, which is considered broken by both GCC [1]
> > and Clang [2] because label addresses are only expected to be used with
> > computed gotos. While the generic version more or less works today, it
> > is known to be brittle. For example, Clang -O2 always returns 1 when
> > this function is inlined:
> >
> >         static inline unsigned long get_ip(void)
> >         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> >
> > To provide a reliable unique identifier without breaking architectures
> > relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> > to _THIS_IP_ where architectures provide a safe implementation, and
> > falls back to a zero-cost static marker where _THIS_IP_ is broken.
> >
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> > Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
>
> Looks good to me,
> Reviewed-by: Harry Yoo (Oracle) <harry@kernel.org>

Thanks!

> with one suggestion below.
>
> > ---
> >  include/linux/instruction_pointer.h | 24 ++++++++++++++++++++++++
> >  include/linux/slab.h                |  2 +-
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
> > index aa0b3ffea935..ea5bc756bd99 100644
> > --- a/include/linux/instruction_pointer.h
> > +++ b/include/linux/instruction_pointer.h
> > @@ -8,6 +8,30 @@
> >
> >  #ifndef _THIS_IP_
> >  #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> > +/*
> > + * The current generic definition of _THIS_IP_ is considered broken by GCC [1]
> > + * and Clang [2]. In particular, the address of a label is only expected to be
> > + * used with a computed goto.
> > + *
> > + *   [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
> > + *   [2] https://github.com/llvm/llvm-project/issues/138272
> > + *
> > + * Mark it as broken, so that appropriate fallback options can be implemented
> > + * for architectures that do not define their own _THIS_IP_.
> > + */
> > +#define HAS_BROKEN_THIS_IP
> > +#endif
> > +
> > +/*
> > + * _CODE_LOCATION_ provides a unique identifier for the current code location.
> > + * When _THIS_IP_ is broken (generic version), we fall back to a static marker
> > + * which guarantees uniqueness and resolves to a constant address at link time,
> > + * avoiding runtime overhead and compiler optimizations breaking it.
> > + */
> > +#ifdef HAS_BROKEN_THIS_IP
> > +#define _CODE_LOCATION_ ({ static const char __here; (unsigned long)&__here; })
>
> nit: perhaps it can be __initdata to free these after boot?
> ... if we want to save actual memory allocated rather than the
> vmlinux size.
>
> apparently ".init.bss" is a not thing :(

Not sure - it might cause CONFIG_DEBUG_SECTION_MISMATCH warnings.
Also, if this memory is reclaimed, it may be reused for kernel
modules, at which point there's a chance for collisions.
