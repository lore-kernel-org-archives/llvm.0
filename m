Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8D32F26
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 19:48:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id z19so28942496lfq.13
        for <llvm@lists.linux.dev>; Mon, 07 Feb 2022 11:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xshAeQAm5Ise7n5+KqUI2Gq2vO43dYWLzj1n4M3lADI=;
        b=m2jprebEmhSHSHuYWHpyXk49Q0ycc3cDlMn8JwLTJJKi2qmYSXGGWLoz6bhYhWu4b7
         WLT19qdEsHrW5Af6zYgwyr9CHYjWxlnl1s0VchRi57EarrSycUQh196P7SyNM6uW01th
         gnPfKYQmGbsuDcYSC8LlYEKew+wRz/a4CEjh414g8M5tqRCmp5iWBjX+e2YiyFzh2wZt
         J4oGZRvK4SRlVUUa/H6PGStsTQeKvk9uoL3RvfR7e63ThSnGziaw2k4B1T6zUhLcoPMf
         nS+SBy3zu4A9uchwt1CmvnTevZEmI2ii8QW82pmdTb2FlG7lO+SGc/8Yr9dDygMfsCIZ
         7FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xshAeQAm5Ise7n5+KqUI2Gq2vO43dYWLzj1n4M3lADI=;
        b=7KOol+ZkHs/1Cv6CsNu4+s/6kATNPFah8uKm5whu9KqKbv4lJUM6RL3KaGaoZIxiHS
         53sbS3j4+Thi4LlRcTjARqy81r/l7+YrxVzP65u6amNo3hUu/gVsIVFAwVTHfMLjRY8A
         yFCQXrr6drSR7AeswGZdrkzaokjqz7uCHbZcojXGrWidZMHGnIVbCP3CEMEfo7QDR5nf
         8a+sFUV2KtnaHrHa7YTcbtlP6wngBud0mKizUtC8YFVfhWFURNuE8AriMv0NuWSGyNXY
         wH7C6PhKIz7X24pVfjkz9YYc89fTX3G7J7HsJk3eVEUkcHlsNgE323tv7deXDn/Yy3BY
         kLxw==
X-Gm-Message-State: AOAM532KRxtElkQbyf2r12r39+B9n695QrkAI8XHao75ApGT5b6l9vrH
	9TfK4FZyRKxJBrdZJItWvaM7c+02zIEaPQcJ90dOKA==
X-Google-Smtp-Source: ABdhPJxGbuBFTqFUGLppr8/37eakpFsdrpJ9JwAJ3Gez87KBdM9rrL4ReL3BepKhdcb9fJ8x8e3HiDRO8sSDB9UW9qg=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr739680lfr.444.1644263304407;
 Mon, 07 Feb 2022 11:48:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207185126.2085525-1-trix@redhat.com>
In-Reply-To: <20220207185126.2085525-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Feb 2022 11:48:12 -0800
Message-ID: <CAKwvOdnyPZ6w5qg-+W0H0ait3KUV5S9+-gmty-ANK46BeKd5VQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring: fix uninitialized return
To: trix@redhat.com
Cc: axboe@kernel.dk, asml.silence@gmail.com, nathan@kernel.org, 
	usama.arif@bytedance.com, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 10:51 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> The clang build fails with this error
> io_uring.c:9396:9: error: variable 'ret' is uninitialized when used here
>         return ret;
>                ^~~~
> Return 0 directly.
>
> Fixes: b77e315a9644 ("io_uring: avoid ring quiesce while registering/unregistering eventfd")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch:
See also:
https://lore.kernel.org/llvm/20220207162410.1013466-1-nathan@kernel.org/

> ---
>  fs/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index aadabb31d6da7..74afb96af214c 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -9393,7 +9393,7 @@ static int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
>         ev_fd->eventfd_async = eventfd_async;
>
>         rcu_assign_pointer(ctx->io_ev_fd, ev_fd);
> -       return ret;
> +       return 0;
>  }
>
>  static void io_eventfd_put(struct rcu_head *rcu)
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
