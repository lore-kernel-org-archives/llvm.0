Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2746F2F23
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 13:37:25 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i14so1149624wrc.10
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 05:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lcWfuffsHlkwnL+NX13z4fIGG38SkjTMAyUWe1hrS/s=;
        b=ax89RcggFkFd1mkVOO4bbwwgJ2uBJIJ2Q3fJKhK2Sc4cUFhsuW3ihJFdynqkkKSgeO
         fJjANcgbdR4JgM+ypugbaaa20LLd7KYcQ4+NwJZilXEMXE1px2Fi/oRL3Z+Wlic/KVtb
         Pm3mBBFsisPBls4E9AmEI0yeHbuyadvvCM2vhrHxznL9qJhnZXnX1AW6/qjr135qRUK+
         yOEu57BN7KgVC9CG4Q8L8N2Jy4giKEq66gDWFalRjDfZ3PIWuaip5DsbaRsi/ob0ciTX
         7FUFic8jt2bertiXzJFl6bXz22pPFQAE8WREXskUGWldKms34kXs2xRwkKDpE5eaJUhx
         xmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lcWfuffsHlkwnL+NX13z4fIGG38SkjTMAyUWe1hrS/s=;
        b=XdjklmM9AsJRCIHZuqi9FNXtqEqTabXelHx+Bx5sS+nydtIzOL5oLksExAduSB93r9
         IMb1WRidNrbwcbWqKo4RUIblBWxyGBD0xZ33ikmzUQy7R+V3j2ZQ6ZT/nN7qBRD8I4wi
         Yz2iMqyho2J0RWgQQZ7aINbmFA99pF42cgm8g8M+o6rGkC31u247C1tICzPIPesUMRL7
         vac7iePjp3a0kF3D0H6Nd0G03c30+Slbw3f2gsU/QforCmeXVaTmyGvEe1kIv28v/7Ia
         SlA1xDvwxemGv+QAjO1Y2yLgfFmZSEBaaTPpdMfTQlx98ImhOT3pj11zVw2T7Mmul3OH
         Zdyw==
X-Gm-Message-State: AOAM5311yJkDk5gdHucB9gTXtdQXn0LM1mdGA4QOhTvep2aER4DWthK0
	M2Xy147sr99RHBb5Krse9sgxHF2MnF0y7g==
X-Google-Smtp-Source: ABdhPJzyK9POHUMwimAGW7OLwuIips21giBJNRXYRkQB5rSKYcfCh573Ny7ugpEOgQXzUz6NhceNAg==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr1561790wrq.384.1644327444049;
        Tue, 08 Feb 2022 05:37:24 -0800 (PST)
Received: from ?IPv6:2a02:6b6d:f804:0:e066:3489:1ae2:dec1? ([2a02:6b6d:f804:0:e066:3489:1ae2:dec1])
        by smtp.gmail.com with ESMTPSA id v9sm1975681wrw.84.2022.02.08.05.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 05:37:23 -0800 (PST)
Subject: Re: [External] [PATCH] io_uring: Fix use of uninitialized ret in
 io_eventfd_register()
To: Nathan Chancellor <nathan@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>, trix@redhat.com,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220207162410.1013466-1-nathan@kernel.org>
From: Usama Arif <usama.arif@bytedance.com>
Message-ID: <2af2d61f-bd3d-5288-7bd2-4768ebe266d7@bytedance.com>
Date: Tue, 8 Feb 2022 13:37:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220207162410.1013466-1-nathan@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/02/2022 16:24, Nathan Chancellor wrote:
> Clang warns:
> 
>    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>            return ret;
>                   ^~~
>    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence this warning
>            int fd, ret;
>                       ^
>                        = 0
>    1 warning generated.
> 
> Just return 0 directly and reduce the scope of ret to the if statement,
> as that is the only place that it is used, which is how the function was
> before the fixes commit.
> 
> Fixes: 1a75fac9a0f9 ("io_uring: avoid ring quiesce while registering/unregistering eventfd")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1579
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   fs/io_uring.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>

Thanks for pointing this out. Just for some background in earlier 
revisions of the patch for "io_uring: avoid ring quiesce while 
registering/unregistering eventfd" the error return part was being 
handled differently, but ended up looking similar to before in the final 
revision that got merged, but i forgot to change this part back. Would 
it be possible to fold the below diff into the patch as well Jens?
Thanks and sorry for missing this!

Regards,
Usama

> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 5479f0607430..7ef04bb66da1 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -9370,7 +9370,7 @@ static int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
>   {
>   	struct io_ev_fd *ev_fd;
>   	__s32 __user *fds = arg;
> -	int fd, ret;
> +	int fd;
>   
>   	ev_fd = rcu_dereference_protected(ctx->io_ev_fd,
>   					lockdep_is_held(&ctx->uring_lock));
> @@ -9386,14 +9386,14 @@ static int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
>   
>   	ev_fd->cq_ev_fd = eventfd_ctx_fdget(fd);
>   	if (IS_ERR(ev_fd->cq_ev_fd)) {
> -		ret = PTR_ERR(ev_fd->cq_ev_fd);
> +		int ret = PTR_ERR(ev_fd->cq_ev_fd);
>   		kfree(ev_fd);
>   		return ret;
>   	}
>   	ev_fd->eventfd_async = eventfd_async;
>   
>   	rcu_assign_pointer(ctx->io_ev_fd, ev_fd);
> -	return ret;
> +	return 0;
>   }
>   
>   static void io_eventfd_put(struct rcu_head *rcu)
> 
> base-commit: 88a0394bc27de2dd8a8715970f289c5627052532
> 
