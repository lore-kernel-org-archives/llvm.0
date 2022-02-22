Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AB67E
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 23:16:46 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id r13so24493321ejd.5
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 15:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KzvH9ZQaXdUgSyIdwCtFzNEtbBoZxdQVld6HVvqC3h0=;
        b=S/IydQVZc46d4zetWnmQ5U0e/PzMQNOi9DIjYeoinrNryqb/zeu17/TuDGbIX/KWpC
         72p/RUQcIO43sVlxpFBZmQdfy6WJtCivMolKcubjDm1vgXMy8k/BPNGr/UPBh9C4W41h
         4OMcW3ugJLilxrgRaLIAK4YLgo1M1xTJxv0gptrzQotyWQ8BVbQgyOuu/RAZGlM5Bw8P
         JmKxduxWoEh8ZNP3EI0O00LrNVhJlX3v4Rw2jBvCxgmBre2DuzWvIcOX5LuS+YxoHWGU
         YdMkjRgsLGwFaosBa6vzrp7EVsu7uc8gPip0/Bri8/5SM/66BSW/Pl4hxH3OB0jOdfoL
         rEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KzvH9ZQaXdUgSyIdwCtFzNEtbBoZxdQVld6HVvqC3h0=;
        b=YhqoKexFcgiisLr56P25gaTqaXPjyvFeJvvqmwc1nM8MtvNoRmVHo1txsm/hEQn3b3
         FudqmhVNRjIqhpc+Yu8pigyiGI7GYWmEXfVdo1UcbMKGVjt+Wa6fuuHZfMjzfPBYkwIf
         Vvv5H3qEYk6Ln0uxCejH6iruV2Zi0A7OcNwQNNzKDA7yELVn19oscuix/4BeyThlxUw6
         /nXH8wrl/SqVs6Jw4plkVXezEfrn4f+6lrMJVHV3q5TVwODufY6Rphz24zsmEFQ87p/H
         VAlA69e5u2OiQ8G97NkM9GUzDfGeo8QERDeQiUj4hoY4kSu9dRWTd5AozpQZgxQTTi2F
         UX+g==
X-Gm-Message-State: AOAM533S2QYRMg43KW2VfXRR3ZwOea4R69+HwR64LB4N+uQovVKyf6uc
	SK/YD1EW87NcxfbbI2KcASZ0cbmGBw8iIECtrr6t
X-Google-Smtp-Source: ABdhPJyC5JfFslCe0iSc7dk6uE4kYr0sXtIjOP3+4cJ8OXdGFLZZdB3wUVrWstGC2q8isedVNDR8Em5of/ldksyZE6c=
X-Received: by 2002:a17:907:2a54:b0:6d5:879d:aca4 with SMTP id
 fe20-20020a1709072a5400b006d5879daca4mr419389ejc.29.1645571804662; Tue, 22
 Feb 2022 15:16:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com>
 <20220217142133.72205-3-cgzones@googlemail.com> <CAHC9VhT77Ft4+5LmNP0dwtaeNzF+r0b=9M5vh7qA1poY9jesJA@mail.gmail.com>
 <CAKwvOdkioR+7aebgzPu2Exe0oD9rwAeHK=CgM6vAkpBWdHnF2Q@mail.gmail.com>
In-Reply-To: <CAKwvOdkioR+7aebgzPu2Exe0oD9rwAeHK=CgM6vAkpBWdHnF2Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 22 Feb 2022 18:16:33 -0500
Message-ID: <CAHC9VhSKZes9g_GHMKJdhd_BEt7GT4FKOLeMJ=o=FU8TtOZ-gg@mail.gmail.com>
Subject: Re: [PATCH 4/5] selinux: declare data arrays const
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	"David S. Miller" <davem@davemloft.net>, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, Austin Kim <austin.kim@lge.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 12:24 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> On Fri, Feb 18, 2022 at 8:13 AM Paul Moore <paul@paul-moore.com> wrote:
> > On Thu, Feb 17, 2022 at 9:21 AM Christian G=C3=B6ttsche
> > <cgzones@googlemail.com> wrote:
> > >
> > > diff --git a/security/selinux/include/initial_sid_to_string.h b/secur=
ity/selinux/include/initial_sid_to_string.h
> > > index 5d332aeb8b6c..915283cd89bd 100644
> > > --- a/security/selinux/include/initial_sid_to_string.h
> > > +++ b/security/selinux/include/initial_sid_to_string.h
> > > @@ -1,5 +1,12 @@
> > >  /* SPDX-License-Identifier: GPL-2.0 */
> > > -static const char *initial_sid_to_string[] =3D
> > > +
> > > +#ifdef __SELINUX_GENHEADERS__
> > > +# define const_qual
> > > +#else
> > > +# define const_qual const
> > > +#endif
> > > +
> > > +static const char *const_qual initial_sid_to_string[] =3D
> > >  {
> > >         NULL,
> > >         "kernel",
> >
> > Thanks for this Christian.  I generally like when we can const'ify
> > things like this, but I'm not excited about the const_qual hack on
> > core SELinux kernel code to satisfy genheaders.c.  I understand why it
> > is needed, but I would rather clutter the genheaders.c code than the
> > core SELinux kernel code.  If we can't cast away the const'ification
> > in genheaders.c could we simply allocate duplicate arrays in
> > genheaders.c and store the transformed strings into the new arrays?
>
> Note: casting off const is UB. I've had to fix multiple bugs where
> clang will drop writes to variables declared const but had const'ness
> casted away.

Then let's just memcpy the array in genheaders.c.  I'm okay with
genheaders being a little ugly if it helps keep the core code cleaner.

--=20
paul-moore.com
