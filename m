Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3554429
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 20:57:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id z20so2884744plb.10
        for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 13:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYaziEJ7Yp9qYJtgvX45VBWyIc4HpzXkckmVSYMctDg=;
        b=aJk3zaDZBm8/UfgByPmkSLx0Vn2au4SnrDGkqEZx678j8ppPLR63VNqItjjiNuCpg9
         fkYAXsQbLzJ/56eRN468M6UdAHgbhtmjhEj+Oqlr9V4dwPwbdP8VU7oWHHSssSWHQ2H7
         INNNgJO/hpggwLtPMbDLUSCW4l207dMLzHvbt7KwNKkoOg3C7juBuuK6OGjzqYWFJkFz
         s2r6Bl1TNIMs9iZOAfJapAZXcSVTzqsk3pLQDS9VsPHz51J6m8CAoNUToNUXiNgqMq1A
         mapi5McJR4DRt7MHYGyDbBjKIEnwJZ/OQeuvddUb66cveEUBszpMqxefjN9vvEQbx82v
         MInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYaziEJ7Yp9qYJtgvX45VBWyIc4HpzXkckmVSYMctDg=;
        b=bQJH5xw6Y7+ZuUOqf61YupSC4mlZTZPnsgYRtvlpFC4FCN49l9ALdsD4633fdTxpk9
         BV0uGF5pfNK2dY4/inKNQ991WMydO1+/ikgPwby7JH8eMsDBc98L/DPir4CZ1RAUGxoS
         NJiCRwGCwoIf+vSzJx8TKj+MqMi+ufbsd+n83VOwVHja4v5jFTM7llZO7jUjQ8gbq176
         j6leWzfO5tayaTMYdgEo0cTP9DEuuYsBSOmy4vCWQRyht3YKnteHJWFozDwNrEvjIkGj
         xibVgjEcm3Mgm1rJPGToThHPI8JVmRrg3xQxtIBi8T9/BtyzSiZxx2EtAmJVcT25pLlZ
         UoRQ==
X-Gm-Message-State: ACrzQf0bSe8uVlF+WdNe5MJ5/J78/8+2vNB5WsfzQCxH4WoAixijhC1o
	H4aCxS2WwTuq8nh1KvXEAPDB1oSM30zvUlyX0j7s+g==
X-Google-Smtp-Source: AMsMyM6MOeEKW0yihGodYRFpUfcMXSeOibakzhbNseqUJSB45y2DUEHx6M2yKYsQfl67TCq68IsL8c94sjwX/8LX6Qo=
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr13382600pjb.102.1665694620565; Thu, 13
 Oct 2022 13:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221012174622.45006-1-cgzones@googlemail.com>
In-Reply-To: <20221012174622.45006-1-cgzones@googlemail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 13 Oct 2022 13:56:49 -0700
Message-ID: <CAKwvOdk+dLP+0iZmKVNdgi7425DLZpMH+9dHnASzKZeXUnkiiA@mail.gmail.com>
Subject: Re: [PATCH] of: declare string literals const
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 10:46 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> of_overlay_action_name() returns a string literal from a function local
> array.  Modifying string literals is undefined behavior which usage of
> const pointer can avoid.  of_overlay_action_name() is currently only
> used once in overlay_notify() to print the returned value.
>
> While on it declare the data array const as well.
>
> Reported by Clang:
>
>     In file included from arch/x86/kernel/asm-offsets.c:22:
>     In file included from arch/x86/kernel/../kvm/vmx/vmx.h:5:
>     In file included from ./include/linux/kvm_host.h:19:
>     In file included from ./include/linux/msi.h:23:
>     In file included from ./arch/x86/include/asm/msi.h:5:
>     In file included from ./arch/x86/include/asm/irqdomain.h:5:
>     In file included from ./include/linux/irqdomain.h:35:
>     ./include/linux/of.h:1555:3: error: initializing 'char *' with an exp=
ression of type 'const char[5]' discards qualifiers [-Werror,-Wincompatible=
-pointer-types-discards-qualifiers]
>                     "init",
>                     ^~~~~~
>     ./include/linux/of.h:1556:3: error: initializing 'char *' with an exp=
ression of type 'const char[10]' discards qualifiers [-Werror,-Wincompatibl=
e-pointer-types-discards-qualifiers]
>                     "pre-apply",
>                     ^~~~~~~~~~~
>     ./include/linux/of.h:1557:3: error: initializing 'char *' with an exp=
ression of type 'const char[11]' discards qualifiers [-Werror,-Wincompatibl=
e-pointer-types-discards-qualifiers]
>                     "post-apply",
>                     ^~~~~~~~~~~~
>     ./include/linux/of.h:1558:3: error: initializing 'char *' with an exp=
ression of type 'const char[11]' discards qualifiers [-Werror,-Wincompatibl=
e-pointer-types-discards-qualifiers]
>                     "pre-remove",
>                     ^~~~~~~~~~~~
>     ./include/linux/of.h:1559:3: error: initializing 'char *' with an exp=
ression of type 'const char[12]' discards qualifiers [-Werror,-Wincompatibl=
e-pointer-types-discards-qualifiers]
>                     "post-remove",
>                     ^~~~~~~~~~~~~
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  include/linux/of.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 6b79ef9a6541..8b9f94386dc3 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1549,9 +1549,9 @@ enum of_overlay_notify_action {
>         OF_OVERLAY_POST_REMOVE,
>  };
>
> -static inline char *of_overlay_action_name(enum of_overlay_notify_action=
 action)
> +static inline const char *of_overlay_action_name(enum of_overlay_notify_=
action action)
>  {
> -       static char *of_overlay_action_name[] =3D {
> +       static const char *const of_overlay_action_name[] =3D {
>                 "init",
>                 "pre-apply",
>                 "post-apply",
> --
> 2.37.2
>


--=20
Thanks,
~Nick Desaulniers
