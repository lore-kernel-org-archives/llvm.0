Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB952F80
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 15:44:44 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id p1so9745417ilg.10
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=jqe6G+RxeN+0BQAUW2ZnGRw47yGNXZWVfO1Qg7DdDIA=;
        b=VTbZeN2++noIRr5Q3U/1u50CfNgnsNrjRR4NMCRqamavXNKWCXvH5R+w6DIpXO6dba
         ZFRcpYNmFCOwQb4CzYMDA7Q4vvN3TS8RRMv1k1SD2WTfUVbBdV0QEsr5FNhzJlFEhRoG
         D4heFu5/N18KK6diOyUAaVCX8OyY+FW2CnVdlayzHqcOtqefU122VW0RHnMmKAO/KgE5
         GVfcuKInIJBoLtRe9c7mWHQeYfMG5pGbGQdT+lC3bpGs8aGO4PebEluEIR/u7oqYm0Dt
         aISAhtE7Hlo616NTQuAeUNM3mYwh4mh19HEOqxJaVInoNgN4kscdWeyG5xoa+Zuyo9vT
         sE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=jqe6G+RxeN+0BQAUW2ZnGRw47yGNXZWVfO1Qg7DdDIA=;
        b=oCrfY3nFdzWm+jB7QBJqGIGIiCQcDumIS2A6JmMc33js5CqAEia3gp4zInm3+XyDT2
         h0TixKuAJHZDOS6x/Zn8EyzzbA6gMWaXdvH2L8bNzVA5Z4GGnlNfRHrUMq+Tx6PD7fCR
         oAPSwARDoXIvJnOVjGO2YqfIoWWwOYnG6hfvX0Gg5XGhnWBbsXO7+0swZSlEIKQJ9eyP
         HoujQoykLyZkGATNzXDP3H5Av2RtGNIVGZIxxAH3x5OtqFEB2BDL+ENKGvtuHF1/Oy7G
         Nzwsw/mxwRTy7BC9fXsz/E2fpwP1fSgdRv3Zk15inGzlnqAG0FTcmQWpxjylET6J43Js
         itPg==
X-Gm-Message-State: AOAM532d54xblAmTvZMa95dyeV+YiCCfpOjaZReNAEfDb4DZE9+2LkUU
	3v5C7APcgub9oN7NWRV6WG2u0jAPDfy0p2DKKHk=
X-Google-Smtp-Source: ABdhPJwWGZxblICOjXvnFDbNPoZLCwIaabQrx7fMZxWYWPD3BnV6tO3eyOrlfShjqOjI9tOg3Q1oLixsZncTerHuquo=
X-Received: by 2002:a05:6e02:1a89:: with SMTP id k9mr9320598ilv.77.1633103083103;
 Fri, 01 Oct 2021 08:44:43 -0700 (PDT)
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
Date: Fri, 1 Oct 2021 17:44:13 +0200
Message-ID: <CA+icZUUEmCR25dPfK16JB2V5wJfkuDLj3Dm+_BOAsfn_vUPRBw@mail.gmail.com>
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

For the followers of this issue:
Commit is now in Linus Git.

- Sedat -

[1] https://git.kernel.org/linus/3110b942d36b961858664486d72f815d78c956c3
