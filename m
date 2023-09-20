Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EE53C693
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 16:51:01 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d81adf0d57fso78122276.1
        for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 09:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695228661; x=1695833461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFp4/FBehp7bXIUiukwsVd1VDsGADtdLcprhP9iiGVo=;
        b=VfMJu0GwUtrCBAt7C52wnCxZwMdv47/aADZAth7ejYlZXi4EES44t6QWqF36q5muIm
         jQ4FwcWutTgR9h0zNaXgRLLNNzi1+3uPxSrmhLCyodotcqALgoyDQf2Ngeoxj5k5rVRt
         J7bpbD/sZSX1Dv73hRPoI+2DjsQCSSrXaXVZeCwtsEOuraxXS2b5T/sXxQtq+K3WsbD7
         U6vyfU7M0Xs5zN97RlojF+dpszfsUZrL1dznUr5DMqtdj/a7z5ISPiK13jJ2tuTlOLN4
         EbjuCIKahDXWQ2lM/0AGoGJcLVzHhWZpMPaOp6uwURTbd4bM7F1l0HGDMZx6ZlvRZD5A
         DJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695228661; x=1695833461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFp4/FBehp7bXIUiukwsVd1VDsGADtdLcprhP9iiGVo=;
        b=ljqtX1fg+Eqs96HWfhUrkfQOPiYmJ7hiGDq/djajeWnUkVg5F3/tvyOKx1GnpH17HP
         AX173i4gfrbkQ1essYrnKKgHPeblkrGf1Hcyok8mvI38TbyLe7Dlq7gA4Bxo1MjjnDVR
         qnaF5BLC0GCd20t1D54njfo+1juMF5zrhhQohhZOAK53gJTp4SvXhRcOMNKO9d/H/XO+
         AdHJQor4bMJjGUXwkWSCBAUjSHv4pzDmljQubLQ5MVAtfeFada46EGl1xFbPHwwT2RqP
         CVznxaVZc1wn0HSdTL4A46gHSIbaw+mMaP2Alu4jzkno/GkDDeTkWrCOAYHHbKoAwYZj
         xBjA==
X-Gm-Message-State: AOJu0Yx11NQlAlYasseokoO94lbIDpyO7QDf0bCXZzCp3CKNYdGSjtmz
	HgC7D8DJVYEwpQ1yPqkxtcle2WJ66MpA7ok0Fmo6Ig==
X-Google-Smtp-Source: AGHT+IEuELX3/Oyy6eRXnIacTDFmEDIXHMrCxW6IPWYkJBUy8R78CaXGS8Piry3NQBq/Ct/oKIOvajA2h1foAouaUKk=
X-Received: by 2002:a25:d0d7:0:b0:d81:5ec1:80cf with SMTP id
 h206-20020a25d0d7000000b00d815ec180cfmr3192253ybg.12.1695228660956; Wed, 20
 Sep 2023 09:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Sep 2023 09:50:45 -0700
Message-ID: <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] device property: Replace custom implementation of COUNT_ARGS()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com, llvm@lists.linux.dev, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 8:38=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace custom and non-portable implementation of COUNT_ARGS().
>
> Fixes: e64b674bc9d7 ("software node: implement reference properties")
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Closes: https://lore.kernel.org/r/ZQoILN6QCjzosCOs@google.com

Thanks for the patch!
Closes: https://github.com/ClangBuiltLinux/linux/issues/1935
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Of course Linux would have a macro for this!  I should have known.
Trying to wrap my head around it. Awesome

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/property.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 1684fca930f7..55c2692ffa8c 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -10,6 +10,7 @@
>  #ifndef _LINUX_PROPERTY_H_
>  #define _LINUX_PROPERTY_H_
>
> +#include <linux/args.h>
>  #include <linux/bits.h>
>  #include <linux/fwnode.h>
>  #include <linux/stddef.h>
> @@ -314,7 +315,7 @@ struct software_node_ref_args {
>  #define SOFTWARE_NODE_REFERENCE(_ref_, ...)                    \
>  (const struct software_node_ref_args) {                                \
>         .node =3D _ref_,                                          \
> -       .nargs =3D ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
> +       .nargs =3D COUNT_ARGS(__VA_ARGS__),                       \
>         .args =3D { __VA_ARGS__ },                                \
>  }
>
> --
> 2.40.0.1.gaa8946217a0b
>


--=20
Thanks,
~Nick Desaulniers
