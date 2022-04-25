Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E57E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 17:51:46 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id t25so27560586lfg.7
        for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d4CKusOmKFpB//zpJna6TMOVyVV+HbHdecXxRDxqWJE=;
        b=KbnauGYZbd2ceBOD/lP8RHEg9djTXfQAqnpQ28WeYUkk5sNd18iz3LlronhYaLANkw
         pg5xLLuZraGQoEPZe2/GSkeSMbrvolPyxjnwwA1FoiNfOfiwSWUhV20aJXNOVAYV0Ry2
         cwllTyb3FXsbfpuBFn2xTo2Efq34vbdmn/ZN/QXPOoaAMDV8mCVaVu+NdWEMwGLowlJO
         9QoN6avMZS3/+VHZaHXMN1wn5v2Zl1NQzcuUZ9k2rmJCRKd3YOVbJP5ddUmAFfqMts1B
         3D6z8Z7yUMhAcEsXjjDw3FrQE4cz5rKnBYsSi+IvBxi7ozMKqCAv90tLTFGCM0CD5H6r
         tkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d4CKusOmKFpB//zpJna6TMOVyVV+HbHdecXxRDxqWJE=;
        b=OsXuFNcbw+sTo8tlVlwmeJ6mPnd6ICe5iprjM5YjUES0NvAni5tz5PJPyTaNJ1JynQ
         jZVegALZlN166Fb+aXtAKNSi7QQk+zg0Cy7RTsFcQXC3dAsvaAz4yI/n7d8kOo3wrOzA
         cjl8iDLz96XoqeHE4gGDCZZDKOLxP6i/7/6c/LvyvO91CrkTcXCqZ8GPC9XJ2GEfQJal
         c/GRelFxbEJ1u6uxcz9oGGKu1AUaYh+ydKtXhh5n6kZT8hAuNwFm0kO/5xPq1ICQ8hgk
         EoSY0xxMTr9RkfLDL/KYU0LdhArYzUq3PvKQaZg1ZBIOXKG9Lhko9zmFg1nuoZhZAkD0
         lMmA==
X-Gm-Message-State: AOAM532EYQeaT3zXQMLo2gmSfIAH9DgR79SA2EpADpU26PFrmDYxcw3q
	6xInGlSCM+MS7Q3puIlXtKvvfJQsEyzSbd5MSm96Tg==
X-Google-Smtp-Source: ABdhPJzYxIj3xqgaFZ1xKTponeM1pO9KPmIP8f/N+5TRbu+uuD3iTwOshtcQQhkuqn75wv91nWbwA0TMDleufJhexPw=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr9658870lfp.392.1650909102664; Mon, 25
 Apr 2022 10:51:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmwyFDYKMpq0dcvbq06drtZonpNJ3PqLx2RMBE00beHZA@mail.gmail.com>
 <CAK7LNARx_z1Cv4YOkYkdbgrv3PKVa3msHh8mCZDFvYDib++4kQ@mail.gmail.com>
In-Reply-To: <CAK7LNARx_z1Cv4YOkYkdbgrv3PKVa3msHh8mCZDFvYDib++4kQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Apr 2022 10:51:30 -0700
Message-ID: <CAKwvOdnzHJX1+H2d4QxhtDS_W96Jq0YAgZJTHwHxmbHRVPx-uA@mail.gmail.com>
Subject: Re: plumbers session on syscall wrapping and kernel header libc
 circular depdence?
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Florian Weimer <fweimer@redhat.com>, Arnd Bergmann <arnd@kernel.org>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, linux-toolchains@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 24, 2022 at 9:45 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hello Nick,
>
> Sorry for the late reply.
>
> On Sat, Apr 16, 2022 at 2:48 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Hi Florian, Arnd, and Masahiro,
> > Jose and I are currently in the planning process to put together a
> > Kernel+Toolchain microconference track at Linux Plumbers Conference
> > this year (Sept 12-14) in Dublin, Ireland.
> >
> > Would you all be interested in a session (if you're planning on
> > attending) discussing syscall wrapping for libc's and UAPI circular
> > dependency on the libc?
> >
> > Masahiro and I were recently discussing the feasibility of building
> > the kernel UAPI header tests with -nostdinc, but there are some
> > interesting complications perhaps worth sharing with others?
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
> I am not sure about the travel at the moment.

Bummer.

> I may be able to attend it remotely if the the plumbers is held as a
> hybrid conference.

I think it will be.
https://lore.kernel.org/llvm/3119c35ba1fa7247e87d7acb56e85ea99092d0a4.camel@HansenPartnership.com/

> I am not quite sure how many developers would be interested in this topic,
> but we can continue discussion in the ML as well.

Ok, based on the feedback, we will scrap the idea for the topic. I
will follow up with the UAPI discussions on the list.
--
Thanks,
~Nick Desaulniers
