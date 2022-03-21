Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D21D63E
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 17:50:26 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id p8so16106132pfh.8
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 10:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xm/AHZsJfo4Q5m1ZRbKY9ffQNuxs1oV6xRmfufFjoRM=;
        b=kNS6QJmKh3GO+IfuqJ35qyUf9JvT2eE7gGsUF6fEL6OHfBxNZnORHfHg29dMmTdk95
         h3yiaRr59guCVWMl/g5HStYr01LJk7VAvcFH0Uo7S3GHl0HFjQHY0VpWHU0HA3pouvPQ
         Ax4v+5z30lwLZJLPotdz1U8/OMCRtt1IxORyMZXni2ammgU0hXufdgDPNyh8oZqZHZn6
         GhX9XX+enV4kie3xxhpTaYB7uS8guxq+DlZ6mLhfU11QMiuTJatqRPce7LB684VHQ2nD
         bYumzEQ5N2fzoTh5muqii5dUbgqgkoUW0WDbxREVA7vZjhYGbRQgvBQ1jaMMTzVqFblI
         /GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xm/AHZsJfo4Q5m1ZRbKY9ffQNuxs1oV6xRmfufFjoRM=;
        b=1m0mcaJ8w34YO/XuqVPuMRXxHZrep1MV65cBRVdoqDfuHaDJOdQyJkwILRKzgncPYb
         UESZJSM5JTpvYPEhIl8YUJwe0dBq99x/eb9cAMGll1uhhGKbvlsVgBAyprm3nEGbyvNc
         rKsTqQjUl3vzQc5LhRD7+HSX7MMa7H2n+VwOj2kofR7V6+G049BWxfCwYOLrJnkdFAmS
         Yj8yxrxuhktY89ow0RXxdHar1aYWmwo/nXxBY3tZB9LKIfpQWABipYFRU2ajtGYXs8W8
         HF05vjmGiMUgYaXVdxobOzErGmPL/h6NQ7XTiEHOju3kNbX4HHPPiueK8bNTSHxmFL9q
         /37w==
X-Gm-Message-State: AOAM530e9R2IhgqzZGLHyT0iDvbim66TkCoeyAsWJHux3J2QPil3HioY
	QbjEXlLli44xTtUXNQGz1dGCnRx585WvkbHNCUft
X-Google-Smtp-Source: ABdhPJyor50zDgeYlpeRIm+dAJQzQOT7vXr1ZMpuFcDQsN9OQLDu0xUGz/AvbUKA5K4OR9808SXN1ToITpXUT+9DNFI=
X-Received: by 2002:a05:6a00:14c7:b0:4f7:4553:c06e with SMTP id
 w7-20020a056a0014c700b004f74553c06emr25059646pfu.45.1647885025646; Mon, 21
 Mar 2022 10:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213118.2352683-1-morbo@google.com> <YjTJRqlFOsXz7Ss7@dev-arch.thelio-3990X>
 <CAGG=3QUXDj1Bp1kDY2F0dqw=6f8iRqE4nRDyticUrWx-nTb-=A@mail.gmail.com> <YjiYrj5euvidRKHM@builder.lan>
In-Reply-To: <YjiYrj5euvidRKHM@builder.lan>
From: Bill Wendling <morbo@google.com>
Date: Mon, 21 Mar 2022 10:50:14 -0700
Message-ID: <CAGG=3QVTyEC5NdLFAwy=SYn7CEKYTE9wF00KMzDutEvXoQesZQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: smem: use correct format characters
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Andy Gross <agross@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-arm-msm@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 8:24 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 18 Mar 13:27 CDT 2022, Bill Wendling wrote:
>
> > On Fri, Mar 18, 2022 at 11:02 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On Wed, Mar 16, 2022 at 02:31:18PM -0700, Bill Wendling wrote:
> > > > When compiling with -Wformat, clang emits the following warnings:
> > > >
> > > > drivers/soc/qcom/smem.c:847:41: warning: format specifies type 'unsigned
> > > > short' but the argument has type 'unsigned int' [-Wformat]
> > > >                         dev_err(smem->dev, "bad host %hu\n", remote_host);
> > > >                                                      ~~~     ^~~~~~~~~~~
> > > >                                                      %u
> > > > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> > > >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> > > >                                                                ~~~     ^~~~~~~~~~~
> > > > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> > > >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> > > >                              ~~~    ^~~~~~~~~~~
> > > > drivers/soc/qcom/smem.c:852:47: warning: format specifies type 'unsigned
> > > > short' but the argument has type 'unsigned int' [-Wformat]
> > > >                         dev_err(smem->dev, "duplicate host %hu\n", remote_host);
> > > >                                                            ~~~     ^~~~~~~~~~~
> > > >                                                            %u
> > > > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> > > >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> > > >                                                                ~~~     ^~~~~~~~~~~
> > > > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> > > >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> > > >                              ~~~    ^~~~~~~~~~~
> > > >
> > > > The types of these arguments are unconditionally defined, so this patch
> > > > updates the format character to the correct ones for ints and unsigned
> > > > ints.
> > >
> > > Right. Alternatively, remote_host could be turned into a u16 to match
> > > host0 and host1, as those are the only values that will ever be assigned
> > > to it, which should have been done in commit 13a920ae7898 ("soc: qcom:
> > > smem: a few last cleanups") to avoid introducing this warning in the
> > > first place.
> > >
> > I'll be happy to redo the patch if the maintainers wish. :-)
> >
>
> Forgive me, but I think that not mixing the unsigned int and u16 would
> look better. So if you're willing to respin this to change the type of
> remote_host, I'd be happy to merge that.
>
Happy to do so! I sent out v2 of this patch. (I didn't mark it as
"PATCH v2" because I forgot about that. Sorry. :-( ).

-bw
