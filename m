Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647A195809
	for <llvm@lists.linux.dev>; Fri,  9 Aug 2024 15:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723217913; cv=none; b=h2hYLrWY7VbWxYVWCAGr7C3pP+SnH46K/eFhUtRkEzGuq9Hokw2jOajDDuYwuOHhZU4I0zW5UxDoLpQ80qqsWyxeyhLrH4VFRdoCxcAhCvtRURmdltf1uJTWQvwy55vjSrsnTZO2shRo+edmyj0PO0kLKZOh5pZ2ub6uGKbUCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723217913; c=relaxed/simple;
	bh=JwnkO9eMpObFo+OsLedKRFJApFZ3y9YoaamfM7OUxIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnvYyk+yns19dZBSJ3qByAc1QqNSl6e22Tuco6LWcSCu9bUJA7FZdh5jFYoTfyWh0Q0pYkl+WrknS+O9qZbiulrh7wmmdUTy6ZlGMC52tGMD6m6WTFVGJXBd3M4Sv7m8DOwlgkTnQU8jk9OzM6FU9IrwCNGryrHLLsHIJEzAKt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1UwMdq5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1UwMdq5"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f16d2f2b68so32037751fa.3
        for <llvm@lists.linux.dev>; Fri, 09 Aug 2024 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723217909; x=1723822709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWXbMODiYuxXorvAx+kfN59eGwt8Ix7uvQ6uN1UXLrg=;
        b=H1UwMdq5tTu/Zr9PRsHj+02gMh5Nu/PDRh+eQR78pS00SiwqL2gNufuakIlWNIgSte
         u+rwpxMU+fynMtXc53Jn+oUcrSdiCe4rubkDHmHoMQ2l8WeHxsxtMBdBuH3QZqsDpqv8
         6uFEBRea9Ccj2fE1kzIUW5GhlSvIBjbZGsPcCb4/3QIAx/2hDU3Og2yJo7g9M2ZDee1e
         LhuHOuCls/6ER4kkM0H68cqY3Bo9F1P8KpDuiaQEQ0YAW9r4RF7Hck9DuoEelX9woxc8
         5xgROfJQCM+hLA53ugFJFkKm1nUGJ/KpazHEHTN9+FRQi8fIGIr3MDYLE1ZeA1aL1905
         I9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723217909; x=1723822709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWXbMODiYuxXorvAx+kfN59eGwt8Ix7uvQ6uN1UXLrg=;
        b=UTAHlUW80ZX2uGtGrWhL82OvmQcEYunVb7pkBWi6cThiQ+CotRs7+YrwSmq0rVdvDG
         hEcZQjYJTDPc/6CQQSlteQcKjaSgic8KCuXdD0OsLzwKAg3bIiqT3YGAhjdXDLMSHDkq
         TiHlejslgOyws6XOF4uC+41Wbx7wVAicqwFhRFlzqzGD4n0qwmAXak1z8Ppm6Mfrm38A
         C/AXPPSfaMp0F7JmVKJFbUmsjBrf8RoDncssHWo7s0awqZoHBOx22Im/dAbQuOm9z7W7
         iE3mAqP0QusykFkwRMAsuy4fi1UudgNrnw8SUaT5Ntv/HVRJjmHUDvtu/AaXhLoGT9cn
         WoZw==
X-Forwarded-Encrypted: i=1; AJvYcCVo5u93DbAwrP0mOBfyWzaGhmZpncm3J4sdluxBfyJ3RkzB1Kf6bZ6xYO0mPtYH/6/H6d4DPXkvH4b3pRgsHKvDWCytjQ==
X-Gm-Message-State: AOJu0Yzw79Dtc1eCeFR7ocZtxkjeGFcnKgwDr6GOxfHG+eqO2LDZXDYM
	J7rsCk6qIc1bmrXAn87RS11PXACBjumNC07F6MSXfn+u4VU0wAtqQQ7R+mc1aV3uXKWRAWpeA3k
	GShL8nF2wkthKXhjimOcGXnY850U=
X-Google-Smtp-Source: AGHT+IFrrCUT+HJWFjXvxQEV3ITu84mxyWLhuzwLjtJ4nW5WcXBU4YeYGQ3URChdaQ8hO1rRYjy4qKNh6eDpVlwHt5Q=
X-Received: by 2002:a05:651c:102a:b0:2ef:32bb:5368 with SMTP id
 38308e7fff4ca-2f1a6c5c2f2mr17381101fa.11.1723217908335; Fri, 09 Aug 2024
 08:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com> <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
In-Reply-To: <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
From: Steve French <smfrench@gmail.com>
Date: Fri, 9 Aug 2024 10:38:17 -0500
Message-ID: <CAH2r5mvHpNA-FLuq3gwV06tzwv+ioqQxFWqC8f3rcRPMrmdOFg@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in cifs_free_subrequest()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, David Howells <dhowells@redhat.com>, sfrench@samba.org, 
	pc@manguebit.com, ronniesahlberg@gmail.com, sprasad@microsoft.com, 
	tom@talpey.com, bharathsm@microsoft.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 10:01=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > Clang static checker (scan-build) warning:
> >       cifsglob.h:line 890, column 3
> >       Access to field 'ops' results in a dereference of a null pointer.
> >
> > Commit 519be989717c ("cifs: Add a tracepoint to track credits involved =
in
> > R/W requests") adds a check for 'rdata->server', and let clang throw th=
is
> > warning about NULL dereference.
> >
> > When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' happens=
,
> > add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> > This will cause NULL dereference problem. Add a check for 'rdata->serve=
r'
> > to avoid NULL dereference.
> >
> > Signed-off-by: Su Hui <suhui@nfschina.com>
>
> Needs a Fixes tag.

I had added a fixes tag

> Also when you add a Fixes tag, then get_maintainer will add the David How=
ells
> automatically.  I've added him manually.
>
> > ---
> >  fs/smb/client/file.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> > index b2405dd4d4d4..45459af5044d 100644
> > --- a/fs/smb/client/file.c
> > +++ b/fs/smb/client/file.c
> > @@ -315,7 +315,7 @@ static void cifs_free_subrequest(struct netfs_io_su=
brequest *subreq)
> >  #endif
> >       }
> >
> > -     if (rdata->credits.value !=3D 0)
> > +     if (rdata->credits.value !=3D 0) {
> >               trace_smb3_rw_credits(rdata->rreq->debug_id,
> >                                     rdata->subreq.debug_index,
> >                                     rdata->credits.value,
> > @@ -323,8 +323,12 @@ static void cifs_free_subrequest(struct netfs_io_s=
ubrequest *subreq)
> >                                     rdata->server ? rdata->server->in_f=
light : 0,
> >                                     -rdata->credits.value,
> >                                     cifs_trace_rw_credits_free_subreq);
> > +             if (rdata->server)
> > +                     add_credits_and_wake_if(rdata->server, &rdata->cr=
edits, 0);
> > +             else
> > +                     rdata->credits.value =3D 0;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^
> Why do this?

add_credits_and_wake() has the effect of setting credits->value to 0
so seems reasonable here
(in the case where add_credits_and_wake can not be safely called),
even if an extremely unlikely for rdata->server to be null.





--=20
Thanks,

Steve
