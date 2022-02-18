Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AEE4AB2
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 17:24:51 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id o128-20020a4a4486000000b003181707ed40so4259306ooa.11
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 09:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e48rbRghZ1DHjEo5oAQPObeUfspj3j2bBv68xgwxZDg=;
        b=B6b07vv9/aGPNg6S485OaHdVCheTvWziFVBg71SY0DOhjK7WDiRUJjBrnomP+yCPKi
         beF4zz1XqIgM7q5h2UVDA+K8EpzE3Sl+CMTCJsteOe3Uff1qUlw2cMEnQbQdzGIJxrky
         h5S4rMM94onJIbUS4+dMB/YhGIoP9j4x5M9nwUrrPXfqWDeBDAMIELL3VvvxGvWgqMyN
         2sDxR/EXKyqEFQuyCKBLH5dt6DZfY+nJuWLYklzfI6v5JzlhIXSdACTerkZmhXouMGIK
         Sr3GDvB6hVLLANmcqhh1hmdwzXn9Dh8nOcvYbLVllThUGCpHBQn80TLrYsdpNN2UshO2
         C4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e48rbRghZ1DHjEo5oAQPObeUfspj3j2bBv68xgwxZDg=;
        b=TOWZRA09x3a4DYpxfDb5JxK8BMweVpSiBenCX8c0oYnmK7Eskv2Qu/rea2o+ad4dZI
         7hdDLHZcgqcJIxTjMAkMXQhxyb6ejPmcfdEr6NhzESBJXfSUR9BNEf5TOuK7POhcDSyg
         qBYe9KCXzK63+okplmp5qhyzIw8hH6Er2rEB30hqX52lOnCSIABhjShuT+HgYYCGA0b8
         XZ7bS6hDr1CUUC/BSXrW7huhIhhR4JZj+chXKTrYdcLYrAXcyIb73ZrAvTTcp5lUmEhY
         s4EvcQ79W6HE7wz+D5JF/9EIOQEn5ofBp/fRidr+mV7IxnTd5lbn9rwqc3uJ6JjIJUiG
         6yhA==
X-Gm-Message-State: AOAM531yicFipJKEzshipxLBal23Wv7hq6+0KzzYOKlZLasf5S6fy3Dc
	k+gjmXrx2045VYOKrImBG43S0VkMSAcIp5XYLASv2Q==
X-Google-Smtp-Source: ABdhPJxeMGrNQo5p4UItQyXTMpqQBxLO8zARxmITPMT0p8OolI64JRzNUI3LaxZS0U2ddwM3nEFeutNzi0O3h5nsuGI=
X-Received: by 2002:a05:6870:3491:b0:d2:48b5:7a4c with SMTP id
 n17-20020a056870349100b000d248b57a4cmr4553827oah.288.1645205090740; Fri, 18
 Feb 2022 09:24:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com>
 <20220217142133.72205-3-cgzones@googlemail.com> <CAHC9VhT77Ft4+5LmNP0dwtaeNzF+r0b=9M5vh7qA1poY9jesJA@mail.gmail.com>
In-Reply-To: <CAHC9VhT77Ft4+5LmNP0dwtaeNzF+r0b=9M5vh7qA1poY9jesJA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Feb 2022 09:24:39 -0800
Message-ID: <CAKwvOdkioR+7aebgzPu2Exe0oD9rwAeHK=CgM6vAkpBWdHnF2Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] selinux: declare data arrays const
To: Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	"David S. Miller" <davem@davemloft.net>, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, Austin Kim <austin.kim@lge.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 8:13 AM Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Feb 17, 2022 at 9:21 AM Christian G=C3=B6ttsche
> <cgzones@googlemail.com> wrote:
> >
> > diff --git a/security/selinux/include/initial_sid_to_string.h b/securit=
y/selinux/include/initial_sid_to_string.h
> > index 5d332aeb8b6c..915283cd89bd 100644
> > --- a/security/selinux/include/initial_sid_to_string.h
> > +++ b/security/selinux/include/initial_sid_to_string.h
> > @@ -1,5 +1,12 @@
> >  /* SPDX-License-Identifier: GPL-2.0 */
> > -static const char *initial_sid_to_string[] =3D
> > +
> > +#ifdef __SELINUX_GENHEADERS__
> > +# define const_qual
> > +#else
> > +# define const_qual const
> > +#endif
> > +
> > +static const char *const_qual initial_sid_to_string[] =3D
> >  {
> >         NULL,
> >         "kernel",
>
> Thanks for this Christian.  I generally like when we can const'ify
> things like this, but I'm not excited about the const_qual hack on
> core SELinux kernel code to satisfy genheaders.c.  I understand why it
> is needed, but I would rather clutter the genheaders.c code than the
> core SELinux kernel code.  If we can't cast away the const'ification
> in genheaders.c could we simply allocate duplicate arrays in
> genheaders.c and store the transformed strings into the new arrays?

Note: casting off const is UB. I've had to fix multiple bugs where
clang will drop writes to variables declared const but had const'ness
casted away.
--=20
Thanks,
~Nick Desaulniers
