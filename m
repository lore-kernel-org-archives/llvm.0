Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B136D4EC
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764015375; cv=none; b=Rv3LNLz0wvsFxokbxKoMBXVpXhO6LDFN0raB5AkmNxbxowufaDTbVgLniopBj/c6VpC9mwTOFyfj9eJZmanm+kSf2ESPoU+qAWAxvzXUz4d0w9ay78TGqWyVu7HvR3QDfCtuo5ejWVVTTMeF6UTF/kbD4V1uzikYGW1hUxwTsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764015375; c=relaxed/simple;
	bh=R4tPolCNS6+DjWLqZWJbOBpny9B2bt9yL0gYsMUMpqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evOweTQzej3Opz1MsB1GIkmEC3H3RSXKpVXqvJ60uCDwVya0NoTKP8ZpRKzwWTHyN/+3p1Nwv61gJ0Wgsh8T1wdjnM+ZI1g+NEJl5uz/S9Df4MlavYVpqJc/W/REwDhhGFUBA/ztVNhatKYiVlpvTvKDwOZ5zT8QqJfMrn6Po5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JAigIzyM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JAigIzyM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so7285844a12.1
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 12:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764015372; x=1764620172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z06KotmtsfB1UWZ1tUPQjTnpS7Gb0kLa+slh5Hjs72I=;
        b=JAigIzyM4rXqnEDDCoFvaQ/LZHm8VhnmYG7moxTHeAoqY1jdELbGs3NY5Wgx5RpjtI
         H3lXwgEaPCw9pYQzZQifBuIqFlZmOalM12kKUJ6QnWTS/5tZGvT+qdmGeedvN9rMx7tZ
         GzYwqQpaEH393/3a40rZg7n5Usgv0OKyWywDvd8yFXGJ5QgqXzUWsnZDaNcAJ++jr9AN
         w0yuFsMJxVdthvxiZJw1+G8gyc9vFqcp31w6KZLQs5l89lV5BmthfKVLIOKtudASrfkw
         EIEUnCd/BFRTLbYKE6m5N1l+xRNRIOjMEGz+zp1ZGMbGB4aPLQ61+dMZAYe+joitawVN
         EXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764015372; x=1764620172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z06KotmtsfB1UWZ1tUPQjTnpS7Gb0kLa+slh5Hjs72I=;
        b=vSBeVixivyTM0Q06GmWAOLiZ2AdmoEutRR0mXUHMffcQGbEJ7vh6um3QmkFgcnE+sA
         w8q6Xq4WD9+9Uefh7ReklnjvTJtU27SSHrTajPuF9hYn63+D0TsV3j9l268YoXGcT43e
         sxXmLZiptUrMCrjNH3KeyjNgNLYbkAx8pOQHW/6/3HK5HcujUHR2XTlKyEC9IrhP1mOK
         P3Eye0IGhh8GTPkw4KMuL38LY+cbxWnVuUBfBTe7LzxEN7HyNXM+PRg0WBY0p8ZfGS2s
         mcLBS9qOScbpj6QByLTEbjJcTWlp2Q6wMEMJtSplB2abZ4Zu44cR88u00fsRAqPtNYob
         4ilA==
X-Forwarded-Encrypted: i=1; AJvYcCU6ohofMgMctSV9LkAznTJ/6HFmQgqQmXXZF8cd3cUdtqmZ9tKzY4TJM2Tgh9dtBqus8frX@lists.linux.dev
X-Gm-Message-State: AOJu0YwG+AfXKcS1wMQ9gQkVltDilXn1OQe1JZimpEJD5yOUvk0u+xkQ
	rtKMbfejgCKohhxMU88YXb0IX3rDa693fvs4sgL3MD6hoKxolw8GYYZCz82NdWyvAIQOrq+qLlq
	D8dFCUceWklbJWT8J1VyWJMnTwTG/nIIYyt0Dxl4=
X-Gm-Gg: ASbGncvsrZo/PaY2nFeF+HK8S53P1Tfd2vpUioYWUsUKbwCyjE1VMRpz29MPGJYMPXQ
	UjLUGtRaoVBuWcIVFznBvaZcMgyHwglRe6nvibVOo3KSJ1Eq8eGY10uNY3Rb8eWi9Na1gjpYIj+
	EGhnUFe7Px3S+VLf6MUR1wGy0Hkq3w9kb1C7WRSwcm6TPNPrb0+8IOHhvx6WOaIM+VVat9jefHl
	OfbUrI7Id52A96UinzPgiDtLIb0XOp4jJaFeP/pQIYdnPItp10p1bUjvyy+3M8BdUP+8RepbVqQ
	WL0=
X-Google-Smtp-Source: AGHT+IH8BTSWpESlDk+bVNYpCBTYerkjXtzYduYOQ1ee5rVed6iH0r8+tbGf7UdNFGD02PcNrfkSjNuIBLo4OJtxfSA=
X-Received: by 2002:a17:907:7e96:b0:b6d:7b77:ff33 with SMTP id
 a640c23a62f3a-b76c53c0a57mr10512666b.19.1764015372261; Mon, 24 Nov 2025
 12:16:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-1-morbo@google.com> <20251121193957.1655580-3-morbo@google.com>
 <202511211525.05CB7E1AEC@keescook> <20251122141614.80f1a845cd694b1b470107ca@linux-foundation.org>
 <202511241117.CBE8ADC2@keescook>
In-Reply-To: <202511241117.CBE8ADC2@keescook>
From: Bill Wendling <morbo@google.com>
Date: Mon, 24 Nov 2025 12:15:54 -0800
X-Gm-Features: AWmQ_bmKteXP34og9YzGqC2nViwRnhBfRt6gIUL5VMXxuRtXI7wduxj48bhexM4
Message-ID: <CAGG=3QVwhA8yca4hQD1q7c6TgPL0dT5RODpdpBHSw2yuh1x7oQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] memblock: annotate struct memblock_type with __counted_by_ptr
To: Kees Cook <kees@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 11:19=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Sat, Nov 22, 2025 at 02:16:14PM -0800, Andrew Morton wrote:
> > On Fri, 21 Nov 2025 16:30:43 -0800 Kees Cook <kees@kernel.org> wrote:
> >
> > > On Fri, Nov 21, 2025 at 07:39:44PM +0000, Bill Wendling wrote:
> > > > Add the '__counted_by_ptr' attribute to the 'regions' field of 'str=
uct
> > > > memblock_type'. The 'regions' field is an array of 'struct
> > > > memblock_region' and its size is tracked by the 'max' field, which
> > > > represents the total number of allocated regions.
> > >
> > > As part of any counted_by annotation patch, there needs to be discuss=
ion
> > > in the commit log about how it's been shown to be a safe annotation
> > > to make. e.g. in this case, if all allocations of "regions" have a
> > > corresponding "max" assignment, etc. If just "git grep" can't find th=
em
> > > all, using something like Coccinelle or CodeQL to search for struct
> > > memblock_type::regions assignments can work.
> >
> > How is anyone to know these things?  I can't find anything about this
> > in include/ or Documentation/ or in the relevant commits.
> >
> > There should be a comment at the __counted_by() definition site, please=
.
> >
> > And possibly write a Documentation/ file then change checkpatch to
> > direct people to that file if they add a counted_by?
>
> This is a fair point, yes. The documentation and discussions around
> counted_by are very big in my mind (and for Bill), so it was mostly a
> consolidation/reminder and some extra detail on prior solutions, but
> for anyone new to that annotation, we should have collected common
> guidance. I will write something up.
>
Good point. I'll add documentation for these attributes both in
Documentation/ and at the macro site. The frustrating thing is that
we're likely to have at least one other macro flavor (something like
"__counted_by_expr"), though that's the only foreseeable one. All of
these macros are wrappers around the same attribute because of
compiler skew.

-bw
