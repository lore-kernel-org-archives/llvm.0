Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2163DDAF7
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137543; cv=none; b=uShNyEDQOxtQ8MK1y0FqgK0ykxhZZXa2d0rjcCnKwLioloxrk7rg7+m5+Dmb8t+c9kNLW2JbNklzNa4MY+IJVKuFGhwcfkiqe/hLyQMhB1J/OqVnSL9KXEi50j3uA1g4N16J8bXO60cp1Qg36efUTct3UdbExBsEMLYUGSxJcAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137543; c=relaxed/simple;
	bh=AhaZ2ac8oEimySxpNjIfoYtWcC/kc92M7RxeTjSTuOs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmY9Lwu+QN/Dbg0xia86QBhoYdHNNEK3em3Wkz1Zpic2UwFWfbzqwBzUD1hBXV1YOPKuLhqdd7/r+sDn/YK4yxnjPN6ejA/hymUKm9dwgSzyM4O3aYbpxsFOPtsu1zhXUwfmpk1IsnOAGi/6i4K3HSPcpBFgljanbESUx7Uqmk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQkJnqys; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQkJnqys"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954aff6088so19883945e9.3
        for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 00:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785137540; x=1785742340; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOW/nYL4to09ZFRK9TrJFYsB5lOpHRRLHeRIsAezmMY=;
        b=YQkJnqysgs0K+L9VYk2Dl1lX1rzjUrlkH3uGVEg6+Upy4zmdGuIF0lH2npGfCtS7Dm
         TKFrt7dPJJt4yc2UTGCKufu3RqQxHuDZUq7jFG9ESCgCnDVVbIS0ZnuouZWiePO+2Ewl
         R3kVcR3QQErLkfd0l6NNGWxC7ukzVpYsrE892GgZTusizF5gU5WuGwchnmiMM/3HL4vD
         T+4D6FRiIW+iknzbrPSKOxutOZRRk8/vU8KmqZc3Atsv6KPwRdIA1hdPzJbctgKIAZuT
         UqP+s7tHe1bjMaQ5fLPwUPpQXrdeTR4cCC6D9yjKx/wbyV5GDH2HzgnydG+m9DO8drug
         OxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137540; x=1785742340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOW/nYL4to09ZFRK9TrJFYsB5lOpHRRLHeRIsAezmMY=;
        b=aD8eJzhJVo49rR5tDDwXuf+o4LQvT86rpSmv9MrynGQ8Lb06cCnvqcZmC2tm6VZ3NB
         weY6uIEuhmpIcPa6aAPmBlBu4jc7KzehbaejdcFx1Z7ZsrOeV4DLEislNzXQz9pOTXcS
         GXVcFL4z0P9JoTDJRA+dXNkuK4spcWLM1+66qG3OhKWypECRqIdqMBb3x/5XWUNgcxAv
         /kvEVcq/GLNMjJIAfBHSiUgOj1Qdaf2qB24ynUGOAFaR9XSTbs2iqDtlbqSTA3QcgrW+
         ecXnK6Zhk7BDIllE77y/9NZws7zyfikwvwP7XuMJmNLMiT3vR0JyPxdxr6eaTuI1+J74
         buTg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1IRSu31KQoxgo93ujE21gRSXRJfPIqE8ckJPxsuN/QXEONTkSxRfUvhYD2GHu2l68cwC6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy67Pr8KbOFZYNv9n5GFJeY9t6itsVSDG4sPRY0zR90LqcmjLst
	SbOmIn0cChU2mPHtvxwsRFC3cVupdkqQgPtUqEnwdyes196zPCIFSxqW
X-Gm-Gg: AR+sD121EuGB2ZMwWuUF0xjFVIu5IuNhWJorkSv0j4u9M3t2VnfMHJ8SLGhZgPgp7+m
	xanJZCDZ9YW083M3GMcTZjh0hFeFzwjdfHAecgytEPTeA3OTMTdodpaFj5ckqmGuuP2ZqAEZn5k
	5YpNDubXqS9kQwnPaDxj91VOTm6tid9wAE8g4aSPEL0zs5qv/5wSHf7XGnD3AC2sh8Ibe3Nl8PK
	8mbS1yWSA7DJDlEJnwMi2jS9GV2m/jEG4uw/qvHHqhiqEnXjo1LrzKQgo1uvpCZv/I4loqeAi9h
	HM/nGuKHWeDI6Dn4761ECKZDFSfU6ESswQzi7Sf1EVCpE6bgwV63ix+nAshvrcR2OZLNz6Wo8zV
	VM4cmjDymBvtI3E5UrfJY6zlPXxk/i3XckSOS3z23lqfG9tRC+Gu/bhJA2zlLbF1RSr3xpcs9YK
	qQu0cpYzx3/U8AZkblXunzS6TMuGGdWYu6JI9c7r0=
X-Received: by 2002:a05:600c:3586:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-496bffbfc25mr23100895e9.10.1785137539393;
        Mon, 27 Jul 2026 00:32:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee1d31sm219425825e9.5.2026.07.27.00.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:32:18 -0700 (PDT)
Date: Mon, 27 Jul 2026 08:32:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1?=
 =?UTF-8?B?aA==?= <linux@weissschuh.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List
 <linux-kselftest@vger.kernel.org>, LLVM Mailing List
 <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, Alviro
 Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan
 <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in
 abs() and friends
Message-ID: <20260727083212.223cb1ae@pumpkin>
In-Reply-To: <amYvRyLKZzEsFyq9@1wt.eu>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
	<20260726101306.3772237-3-ammarfaizi2@openresty.com>
	<20260726151334.4c1ec6f1@pumpkin>
	<amYvRyLKZzEsFyq9@1wt.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 18:01:11 +0200
Willy Tarreau <w@1wt.eu> wrote:

> On Sun, Jul 26, 2026 at 03:13:34PM +0100, David Laight wrote:
> > On Sun, 26 Jul 2026 17:13:03 +0700
> > Ammar Faizi <ammarfaizi2@openresty.com> wrote:
> >   
> > > Negating the smallest negative value of a signed type overflows, which
> > > is undefined behavior. The selftests are built with:
> > > 
> > >     -fsanitize=undefined -fsanitize-trap=all
> > > 
> > > so a caller passing INT_MIN does not merely get an unspecified answer,
> > > it dies (on both x86-64 and i386):
> > > 
> > >     A simple test program:
> > > 
> > >       printf("x = %d\n", abs(INT_MIN));
> > > 
> > >     $ ./ab
> > >     Illegal instruction (core dumped)
> > > 
> > >     (gdb) bt
> > >     #0  0x0000000000401009 in main ()
> > >     (gdb) x/6i main
> > >        0x401000 <main>:     mov    $0x80000000,%eax
> > >        0x401005 <main+5>:   neg    %eax
> > >        0x401007 <main+7>:   jno    0x40100b <main+11>  
> > >     => 0x401009 <main+9>:   ud2    
> > >        0x40100b <main+11>:  push   %rax
> > >        0x40100c <main+12>:  mov    $0x80000000,%esi
> > > 
> > > Negate in the corresponding unsigned type instead. The value still
> > > cannot be represented in the result type, so the minimum is returned
> > > unchanged.
> > > 
> > > Cc: Yichun Zhang <yichun@openresty.com>
> > > Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
> > > Fixes: bf5e8a78bede ("tools/nolibc: add abs() and friends")
> > > Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
> > > ---
> > >  tools/include/nolibc/stdlib.h | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
> > > index 1816c2368b68..8d86044f759f 100644
> > > --- a/tools/include/nolibc/stdlib.h
> > > +++ b/tools/include/nolibc/stdlib.h
> > > @@ -32,22 +32,28 @@ static __attribute__((unused)) char itoa_buffer[21];
> > >   * As much as possible, please keep functions alphabetically sorted.
> > >   */
> > >  
> > > +/*
> > > + * The absolute value of the smallest negative value is not representable in
> > > + * the result type. Negate in the unsigned type so that the overflow is
> > > + * defined and return it unchanged, like the other libcs do.
> > > + */
> > > +
> > >  static __inline__
> > >  int abs(int j)
> > >  {
> > > -	return j >= 0 ? j : -j;
> > > +	return j >= 0 ? j : (int)-(unsigned int)j;  
> > 
> > An alternative expression is -(j + 1) - 1
> > gcc (and I think clang) optimise it to just -j.  
> 
> This one would give -j -2,

Gah, I meant -(j + 1) + 1 :-(

> but ~(j - 1) would work, just like
> (~j + 1). However here the benefit of the casts in Ammar's
> version is that it's obvious that it's only playing with same
> size casts with no extra operation.

They only work for 2s compliment.
While that is normal (and required for the next? C version)
it isn't actually required by C.
(Not that gcc supports '1s compliment' or 'sign overpunch'.)

	David

> 
> Willy

