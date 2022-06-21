Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A51C00
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 22:03:02 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id a2so24631287lfg.5
        for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 15:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/nAALPTQk2jOf7mwjFbXYskfwmpL/i3xmmIwWAqGBk=;
        b=X6t1vTBA6W1iUMu8Qz7eID+6FJWgZfWRA7zdkDckW4hNHGuZ2/QO03KT1VsPZyHWee
         l5itrIal+AwrzrdgdDBYCLYGHKvti9IRVUl0kfq/3ggZQowxaWsXOe9ydphnuFteIlrw
         azUnNJcBMdBCdXdOF1dC1gVFKaQpW/HSgcYxvKQ0JSfcjVpbircgdMBlH9mSCsLxGvXH
         +zrl2ydovOhve4QTBNVZpydzIu3e9eBY3AwDYzqjvoM4Hgs3VZLd0mOl/kBL6127eHWw
         7dq/f6yo0dJ+piy8A+8OgfdCaAO6g8SgJna27hwhay32dLt3T9sDLNKXKIW+D763FHBp
         OVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/nAALPTQk2jOf7mwjFbXYskfwmpL/i3xmmIwWAqGBk=;
        b=ldNXnK+JpjkiH8ENqoHMfBE1J/LCszyatthp1G2BMXDO2d5aXModMCmpiymSynQ4hz
         QxHFNYc522UTyftDZBXJAsAQtLJkgcocE2ZE5nrD9zsh0BxATVusqViUzI3itDo9/H84
         65lo5AyPViSOrg4Eh+vN1aMm8eUOU5Judsxy0YL5cVbZJUEzogFtV46cCUXDu5918IbU
         fbMDHiGUaenHZ90smVK7Ek32vX/kTOjPrYKRHyXtC+vw0xk9NeYUUX77spS+FUrbS6Un
         gUNBg0lj0U8+jyPZXdmJa7jQbZz4e29vaWEshTEkTmXi3H+L2pmBV9X0kVcJhgDO2Ss6
         4e0g==
X-Gm-Message-State: AJIora8vGNdLS6WA8WpN8BhFR0awPzKNhb+UFOKmL2BhNSSSHppbwPWV
	tBg0kqHUs2pTsOnSiFuq56kuezh011f3/V/xDSVONgNR49eckQ==
X-Google-Smtp-Source: AGRyM1twzM6PZQGBn/eKAhODKzD6PMg5gKTbscJydFS2KHZpqXK16I02j71nfGu5QWAT6I2VTcEoEJ2YRPhl89Ab2oc=
X-Received: by 2002:a05:6512:10cb:b0:479:682e:7f0c with SMTP id
 k11-20020a05651210cb00b00479682e7f0cmr224941lfg.626.1655848980268; Tue, 21
 Jun 2022 15:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
 <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
 <87mtf7z0rt.fsf@gnu.org> <6F9E9D93-3913-4022-9384-D809C8EF7715@oracle.com>
In-Reply-To: <6F9E9D93-3913-4022-9384-D809C8EF7715@oracle.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Jun 2022 15:02:49 -0700
Message-ID: <CAKwvOdm=_YqBpuBzouqoWHYNe6MMUE10vqF0PUkU=hcOj+UqrQ@mail.gmail.com>
Subject: Re: plumbers session on profiling?
To: Ruud van der Pas <ruud.vanderpas@oracle.com>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Bill Wendling <morbo@google.com>, Vladimir Mezentsev <vladimir.mezentsev@oracle.com>, 
	clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Yonghong Song <yhs@fb.com>, Wenlei He <wenlei@fb.com>, Hongtao Yu <hoy@fb.com>, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 4:46 AM Ruud van der Pas
<ruud.vanderpas@oracle.com> wrote:
>
> Hi Jose,
>
> Thanks. I indeed plan to attend LPC 2022 and am very interested
> to participate in such a discussion.

Hi Ruud,
If you're still considering attending Linux Plumbers conf, please
submit a proposal:
https://lpc.events/event/16/abstracts/
Please make sure to select "Toolchains Track" as the "Track" after
clicking on "Submit new abstract."

>
> Kind regards, Ruud
>
> > On 24 May 2022, at 12:24, Jose E. Marchesi <jemarch@gnu.org> wrote:
> >
> >
> > I am adding Ruud van der Pas in CC.  He works in gprofng and would be
> > willing to participate in a discussion on kernel profiling.
> >
> >> (Re-sending with Vladamir's email addr fixed; sorry for the noise)
> >>
> >> On Fri, Apr 15, 2022 at 10:54 AM Nick Desaulniers
> >> <ndesaulniers@google.com> wrote:
> >>>
> >>> Hi Sami, Bill, Jose, and Vladamir,
> >>> Jose and I are currently in the planning process to put together a
> >>> Kernel+Toolchain microconference track at Linux Plumbers Conference
> >>> this year (Sept 12-14) in Dublin, Ireland.
> >>>
> >>> Would you all be interested in leading a session discussing various
> >>> profiling related topics such as:
> >>> * gprofng
> >>> * PGO
> >>> * AutoFDO
> >>>
> >>> Would others find such a discussion useful?
> >>> --
> >>> Thanks,
> >>> ~Nick Desaulniers
>


-- 
Thanks,
~Nick Desaulniers
