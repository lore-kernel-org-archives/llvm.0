Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F313FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 19:18:48 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id x27so675912lfu.5
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YxCg+Ff5e18Lo5SLxz2RohY8wIeS7mnNr94SiNjtXE=;
        b=MAAULZ4URU5MTmtKRWymxurd+Zu6ETEEDIunC1m5EtPyL8I0MQlFAdKvzoK6qKJomw
         qw+saZ9NCqKKF9FlwDUGiOyvAmlXYwOF7O3XP4wRG7NSrfOZmJl87gAFOG1J81g9q+cH
         6RYe0cCAP/vNZGkM9eljVjR19I9Wsiig/vp+dlTY3kKRu6LBouisQGPCSZevvSD+j1Qm
         IMpSzG0iUHG2aS7hXlnBYZkL121q/rK08HRxTbmFHXzxag0mEdnq45lBKQTVY9k1hege
         j3iPe+iLBkLXELjnu+2QuWmJYHoxfj2wYKlz1JgJc8TN2fiasfHOhgBpaAzPDjrKMCHn
         CIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YxCg+Ff5e18Lo5SLxz2RohY8wIeS7mnNr94SiNjtXE=;
        b=ffEb8gln/ZwJacysE2QMrNTTMEukqh3z/w+FiueJFBMbRlE3qjDfpgOlX80ovDcEd/
         ShSfwQzcTAvGa9evy3p6zNPic+kJe1ZP9QZ5LuYgDdfjxoctZ2FTJWg+vVpn2jQWje5c
         ccC1yqL8phVqtGvYHYBjb7AkugHanudy6Tj1WWm5Us63mUHAwEAfmJHUwwAKAf/Xhuxt
         JntAbEYrKkFkFl4gHZAfJ7BNrY4dQJIgg9OnziJWR4xaH0akY7td8X+aMy7sqSgmfZrm
         8nDC+6cL+ssz4IbZLl/GLuaLLvnAc1knNv87k6BZ4/X0XxZG7trJmOGgvjcobWxrss5q
         sRRA==
X-Gm-Message-State: AOAM533uadRzUhz9UuGFzb0cVWcSOd+Ghc6yXDRfBwfyud6b0rI4nJ5o
	3GXWwZcM1aqbL7mXQ8MV7eN65hXh4BuovD1CMZLb+Q==
X-Google-Smtp-Source: ABdhPJw16ccf80fVUt2Ftx18ZwpsavjrFkyaXZ38lNAQGEztzwddr/2uECAcEJCIiz5gjGcanzI2I0+0jH3Kicyx5S0=
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr14931868lfe.444.1631647126453;
 Tue, 14 Sep 2021 12:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0-v1-1b789bd4dbd4+14b16-clang-fix_jgg@nvidia.com>
In-Reply-To: <0-v1-1b789bd4dbd4+14b16-clang-fix_jgg@nvidia.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 12:18:35 -0700
Message-ID: <CAKwvOd=Py3qAmn5e1gqWPe9bhzQ6pwmjRsRyqf+KBtwd7OQbyg@mail.gmail.com>
Subject: Re: [PATCH rc] IB/qib: Fix clang confusion of NULL pointer comparison
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-rdma@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 12:01 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> clang becomes confused due to the comparision to NULL in a contexpr context:

s/comparision/comparison/

s/contexpr/Integer Constant Expression/

I don't think constexpr is the equivalent to an ICE. We know what you
mean though. :^)

>
>  >> drivers/infiniband/hw/qib/qib_sysfs.c:413:1: error: static_assert expression is not an integral constant expression
>     QIB_DIAGC_ATTR(rc_resends);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/infiniband/hw/qib/qib_sysfs.c:406:16: note: expanded from macro 'QIB_DIAGC_ATTR'
>             static_assert(&((struct qib_ibport *)0)->rvp.n_##N != (u64 *)NULL);    \
>
> Nick found __same_type that solves this problem nicely, so use it instead.

Sorry, Nathan found that.  Should be:

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch.

>
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/infiniband/hw/qib/qib_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Hopefully third time is the charm here..

:^)

>
> diff --git a/drivers/infiniband/hw/qib/qib_sysfs.c b/drivers/infiniband/hw/qib/qib_sysfs.c
> index 452e2355d24eeb..0a3b28142c05b6 100644
> --- a/drivers/infiniband/hw/qib/qib_sysfs.c
> +++ b/drivers/infiniband/hw/qib/qib_sysfs.c

Consider explicitly including <linux/compiler_types.h> in this
translation unit.  I know it may compile today, and it might just be
our internal style guide talking here...

> @@ -403,7 +403,7 @@ static ssize_t diagc_attr_store(struct ib_device *ibdev, u32 port_num,
>  }
>
>  #define QIB_DIAGC_ATTR(N)                                                      \
> -       static_assert(&((struct qib_ibport *)0)->rvp.n_##N != (u64 *)NULL);    \
> +       static_assert(__same_type(((struct qib_ibport *)0)->rvp.n_##N, u64));  \
>         static struct qib_diagc_attr qib_diagc_attr_##N = {                    \
>                 .attr = __ATTR(N, 0664, diagc_attr_show, diagc_attr_store),    \
>                 .counter =                                                     \
>
> base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
