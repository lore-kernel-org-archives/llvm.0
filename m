Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BC5A1F
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 19:54:18 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id bn33so9279361ljb.6
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 11:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rzaQ2PbNM4OWTXaZoJt/jXvupOFzRgUwd9R+pk/wVa4=;
        b=ggQcQqPLxpOZkN6xIBmGo28BFFNVs8UHh/IjTismzkd/xutuOP3k5tn1+FwAUGOdME
         ijmW6ES+X3xtP5GsM+KaXI/PkzOVWIepnTeRlLgvxFf927Y6oeyhziTD93hpj9haMeW2
         4sR1SVVJTjClDlayb91EzsELLkTrbyUNBXvGTeBCZ95F1EVYZw0zR/drMfnnvYjhGk5P
         Q5h+jGoARJcL8RZqMhQtYxcnuodadvcOqVMRiZnL1TxTi6MCDte9MgECS5fyzxcmsrFL
         X1DiCbujfGDfGOI2Y2KBoG94i5Aq0hk1yfzkHxoXvswummOpH/BZeROScMxSnjmmO3ZC
         TVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzaQ2PbNM4OWTXaZoJt/jXvupOFzRgUwd9R+pk/wVa4=;
        b=G2t7jZwljcBfawW5/XCg7ylxRTjSB4ecQRsTktKcUaZfI8TLJLEY7zrkyISDuctlqK
         h/FLoeRSbqp24kKPWRsor7X83KjecLYSnlU5WJEj8c7Jg5OjxtZU+oyrHWe+4cmLaKPU
         Vu/g98SU/WxvMt0adk4ZuvMZluLPOMU7iK5bfC8D6tPcnF5vT5xy21hL4ZWllzIjOeZT
         fB15W9yR6eZVcOTufpbNCwkZY3f9iPhvF+S8GxoIsej5CWT8gmWvnSrssdf5/HD/2hyg
         qDpd05FSRIX/z6rxC1/6Xdeni6Rc/gVmkZqrbfDXZIaZYDSqa3kYN0six393qCb825V8
         gOyA==
X-Gm-Message-State: AOAM5320+7RcTRLUhpeLLDP3aNtD1UZztrC8U1GKmaVfwh4L2qf+9XP4
	zklROP30y7h2YfLfg31r+8CA7QK2KtGf2tY1/zUr/Pelk+yIJf62
X-Google-Smtp-Source: ABdhPJyY7388Mtw8RGExlOptHW56bIIwr/NeZd5PjTV9oufBuCB4djbN4p9cTgNfi9U6KFgbFw4lY8mvI6K5M3SXiDU=
X-Received: by 2002:a2e:871a:0:b0:246:ee2:1109 with SMTP id
 m26-20020a2e871a000000b002460ee21109mr3957045lji.165.1646942056815; Thu, 10
 Mar 2022 11:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1646865178129106@kroah.com> <YiktjbXe/2XmjHrb@dev-arch.thelio-3990X>
 <YinFYzenEjq99R3w@kroah.com>
In-Reply-To: <YinFYzenEjq99R3w@kroah.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Mar 2022 11:54:05 -0800
Message-ID: <CAKwvOdnw3L+SCNo1FJpXSnFhkzXpY_+ZQHLW+mM2UUZaofuLfQ@mail.gmail.com>
Subject: Re: Patch "ARM: Do not use NOCROSSREFS directive with ld.lld" has
 been added to the 4.19-stable tree
To: Greg KH <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>
Cc: torvalds@linux-foundation.org, stable-commits@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 10, 2022 at 1:31 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 09, 2022 at 03:43:25PM -0700, Nathan Chancellor wrote:
> > Hi Greg,
> >
> > On Wed, Mar 09, 2022 at 11:32:58PM +0100, gregkh@linuxfoundation.org wrote:
> > >
> > > This is a note to let you know that I've just added the patch titled
> > >
> > >     ARM: Do not use NOCROSSREFS directive with ld.lld
> > >
> > > to the 4.19-stable tree which can be found at:
> > >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> >
> > <snip>
> >
> > > +/*
> > > + * ld.lld does not support NOCROSSREFS:
> > > + * https://github.com/ClangBuiltLinux/linux/issues/1609
> > > + */
> > > +#ifdef CONFIG_LD_IS_LLD
> >
> > Please cherry-pick commit b744b43f79cc ("kbuild: add CONFIG_LD_IS_LLD")
> > to 4.19 so that this patch works as intended.
>
> Now queued up, thanks.
>
> > We do not link with ld.lld on 4.9 or 4.14 so the NOCROSSREFS patch is
> > not technically needed there but it does no harm if it is.
>
> I'll leave it as I'm sure there might be others out there that do that
> (Android or ChromeOS?)  I already did the backport-by-hand work, might
> as not waste it :)

FWIW, ld.lld support in 4.14 exists only for ARCH=arm64 and
ARCH=x86_64. The NOCROSSREFS patch is specific to ARCH=arm. I agree
with GKH that it won't hurt to backport b744b43f79cc.
-- 
Thanks,
~Nick Desaulniers
