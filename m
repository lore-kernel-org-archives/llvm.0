Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B21F2BAB
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462140; cv=none; b=QIuy8ag7okutKVRuSp++jwL8fwF2b685Xe6Oc3LODOFlTVF3D+gemkxGtWc+lIQHvPB54P6WofeD2VObqKQKtjPxtT1CugFOelhgCCEAGnAz0JBYtKC/or1h2L+WuBJJF+FE0eBBVQ6TzpxQb4N6c+Opo/C01Z7eJpQFZwLoD+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462140; c=relaxed/simple;
	bh=dx+0A0+zGYkg14I6OBkj3/ss6kuJ7p0HznjIA0M5sBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRAdQjkM/NpqxfeXLHvw2bieI0YrElFZDep+swhm0vabYlz0WntwJGkke4z5OUlq0nSvKFQWTxPT+1Me1+rcmh+s7ufaQ6n0cxk8P2kqG+udTtGzLRH1jz3Wp3g/IqnhhEAG0RfGDiSjfWzZGI67gNnVIw18E4l9+tKOdFYVbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JFsVKSzg; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JFsVKSzg"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-708154c2a80so33660317b3.1
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746462137; x=1747066937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUSGTKlbA5H24+yBQN4jIkG58T5ExeiJA4eFJ+JNTtQ=;
        b=JFsVKSzgnBDOqt9of+8oxqbCXAoyUvEZH0zBEjaYZQg8BgqrqcHw1QNAmn8L5W9BvD
         G1mQrINJYBw3nmSW+fqU5mkEisKPgzSkrVo8Fjz/DeaUUza2NAf0Yb93luvsTEUZw/2x
         ddLbWjDFSUkLeKwaSqia7dwyBqyAXO0Zbk2tssuWRHC7uJqsfkhkeow1ojvpoITED6dp
         UfwvpkT7fcsOafG26Oc7D1nFIO38Q3Wl7Wg3dDu/K51AQQOgCVYoIN32t1n5EgGkGf3K
         GghfW2QWSvDfLtCghZW24LnUDjzDwk1IJRmNfac2bst+ufj4YY4yRusWmfVcw2mxQ6Qv
         cmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462137; x=1747066937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUSGTKlbA5H24+yBQN4jIkG58T5ExeiJA4eFJ+JNTtQ=;
        b=Zjo7XZH9yFq2ckecyn5bRi/yVTT0U/UggyhafAUkkBZQlBDVR3PAMC4GDFXnsKcpJB
         avqaWacDOsAso8YQYxLWlezrCmaT2s4QuC8hGMrzkluLfUhR5lMv0qzGiQVGWRXwDJy/
         SjW0gkX78jPJ4g073/hX8Eir4C7aSzJ3FJoC7tQaw0EIc6rEzXX4lpx4pfxukaV9Dmzr
         4MdvLEVGXYitKyLKZALeyoNQJpwKpeuR7M16D0AjVTBJUzAcKem+96mtkmttYlciysjD
         hXLR+Mm0GCmV01CVYiO4BkGLJWgeYoJ51LvyhpOhX4xIWGFWdKkMSFWZQZVUbSMGOUAA
         rAKw==
X-Forwarded-Encrypted: i=1; AJvYcCVo0ep1Syi7Uw5wCi2hXskwAnhW20x4+RWeVLhZ8fDqfsw68KtmBQOPeCdLSCkUizvFVP0q@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8ZrRURvkupnd3b4mxWmdqyfxx001upBXMb/EMWaTn3tBOBqBu
	meMfWamgJ63jQelDCCHxXDD9xYfMxMe6dwzunQ1cY1dcoBZL6eq//0be+3DY7ral+XwRHloCITU
	2bcTDk9u9VKEndzHW6oz+x5uycJw2Qv5UrT3k
X-Gm-Gg: ASbGncsBHZ+la5lHekRPhmXIU2b0JSmhbQd2XwWvdlqWiqYCTnT5/kuejfFx536OYix
	wRaC/4tNJ+AJKyDzsHIyIX7rfWrkP+qPCoHUbpy/cRGL/qOeE46gvoDx/tUZm3BLvPWtld0ki6l
	36i+QMkcVxo/lfXDXoEonROA==
X-Google-Smtp-Source: AGHT+IH2DUE5HVNEg2bSjlLOWtDIRC8IZyXb2mE2mCyNBUhFsO4FmPL69/3p57Fob2eoRjHd/ddHHp962kCkNWER8p8=
X-Received: by 2002:a05:690c:6504:b0:702:537b:dca8 with SMTP id
 00721157ae682-708e119b266mr116732617b3.4.1746462136818; Mon, 05 May 2025
 09:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org> <CAHC9VhS5Vevcq90OxTmAp2=XtR1qOiDDe5sSXReX5oXzf+siVQ@mail.gmail.com>
 <CACYkzJ5jsWFiXMRDwoGib5t+Xje6STTuJGRZM9Vg2dFz7uPa-g@mail.gmail.com>
In-Reply-To: <CACYkzJ5jsWFiXMRDwoGib5t+Xje6STTuJGRZM9Vg2dFz7uPa-g@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 5 May 2025 12:22:05 -0400
X-Gm-Features: ATxdqUHVSCLwU25t9Nh-Eb-QNfhRN532QIA5RHPtIkiKO7hREbMXnOdoRrxJisQ
Message-ID: <CAHC9VhRf2gBDGFBW1obwCaGzK4RdH+ft_J-HXV6U7x7yiCJn5g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: KP Singh <kpsingh@kernel.org>
Cc: bboscaccy@linux.microsoft.com, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, code@tyhicks.com, corbet@lwn.net, davem@davemloft.net, 
	dhowells@redhat.com, gnoack@google.com, herbert@gondor.apana.org.au, 
	jarkko@kernel.org, jmorris@namei.org, jstancek@redhat.com, 
	justinstitt@google.com, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, mic@digikod.net, morbo@google.com, 
	nathan@kernel.org, neal@gompa.dev, nick.desaulniers+lkml@gmail.com, 
	nicolas@fjasle.eu, nkapron@google.com, roberto.sassu@huawei.com, 
	serge@hallyn.com, shuah@kernel.org, teknoraver@meta.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 7:25=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrote:
> On Sun, May 4, 2025 at 7:36=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Fri, May 2, 2025 at 5:00=E2=80=AFPM KP Singh <kpsingh@kernel.org> wr=
ote:

...

> > > ... here's how we think it should be done:
> > >
> > > * The core signing logic and the tooling stays in BPF, something that=
 the users
> > >   are already using. No new tooling.
> >
> > I think we need a more detailed explanation of this approach on-list.
> > There has been a lot of vague guidance on BPF signature validation
> > from the BPF community which I believe has partly led us into the
> > situation we are in now.  If you are going to require yet another
> > approach, I think we all need to see a few paragraphs on-list
> > outlining the basic design.
>
> Definitely, happy to share design / code.

At this point I think a quick paragraph or two on how you believe the
design should work would be a good start, I don't think code is
necessary unless you happen to already have something written.

--=20
paul-moore.com
