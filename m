Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5F3FE7
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 21:50:05 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id h9so20963591ile.6
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=tikSQPAyzklwRveDS3Z5YihXzUXmcK3zSUGwoQRh0mc=;
        b=WCJ5uXuAys8JIc4FJY6+TyBLOu0iSZALBoDMh0XWbTcFi2aJIETo/yqf/AjfnKtxnn
         0FmAeBYXE43yDnmGh9+2yI8bTsS2TUpfLqJj3PpAWGwH4bvr76+eM6jXCTkqJwsTU4ah
         s09X8BGtUm9sz3QLPJT+w6fBCYO5NRCjdqFWRY7Jb3kQ/2d9PzKi1CxLJpg/7IXjXfAf
         zvkPACfIKQcKMjSZQS2htY6U2oN2RappU9rck9T9eC84EV80vWi7kGFYXT4PdfqI5pbk
         u2Zt5JCsvKsQiinEpuDKtzunYtNGHFd6GPeBbz8+FdOso5NcIf8yK5JWXcHEfJnx2ii+
         RR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=tikSQPAyzklwRveDS3Z5YihXzUXmcK3zSUGwoQRh0mc=;
        b=7j2R4bOMDX0BwhIf7I9qb9oEYCZ0Zq8X63WLx2C/ztmwGr1GQO1wJ62zCC51hkVb4Y
         xnnJADRZqWYVxkY5d7Yzu21f/1ctuJsMnVldpJQPlvcfUBanG0RWefHxQxLvR84uGVeu
         IXQ30gIqyLL3DlIGmAYjUNZyK+hYdpQ53rbWCgFqd4tCH9Li5f8Yj+hk/oWxTQN+AFkI
         YUctXMpHJC5vWLwAZnBwBAaD/egKSSWBXGRFJGHiKVPlCfUCfUImaHl0XNpiTjY4gUPo
         WwKez6oshSVi09sHLDuPM39pnXA0FBVyhJrmRmZHM9FiUsQIfR9OVdFLSpTArqtDGTVe
         GfSA==
X-Gm-Message-State: AOAM531+WDZfHF1svqS0U2kYg8GNWEfga2l2G1NH5hVXrg+eRukWgZoe
	kUNaBe45/2uDh+rwkQ/E/U4ZF/2ak35wXNb7EnM=
X-Google-Smtp-Source: ABdhPJwI1HhPHfNS/jXu1lg9HT/GpcVmrGU610X6rk5pu8ryCEJDbylB19fni9LnAz0JzfBioEfmzzvsqBecthg6Ss4=
X-Received: by 2002:a05:6e02:1a46:: with SMTP id u6mr1723814ilv.214.1632779405064;
 Mon, 27 Sep 2021 14:50:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUUuacTuaWXopzH_YC3pCa3FPB=GReJ6BwE5zJ1j2WB_ew@mail.gmail.com>
 <20210927214715.GE964074@nvidia.com>
In-Reply-To: <20210927214715.GE964074@nvidia.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 27 Sep 2021 23:49:29 +0200
Message-ID: <CA+icZUW3=-FiUebSEsqgBQcHGrk=ket906V9mAqd_COJAmTDhA@mail.gmail.com>
Subject: Re: Linux 5.15-rc3
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 11:47 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
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
>

Personally, I am fine with this.

- Sedat -
