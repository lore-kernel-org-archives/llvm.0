Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9A516E0
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 16:10:27 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-313e742a787so557167f8f.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696003826; x=1696608626; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsosfGEshqIoKCDorpEdcceOnoGA7Z3Gi/jf7+l6H3o=;
        b=2h8YgY/89knFVkfN4JuoSZ7l4NMsWo5SbFsjrcgA6hbZOwhYSBSFh2DiFlQDRAEZIO
         hJKLs1oYMtnYRJWr/T8pyI2JU47roWcxGtIbfyyChJmiQGsjqXxrdnYfYreNVkr3Gqyt
         b5hmg5xBWZevZhR4d0/QFFErnjZtPf7FWJSJsQHUDkoZASAtQXelTdkYNcla/G3k8snx
         OhxcvkaTbcJwvN/PDvblX0u5X6xb+8rrrHzJK4Rw5xtTsdflPG7Q/O3eAQuj73nl5uOm
         uFeGeG/umSkAfUVQ836jfDkrANzIncgsU9vBOMJLJubF7+QImEMzYJI93HjWga49wWTB
         qVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696003826; x=1696608626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsosfGEshqIoKCDorpEdcceOnoGA7Z3Gi/jf7+l6H3o=;
        b=dl+fHcRaZ78YJ061xjxlChUgBd4W/rTxVhGUlt4J3bbLhei2qzokdL5KC9NAj3nHcj
         NQ/NlgrHNwcAIQrIhrTJdaMhCaOjkIEwVvP3zjSMRsIdHAXLaIHE+etOq3GKN1jEJBsu
         jjFbbQ8TYp98g/fEirieJ+ahb9tw6lbmIC8QfEiQg9ypgGhM3nIK2DHOzhTOM8wOs5di
         okm3rqhiQBe9xKPwu+HKdQf1NQ5rcUnigk1KrSFRm4ijqfQMdJgD1FUdW0yDV2S4wK2n
         XUKqRl410w7AVkVBx27vPvT7M5g6kEKHS3Es0nchyo817qqXyFa+51yWK35a1UIj9uIv
         bJ6w==
X-Gm-Message-State: AOJu0Ywj3BSa/fIfibJskV4szNsxoNDaGK3I4R2L+Qy4508J9FlPKncJ
	7P5oqfSO9QAkevw+KP2eXUGaJOHDJV0yEwIveqqrhg==
X-Google-Smtp-Source: AGHT+IGJVy4cn6wsfYJyybJLTpVzhBoLAsGq/mtGnVfwMtDc27EoHCRTJrLpDNvmF4nasPQGeqo5XBwkuq750bEZ3zY=
X-Received: by 2002:a05:6000:1090:b0:31f:f8a7:a26c with SMTP id
 y16-20020a056000109000b0031ff8a7a26cmr4058353wrw.25.1696003825641; Fri, 29
 Sep 2023 09:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com> <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
In-Reply-To: <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 29 Sep 2023 09:10:11 -0700
Message-ID: <CAKwvOdkbcUh+tmsNcT4nCzFY37WbAUdjHJ62qNe=p8SetaQNTQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] device property: Replace custom implementation of COUNT_ARGS()
To: "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, llvm@lists.linux.dev, 
	alsa-devel@alsa-project.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 9:50=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 20, 2023 at 8:38=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Replace custom and non-portable implementation of COUNT_ARGS().
> >
> > Fixes: e64b674bc9d7 ("software node: implement reference properties")
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Closes: https://lore.kernel.org/r/ZQoILN6QCjzosCOs@google.com
>
> Thanks for the patch!
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1935
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Of course Linux would have a macro for this!  I should have known.
> Trying to wrap my head around it. Awesome

(resending as text/plain)

Can someone pick this up for linux-next?

CI for linux-next has been red for days over this.

>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  include/linux/property.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/property.h b/include/linux/property.h
> > index 1684fca930f7..55c2692ffa8c 100644
> > --- a/include/linux/property.h
> > +++ b/include/linux/property.h
> > @@ -10,6 +10,7 @@
> >  #ifndef _LINUX_PROPERTY_H_
> >  #define _LINUX_PROPERTY_H_
> >
> > +#include <linux/args.h>
> >  #include <linux/bits.h>
> >  #include <linux/fwnode.h>
> >  #include <linux/stddef.h>
> > @@ -314,7 +315,7 @@ struct software_node_ref_args {
> >  #define SOFTWARE_NODE_REFERENCE(_ref_, ...)                    \
> >  (const struct software_node_ref_args) {                               =
 \
> >         .node =3D _ref_,                                          \
> > -       .nargs =3D ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
> > +       .nargs =3D COUNT_ARGS(__VA_ARGS__),                       \
> >         .args =3D { __VA_ARGS__ },                                \
> >  }
> >
> > --
> > 2.40.0.1.gaa8946217a0b
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
