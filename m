Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38B2C9D
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 19:16:45 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id p8so29298930ljo.5
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 11:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xjHnD1He2uZDLr+dWRFgaLTBh3CoIllq/1pafer4U4E=;
        b=Vg02nzBR/7HK0y5miaf7RQut26GdJIIfuclvnYRWBtaT+yKZgNqvX/8PHnTrK6B49J
         g9TjoMp6fK/Vb2YVV2YxL93RmS/Ij84OY3IvdUU49pSsKuBQT8jPyePtC4S+BoWJxAhz
         j3HsIKRlEVqnHvBIk0DPGWiOTl07YEYzBUTacQb85fkO+ulk6ndcVpuLbKSCkfZiITLq
         PEsEx5zBLjRkY2OPTMRulBow0yoVK+WkNd9zNG9+O4/8r2gEFbPEvqeeT5gq0D4v8GYa
         sa46eky/+5EBDBQSgGEQswxLexkvWPfyDrrsTqh2F2DGl5UYk3y2GbTwnsgjhnIVKv25
         87og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjHnD1He2uZDLr+dWRFgaLTBh3CoIllq/1pafer4U4E=;
        b=ddnrMXlTulNdDsTx+fJh0xUm8PgyyaKITymIOFgPxaUqZSTCAh3IjVDgurZb2/Niha
         zQHo3OcTv5PsET3qpSnz/r0OCoBwVnh6FJBJch2BZ5BR1ENX49jSsIVzYLBiT3UFOv4H
         h6qDfbaMPAth83D8ve2v3p/aLeaZjL7YQrKXiU9olwQAqk9zLGZiKOy0VkgVC5NXG/zt
         j3skAIgEr7F+6IAKLXvbMuCvGi//RbXKn++WjW0VDt2FWbUMfu2ZwDkNIY+gAPNBfPKl
         ZEpoyXLBUyuf7OOBtzzAwzOKKG0K8lV25nesT3d8jiAC4UxKwnDTGgQ4gH8sR9K8Ciy3
         FjPg==
X-Gm-Message-State: AOAM530cqJpr+8DN9v0xgrX7MXOZqd9wFn5wKJX5IGrk/LH++UF1seNB
	NB1M4iE3igWWIPeaqxLVx/HKCvnwB2J9+Hm7hoPylQ==
X-Google-Smtp-Source: ABdhPJwHlcxa3UGKyBoNhhDk6BFsf6F2z/GGO32i01oWgvp6N/b9vhcmcjPvOe5WgjJUhEq3owWsHtOlWg8uHq+8lSs=
X-Received: by 2002:a2e:b04c:: with SMTP id d12mr318300ljl.338.1638904602799;
 Tue, 07 Dec 2021 11:16:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211204220249.591482-1-arnd@kernel.org> <CAKwvOdnZSyfZaa1crQ15DGNNj8JBspnM0xxOF3D2mTt96Ftfgw@mail.gmail.com>
 <Ya+wlfX7ZPb95mZ4@archlinux-ax161>
In-Reply-To: <Ya+wlfX7ZPb95mZ4@archlinux-ax161>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Dec 2021 11:16:31 -0800
Message-ID: <CAKwvOdkxFrO0+WWqcQ9ZVHbT+TVpks1gE-SWG8yUF5U7E+HPHw@mail.gmail.com>
Subject: Re: [PATCH] power: reset: ltc2952: fix float conversion error
To: phoebe.pf.w@gmail.com
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

(Minus most folks, plus Phoebe)

On Tue, Dec 7, 2021 at 11:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Dec 07, 2021 at 10:41:24AM -0800, Nick Desaulniers wrote:
> > On Sat, Dec 4, 2021 at 2:02 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > clang-14 does not like the way this driver converts a 'long double'
> > > to an integer when the target architecture disables floating point
> > > support:
> > >
> > > drivers/power/reset/ltc2952-poweroff.c:162:28: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux' does not support it
> > >         data->wde_interval = 300L * 1E6L;
> > >                                   ^
> > >
> > > Turn this into pure integer math and make it more readable at the
> > > same time using the NSEC_PER_MSEC macro instead.
> > >
> > > Fixes: 6647156c00cc ("power: reset: add LTC2952 poweroff driver")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thanks for the patch! The change in clang-14 (ToT) that triggered this
> > has had another patch on top reverting these diagnostics.
> > https://reviews.llvm.org/D114162
>
> I can still reproduce this failure on current ToT (33e3554ea33d) on
> x86_64 allmodconfig; it seems like that patch only fixes it for 32-bit
> x86.

As a heads up Phoebe, in case there's any interest in doing something
similar to https://reviews.llvm.org/D114162 but for 64b.

>
> > That said, this change is still worthwhile for the improved semantics, IMO.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1497
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> My patch appears to be accepted in Sebastian's branch already, it seems
> like it just needs to be sent to Linus (it also looks like that branch
> doesn't flow into -next, it probably should):
>
> https://git.kernel.org/sre/linux-power-supply/c/644106cdb89844be2496b21175b7c0c2e0fab381
>
> Cheers,
> Nathan
>
> > > ---
> > >  drivers/power/reset/ltc2952-poweroff.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/power/reset/ltc2952-poweroff.c b/drivers/power/reset/ltc2952-poweroff.c
> > > index fbb344353fe4..9fc88a9f244c 100644
> > > --- a/drivers/power/reset/ltc2952-poweroff.c
> > > +++ b/drivers/power/reset/ltc2952-poweroff.c
> > > @@ -159,8 +159,8 @@ static void ltc2952_poweroff_kill(void)
> > >
> > >  static void ltc2952_poweroff_default(struct ltc2952_poweroff *data)
> > >  {
> > > -       data->wde_interval = 300L * 1E6L;
> > > -       data->trigger_delay = ktime_set(2, 500L*1E6L);
> > > +       data->wde_interval = 300 * NSEC_PER_MSEC;
> > > +       data->trigger_delay = ktime_set(2, 500 * NSEC_PER_MSEC);
> > >
> > >         hrtimer_init(&data->timer_trigger, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> > >         data->timer_trigger.function = ltc2952_poweroff_timer_trigger;
> > > --
> > > 2.29.2
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>


-- 
Thanks,
~Nick Desaulniers
