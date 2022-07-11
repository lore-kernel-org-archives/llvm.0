Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516F81FA6
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 18:35:09 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id t25so10130725lfg.7
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AqqveFmjBsc4u/9rgTbLZUZ6Shr0vBwqgbZ9HY8BvP0=;
        b=BsfiPdcppREkrn9AC5kkVy991DSbOiOn+QxPCfVyiL1InhbgHkYd8uX2KxWHIqdri+
         vJIDc1VwZ7wQYYg+AjQQ94qGdHrPXOeEAloQ8RBTboX5nWzvyG2eAPd+zzpSCa5WHs8Z
         OhxKbTXhZ9k/xhfe4De+1UkzKC4Vxo2iCa6xYGzyitsN5qNUTtyl3tTyRZjN+/+MY3Ho
         U11DWObm9bnQRQp/TQMbIosda/O22Co9OXkUreN4QJofsNFYLuM9Ly834UhDmt8B3bqp
         XAXU0mXSU8rkLvV3CiT6eGfRfxRp6w7X/u/AaLDoVcO82P/TY4y7gRXm5xcRQ5AZCXCz
         wmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AqqveFmjBsc4u/9rgTbLZUZ6Shr0vBwqgbZ9HY8BvP0=;
        b=r21oYeclQ3E3Q2nyK+E2mQcaNway9cQ6I3ksc3PRaoat+81M93kw66chLwsnxBOeQ7
         yua02eKkwwcpRjPjSeBzWkq3amOUxNYdOyxnXqpstKBMdLa5KyvKUW1p1M2V9u3Z/LyD
         FAX2thjxH+1EqmvGKnqUcSa4ChE5htAegeWuaXLve5T6kPEHh9z6RaiH33JL5paaFI8c
         uwLp983uqK6VNmgnr8b7G0mmwZUr+3eLBOn+RD5d/gpArZ0wPvaLLUjSAq4KTPskwKTi
         Xmx5FjJ4+Eeqjfu73GhrTYOKJya64Me3tWnBIOQZuNDmq2yIfGmk3rUbAIyUJ0KxvTk9
         T85g==
X-Gm-Message-State: AJIora/qvINMT+k7vPO2D+73Evane8X0j2dpoip44c2F7ua2fyg9r+cX
	uQ41qWazIUzgdyF2i7ZH8cxl3RGMGuqNwGgJoN8MZQ==
X-Google-Smtp-Source: AGRyM1vknHWkoCQQCV+s/LUJYhUQBw4Gh+iSAFaczxcs4dnNxQW3c1f5S9e/EkHIXv5AbWkC9WNuC3f7HaOIFcvlzoQ=
X-Received: by 2002:a05:6512:308b:b0:489:32f8:426c with SMTP id
 z11-20020a056512308b00b0048932f8426cmr13195433lfd.270.1657564507156; Mon, 11
 Jul 2022 11:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1657492202-18435-mlmmj-51d729a7@lists.linux.dev>
 <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
 <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com>
 <20220711181933.rcukzsnabiiowy7p@meerkat.local> <CAKwvOdmPjCWo0kjfUEamH+bBbeBK09nDcZzyKSr1ze+sVbUvcA@mail.gmail.com>
In-Reply-To: <CAKwvOdmPjCWo0kjfUEamH+bBbeBK09nDcZzyKSr1ze+sVbUvcA@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Mon, 11 Jul 2022 11:34:55 -0700
Message-ID: <CAFP8O3JtxmwWSxTen-G3d8sZ68uCCk+_EEk75pJ2S+-RmAEssw@mail.gmail.com>
Subject: Re: [sysadmin] Fwd: Bouncing messages from llvm@lists.linux.dev
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, postmaster@kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 11:30 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Jul 11, 2022 at 11:19 AM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Mon, Jul 11, 2022 at 10:54:34AM -0700, 'Nick Desaulniers' via System=
s Administrators wrote:
> > > Hi Post Master,
> > > Any idea what's up with the below message?
> > >
> > > To Fangrui, it sounded like his patch wasn't delivered to our list bu=
t
> > > the message Fangrui sent was indeed posted.
> > > https://lore.kernel.org/llvm/20220710071117.446112-1-maskray@google.c=
om/
> > >
> > > Can the error be reworded possibly to elucidate what's going on?
> >
> > This happens in a rare case when we mistakenly allow a spam message thr=
ough,
> > which is this one:
> >
> > https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazze=
ttait.com/
> >
> > when we tried to deliver this message to maskray@google.com, Google's s=
pam
> > filters rejected it, so we got back a bounce. When this happens, mlmmj =
follows
> > up with a probe email to make sure the address is still valid, which is=
 the
> > message you received.
> >
> > This behaviour is indeed a bit confusing, but it's not about the mail y=
ou sent
> > out, just the spam your MX refused to receive.
>
> Cool, thanks for the explanation.

Thanks, too. The bounce from the spam happened to be delivered to my
mailbox few hours after I posted the patch, so I got confused :)

> Any chance the error message could say something like:
>
> The message at
> https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazzett=
ait.com/
> could not be delivered to you; it may be spam but you might want to verif=
y.

The wording looks great!

> Since I suspect the message id will be in the lore URL?
>
> >
> > HTH,
> > Konstantin
> >
> > >
> > > ---------- Forwarded message ---------
> > > From: Fangrui Song <maskray@google.com>
> > > Date: Mon, Jul 11, 2022 at 10:36 AM
> > > Subject: Fwd: Bouncing messages from llvm@lists.linux.dev
> > > To: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > >
> > > ---------- Forwarded message ---------
> > > From: <llvm+owner@lists.linux.dev>
> > > Date: Sun, Jul 10, 2022 at 3:30 PM
> > > Subject: Bouncing messages from llvm@lists.linux.dev
> > > To: <maskray@google.com>
> > >
> > >
> > > Greetings!
> > >
> > > This is the mlmmj program managing the <llvm@lists.linux.dev> mailing=
 list.
> > >
> > > Some messages to you could not be delivered. If you're seeing this
> > > message it means things are back to normal, and it's merely for your
> > > information.
> > >
> > > Here is the list of the bounced messages:
> > > - 11406
> > >
> > >
> > >
> > >
> > > --
> > > =E5=AE=8B=E6=96=B9=E7=9D=BF
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
