Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A5B2C96
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:47:49 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id p16so21145607lfa.2
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzIUMIfi4RPXj+onsD2EV5D7RTPP5SubsnRhKU4PVU0=;
        b=STcanu/5UsqXYQCqH+MMlwnQs3HYtefRvaVpdBadT4nknJx7xsOWcuWJFSNqH8EGcc
         TdVh2U9BG0Ll8NqyhIpXa0bN5nKoC87pay5tODOXNsMRNr0+IAHXgi/TUmPGeXabbWhP
         3+W8acnoow1uISKEeiZY5onD9DQjC9h+hXYXVghf1fjciY0IGQOfm6jMRGtZoVz1yu6Y
         L66uVvPlhxO7g8ZOu5c/gQpvqJqjFxaOKvKl8fq51HYnF6uUxqtiYwl48HXw4GxD2nb3
         IHjr6/nVPUUamL9GA8ojWKkwzsmX8F5+tQaSQbZsmisDmmu8wUMRL82zKCy74IC2jYCj
         oeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzIUMIfi4RPXj+onsD2EV5D7RTPP5SubsnRhKU4PVU0=;
        b=MMHR4VYH0vPNxNLrzuGV8ZjMF/BwvVwNbo7TguW/iezejs+P/JKCP11eKA6BDYXqBw
         3QFr2ovx5rGJo772MnsjMy31bCTLHPOVIlYdNLphr+7byFyi0QTSH75lmmJiETypHAf7
         fTc+Ehp86CjzfxvujspMOAK9ri2NVP4cNKdpronloDqHI0f5lzx1PjIjUxpvR1ji2YYE
         tBrOJuAiuxNEFmwt4Oue+xXC3VY7O1IUdC5TdFDoqBUup0xZbyVkooC0m6FmtTxEFwzj
         j2kuK2Q2DVxeTjPLfswPyOzx3QUiCzGdmQNKkMxUhGqFwM3KTKfHlpzm6kljN5/6idAW
         vIvg==
X-Gm-Message-State: AOAM531GQFdR6EzqPirsvkrKBM0VgmfVp83rXl+YhttoOC3CaeQwa3Uq
	wwvasC6ZMMqKFjVwl4zw7RVEdQhrNW5JwHjVYjs2Lw==
X-Google-Smtp-Source: ABdhPJx6deQDCMojiHegS2mr4kysTeQUwWlnsyXo3BZVwZZ0CbYgJnSE8SDB61e07DBsybj27PrjCyFSpnlV/xbuQeU=
X-Received: by 2002:a05:6512:228a:: with SMTP id f10mr56001997lfu.489.1636145267629;
 Fri, 05 Nov 2021 13:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105164511.3360473-1-anders.roxell@linaro.org>
In-Reply-To: <20211105164511.3360473-1-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:47:35 -0700
Message-ID: <CAKwvOdmj07NhhrLUqavJGHBgsBRrg6BvCFCzKbzt4wQJUv+M9A@mail.gmail.com>
Subject: Re: [PATCH] selftests: net: tls: remove unused variable and code
To: Anders Roxell <anders.roxell@linaro.org>
Cc: davem@davemloft.net, kuba@kernel.org, shuah@kernel.org, nathan@kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:45 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building selftests/net with clang, the compiler warn about the
> function abs() see below:
>
> tls.c:657:15: warning: variable 'len_compared' set but not used [-Wunused-but-set-variable]
>         unsigned int len_compared = 0;
>                      ^
>
> Rework to remove the unused variable and the for-loop where the variable
> 'len_compared' was assinged.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch. Hard to say what the original intent was here.

Fixes: 7f657d5bf507 ("selftests: tls: add selftests for TLS sockets")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  tools/testing/selftests/net/tls.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index d3047e251fe9..e61fc4c32ba2 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c
> @@ -654,7 +654,6 @@ TEST_F(tls, recvmsg_single_max)
>  TEST_F(tls, recvmsg_multiple)
>  {
>         unsigned int msg_iovlen = 1024;
> -       unsigned int len_compared = 0;
>         struct iovec vec[1024];
>         char *iov_base[1024];
>         unsigned int iov_len = 16;
> @@ -675,8 +674,6 @@ TEST_F(tls, recvmsg_multiple)
>         hdr.msg_iovlen = msg_iovlen;
>         hdr.msg_iov = vec;
>         EXPECT_NE(recvmsg(self->cfd, &hdr, 0), -1);
> -       for (i = 0; i < msg_iovlen; i++)
> -               len_compared += iov_len;
>
>         for (i = 0; i < msg_iovlen; i++)
>                 free(iov_base[i]);
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
