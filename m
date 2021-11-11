Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34C2C81
	for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 15:52:59 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so9498542otl.3
        for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 07:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XOIv/URPqC6eVjwDrRR5fYOj9yjs4EkQ/pA34VIFsCI=;
        b=Eyhft6Xf2VI0gBV0H6/ONYORdlmtc9gr6jLIhwgFGDcXr7m5gGQCouC2n40kCVMDEn
         Donr40sJ+lx7Yr2GJ2XpK/gqU3Z9z+aIbAfhae3Zae05jc6Q5IrbFJP3MqerICkRSLSb
         fgPF24JHiLgQWAH4/HHnrRY9vljS8O3gqckNIbCA3LpA9fMsNpurzjtYMAuT09NJV6Kg
         HOIBIK/AQ8YRDstfGzUhdxn2q9gYvt0UbGyDOMrkOajRxI8TTeKhWaYe0SkH4/PB3PKv
         N9LdJW5MMIwLSBVEd1kaG4fDN6YBdKbihcItHB9yJFZW9gBxc5wzaeEzyBVGPwK7wUFX
         K42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XOIv/URPqC6eVjwDrRR5fYOj9yjs4EkQ/pA34VIFsCI=;
        b=jOt9+taLGQYKAe5Affpmp8gHbp+XG0xwWV0lq0iYG5LkDaNonLCvaw5j6tQmVwuvQ2
         LKYnJxHm3lRdZz4XL/BdIsJxegR9y8HYNYjevWjQIjWAZjx6eS22QdFYT1tv47fHlDiC
         RBSPoAnmWsObCQXrPlTGEk3Gozs2+Z+T1zsHrvF2xPa9ok7OOnCfupbZLTETFgYYZA1r
         PgJwGDcrehUL5QuFw9w5YFL11ZhDfbE5lzJcHZ3fEia4pAEri5+SwxSUGIfgu5lX1GeK
         Ubt9oqbdwc2I8o4W8OycGurW831f/vzFK0snt8jJss+Sh5g74//+EATnjphKAVce0cx4
         nyQA==
X-Gm-Message-State: AOAM531MKae9CuwyHAX2r2G4VgQaOCXsNxwGk1nfhdWdwNel9aZrAt2l
	ely3vgPFzmYaZ4MhHatMXq4Hlh4xipTEgp0prRtTBA==
X-Google-Smtp-Source: ABdhPJw29oJdBm4eo39mCVignGDLORgWk0k1N0EgIzqxbAugI1zvrSur0vpAQSd/U7TtjiqqSwEmA7WOYJ0I1vASkrw=
X-Received: by 2002:a9d:7548:: with SMTP id b8mr6647636otl.92.1636645978580;
 Thu, 11 Nov 2021 07:52:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211111003519.1050494-1-tadeusz.struk@linaro.org>
 <CANpmjNNcVFmnBV-1Daauqk5ww8YRUVRtVs_SXVAPWG5CrFBVPg@mail.gmail.com> <c410f4a0-cc06-8ef8-3765-d99e29012acb@linaro.org>
In-Reply-To: <c410f4a0-cc06-8ef8-3765-d99e29012acb@linaro.org>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Nov 2021 16:52:46 +0100
Message-ID: <CANpmjNNuWfauPoUxQ6BETrZ8JMjWgrAAhAEqEXW=5BNsfWfyDA@mail.gmail.com>
Subject: Re: [PATCH] skbuff: suppress clang object-size-mismatch error
To: Tadeusz Struk <tadeusz.struk@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jonathan Lemon <jonathan.lemon@gmail.com>, Alexander Lobakin <alobakin@pm.me>, 
	Willem de Bruijn <willemb@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Cong Wang <cong.wang@bytedance.com>, Kevin Hao <haokexin@gmail.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>, Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Nov 2021 at 16:46, Tadeusz Struk <tadeusz.struk@linaro.org> wrote:
>
> Hi Marco,
> On 11/11/21 01:51, Marco Elver wrote:
> > On Thu, 11 Nov 2021 at 01:36, Tadeusz Struk<tadeusz.struk@linaro.org>  wrote:
> >> Kernel throws a runtime object-size-mismatch error in skbuff queue
> >> helpers like in [1]. This happens every time there is a pattern
> >> like the below:
> >>
> >> int skbuf_xmit(struct sk_buff *skb)
> >> {
> >>          struct sk_buff_head list;
> >>
> >>          __skb_queue_head_init(&list);
> >>          __skb_queue_tail(&list, skb); <-- offending call
> >>
> >>          return do_xmit(net, &list);
> >> }
> >>
> >> and the kernel is build with clang and -fsanitize=undefined flag set.
> >> The reason is that the functions __skb_queue_[tail|head]() access the
> >> struct sk_buff_head object via a pointer to struct sk_buff, which is
> >> much bigger in size than the sk_buff_head. This could cause undefined
> >> behavior and clang is complaining:
> >>
> >> UBSAN: object-size-mismatch in ./include/linux/skbuff.h:2023:28
> >> member access within address ffffc90000cb71c0 with insufficient space
> >> for an object of type 'struct sk_buff'
> > The config includes CONFIG_UBSAN_OBJECT_SIZE, right? Normally that's
> > disabled by default, probably why nobody has noticed these much.
>
> Right, in all the defconfigs CONFIG_UBSAN_OBJECT_SIZE is not set.
>
> >
> >> Suppress the error with __attribute__((no_sanitize("undefined")))
> >> in the skb helpers.
> > Isn't there a better way, because doing this might also suppress other
> > issues wholesale. __no_sanitize_undefined should be the last resort.
> >
>
> The other way to fix it would be to make the struct sk_buff_head
> equal in size with struct sk_buff:
>
>   struct sk_buff_head {
> -       /* These two members must be first. */
> -       struct sk_buff  *next;
> -       struct sk_buff  *prev;
> +       union {
> +               struct {
> +                       /* These two members must be first. */
> +                       struct sk_buff  *next;
> +                       struct sk_buff  *prev;
>
> -       __u32           qlen;
> -       spinlock_t      lock;
> +                       __u32           qlen;
> +                       spinlock_t      lock;
> +               };
> +               struct sk_buff  __prv;
> +       };
>   };
>
> but that's much more invasive, and I don't even have means to
> quantify this in terms of final binary size and performance
> impact. I think that would be a flat out no go.
>
>  From the other hand if you look at the __skb_queue functions
> they don't do much and at all so there is no much room for
> other issues really. I followed the suggestion in [1]:
>
> "if your function deliberately contains possible ..., you can
>   use __attribute__((no_sanitize... "

That general advice might not be compatible with what the kernel
wants, especially since UBSAN_OBJECT_SIZE is normally disabled and I
think known to cause these issues in the kernel.

I'll defer to maintainers to decide what would be the preferred way of
handling this.
