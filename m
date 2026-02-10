Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349523DEB6
	for <llvm@lists.linux.dev>; Tue, 10 Feb 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721223; cv=pass; b=N7IksFlDbgCE2alfGQbbpP5syGqSsVoOw4f911X43KdzOC4CYA/x1lHT+eve3RrMGM5IxIq38waC1+5ifMUpO/6h9yibru1lpS9kdzHTfTVmI75/MADpT5eTwgXQhyP9RKBDD2YYNsZWQfIzhLgInsqbRDAqj7Xxw86E756nH0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721223; c=relaxed/simple;
	bh=7jlgqr3yZphn3pukISYjQ5gwlyu5U7nFrO2FLlQ6AM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KITQYjFd6E3aONqKolfHdVRCFW9nPCPWdnbSWqinsguhcdVKpdtHTwJkom/YcTFdT5CIsf9Gv4NuTB6th+3xeMvPmGWZb7VrunGfjXFMAvQ4cWJ9R4tGIh3lRvbYh49vd7ROAFXKRd7xCDJ+lAGqUyAsLj5xTlIl0vY+N0/Oay4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MRm8NT8H; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MRm8NT8H"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5fc41477460so292294137.3
        for <llvm@lists.linux.dev>; Tue, 10 Feb 2026 03:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770721220; cv=none;
        d=google.com; s=arc-20240605;
        b=aJu0mYiVbMKmqsKL0XabeKsmZKatZkw1zCguGvqbkdISQKGVVqPI78190lWCi/fF0t
         neS6NJadYGmh9E5YtE5HqTpIi+HNl0kv0XAls4qSn4m8MtnR6e5GgM3a37++j2YV/i2N
         eKZaX5LDjOhNm5E0E88mDLjG7r7A873wGJQfQ40GAv5Mx+31XMZ/cj2XMzSBjW+7z9CE
         5PW+PrQ3ILHTPxJSax5/Efmi8IEHIcKrcWUYivlFnKPmgKM2+JSGl31H0Jbh7uHcqeFa
         UydEkkWSx0ZlzcbDdd0LlYklKnNjRbLpbcw21TLgp+TkMh5LWVMIdnOgeQuhy4ZfsCrS
         kxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0DJjTOyGvQSzTSy8pu2rJIfOiWHMKOk3wlQ76meFp18=;
        fh=G0beZrmxW1FoEUAG7hm0Lk4PDoMH8v3HHrccbzWs6V8=;
        b=aurGAuRFg1/YD9njBZ4t0p3FIc39pjNB/wXliaUyvzLqUnnon3sGDv6PPIfxAEH3kK
         MIzSATrL+SE3GEbruy1vgq2k3ZHlOPjpzFBeiTzi8j+8+qbqg9gvm8OymulcHvpF9F5m
         CiDi+VfOJbDTQJYwCNTF7hBUvH2keS10jzc5fyKKwaiutHNth6MNlRhq/mXOblrbpQrS
         12OeAX3izoz0jcItBS/XsNxIjnJ0Z13WVvVDqOIG7HVdyWeKNIioszuEVIdBHd20tPzl
         mJUFdrONUCEbURQFr0HCNq6Iioc1d5BfrEJqhCEuH/2ka5Ixuzy1lJgmPKeljt2kEzYE
         evFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770721220; x=1771326020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DJjTOyGvQSzTSy8pu2rJIfOiWHMKOk3wlQ76meFp18=;
        b=MRm8NT8HtGIm4VNwYq7PXwja3oU76MeEDu3olmpVO6u4eyZ2PHVbytD64TziMD4Gwh
         f3mId/fbEPB4mlZx9hAtWqhfllWUSHwtJJdiL+sQvIdqfovtF8Q5wpSf60qBUY6NeIDC
         BnzeWwr/GHz/KusSg6RLmMLPL0znk6FkZ3WfyIfmtHnmau4JfHs83W2ui/u+250bZipc
         niEXGAADeYK/iy9gtH1kZuUfRwUV3iJo64BlLnqXc8MpBYKG5OrCcZVxjW/oBGGSEwuy
         xTlMD+gEFgCqcXe4vjkUQMGPWfe5nxNHedBfSFegmUsgnS39Xok8TOkyjOzURwGuByHP
         lQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770721220; x=1771326020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DJjTOyGvQSzTSy8pu2rJIfOiWHMKOk3wlQ76meFp18=;
        b=njyUvPU1JNUGEYS6GCW/i1bzLNk+aW2rUtUCnpKhM47ci5cg4eE09K+vV2qX5/sQof
         lPYLsr62f1MPMWa/7mw9G9oRChxIifY2ubY0KCrP3GoY1ynFPYnfpMdkSHfNQNs3TDLa
         xLG9/UfWbtcoHOrsR7cQYTzXBuPBYnCrOZtLF2MX2Hzf+AxjKjFoUUYUoVFb0kkBWWRm
         CugoGLboDZpj+rfyWl5XjblQWKG8jUcB4zvj1yIMPgvQqiJ/U2DHWXsf6FbY2Jz04Jek
         kdaVCEjzYHsoGe+moscekHXlxwtyIxY3CJk0X1hwxHEozTHAPrpcmy04zr9s1Nnxem/k
         El6w==
X-Forwarded-Encrypted: i=1; AJvYcCVMYD0OaCBs3HAaDLYU4PzD9SfBDHET/siC+aMcVNxlzFUqWxngyGLzXp9IXidy9/BXz+ya@lists.linux.dev
X-Gm-Message-State: AOJu0YyOYr8n3kQayIvRr9Brt7cYR0TvBbRtILuveoiFME5rTNokn9z9
	b9gSeclQZUMbYi75h7c3DmYkfBZ3u2yI/F+DaB8hn5YGjRvWdbI8BTjkBMXV/pSZTd4QbnvBxBg
	MUvRKMJJQZc+Elfvbt9XnMO7kTuKTQnT+3N8fKno=
X-Gm-Gg: AZuq6aLXYSmew+3DtJyeTTXJWTkayKpVu6G6/YyV8DhFbVDKV0LjpBCtT2gLC+cpJjN
	/jCk80sorUG63EDT1K4+48gzLga4QSqaYFGTT6r2wyJQ6RKfLLTZ+/6Y0dF3XC5wlGEkky+BDuw
	Vr4W6ekHrC3vwOa80O3MEVdndY0yvUOTAZBv6z/Uzl1aUZW9zZvrLjHJw7ikXLFJyGzs+SnlSQY
	FCMdspALClEnmCk+pzoUfY7f4O42a7XBuwjHlvNORVe5QDdoKhzZJ6y8wORjUnet1ffwh7IREFC
	DC4icJMu8MrS1/bCToQxfkMUjdordAU5yIuapphJL3cwGCoythPg9QsL/6UEqcnbFQLADQ==
X-Received: by 2002:a05:6102:3e81:b0:5ee:9f76:1ab with SMTP id
 ada2fe7eead31-5fae8a167f7mr3666507137.5.1770721218424; Tue, 10 Feb 2026
 03:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-1-morbo@google.com> <20251121193957.1655580-2-morbo@google.com>
 <d29ca795-ade3-454b-816e-46b5815a1444@app.fastmail.com>
In-Reply-To: <d29ca795-ade3-454b-816e-46b5815a1444@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 10 Feb 2026 03:00:02 -0800
X-Gm-Features: AZwV_QholJlbosqtF2gd0_fYtoKv2w6FE-QJm9P6K9iICEjFVI1V3YpH6ysZSLk
Message-ID: <CAGG=3QXC7EH18mhJq6egqE6bvo8_KchPD_N4PeZ7Z7tLOv26-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Jan Hendrik Farr <kernel@jfarr.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 12:41=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Fri, Nov 21, 2025, at 20:39, Bill Wendling wrote:
> >
> > +/*
> > + * Optional: only supported since clang >=3D 21
> > + *
> > + * clang: https://github.com/llvm/llvm-project/pull/137250
> > + */
> > +#ifdef CONFIG_CC_HAS_COUNTED_BY_FOR_POINTER
> > +#define __counted_by_ptr(member)     __attribute__((__counted_by__(mem=
ber)))
> > +#else
> > +#define __counted_by_ptr(member)
> > +#endif
>
> Something changed in recent gcc versions. I had tested gcc-16.0.1
> successfully with CONFIG_CC_HAS_COUNTED_BY_PTR=3Dy, but after upgrading
> to a recent git snapshot, I get this output:
>
> fs/coredump.c:95:15: error: 'counted_by' attribute is not allowed for a n=
on-array field
>    95 |         char *corename __counted_by_ptr(size);
>       |               ^~~~~~~~
> drivers/misc/lkdtm/bugs.c:518:15: error: 'counted_by' attribute is not al=
lowed for a non-array field
>   518 |         char *buf __counted_by_ptr(len);
>       |               ^~~
> drivers/misc/lkdtm/bugs.c:520:29: error: 'counted_by' attribute is not al=
lowed for a non-array field
>   520 |         struct lkdtm_extra *extra __counted_by_ptr(nr_extra);
>       |                             ^~~~~
>
> This is every use of __counted_by_ptr() in linux-next at the moment.
>
I assume it's a git snapshot of GCC. :-) What does
`scripts/cc-version.sh` produce for it?

-bw
