Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EA95395
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 17:41:24 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id x37so9762450pga.1
        for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680111684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HLyYeKV3If5cAiJw/VAQ1aNDVNCtxxtUuMyZtuuZJs=;
        b=nQ50QFq2oQaeue7g99fWt3LYzim4DoP351259h+OjISIxFL0HSrYifEKZzXFuCp4kN
         zTW0fp74XQOcA+AdBe1zlS2XRP/dwwYuBxzYxeW0v82hYny2ieOa/OyagiJ5Ywv89bio
         XrdEWRYp4ly32ewX9Idj0Uco/qe5sPNgwQrJsvpE7biD19aa18AZbECJz9fxhUpVAIiF
         nNQb6rHy3NeYphBgnwH8GrUpjunTe2C903BYSgRvhfydQv993BSE1QofQ1mkyzJRL7Pp
         UmpH7UsQrajnVeY0Z6lmWgkUoPG6XgfuOxZxvkujKcRJ4dOrGb/yFEBixEW/+jkrPEZ5
         MTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680111684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HLyYeKV3If5cAiJw/VAQ1aNDVNCtxxtUuMyZtuuZJs=;
        b=MwVE2EUq1LYJ6sNZseSHq9iTxbtkwKp+j9w0c3J0iHfNOffePzyJ4mnFfhGfTV8SvF
         Id47iTkjBv3gNasC0+yUNpcUhAnjVo9igPAR1JP3rCu1FaFUEmydUotwGgtH+iALrd5v
         e0r8cik8EnwOqo5+ZSFBu0IUy3qTwZfTXg2WKtKogdJOD9YQS+z2UpcANWsVE67IsSxk
         The+i+QpEh0ut666MQA3N3OOM19n6c2kP3bQAshGhpDu/1KsNuYauae36Dh7X6+9ns/I
         2mUvQGcidxvU2DLhq8JmpsB/Pv2i5absm1cxXHFJvWG9epDNmSgxBv0wpQUNrnEHHJjq
         NhvQ==
X-Gm-Message-State: AAQBX9c9sFzkzbzc8wAko84/LMJssIvXfXWEld7eauorOn7gzHf3JFis
	jXIzxlyl8sXd26npw6P5rIJ16MnUlrWrM6iWDTxlzQ==
X-Google-Smtp-Source: AKy350abXbUxEEXq3i9xDxZykzGOBVliqLi4/3uqla2IzGu82Yr8XzrqWZiHLqLlPTBfgnN87bOKeaoqYkUT7RT3ee4=
X-Received: by 2002:a05:6a00:894:b0:606:a4bd:8dde with SMTP id
 q20-20020a056a00089400b00606a4bd8ddemr10983778pfj.4.1680111684131; Wed, 29
 Mar 2023 10:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329-net-ethernet-ti-wformat-v1-1-83d0f799b553@kernel.org> <CAKwvOdmcpESfN-9X2pzuxyj5q0wkH=kFwhaAhbaEJHwatyQLQA@mail.gmail.com>
In-Reply-To: <CAKwvOdmcpESfN-9X2pzuxyj5q0wkH=kFwhaAhbaEJHwatyQLQA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Mar 2023 10:41:13 -0700
Message-ID: <CAKwvOdk0wgGrMLrebTcHU078Kjtgb_xR3ghnEgQeS3PxgxNzag@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: ti: Fix format specifier in netcp_create_interface()
To: Nathan Chancellor <nathan@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, trix@redhat.com, razor@blackwall.org, 
	kerneljasonxing@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 10:10=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Because integer literals in C are signed, the cast is necessary to
> avoid the format specifier from warning about the wrong signedness.
> It would be preferable to have a `U` suffix on the literal value, then
> the cast would be unnecessary.
>
> Untested:
> ```
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 494a23a976b0..67cb6bfc4056 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -349,7 +349,7 @@ struct sk_buff;
>  # define CONFIG_MAX_SKB_FRAGS 17
>  #endif
>
> -#define MAX_SKB_FRAGS CONFIG_MAX_SKB_FRAGS
> +#define MAX_SKB_FRAGS CONFIG_MAX_SKB_FRAGS ## U

Or rather this trick.
https://godbolt.org/z/81aPxf39b
I forget what that's called (it's not xmacros); we definitely have a
macro for that in the kernel.

--=20
Thanks,
~Nick Desaulniers
