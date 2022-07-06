Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216B2F21
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 20:31:13 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id y16so27758871lfb.9
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 13:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sLAB7PPgRJS7FBUcfBXuPogoYxwCOXpRzrraHJLqWfE=;
        b=YHlBoPSJuPoCecofCvpCH4tmscl+28DBd8wK50hy4bthb6jphDprUKrGdG13GhRe+u
         X/AfJXnFGGeZhoOHuSQsipNPRMWzx4kR5pABv7w668ayE5GKkdUWl3yvMursxjLsvM8e
         Y3zMol3FS7vEhujIcXUWqzJwz8fx4PxlMkt6j+Sfb8BptT4P45z0fb594wOqvRYIc2K7
         AGTT2Xa1k/mXHjlJve+o+IrgXTAJdWOTOa23QcRvUpEVV6OgY31stizTEvIv3fT7j4lE
         hMAOAY5hzFOL1C4dU0Pg3xrS3CBqrOFLCiorK+3GE1cAscIjpENyCxd/dx9XtJmEhKFz
         eccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sLAB7PPgRJS7FBUcfBXuPogoYxwCOXpRzrraHJLqWfE=;
        b=xHBPwvx0AguVcvnuj5/efUIO39ixwHo2FLFQENOd3qZsvpPiMxigMU8Rb6PmBUYY+T
         UMuz7Scb0zFTYZgtk3T4dcDKDzBqFri8PjHX6JEr8CFKqJxci1vEprmkECTnbwVTvpgq
         ppQmqfsqJNhggJ125YnV2XNNt1elrgw7fiE/Q14BrayBFpoFDs9S2HwdvXvGAaG6Bnip
         yIIzaWxxnP+epxfHyXQepphO6jveZimQ6pYmy9xiwJb66KJofnCXvjhblIZaf3hMJXoh
         xLfLYRPk20PNk5mdOjwe2ZRAMwuMXTSsEjCFR26IcFBmhTDoqNZg8zTyVDfJWbG1LXIP
         CwzA==
X-Gm-Message-State: AJIora9BGQ5vK1WlAu/dNpIY8vE0j4+PRmFE/tyLKxa3xqJPrQ/2d9ES
	07cqOVOc8zt5quIGNzPfSz3HfvJXBVyagsn48iWuZw==
X-Google-Smtp-Source: AGRyM1vSDOBH7B9iAAHVjpTbPd3tKPUPLTeCrocbC7VW2zzKMNmJfLigIa8R9o8iO9nBgX/88zOV/6kdmmjeOMD7f3U=
X-Received: by 2002:a05:6512:1188:b0:481:2eb7:f2 with SMTP id
 g8-20020a056512118800b004812eb700f2mr26513384lfr.401.1657139471312; Wed, 06
 Jul 2022 13:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207060054.o8GrfMhS-lkp@intel.com> <20220706134523.00000555@Huawei.com>
In-Reply-To: <20220706134523.00000555@Huawei.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Jul 2022 13:30:59 -0700
Message-ID: <CAKwvOdm9+UEXCepJGDzjNibYTss5joek-3FMC6K2Z7w1EPLdGQ@mail.gmail.com>
Subject: Re: drivers/iio/adc/ad7476.c:29:8: warning: Excessive padding in
 'struct ad7476_chip_info' (10 padding bytes, where 2 is optimal). Optimal
 fields order: reset, channel, convst_channel, int_vref_uv, has_vref,
 has_vdrive, consider reordering the fields or addin...
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 6, 2022 at 5:45 AM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
>
>
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    21 warnings generated.
> > >> drivers/iio/adc/ad7476.c:29:8: warning: Excessive padding in 'struct=
 ad7476_chip_info' (10 padding bytes, where 2 is optimal). Optimal fields o=
rder: reset, channel, convst_channel, int_vref_uv, has_vref, has_vdrive, co=
nsider reordering the fields or adding explicit padding members [clang-anal=
yzer-optin.performance.Padding]
> >    struct ad7476_chip_info {
> >    ~~~~~~~^~~~~~~~~~~~~~~~~~
> >    drivers/iio/adc/ad7476.c:29:8: note: Excessive padding in 'struct ad=
7476_chip_info' (10 padding bytes, where 2 is optimal). Optimal fields orde=
r: reset, channel, convst_channel, int_vref_uv, has_vref, has_vdrive, consi=
der reordering the fields or adding explicit padding members
> >    struct ad7476_chip_info {
> >    ~~~~~~~^~~~~~~~~~~~~~~~~~
> > >> drivers/iio/adc/ad7476.c:39:8: warning: Excessive padding in 'struct=
 ad7476_state' (472 padding bytes, where 216 is optimal). Optimal fields or=
der: data, spi, chip_info, ref_reg, convst_gpio, msg, xfer, consider reorde=
ring the fields or adding explicit padding members [clang-analyzer-optin.pe=
rformance.Padding]
> >    struct ad7476_state {
>
> For this one and I'm guessing some of the other IIO cases, if there is an=
y way to suppress the warning where we have specific
> alignments specified then that would be great. These are padded to ensure=
 the buffers are DMA safe.

I didn't see anything during a quick scan of:
https://github.com/llvm/llvm-project/blob/main/clang/lib/StaticAnalyzer/Che=
ckers/PaddingChecker.cpp#L73
to disable this warning when it's a false positive.

Though
https://clang.llvm.org/extra/clang-tidy/#suppressing-undesired-diagnostics
mentions NOLINT.

>
> Thanks,
>
> Jonathan
>
>
> >    ~~~~~~~^~~~~~~~~~~~~~
> >    drivers/iio/adc/ad7476.c:39:8: note: Excessive padding in 'struct ad=
7476_state' (472 padding bytes, where 216 is optimal). Optimal fields order=
: data, spi, chip_info, ref_reg, convst_gpio, msg, xfer, consider reorderin=
g the fields or adding explicit padding members
> >    struct ad7476_state {
> >    ~~~~~~~^~~~~~~~~~~~~~
> >    Suppressed 19 warnings (7 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    20 warnings generated.
> >    drivers/iio/adc/ad7766.c:35:8: warning: Excessive padding in 'struct=
 ad7766' (392 padding bytes, where 136 is optimal). Optimal fields order: d=
ata, chip_info, spi, mclk, pd_gpio, trig, reg, msg, xfer, consider reorderi=
ng the fields or adding explicit padding members [clang-analyzer-optin.perf=
ormance.Padding]
> >    struct ad7766 {
> >    ~~~~~~~^~~~~~~~
> >    drivers/iio/adc/ad7766.c:35:8: note: Excessive padding in 'struct ad=
7766' (392 padding bytes, where 136 is optimal). Optimal fields order: data=
, chip_info, spi, mclk, pd_gpio, trig, reg, msg, xfer, consider reordering =
the fields or adding explicit padding members
> >    struct ad7766 {
> >    ~~~~~~~^~~~~~~~
> >    Suppressed 19 warnings (7 in non-user code, 12 with check filters).
> >    Use -header-filter=3D.* to display errors from all non-system header=
s. Use -system-headers to display errors from system headers as well.
> >    20 warnings generated.
> >    drivers/iio/adc/ad7768-1.c:154:8: warning: Excessive padding in 'str=
uct ad7768_state' (388 padding bytes, where 132 is optimal). Optimal fields=
 order: data, mclk_freq, spi, vref, mclk, trig, gpio_sync_in, labels, lock,=
 completion, samp_freq, consider reordering the fields or adding explicit p=
adding members [clang-analyzer-optin.performance.Padding]
> >    struct ad7768_state {
> >    ~~~~~~~^~~~~~~~~~~~~~
> >    drivers/iio/adc/ad7768-1.c:154:8: note: Excessive padding in 'struct=
 ad7768_state' (388 padding bytes, where 132 is optimal). Optimal fields or=
der: data, mclk_freq, spi, vref, mclk, trig, gpio_sync_in, labels, lock, co=
mpletion, samp_freq, consider reordering the fields or adding explicit padd=
ing members
> >    struct ad7768_state {
> >    ~~~~~~~^~~~~~~~~~~~~~
>


--=20
Thanks,
~Nick Desaulniers
