Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF443156
	for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718913267; cv=none; b=F5ZIotuF++n0Nnr24q9yzzak5Gh9Vr4x0BJXOk+RhQCOY7CWBaFWDcNNnW+ZasGfdgw+ieYr9K29KRRbQX5+/svEepVph4CWpw3cjM3UiJWrdajy5qTV6zk4ko9C/8tbjwAkZWnN1zFqb3TQBoC+vtms/vFI7wlsV8AK1wQ2980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718913267; c=relaxed/simple;
	bh=BLZ4+99zlaXYewrSKS/BeWr6vPLy/tesWoL9XhfXIxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZFsVJ/zQE1kaNrhgB3tfq1Bw6xJ2ZyGKKNuTeU0SX/5kXhmOW9xIAblbsAKAw1uk2Ac7VgtrdvxHR+529KAjgK5DWIgGaxnzLl6B4eCvPbB8yfeFsJx8ANVK9ko81IT91fTFAgp+OfTN/rsExu1FM+qOKHqhAkVQlQo26eJk7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hlMBWFXj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hlMBWFXj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4217dbeb4caso11566925e9.1
        for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718913264; x=1719518064; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcaMH55LLUeG7NrepQHRnj4cJbGnKrphz5BhzNZk32g=;
        b=hlMBWFXj7A2q3pNq6/rk0c6ehBUyjnIsmj1MJ626/Yhz4qoPGjcw6tR+R+ynfKrbPf
         Y9djvOBpaHz7r5EWrkKrFZ9gsTP2ZkXY9DS9i0S0kmRVPS/12SFwlGpqgruKrsR8QwGq
         9iacQjJu1dZboyecVQ4MLEiq7AcLTzByb5G+fkcrTn6BaqFE9P5iGlTm+rxetr4WeoPM
         tSqC/iK5A7A0Piax3Ls5r9qkPExd318IGxQv7X9RsxounC5mGPczWQi03jB/Fc9Wyl4i
         cOjIOZJEE8UujpaikoV2TEEKI7pkSIVsnmEw/96Eauho64q92QQv1k+FX9v9it0VrfJV
         DnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718913264; x=1719518064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcaMH55LLUeG7NrepQHRnj4cJbGnKrphz5BhzNZk32g=;
        b=emoz6ldxE8TWBnZkS6IEHumQIxzuXga5b01zRytb6OZ5h2pb6q8ELJfFnv4JDEaVKt
         BtI6dnWFjbto8HfhyZG3WbTvaqArWgy0cM20eZrNt/wyz/+TsjV3buy6lS992ux10NC2
         6pvFIibyWvTZquFo0s2hme2soouE0YVOO+9U9+AEXsdH8BNRi5ob7F3XckJM4jw3gvx1
         E269ze6C5by9/kXYbv9LITrV0XlFwDDi01ljWRNsg/3yjHV5JZoV6SiavaN5hUozMRr8
         VMIE2sLH8NVAKNFHnYYyLO3u24dBFRaAQhxal/exE5Fy/W/MM/kucARajABCGopHO7WB
         1/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQtZvP04Meu0RaOEhTf2zHmG5jk1DHfMLHPmNVzNRzX6FHjKcx6tccqaDAgw+ATFALFy6fWArPXrE4GmdYQyncQ3nTA==
X-Gm-Message-State: AOJu0Yz1tmDy1InoaZwr52hyhVq+qYH0PR6bwMD0VsWMaBH+HQHZ/Upl
	RZKeTis9Slpgfry5wBtYHcZhqGv60QbwLLE6eJJOfP1It2HNYwQT3rpNlaqiUKyEYqb8Jo0bRHX
	TMPVRNWNA32mu18qVBy3pDPy6a7/A9ku659FX
X-Google-Smtp-Source: AGHT+IHbb0ns1VcAL2AuPsJP0VuRb7bEni14HNl55IoSwWc7cQ1UsbBgY8bSBKed9IK11uNfM7jlCgePEyPllxvYmpk=
X-Received: by 2002:a05:600c:2252:b0:424:798a:f7f6 with SMTP id
 5b1f17b1804b1-424798afe74mr42769395e9.8.1718913264293; Thu, 20 Jun 2024
 12:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620181736.1270455-1-yabinc@google.com> <CAKwvOd=ZKS9LbJExCp8vrV9kLDE_Ew+mRcFH5-sYRW_2=sBiig@mail.gmail.com>
 <CAKwvOd=DkqejWW=CTmaSi8gqopvCsVtj+63ppuR0nw==M26imA@mail.gmail.com>
In-Reply-To: <CAKwvOd=DkqejWW=CTmaSi8gqopvCsVtj+63ppuR0nw==M26imA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Jun 2024 12:54:10 -0700
Message-ID: <CAKwvOdm+uudyu_JrHUBBJnU_R4GYprym6HWmcYYyHoCspbcL3Q@mail.gmail.com>
Subject: Re: [PATCH] Fix initializing a static union variable
To: Yabin Cui <yabinc@google.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	"Ballman, Aaron" <aaron.ballman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:47=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jun 20, 2024 at 12:31=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Jun 20, 2024 at 11:17=E2=80=AFAM Yabin Cui <yabinc@google.com> =
wrote:
> > >
> > > saddr_wildcard is a static union variable initialized with {}.
> > > But c11 standard doesn't guarantee initializing all fields as
> > > zero for this case. As in https://godbolt.org/z/rWvdv6aEx,
> >
> > Specifically, it sounds like C99+ is just the first member of the
> > union, which is dumb since that may not necessarily be the largest
> > variant.  Can you find the specific relevant wording from a pre-c23
> > spec?
> >
> > > clang only initializes the first field as zero, but the bits
> > > corresponding to other (larger) members are undefined.
> >
> > Oh, that sucks!
> >
> > Reading through the internal report on this is fascinating!  Nice job
> > tracking down the issue!  It sounds like if we can aggressively inline
> > the users of this partially initialized value, then the UB from
> > control flow on the partially initialized value can result in
> > Android's kernel network tests failing.  It might be good to include
> > more info on "why this is a problem" in the commit message.
> >
> > https://godbolt.org/z/hxnT1PTWo more clearly demonstrates the issue, IM=
O.
> >
> > TIL that C23 clarifies this, but clang still doesn't have the correct
> > codegen then for -std=3Dc23.  Can you please find or file a bug about
> > this, then add a link to it in the commit message?
> >
> > It might be interesting to link to the specific section of n3096 that
> > clarifies this, or if there was a corresponding defect report sent to
> > ISO about this.  Maybe something from
> > https://www.open-std.org/jtc1/sc22/wg14/www/wg14_document_log.htm
> > discusses this?
>
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3011.htm
>
> https://clang.llvm.org/c_status.html mentions that n3011 was addressed
> by clang-17, but based on my godbolt link above, it seems perhaps not?

Sorry, n3011 was a minor revision to
https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2900.htm
which is a better citation for this bug, IMO.  I still think the clang
status page is wrong (for n2900) and that is a bug against clang that
should be fixed (for c23), but this kernel patch still has merit
(since the issue I'm referring to in clang is not what's leading to
the test case failures).

>
> 6.7.10.2 of n3096 (c23) defines "empty initialization" (which wasn't
> defined in older standards).
>
> Ah, reading
>
> n2310 (c17) 6.7.9.10:
>
> ```
> If an object that has static or thread storage duration is not
> initialized explicitly, then:
> ...
> =E2=80=94 if it is a union, the first named member is initialized
> (recursively) according to these rules, and
> any padding is initialized to zero bits;
> ```
>
> Specifically, "the first named member" was a terrible mistake in the lang=
uage.
>
> Yikes! Might want to quote that in the commit message.
>
> >
> > Can you also please (find or) file a bug against clang about this? A
> > compiler diagnostic would be very very helpful here, since `=3D {};` is
> > such a common idiom.
> >
> > Patch LGTM, but I think more context can be provided in the commit
> > message in a v2 that helps reviewers follow along with what's going on
> > here.
> >
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > ---
> > >  net/xfrm/xfrm_state.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
> > > index 649bb739df0d..9bc69d703e5c 100644
> > > --- a/net/xfrm/xfrm_state.c
> > > +++ b/net/xfrm/xfrm_state.c
> > > @@ -1139,7 +1139,7 @@ xfrm_state_find(const xfrm_address_t *daddr, co=
nst xfrm_address_t *saddr,
> > >                 struct xfrm_policy *pol, int *err,
> > >                 unsigned short family, u32 if_id)
> > >  {
> > > -       static xfrm_address_t saddr_wildcard =3D { };
> > > +       static const xfrm_address_t saddr_wildcard;
> > >         struct net *net =3D xp_net(pol);
> > >         unsigned int h, h_wildcard;
> > >         struct xfrm_state *x, *x0, *to_put;
> > > --
> > > 2.45.2.741.gdbec12cfda-goog
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
