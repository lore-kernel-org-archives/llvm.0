Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27857D0
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 15:24:33 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id e4so13502174oif.2
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8vnMa7QJYto3rUp2CNI3IroLa5v/hp5jnq+SU6YeAQo=;
        b=oBP78Y9N08jETzPolQznEBXq3Uxd/XEb+yye2TG3+vbyfT33AK6uFhZBpLcMNe16q+
         GglCnu2CKG73eZYghuFy0so04d+mdzcjU4Kv7QkEYidzH2H96h1AqO0/PuZcGuO9JgCG
         MVd1c1MtN3Iv0PTPLiV04LcCTyMka/zZ5EpJiiYj3z5I1gjmK12qqV2XMduawUMO1aD5
         E9gGv/7O75vqxHKpn8fCSuzHGwi4kEL6wFPLCo9m8Qmd1HbJNPvFV2qZVJhc+F3HvV/W
         JSHonH18vIa6TjPsEEedwXC0LWVYt7ujBKv2NH3EiZmk3zXqoxznTth8WWXqk5IVrOCU
         NQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8vnMa7QJYto3rUp2CNI3IroLa5v/hp5jnq+SU6YeAQo=;
        b=f7hgY0o5is+2L+6T739vhH3fyExEAhXcZ5SsuIxU4rolGSwFHDc4VZk9lIMHlq0LpD
         N4F7VPkdcQD3HdMP7I74Q3uWmqro1gmcePvTguON/F45AC+5HprQqXA4mFeB0MWHNknr
         bzcER8feF1ifbPWhAZwFuy1qBEwusaBDtssRGRg69ADrcPVU+ODGk0Ud6jGUx0ukpnBp
         f6MoKvg7YdKBf/p2PRlX/lvP+Dn1miXJtxcHk55iRn+7E8dSdciEUAtQekY2nDxp7sSo
         7QWcbUc2zrN7+2RdJ1ddQnlW7mZoSB8sCgfrZGu2cSh9Jc7l1fvE/qTuL5yQEJN0FSE8
         B+1Q==
X-Gm-Message-State: AOAM532z+7Fem3tqn9Gn0piXzw6gDTZ+fibTX6QgcBxP52PvtrgHIkKC
	EEvUjYbWWJc9w4KcFZSY8XoHow==
X-Google-Smtp-Source: ABdhPJxC6uT/rBzoCI8ifUy4cm0zSLKXkk2t+HK66PziQB2HByEqlpYQCCLQuHduP3ICCzWspKkvIA==
X-Received: by 2002:a05:6808:3db:b0:2ec:cfe1:dfa0 with SMTP id o27-20020a05680803db00b002eccfe1dfa0mr13048421oie.127.1647876272900;
        Mon, 21 Mar 2022 08:24:32 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id v8-20020a05683018c800b005cb39fc3e15sm5544170ote.13.2022.03.21.08.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 08:24:31 -0700 (PDT)
Date: Mon, 21 Mar 2022 10:24:30 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Bill Wendling <morbo@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Andy Gross <agross@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] soc: qcom: smem: use correct format characters
Message-ID: <YjiYrj5euvidRKHM@builder.lan>
References: <20220316213118.2352683-1-morbo@google.com>
 <YjTJRqlFOsXz7Ss7@dev-arch.thelio-3990X>
 <CAGG=3QUXDj1Bp1kDY2F0dqw=6f8iRqE4nRDyticUrWx-nTb-=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QUXDj1Bp1kDY2F0dqw=6f8iRqE4nRDyticUrWx-nTb-=A@mail.gmail.com>

On Fri 18 Mar 13:27 CDT 2022, Bill Wendling wrote:

> On Fri, Mar 18, 2022 at 11:02 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, Mar 16, 2022 at 02:31:18PM -0700, Bill Wendling wrote:
> > > When compiling with -Wformat, clang emits the following warnings:
> > >
> > > drivers/soc/qcom/smem.c:847:41: warning: format specifies type 'unsigned
> > > short' but the argument has type 'unsigned int' [-Wformat]
> > >                         dev_err(smem->dev, "bad host %hu\n", remote_host);
> > >                                                      ~~~     ^~~~~~~~~~~
> > >                                                      %u
> > > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> > >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> > >                                                                ~~~     ^~~~~~~~~~~
> > > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> > >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> > >                              ~~~    ^~~~~~~~~~~
> > > drivers/soc/qcom/smem.c:852:47: warning: format specifies type 'unsigned
> > > short' but the argument has type 'unsigned int' [-Wformat]
> > >                         dev_err(smem->dev, "duplicate host %hu\n", remote_host);
> > >                                                            ~~~     ^~~~~~~~~~~
> > >                                                            %u
> > > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> > >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> > >                                                                ~~~     ^~~~~~~~~~~
> > > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> > >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> > >                              ~~~    ^~~~~~~~~~~
> > >
> > > The types of these arguments are unconditionally defined, so this patch
> > > updates the format character to the correct ones for ints and unsigned
> > > ints.
> >
> > Right. Alternatively, remote_host could be turned into a u16 to match
> > host0 and host1, as those are the only values that will ever be assigned
> > to it, which should have been done in commit 13a920ae7898 ("soc: qcom:
> > smem: a few last cleanups") to avoid introducing this warning in the
> > first place.
> >
> I'll be happy to redo the patch if the maintainers wish. :-)
> 

Forgive me, but I think that not mixing the unsigned int and u16 would
look better. So if you're willing to respin this to change the type of
remote_host, I'd be happy to merge that.

Thanks,
Bjorn

> > Probably does not matter though, unless the maintainers feel that is a
> > better fix.
> >
> > > Link: ClangBuiltLinux/linux#378
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> >
> > as discussed on other patches :)
> >
> Thanks! Copy-and-paste strikes again...
> 
> -bw
> 
> > > Signed-off-by: Bill Wendling <morbo@google.com>
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > > ---
> > >  drivers/soc/qcom/smem.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > index e2057d8f1eff..a98b5f395d15 100644
> > > --- a/drivers/soc/qcom/smem.c
> > > +++ b/drivers/soc/qcom/smem.c
> > > @@ -844,12 +844,12 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
> > >                       continue;
> > >
> > >               if (remote_host >= SMEM_HOST_COUNT) {
> > > -                     dev_err(smem->dev, "bad host %hu\n", remote_host);
> > > +                     dev_err(smem->dev, "bad host %u\n", remote_host);
> > >                       return -EINVAL;
> > >               }
> > >
> > >               if (smem->partitions[remote_host]) {
> > > -                     dev_err(smem->dev, "duplicate host %hu\n", remote_host);
> > > +                     dev_err(smem->dev, "duplicate host %u\n", remote_host);
> > >                       return -EINVAL;
> > >               }
> > >
> > > --
> > > 2.35.1.723.g4982287a31-goog
> > >
> > >
