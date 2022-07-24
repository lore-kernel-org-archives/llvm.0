Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08A7E
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 08:25:13 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 75so14945670ybf.4
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E0FYQIjcA1ZBeZ4jpcqY+lww1lYDm9o/uZVAHiMgttw=;
        b=W/aKKpJRcAdZY3UA4E5XDr3fBGbPSmPcS5GCQjN38NRlXhSpzoOA5MJEcVpoeCG8bD
         EohNCEKLFvV6+7hgOavnJ0fY9pLnyNa8ZxAz5oCA3lntQwAM8pkv8skLj/P/7GeVsN5T
         rvQdZqfSJCaGGWLuYdop/DMboPWpRu31ETFeWLz9xGUau0r/ZySSSishnC8frmRUpfVE
         Gvm4959erixZdiPRAnfBgoY0zeiF8gYLFCF9rBhRJRUGOBeo+NjVml9/EMeZBjAVOw9N
         7gm8fWa7gCidmmLj8fPMSl86MjRk8vtJmQFCTP3sA/P7HZTgkLPkUNNbe9PQqw7PoYIj
         /u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0FYQIjcA1ZBeZ4jpcqY+lww1lYDm9o/uZVAHiMgttw=;
        b=W2WEvj7fYL2W6JPDpSGzaCdRnTbQ0C3VWI4LncaGulhFt8Dema2hrE75pyVoCMbu++
         eb20OQ9AYZ/Z3iboD/kqoxjYpu4Uib72TxdcecIN3tgciHbDYnMRnBZfNAGQDpTL2WkN
         8lcP9fT1KpWsPzXd56FzBFNA1iHhWFHVArgrpRK7Xfft4a0R0br4VzxfWUQgNd4HWFNN
         QRN4DbWTsYSCVHptBt2wq819wGrDsSKh/XUkrDiW6UsCvnG8+K206EhbWxPuYtBUvhNs
         aMRY0CTOVrAvtzv1KHWfXmhthKVfx1VKdihxPgMtRG0kuNd7Hyj/JSb+VY7DzAWa1StG
         m6JQ==
X-Gm-Message-State: AJIora/SmrVr2mjYbPUjljEPw/NriSL0+fAmAUVmpeMjyCHdfaAAeui9
	xU8LCzFvhoBYl4vjyM8Zw8/4WK+bTFD05wMHEfGIGHNR
X-Google-Smtp-Source: AGRyM1v0OD6rWTX6augGS10Tm1obstQSqDr+LlmwQaw0Z4oq4BjE1ahgpNssSUPbl+Ws0uRAOsiGCPfPwVBJ9ypzi68=
X-Received: by 2002:a05:6902:1109:b0:66e:f386:61ce with SMTP id
 o9-20020a056902110900b0066ef38661cemr5135859ybu.364.1658651112695; Sun, 24
 Jul 2022 01:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X> <CADVatmNtFYyqk0KwYzB1x6hOPkQ=0gV8mPN1BWp6QWrCs5GaxA@mail.gmail.com>
 <YtrAhG0o/x9B3rDp@dev-arch.thelio-3990X>
In-Reply-To: <YtrAhG0o/x9B3rDp@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 24 Jul 2022 09:24:36 +0100
Message-ID: <CADVatmP2UTd5TG1TShi0yH=S1A6TBoYLGEpbkWmwZiBdS8OTyA@mail.gmail.com>
Subject: Re: help with clang build for mips
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 22, 2022 at 4:21 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sudip,
>
> On Fri, Jul 22, 2022 at 02:29:01PM +0100, Sudip Mukherjee wrote:
> > On Thu, Jul 14, 2022 at 6:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi Sudip,
> > >
> > > On Thu, Jul 14, 2022 at 05:39:39PM +0100, Sudip Mukherjee wrote:
> > > > Hi All,
> > > >
> > > > I am trying to build the kernel for mips architecture with clang. I
> > > > see some of the configuration builds properly, but some of the configs
> > > > fails with the error (fuloong2e_defconfig):
> > > >
> >
> > <snip>
> >
> > >
> > > Unfortunately, I doubt there is much interest in that work, given MIPS
> > > as an architecture isn't being developed anymore. Might be an
> > > interesting hobbyist project though. It is probably best to just test
> > > configurations that work and make sure that those do not regress. Others
> > > are more than welcome to weigh in though!
> >
> > So, I have now disabled those builds with unsupported CPU. But I do
> > see some others with linux-next and will like to have your feedback on
> > them please.
>
> Thanks for testing!
>

<snip>

>
> There was a patch to disable this on the kernel side but it was never
> picked up due to what I read as a soft NAK:
>

Thanks Nathan. I have now disabled all these configs in my daily builds.


-- 
Regards
Sudip
