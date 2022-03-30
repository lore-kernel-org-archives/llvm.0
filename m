Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D836E
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 06:13:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0X0U-1nwJzC27S0-00wXKS for <llvm@lists.linux.dev>; Wed, 30 Mar 2022
 08:08:42 +0200
Received: by mail-wr1-f48.google.com with SMTP id w4so27667196wrg.12
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 23:08:42 -0700 (PDT)
X-Gm-Message-State: AOAM532JSAijIWYcoyjdF4ZQ3yqcca5rZ9rl7AxhEQd434DRNNFD1Qyr
	CqJR61pGWM0YI250lIm5YMKfzvyXV8mtOaKpzcc=
X-Google-Smtp-Source: ABdhPJxb3ayTdwP7GbKNqgnIvGjF8ohxETPSVjrIT/ae8J5nVyT7Tv5Q0wb9WsBju9Q+yhSNMby/JlkVM5NhGe611Ew=
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr33812160wrw.12.1648620522122; Tue, 29
 Mar 2022 23:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220329212946.2861648-1-ndesaulniers@google.com>
 <CAKwvOdmsnVsW46pTZYCNu-bx5c-aJ8ARMCOsYeMmQHpAw3PtPg@mail.gmail.com>
 <CAKwvOdnJB5u96fm1w-R-VUayvhq58EQeqZst32NDRscK17Z8pQ@mail.gmail.com> <CAKwvOdmYzH91bzNus+RcZGSgCQGY8UKt0-2JvtqQAh=w+CeiuQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmYzH91bzNus+RcZGSgCQGY8UKt0-2JvtqQAh=w+CeiuQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 30 Mar 2022 08:08:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a37gvycJ4zbeVvD_=6Npuep52VEP7CrgS-_8y6OXK_U3Q@mail.gmail.com>
Message-ID: <CAK8P3a37gvycJ4zbeVvD_=6Npuep52VEP7CrgS-_8y6OXK_U3Q@mail.gmail.com>
Subject: Re: [PATCH] net, uapi: remove inclusion of arpa/inet.h
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Networking <netdev@vger.kernel.org>, 
	tipc-discussion@lists.sourceforge.net, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:AYnq0lVMo10u9cLVnz+Lc2lKJRC8ZlRTL+iC1GBE/gM3X3y9XrC
 5vzhuhfLOjp/WN/Qi3JrK0/sUgXm/JU1sUQl6wqMVO7R9jlIxBsOBgmxJyIugbGhv3p4P53
 w26uETLYv8m8R7pESU/geZ+p2x6xCwiGFoJVZEklQMIFVfoJviZmNQl3fV9VeWsOeXdehRb
 SZq0F5jEF8tdMaTUVsjTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IjhtMaDFZqA=:jYEPK/JnuHdBdNL9nCKFiK
 5k7f8L0N0g6QN7MCVdhKL8xS4vvEkFWQ+4YslRAB1Y/LEQCh2lnKAHh+/0iqfxma5eYyvIHNx
 yAaST3U4uKNga83joTCsh7oKsT+Cp7Y0qZlkoneZwCV5D7LoLGnYVqBAiFIbAc2S0pvKGC0+u
 0YxFwhRVKDnx3peu2s7qPNm0keXrRMlvUMMUX+3KX69l2fJgZXwYGbuVKGmeVaY5R9kGr/tAz
 y2nb0eX++Wv+f/AzRk3lc3Vp/eyqpb2JA6tkIehZ7FtkshQbQbOYHgd3aMrf8aBwZExmeEtPT
 Ugr76/BaTc/QU/EnAcz9tUUVvXjutONndh5sWZWjdKwP789h9DBXuWDYLQYsFTdRjM8mjR151
 qVAijc0bZ9gHhqGf2MTFfNw202x2jvFhCmsCud6nJn9q1Fz9mGiPkmrHFVjfe0ZIvk06XteDp
 EvjpO6C/D0Qd87KKYq6Df/AsCqn/hNs3ls061zs3KT8DGTzAau+fAXR1jTmpYvrafd1aBuO8D
 u60KcYBEadMrLE93voYGtxLyIvNqXb96oOcqMVNTig9puvwU8VjixH1Xxq5ysLLwvw3lLIVYe
 bOw2EccGsNZeY8IHbN2sin4/14xEtef8vOm2yINyo9jaD4uNTUZpEe0VUTVcPa6zG1dVQObeQ
 f7cKPByOEQhII/1SCxjl1NwJ579muQx7i0rt4AszX8qKDof8v3mtPs6YRwiWNIS7dCdU=

On Wed, Mar 30, 2022 at 12:26 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> On Tue, Mar 29, 2022 at 3:09 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> ```
> diff --git a/include/uapi/linux/byteorder/little_endian.h
> b/include/uapi/linux/byteorder/little_endian.h
> index cd98982e7523..c14f2c3728e2 100644
> --- a/include/uapi/linux/byteorder/little_endian.h
> +++ b/include/uapi/linux/byteorder/little_endian.h
> @@ -103,5 +103,8 @@ static __always_inline __u16 __be16_to_cpup(const __be16 *p)
>  #define __cpu_to_be16s(x) __swab16s((x))
>  #define __be16_to_cpus(x) __swab16s((x))
>
> +#define htonl(x) __cpu_to_be32(x)
> +#define htons(x) __cpu_to_be16(x)
> +#define ntohs(x) __be16_to_cpu(x)
>

This is unfortunately a namespace violation, you can't define things in uapi
headers that conflict with standard library interfaces.

         Arnd
