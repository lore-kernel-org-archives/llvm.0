Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586B63BF
	for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 14:04:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id mg12so39270074ejc.5
        for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 06:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7dRloswEV6O4FN2iiz6ZS4n2jKn6i71GuWTIh1+d6c=;
        b=ZM+3T5Y+1o/Xr4JI8qDG+x0+yhUFZx7dOowdLYw01bMwVcGvO3wY1d3/SCGoOTZNOe
         Fe0hgNCf0nVXF1VEsM6GgU0dYtbBDcUZSyScCz53HpWLmkLIiOUDtXO5sDUucZhVVmGF
         lM9z+mu0spGpmNm9nETCXb9c3hBLMJhLAIFI97q9fUAb0ZrykXtTG4qME6CHw1BnB9iv
         3jTliBp6JuLhQrJt2fiU2R6VZhDFzVj3hdXRjEa83po6+Hff1wPGrNU7aWxaLZePgLUr
         W9OugBNhPTeok059hFbqFUk6erTwddYx0AAUJRsjslOG/QGcCY7enHPopecYFgHC+2+F
         +85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7dRloswEV6O4FN2iiz6ZS4n2jKn6i71GuWTIh1+d6c=;
        b=4MWD37GrfTkAG5Hf3LfHIHj6YOY7fb2TQ2U+ozdHTZWMuUIq4ckFAoawuw0YoXzLWD
         hUcH4197tp/LKT2bAjjqYBObp0T8tuIbEuyNh6DO0qYvDz+CapD6LDjn45v/MlSwC9Xp
         ydY9g88e5uWTWoXVHsegg/wNpUGnuKG5bSIHql8VkQnsKpXG+nw9FfHG+vrXyOnG4gYb
         IEYph2GnFJWgvf3xj6NRYJX1nBnl5U1rV13VGncYXB9RHVVkoFHNbWDRt/efp1RMNzQu
         nczfzRJpLLo7eUn6UPoZUi4sI8RwpJRBJdfKlZraKHgD31CJT0zl/FynEMwt4wUqYwpD
         3waA==
X-Gm-Message-State: AFqh2kqKrTuNbJwg1ZMnShvlhgtnsNP0mnFXCdl3w11JH2mFSe+JseRC
	b5ZH3eKkydsba6Gw9QaFaJE=
X-Google-Smtp-Source: AMrXdXttKKi+iLAmx5d8d5yerYPKvbMZTKXClJq6rTidBrzh7/IKlMLyt82AtvsCotlbkVuV2jyhXA==
X-Received: by 2002:a17:906:e2cd:b0:870:2aa7:6509 with SMTP id gr13-20020a170906e2cd00b008702aa76509mr30689651ejb.43.1674569059643;
        Tue, 24 Jan 2023 06:04:19 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:310::206f? ([2620:10d:c092:600::2:74e0])
        by smtp.gmail.com with ESMTPSA id s22-20020a170906501600b0085ca279966esm945567ejj.119.2023.01.24.06.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 06:04:19 -0800 (PST)
Message-ID: <077b10a5-5ccb-870c-3dd2-e96bc6aad5ef@gmail.com>
Date: Tue, 24 Jan 2023 14:01:54 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] io_uring: initialize count variable to 0
To: Tom Rix <trix@redhat.com>, axboe@kernel.dk, nathan@kernel.org,
 ndesaulniers@google.com
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230124125805.630359-1-trix@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20230124125805.630359-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/23 12:58, Tom Rix wrote:
> The clang build fails with
> io_uring/io_uring.c:1240:3: error: variable 'count' is uninitialized
>    when used here [-Werror,-Wuninitialized]
>    count += handle_tw_list(node, &ctx, &uring_locked, &fake);
>    ^~~~~
> 
> The commit listed in the fixes: removed the initialization of count.

My bad. The patch looks good, thanks


> Fixes: b5b57128d0cd ("io_uring: refactor tctx_task_work")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   io_uring/io_uring.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index 734d074cdd94..4cb409ae9840 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -1227,7 +1227,7 @@ void tctx_task_work(struct callback_head *cb)
>   	struct llist_node fake = {};
>   	struct llist_node *node;
>   	unsigned int loops = 0;
> -	unsigned int count;
> +	unsigned int count = 0;
>   
>   	if (unlikely(current->flags & PF_EXITING)) {
>   		io_fallback_tw(tctx);

-- 
Pavel Begunkov
