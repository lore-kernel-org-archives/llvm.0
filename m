Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5DD2FA
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:48:30 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-246fd87a124so224166a91.0
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 14:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681940910; x=1684532910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3umHbQ49oYLkecPTCD3JSlHIMiNfIqcecI+C874KcLU=;
        b=57b1kFmCr0701sHULhDh6hJvbcA/JCF8T9BfMwXm6gNKjpoFgqkiRNbbSCJ4usngpL
         DKoGEALP4T49ns+mn9Gjv4wAwMsxJXX2CEhhTwvjiI9gSUad8Xf6JwRPGb/31lPG8QXt
         k9LnwFASj/5ONaJ3FyRZZ7Jw6CRyA8Kfb/FtlTr3dCsIMd6gxEXqr9vnxM756KUQjIyW
         1vIED6gatAIMxxqosz2P5t1Ftk7rQ1zIiTjX2GU3joytTkiefDxjc4cApJWVgXQ4kQQV
         E9Kyj2dEfkawcnBtSLuq4vJ3lTHiSMyVhXtmT47lT2Sk4GoMX+MRU7WkNiSgCJGCzFgh
         Z/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681940910; x=1684532910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3umHbQ49oYLkecPTCD3JSlHIMiNfIqcecI+C874KcLU=;
        b=XZ5sdWANE107YgZo81WOLZLcbhaWFLTB3/71hq2W6I8V5dwsg9aQZtkim7ABHE7jrt
         dCdSVhpKWqLLA2gfq54Q4wHkYvIFTo2cvqoSfCANrDWXkc/C7gUYKwfKiB74reggM2r3
         pulvfxAnggxzRPaE3+oYy4oO1Eht4E/AjEXg9+lfPTboKu9lbq/k64oC+wADS9iUsFBU
         ZGLdROziD4NopQPPG3PVbdEEwby+hZX5fZRj7o2ftRdKEBUxUdWfhAmwRjuIksP88AZ0
         rRohjBwhYIo5VMzAeqXKb7JlPyHVkPdvJdtNhjp31TfWt8k2meScuBgABrHlX168R2sh
         wX/Q==
X-Gm-Message-State: AAQBX9cVgW4l137bYJdShu5r8DvvNfbpgT958zR8hhxh9rTiF3hnR7/m
	NWmSUg9dwfBaNHghIyiHF/JP/bCoj8Qyo4hqfPHuHw==
X-Google-Smtp-Source: AKy350aYZAOdqbv0OVmtpCPAntPobWMY0GOLA+cGXP3stu82EOGCdTmpnZBPzc3tJVfo/0nrqABBLXLtnhTK11hhUxg=
X-Received: by 2002:a17:90b:33c7:b0:23e:f855:79ed with SMTP id
 lk7-20020a17090b33c700b0023ef85579edmr4217873pjb.28.1681940909903; Wed, 19
 Apr 2023 14:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com> <ZD+rethobzN+rONr@kernel.org>
 <CAKwvOdkKACfOvZ4BcG9NcO1Kh97vqSx0y7ZBc+BOJnHUpq8qWw@mail.gmail.com>
 <20ac24d6-4d94-4003-9203-d852714e1a46@app.fastmail.com> <CAKwvOd=kShNVxFvjODEghrHGXK7Gekwcwb3cEFUgEBhZcOHC_Q@mail.gmail.com>
 <8d070a27-fa53-4965-95b0-e0bf8bb90609@app.fastmail.com>
In-Reply-To: <8d070a27-fa53-4965-95b0-e0bf8bb90609@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:48:17 -0700
Message-ID: <CAKwvOdkCPy7XQS4dZ0=Ka8TNEStwqLhaW7idPJ+fA9d+A0Sjxg@mail.gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
To: Arnd Bergmann <arnd@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 2:42=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> On Wed, Apr 19, 2023, at 23:38, Nick Desaulniers wrote:
> > On Wed, Apr 19, 2023 at 2:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >>
> >> On Wed, Apr 19, 2023, at 23:21, Nick Desaulniers wrote:
> >> > On Wed, Apr 19, 2023 at 1:51=E2=80=AFAM Simon Horman <horms@kernel.o=
rg> wrote:
> >>
> >> > Marking something as `depends on OF_DYNAMIC`. (Not sure whether Arnd
> >> > meant that for BCM2835_VCHIQ or BCM_VIDEOCORE).
> >> > Perhaps try that?
> >> >
> >> >>
> >> >> I'm a bit surprised as I didn't observe such a thing.
> >> >> But I also don't dispute it - clearly my testing was inadequate.
> >> >>
> >> >> I'll try and dig a bit deeper into this one.
> >> >> Perhaps starting with the report from the kernel test robot [3]
> >>
> >> I have this in my randconfig build tree, but it looks like I never
> >> sent it out.
> >
> > What else have you got hidden up in there? ;)
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Actually, I have fixes for all missing-prototype warnings
> in my tree, just remembered that this one is part of my
> longer series. I have about 150 patches that are already split
> up and just need to be sent out, plus more that are currently
> sitting in a combined changeset.

All? Wanna bet we can introduce new instances of that warning faster
than you can fix all of them? Actually, no I would not take that bet.

I'm just having fun, thanks for all of that cleanup work!
--=20
Thanks,
~Nick Desaulniers
