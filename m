Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912327C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 11:31:34 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id y6so45097733ybc.5
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mw/bxELONBcXUIQ4ZlitUOdIGwAvzRaHxRx0vzLKiwE=;
        b=asNcvjaxh2z9Q0eDPTF/MHVOJlSKunX9xOaEWoZyQdNjgTY0NuVZ7sE1xn32KshaoP
         e/VvGS71+1On+TQj1UU0xvIoAqRdhmdgLfNBYMRwZTVovhWcfFyJPGjLnWLZAlHhC0Wy
         PPrEhRWRTXHvve+RRSRuXHKR92j4hlVsihXwmIHFeRKTQxMLSmpc49sXb5WlxcUO0mxm
         dwgo5q6XGMLIXRJph9rbNQxSyVCNHL2om88A9AvSTkX3u5Yn3yPCdb8TO7B/p71vXdKK
         RqGGN2zYHPQ2Xc9/2rern1s7FdCZ0pHDH1Ll1gltaUMpYofmXLs1Rd5Q7JjcNG3rqlw7
         74PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mw/bxELONBcXUIQ4ZlitUOdIGwAvzRaHxRx0vzLKiwE=;
        b=B/OZu5FjQx8mXLHr0DXziGjYRtSnv6Bg7hk6hrfa1hlQbD6G3rmONz/OVKSGQ8X426
         qD/y9L3s7cElkAvVl02A60u8TzbdMbm77Y80vdZwDt3L0lRHibky9ozPuJXlRIKHN/MU
         NyI72o2cJJSn7ArBtFikAVJkuXhR5dx/7qhbF8cEevFWVjB7hM5j9vCz9gFjb+ci0T1p
         5b1tQbLgoT48zmA8CrQ041Y5kPtDMp7/F3blzBdBOizGhuR3/EP6rZddYX582Iun70RL
         LtJAKlajNwZSrtkTjoziROOlD2Xej/D7lpbkaPytTfYzV/x6+MhpcCIPqrcemV8Gowad
         5drg==
X-Gm-Message-State: AOAM533s3jdn7ZPy0el3/04P3KZK4PXeggMHtx6aZjKtBJQDb77n82jI
	hL8hdsmU/WINI/Gu4Q6O2wjhCSwm/ArlYzhCVU9OOA==
X-Google-Smtp-Source: ABdhPJxa6vrERknymq3wbgVH3aL7pi7aXuDhckCAoXVb99Mp/XV1TLitwoRL3UpFD22a/lTepFhatbY499rliNbMyjI=
X-Received: by 2002:a25:49c5:: with SMTP id w188mr11519207yba.200.1644838293317;
 Mon, 14 Feb 2022 03:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214092510.221474733@linuxfoundation.org> <CA+G9fYvfx2jRPnU6zVK8v9vNbwXc4wV0KX0JfGWeNsAbL72y-g@mail.gmail.com>
 <Ygo8pUuBuNYmP9ds@kroah.com>
In-Reply-To: <Ygo8pUuBuNYmP9ds@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 14 Feb 2022 17:01:21 +0530
Message-ID: <CA+G9fYtkx8kqRR4L9oP-cO5PhU20i2CLfREJkQB+6UGK8ojvEw@mail.gmail.com>
Subject: Re: [PATCH 5.16 000/203] 5.16.10-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	slade@sladewatkins.com, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Feb 2022 at 16:57, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Feb 14, 2022 at 04:29:43PM +0530, Naresh Kamboju wrote:
> > On Mon, 14 Feb 2022 at 15:23, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > This is the start of the stable review cycle for the 5.16.10 release.
> > > There are 203 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > >
> > > Responses should be made by Wed, 16 Feb 2022 09:24:36 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.16.10-rc1.gz
> > > or in the git tree and branch at:
> > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.16.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > On Linux mainline master branch with arm64 clang-nigtly build failed
> > due to following errors and warnings.
> > Now it is also noticed on stable-rc 5.15 and 5.16.
>
> Sounds like a compiler error.  Do the clang developers know about this?

I have reported a new issue on LLVM github.
https://github.com/llvm/llvm-project/issues/53811

- Naresh
