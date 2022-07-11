Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52311FA6
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 18:30:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id t25so10113637lfg.7
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W6rHtwTB0NR34ZrWFPTYwR9rMJ2eE52/aL3ngs7eeXg=;
        b=NAqlwqGBo+69LcmrUq/XxSCfYkEWFm5FlpgxueWSHhEjIaFD/BDj6j9L+VTm95GR0O
         gnQJp81msbhNvbN06Nk6L4TOS4XCOkZ4knLOacK0G2tY2Jdw3u6eYFIdgBEEhL4goQY6
         qJ9xoMic6x1yQmeenrGSFdDYheecCfShH78VlTwp4otHIpPoS2NvRzxJuL5Wy9gSpDoz
         gIU4oe6rOJkbQiQhA57TLrTeqJNJvAEWALBVjk8oyzXiTZMPbZPvLX4f2Hiiwv1AXAPn
         0/q1DP/oa790bCMZrySnSRL/9pjfDUdloVDzwKEnOWrbKLGOog7YdlJJNZLXOQrckxPo
         yOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W6rHtwTB0NR34ZrWFPTYwR9rMJ2eE52/aL3ngs7eeXg=;
        b=Eyil9REZCdouWdRhZfoaPjMJ1G8LYcCbIKrIoC14VBI9kk5EMX7OCGF9YT6ccgTw5D
         EzGD9jvaXn+R+p5tqV4FKWiR471p3NUAH2KH6pCkkacwU8v69HUc89Rpn039YIlBdTt/
         gJwZt1K0ypzJjd2YrOkYiB4pUjkbkmQ+0hB/DtZ5r4N9Ok1AILD1OoSoGjv4JMl6cRje
         TuxlXi3992kopbjf4gRNZuZoPw3zoEsFH8mJ9Ajs4c0GjDNpciWNywBoE/cNEeXfimtd
         xTd8F+2+xwvrIrILKlecjIWM4qQ3RQJ2G6DzoZMMGx6zDMLb8LyMZddNMMX32yNuinGC
         9Cqw==
X-Gm-Message-State: AJIora9ZrHrICycNdNl9GqIHjxvieB91RYItBv3C/z9M0nrjzvJX4rma
	netV8NUm/3mUG7v3oJY9PKARd6Si5EeC3w0ilrZvgQ==
X-Google-Smtp-Source: AGRyM1uk9pHlmfUEizNMvHuz+4LalVLSTKQ6858614s9zcmQcAzVyJNsiGJlYrL4tR1HFXuESEtl722aQ3auPgX7sro=
X-Received: by 2002:ac2:4c46:0:b0:489:e93c:69b with SMTP id
 o6-20020ac24c46000000b00489e93c069bmr724646lfk.403.1657564242829; Mon, 11 Jul
 2022 11:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1657492202-18435-mlmmj-51d729a7@lists.linux.dev>
 <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
 <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com> <20220711181933.rcukzsnabiiowy7p@meerkat.local>
In-Reply-To: <20220711181933.rcukzsnabiiowy7p@meerkat.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Jul 2022 11:30:31 -0700
Message-ID: <CAKwvOdmPjCWo0kjfUEamH+bBbeBK09nDcZzyKSr1ze+sVbUvcA@mail.gmail.com>
Subject: Re: [sysadmin] Fwd: Bouncing messages from llvm@lists.linux.dev
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: postmaster@kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 11:19 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Jul 11, 2022 at 10:54:34AM -0700, 'Nick Desaulniers' via Systems =
Administrators wrote:
> > Hi Post Master,
> > Any idea what's up with the below message?
> >
> > To Fangrui, it sounded like his patch wasn't delivered to our list but
> > the message Fangrui sent was indeed posted.
> > https://lore.kernel.org/llvm/20220710071117.446112-1-maskray@google.com=
/
> >
> > Can the error be reworded possibly to elucidate what's going on?
>
> This happens in a rare case when we mistakenly allow a spam message throu=
gh,
> which is this one:
>
> https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazzett=
ait.com/
>
> when we tried to deliver this message to maskray@google.com, Google's spa=
m
> filters rejected it, so we got back a bounce. When this happens, mlmmj fo=
llows
> up with a probe email to make sure the address is still valid, which is t=
he
> message you received.
>
> This behaviour is indeed a bit confusing, but it's not about the mail you=
 sent
> out, just the spam your MX refused to receive.

Cool, thanks for the explanation.

Any chance the error message could say something like:

The message at
https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazzettai=
t.com/
could not be delivered to you; it may be spam but you might want to verify.

Since I suspect the message id will be in the lore URL?

>
> HTH,
> Konstantin
>
> >
> > ---------- Forwarded message ---------
> > From: Fangrui Song <maskray@google.com>
> > Date: Mon, Jul 11, 2022 at 10:36 AM
> > Subject: Fwd: Bouncing messages from llvm@lists.linux.dev
> > To: Nick Desaulniers <ndesaulniers@google.com>
> >
> >
> > ---------- Forwarded message ---------
> > From: <llvm+owner@lists.linux.dev>
> > Date: Sun, Jul 10, 2022 at 3:30 PM
> > Subject: Bouncing messages from llvm@lists.linux.dev
> > To: <maskray@google.com>
> >
> >
> > Greetings!
> >
> > This is the mlmmj program managing the <llvm@lists.linux.dev> mailing l=
ist.
> >
> > Some messages to you could not be delivered. If you're seeing this
> > message it means things are back to normal, and it's merely for your
> > information.
> >
> > Here is the list of the bounced messages:
> > - 11406
> >
> >
> >
> >
> > --
> > =E5=AE=8B=E6=96=B9=E7=9D=BF
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
