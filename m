Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293FBE7B
	for <llvm@lists.linux.dev>; Fri,  4 Aug 2023 15:50:00 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-47ec8c9d7a0so913576e0c.3
        for <llvm@lists.linux.dev>; Fri, 04 Aug 2023 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691164199; x=1691768999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6GtJle38GYNlw+gZNdG3pGleXzijHW2VDwwGhqBWf0=;
        b=AW5cXx0H8S0x5I+u2xfxfy1V7vR/jMhVl1HUEGEbVyMQepbBG7qwJSWaktQ6RUC0ry
         YWp/wcvzZRS0TmRJPYM7ge8Wunb/krBend8Sku8kZ9/XenVwDkKiznYril6qzO64JRls
         Q7dCK8fwLyw9HBdWcmAEtxT63VH6KCAnDDnSzC6QWOMes9rU+Bk9lh/QSwVUu/+Q9M3F
         yXe4ljZivaQrSG9TrCIM4df/WqKdrg0WjCIf3SXhO+Omc+9BDZvl7iaQ3gi46u/Wl8kv
         8M+yzJ6QwWSZYvFrole4BzasoQzljZn068wOxkBGwSzKUGLR070XifJVqziX33IlqbS0
         aaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691164199; x=1691768999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6GtJle38GYNlw+gZNdG3pGleXzijHW2VDwwGhqBWf0=;
        b=JG+XHk4BW5N+Ho0msDe2FKeIyFkqSYB27tNHbWJo2/4NChn1BavTTGETalsS5rZg3V
         9XdWQeWSlXYFuB5snmX/i4V7C0CbH5IwDErxvEjO4JzcRB7u/yoFKV04Wa3t6vPT0jiq
         wdHf3Od4Waa9l1a1mjsVRkBYH86i4jv8IM2QNKNuOKUe1Wag7QXOsPS5bFCjDPZfgnfs
         UxePhDlBUXBVAOObW4yjuavdoiU+OrVBErFCl27TBCjaZEb3vwXkBsGyOw/mNHHho9OK
         kBO2VA2JICWTqwg3ZBAcadJbny8RruxrIeQ65M9GM1t1wXKbL4A+rIcDsknvxUZ4wmcq
         COYQ==
X-Gm-Message-State: AOJu0YzHzNrAa8gMcGHi7JRL2ed19YK8h4uvTfhY8IRPSparqhY8FFoy
	RZBJUEzw6yFs7xWAOC1fNfqdzR48JI3qbmuZNbUHfA==
X-Google-Smtp-Source: AGHT+IGtDHTDweDFtGPqweVEy6/Ojul8h7Go4cQI7kTAsF7TZW0t3PAPJCedcn9OpWUtmtIlxQmADQwpMGsPvotnBTs=
X-Received: by 2002:a1f:45d7:0:b0:487:1ae2:2ad7 with SMTP id
 s206-20020a1f45d7000000b004871ae22ad7mr1601447vka.3.1691164199316; Fri, 04
 Aug 2023 08:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230804012656.4091877-1-suhui@nfschina.com>
In-Reply-To: <20230804012656.4091877-1-suhui@nfschina.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 4 Aug 2023 08:49:48 -0700
Message-ID: <CAKwvOd=1pEE=pspfg7fcofYF5=eziFvcLJgC0_ohG7jq+rbVyg@mail.gmail.com>
Subject: Re: [PATCH v2] fs: lockd: avoid possible wrong NULL parameter
To: Su Hui <suhui@nfschina.com>
Cc: trond.myklebust@hammerspace.com, anna@kernel.org, chuck.lever@oracle.com, 
	jlayton@kernel.org, neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com, 
	tom@talpey.com, nathan@kernel.org, trix@redhat.com, bfields@fieldses.org, 
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 6:28=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> clang's static analysis warning: fs/lockd/mon.c: line 293, column 2:
> Null pointer passed as 2nd argument to memory copy function.
>
> Assuming 'hostname' is NULL and calling 'nsm_create_handle()', this will
> pass NULL as 2nd argument to memory copy function 'memcpy()'. So return
> NULL if 'hostname' is invalid.
>
> Fixes: 77a3ef33e2de ("NSM: More clean up of nsm_get_handle()")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Thanks for the patch! And thanks for checking clang static analysis reports=
!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> v2:
>  - move NULL check to the callee "nsm_create_handle()"
>  fs/lockd/mon.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/lockd/mon.c b/fs/lockd/mon.c
> index 1d9488cf0534..87a0f207df0b 100644
> --- a/fs/lockd/mon.c
> +++ b/fs/lockd/mon.c
> @@ -276,6 +276,9 @@ static struct nsm_handle *nsm_create_handle(const str=
uct sockaddr *sap,
>  {
>         struct nsm_handle *new;
>
> +       if (!hostname)
> +               return NULL;
> +
>         new =3D kzalloc(sizeof(*new) + hostname_len + 1, GFP_KERNEL);
>         if (unlikely(new =3D=3D NULL))
>                 return NULL;
> --
> 2.30.2
>


--=20
Thanks,
~Nick Desaulniers
