Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9682E5B2A
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971288; cv=pass; b=gINaau9I78Inh+Ckh6j8dLpEY3rwb+PLJDZ5iDMW0Wg6ZzYgplgmK9w2IsOGjwLSxkX8byv/RzqZKxphDKMnXJS+287POPCVb2GBRdc+u8SAR1sg6JMTev122Blm/Yy8XZjKmYSl1MBYxEOFN/FTIRP/AvvNNK5bPXS8kd0k+Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971288; c=relaxed/simple;
	bh=6lQCek5WVt/r86ksr/VRfq+SzkKgYJseGbt9VuJSbjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1nE6mW/3EiX/2jeXw8x8klxzSO7NP8ZHkJHIP9z53WUdElor4PSgk9gEWGtc2oDQfQzCYe79U7qoOeeCanHZpe9N5oARdWgLpc0pyMzaXdtHcX4uPBOKncIME0O8oGWpT3IDuxKnGmXWUxQF43FVZTVvIlFWvu4H05T9Ft6lb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQRsqNIi; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQRsqNIi"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so2554570a12.0
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 01:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777971285; cv=none;
        d=google.com; s=arc-20240605;
        b=N17df/4CKd+hRFfok3yz/Vs3tT7SnmHTJntdkZQ4CptP8B25vv7iqtYUMinx1LsvSY
         hyGjQcB/YROgBcX/BX0DUh9mWPhDrmeoS7F2yeJcNx79sBnEFwzGrLayxkBVsPl/lbYG
         0dgFgCaH1K+2JwjZ8IIyh0/PXPQMfnj+1OJFIim27p4NKJ2h1aQ92SuBb+/KExJdSJKU
         H5j3UHT1yVs/adv7I3RCgzj7gzQDgzdWICnWJViAgro8S0Irrt7IO4wF75gNjd8L8UPA
         TUv9iogjQ9Ja+Dl9TbSNTd63ZvCOEFRy3m7flRURlm59qq2nXZJ7yfP1TtYTHzJR0CQB
         OpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9wdfdluDfOc56C0VjHJT7ZZqNz7mrj9b9II6s2fvnHA=;
        fh=+FIExnEWKBC15kn+4SMQD9+5iXh/hsLlhq9UrRoVQXw=;
        b=lTlCVsDdJ3H1QUEXO1RcHgpCuFg0cxE7biunplfJG9AP7lAwC7izxM5KD5s5uMqh6G
         0vUdJf/ermG0cOKTt9r0JA4J2wc62R41ksuNQw/XU72/Cv6PdtNQPe/5LGNEyYcq+hai
         UfS45de8N690JMLH1BrUNDtAilfTT1X40gKyeXzs+Q1ZFEDTkufAfHcNF8brHUUnlnwI
         4PmUolhyC09YJ8WMuHdOwLA96WYctnKfL8+urpPLGREhawn4EE35wOvg21PEOCFHspsG
         BbLD95yhYtGXiARv5iON2uXZGJyWYia5h+EvjVT0kTXVRnifcFpLMh0nYbA41WPOlTlw
         BC4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777971285; x=1778576085; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wdfdluDfOc56C0VjHJT7ZZqNz7mrj9b9II6s2fvnHA=;
        b=bQRsqNIiSCS8c+X+RVGhjFu6FHoLXZ4YjyQM+2ih7puv8teejLT87X6OlkGaE7yfcd
         HAOZIHdZ7YHjQc3G1PiEHoRIn1NEeTzmMgDIKl8oeaXcqSsIwiqsfDIWYefnwTFffEYO
         2KVV341XpKeuRbAizCi2/0fLW7JHPP1uA2fgf0Rr8irzGpnKS+Agmj2RrKA5vyrObijO
         FrN9UTgqXCNuQtr8+pD68SCjv7sVf6Sa0WCjjVWQ5TdoYtGrIl42jonfWcYqg5/1+C08
         W25KMIO+s+N3tU6qxTE4Eh5/Fr8uswrSJt9G1M2k6saDQv0owsl/AtjgOd4IyqsxZygV
         Ufxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971285; x=1778576085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9wdfdluDfOc56C0VjHJT7ZZqNz7mrj9b9II6s2fvnHA=;
        b=YPUVnh4wOeYDlyKmYWE1rlFkemOgjbFiMA4FFe5qXbu+JYvgkfBUB/lzaFLKvlCEe9
         vXfR0izlfTODmZ5EMb0f751f0kGm/5HdbriCwHjYRa2y7nEksqOXXRz5/baoFll5SLW9
         80777uaaTAQKE+wnz5nKsrDM6lTTP2zIcBk2z1dIEEiY4rK9l4elgpVeTaCtd2EnWK/9
         e5sJIWMPIn286pXttzz0mjU/xL83V0HIs/F4B7LorphvSAkB3Z+vL6ov+sAvO/5rLewS
         9Bm+g6XeX4IX1IrmiawSDkxkBm0beOaPdkoqAmuevtKH0QZ3rnsghEhcm0qkufIHVChe
         URPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8n6M3DdzeZsIcqSwQOp7YOIrKYJVdZfOImaddcSE4MW059Q45NoDG2N/xjCFSeYgwUnTJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyJRN39KlIPp1ntpTbAe7N+qvDcVVlFarpRZY2c8lkcdQLDVhS6
	vDxP0fgJ1A3ObvYk71Oj9lj479RLx7/05YhuTQZMNQv97tbviWdBgkKCBugTRwQoJr/KzaMmINa
	sAOn83t7RFM4/9NQU4YZnSsbRac8LDZk=
X-Gm-Gg: AeBDietorYqYpnFKFjB0VkqkxEkP2YaPRmbh0PxsW4r6TSEHc9PA7ophuRXj5pDHDnz
	MUmFbq9xEDcdyF3x2OuauEaMoGoMNig/dA6XNTr/UPueAztivphVZqkxK0Yy9Wuy7vyYhr+MdER
	x/KFwq02PAQjQ2Qk7lgcHoCCHNju5+irR7PSXmYcSJUhKlbgKgDjimhwrmWcxj51ogp/3oLT8Be
	+iOmGjShOX1gTMvMGJCG58yG9qXuUut1jxaxM5uZsa722Gy7CstbhgM9xXHxECT0sWxGMUclOZD
	tdO14KfFFYSB3Ips+Lbo6ZObNPpmW7cTG8LOHGzut8a5ACFCqOLywKw5oN2accSwFCQIbjm+CX6
	T72SyvUn2J59Gtl/w8BAcJnZWPmPTd+nxLwt5PiyROJHzxXX4/I2ZzySN4zb3SJoaOkRe
X-Received: by 2002:aa7:d549:0:b0:67c:89f2:ae27 with SMTP id
 4fb4d7f45d1cf-67cc392dd47mr866648a12.9.1777971284861; Tue, 05 May 2026
 01:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505010112.645361-1-rosenp@gmail.com> <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
 <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com> <df3e889d-ac8c-4d11-a5fe-8ed2769953f0@app.fastmail.com>
In-Reply-To: <df3e889d-ac8c-4d11-a5fe-8ed2769953f0@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 5 May 2026 01:54:33 -0700
X-Gm-Features: AVHnY4KjRxcRwGciP2xMVdMfFUTVoMobX-8vJo-rhK4YVGeNq03NoVrlCgH7a04
Message-ID: <CAKxU2N_moR8bs=NLUcW054a=oHB--4i+M5XKCBNF9LskYcjAhA@mail.gmail.com>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 1:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 5, 2026, at 09:47, Rosen Penev wrote:
> > On Mon, May 4, 2026 at 10:54=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >>
> >> On Tue, May 5, 2026, at 03:01, Rosen Penev wrote:
> >> > phys_mem_access_prot_allowed is only implemented for X86. For others=
, it
> >> > returns 1. Move it to header to avoid using __weak.
> >> >
> >> > Fixes compilation with make LLVM=3D1 ARCH=3Dmips
> >>
> >> Can you describe what exactly goes wrong here on mips?
> > Cannot find symbol for section 4: .text.phys_mem_access_prot_allowed.
> > drivers/char/mem.o: failed
> >
> > It's full of similar errors in drivers/pci/ as well. clang on MIPS
> > doesn't seem to like __weak.
>
> This certainly feels like a toolchain bug. I would not mind having
> the PCI code converted away from the __weak functions, but it should
> not just fail with a linker error like this.
FWIW I just tested

make LLVM=3D1 ARCH=3Dpowerpc -j 31

which results in no such errors. So probably.
>
> Does this happen with both ld.bfd and ld.lld? Which version of clang
> and lld are you using?
clang version 22.1.3
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

lld the same.

I don't specify lld explicitly. I assume LLVM=3D1 does that.
>
>       Arnd
