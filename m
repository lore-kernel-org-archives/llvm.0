Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE417C
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 17:16:58 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id m12so2111358ljp.8
        for <llvm@lists.linux.dev>; Mon, 04 Apr 2022 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=42+DYObs0d//YPwipHE3d3izqDTdKuFvDHGNlUWoBx4=;
        b=ryB3WQniryeQTcsabtEMlk77sINOiDMjNnKxQIAPWIDWkgT2HeYr5YNp6DI6AxlrBR
         8fCQ5/lZHreREixoEVspMKO0H9IWt5XPvMwwVhey1g+3nGovFlOSfkDV0fB+9JHSyYww
         MfOlG9ttuJqR+MT95v3VjjepW6WKMqyiEifEd4jSbTESt3OkiuCI9dtDpTgNAJdCfa52
         52rZGeBuik8PbNlp7p70U2xxAl9hUAFZLO3frntLBrwofTgyaMBYv01U5bBe80qh7Dre
         A5puCYMeYPj9WlgAEVQoKrpAdNhAm82ngof0dDWWwAWwi9Ke06cvxAHP01nxxBjhXxtI
         /thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=42+DYObs0d//YPwipHE3d3izqDTdKuFvDHGNlUWoBx4=;
        b=nxCphgrFWRaspn3gu96SKiegvRgzXinY0kslMYqKfnBAJuyhlm2Avco00R00twF7nS
         PSd9X+VS/xHUDXBw9tionb4P8tZCQBdTMwISiMFEeHUltHA6etfME40p6VrjcoQpUs4L
         DeNuNN1rcCFegc1MGf7WYhsD3z5aGiD/6dbZMhF7p/u+GFQYrtqDB1QQeuVudZu+1LPz
         mhI1Wf7OJMKokzEiGmFjOduX8uczWvZ9ThPLo6w5uxF5Qi75hIqCm3e1a6wV5r/G9waM
         N0Fkx2TtOaidxSELCVj/yT9n0FWvt944r23gZ+VUfzX8mmo9lZyv4sK752GocoAH646M
         SYmA==
X-Gm-Message-State: AOAM532jY3wTKC7mpAZKsoLCmgtaHI5Y60bL5zaYHdiMU0ScwmHJ7DPl
	W05MB7RtSXBBXKqpL99i1xOvUPeZRVrvJeq+2MAEAw==
X-Google-Smtp-Source: ABdhPJzCr2hVN0gAAJB3yXGwvjHdQ4zEVxVEi7K2YofZ59SQ5b8dfqk23Flzm5EuxCaAEcQZt2M7qWFk0KKWja6DeYg=
X-Received: by 2002:a05:651c:555:b0:24b:15b7:74ad with SMTP id
 q21-20020a05651c055500b0024b15b774admr361740ljp.239.1649092616178; Mon, 04
 Apr 2022 10:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220402084746.2413549-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220402084746.2413549-1-lv.ruyi@zte.com.cn>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Apr 2022 10:16:44 -0700
Message-ID: <CAKwvOdk=_a98oaJxmYJsk_sjeBg1yELmpFeOKe1Cbox2vnVi4Q@mail.gmail.com>
Subject: Re: [PATCH] fs/buffer.c: remove unneeded code
To: cgel.zte@gmail.com
Cc: viro@zeniv.linux.org.uk, nathan@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Lv Ruyi <lv.ruyi@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 2, 2022 at 1:47 AM <cgel.zte@gmail.com> wrote:
>
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> fix clang warning: Value stored to 'err' is never read in line 2944.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

The change LGTM, but next time please consider putting the exact text
of the warning observed in the commit message.  For instance, it's not
clear to me whether this was a compiler warning via -W flag, or a
DeadStore warning from clang-tidy.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  fs/buffer.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/buffer.c b/fs/buffer.c
> index bfc566de36e5..b2045871e81c 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2941,7 +2941,6 @@ int block_truncate_page(struct address_space *mapping,
>                 pos += blocksize;
>         }
>
> -       err = 0;
>         if (!buffer_mapped(bh)) {
>                 WARN_ON(bh->b_size != blocksize);
>                 err = get_block(inode, iblock, bh, 0);
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
