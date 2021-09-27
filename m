Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1013B2FB6
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 21:48:47 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id b20so83940077lfv.3
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQziuvBfMARHu13Vd8UtdQcVHSAZAA1BW8ACAK1SnhE=;
        b=NGpFDJkITm1KfPEm3AGsnSRalQF0DwNDYxx0+9BDd5ChQE9kL6NB5KDsHAmMwVhIgP
         ACUY3BOQZVr6hHMpD6sr5qPQZLozbKu6ibg2WhIpWCB9r4XzmqAuaSYsBT/322WUD+gn
         t8lLVz5wiX7/CJTHCNVlutwPKAddZlDG1Dejg+c5P/TrWhUHDXuBN5q1PWTmbTI4VIto
         qsCm/jmnE30fATndaSCtSCkRj9+cQGETpJAdy091YpXA87AUrsFUrbi6wMN7NyuZvYGj
         UIOw6K7hzQFtdWHvMK2T8QFeL10xFIzxJr0+5y1YxIEK0t4MMs8X26ytL8QTcYvhguRp
         qt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQziuvBfMARHu13Vd8UtdQcVHSAZAA1BW8ACAK1SnhE=;
        b=BWEqUwXSh5TT++RP0PqhR/idEBj2BfDSssFY5RUH6MrvnVeUtpq/ZWoRdD8I7ajoDP
         4pZTo63P4bRgCczhJ7m0XjrT2TztC8T2/Yy8WTC0BM5V2vOuZZa/1WgN/+DYB0VkPK7b
         iC950hldDVCnLDVpVFeEWMIwLSg9W1e0ustSjfN/DHfe4BuDBtOSDAANBi7OtYUQxJpJ
         O64wlr6WUYtv1CTXtxYF3t90sMUVrvEvATh7qRjxLrWf1jGQwQ1R53jDQkgmIM94kp25
         jbt41dYomun6ZcrPq49dx5CxGY3RpwlvijymP/Mul+FdIdwdKdvKY4TNyzANHbUYR1IT
         qRTg==
X-Gm-Message-State: AOAM5300l3M4SscDMZtmWtVhdrkxujyIO4f98XnzJs5eYCR+YJb87tC8
	n04HWjY2EFfuS6vkFI8PYB6zhParWPMGnjZ+jI8Iug==
X-Google-Smtp-Source: ABdhPJxP+ChpDdQIABcI5f3CK9us5oK3lnIFxWcqw0cBy+9IUsI6SeIO9UhwDiMik2DcBMb6VXtvjgnuaa+Js+P7ih0=
X-Received: by 2002:a2e:5059:: with SMTP id v25mr2204795ljd.128.1632779325708;
 Mon, 27 Sep 2021 14:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUUuacTuaWXopzH_YC3pCa3FPB=GReJ6BwE5zJ1j2WB_ew@mail.gmail.com>
 <20210927214715.GE964074@nvidia.com>
In-Reply-To: <20210927214715.GE964074@nvidia.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 27 Sep 2021 14:48:33 -0700
Message-ID: <CAKwvOdnmbLO3+8jwwyoS3Cw_wSfr18Zqf3QyHpEJN5Dok46CQg@mail.gmail.com>
Subject: Re: Linux 5.15-rc3
To: Jason Gunthorpe <jgg@nvidia.com>, Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	llvm@lists.linux.dev, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 2:47 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Sep 27, 2021 at 10:48:42PM +0200, Sedat Dilek wrote:
> > [ Please CC me I am not subscribed to LKML and linux-rdma ]
> >
> > Hi,
> >
> > with CONFIG_INFINIBAND_QIB=m I observe a build-error since Linux
> > v5.13-rc1 release.
> > This is with LLVM/Clang >= v13.0.0-rc3 on my Debian/unstable AMD64 system.
> >
> > For details see ClangBuiltLinux issue #1452 (see [1]).
> >
> > The fix is pending in rdma.git#for-rc (see [2]):
> >
> > commit  3110b942d36b961858664486d72f815d78c956c3
> > "IB/qib: Fix clang confusion of NULL pointer comparison"
> >
> > Dunno if there was a pull-request from linux-rdma folks.
> > Cannot say if it is worth taking this directly...?
>
> It should come as a PR this week, I don't think we need to do anything
> special urgent here, do we?

I think that should be fine. Thanks Jason for doing so, and Sedat for
help testing/reporting.
-- 
Thanks,
~Nick Desaulniers
