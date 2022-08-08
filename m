Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E68258F
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 11:24:54 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id d1so6144251qvs.0
        for <llvm@lists.linux.dev>; Mon, 08 Aug 2022 04:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=bebjkEu/2RtpzlLSCENPsZbQJUlDS0rYB/TyG6UnNbA=;
        b=ZEENe9jAyGJr7LcwsagGW7sgUrXkkIYYVaYWX2VRnNbSPotG4APfiO0gwtKLKxztXG
         tsLtn5wFxzUAErbqdLDSpQu81NDF7/1Y72KYD7/mJWHOxYwW2Fp7XnCXcZBEIcvtenME
         2Wt1vEVteeiHDGu24ceDOvBgGJxLp2PopDZdogli7MCUEn++M3yJipsUGEH0K9rsorL6
         /ZX5Jzqh5xKkaskYdhVCpiCRgHQ3Dk/xe176iu0HCVOufrqXVZCx+sl5x5SEVqX+SFZ/
         Zj78WVLNSMRvReDCPdQ0Cd9ebCq8y9UXBiTqwpvPTdRNuOJuBFFJ1V0LDNJfKQOHLd5A
         RaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bebjkEu/2RtpzlLSCENPsZbQJUlDS0rYB/TyG6UnNbA=;
        b=4xj6dHlSDzNy0+XwBeptKITDp9cQTjipndqnQUhNKm96DUwXykTzgIJOFPkQhwlzmC
         KN2Rz/K3xIE17j6fq6BV4m2L4HCbw7T//t3UWtmBP8FqP8OzLl3ZsYPp4tFEaErQ/nrC
         MBtnlAemFWLO8MtCCJz6cD0YBiC7lDjcaZGT3S2Ao8kl0gDMfW2YgnsWle0SD+9UxZio
         9fnghCtB3twRCNvhmCpzkmA5UEWyZaz8wR+KHKLZGnvL6Q8x1OTi/tpuOE1x91Wjl7NU
         g2F6dCyc9akFDLN7+hPAF7CCWnIygU1M9J7GEBrcvRxUkX0aUyKd2/5yzCHI7kem/Hdv
         27NA==
X-Gm-Message-State: ACgBeo1apbKFqLCAGUXS7FomlrJMUKlMEvfbPy8ik3AFzEm28DA0UTL/
	BtsbXO/Q9ZC5709N6Pg0zEV3Uet5P+cYHj5pjos=
X-Google-Smtp-Source: AA6agR5b9TU3myq3WlLGqEHuTqv5fOuqcyVNntRR95IfrJghUij9L87Ygd29nhaXz22WtMG8ZI00HIHPC66SClnPtAk=
X-Received: by 2002:ad4:5cc3:0:b0:474:8dda:dfb6 with SMTP id
 iu3-20020ad45cc3000000b004748ddadfb6mr15416031qvb.82.1659957893856; Mon, 08
 Aug 2022 04:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8f5f58c9bf0f4006fabd01b5564af071d20f2a2d.1659909060.git.jahau@rocketmail.com>
 <202208081346.EWHUWCSa-lkp@intel.com> <CAHp75VecMvtHwkA6=JxHbX0oeRg+-fXNraggBCaOxqhf9WUdzQ@mail.gmail.com>
In-Reply-To: <CAHp75VecMvtHwkA6=JxHbX0oeRg+-fXNraggBCaOxqhf9WUdzQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Aug 2022 13:24:17 +0200
Message-ID: <CAHp75VfARgxj0iSq_WPHH5Jq9iYoW3uL5mz7E4kYOdzTLbYvJw@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] iio: magnetometer: yas530: Introduce "chip_info" structure
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Jakob Hauser <jahau@rocketmail.com>, Jonathan Cameron <jic23@kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	linux-iio <linux-iio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

+Cc: clang people

On Mon, Aug 8, 2022 at 1:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Aug 8, 2022 at 7:40 AM kernel test robot <lkp@intel.com> wrote:
>
> ...
>
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/iio/magnetometer/yamaha-yas530.c:933:19: error: initializer element is not a compile-time constant
> >                    .product_name = yas5xx_product_name[yas530],
> >                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    1 error generated.
>
> What?!
>
> The yas530 is a part of the enum, how come that compiler can't see
> this? Looks like a Clang bug.
>
> >    930  static const struct yas5xx_chip_info yas5xx_chip_info_tbl[] = {
> >    931          [yas530] = {
> >    932                  .devid = YAS530_DEVICE_ID,
> >  > 933                  .product_name = yas5xx_product_name[yas530],
> >    934                  .version_name = yas5xx_version_names[yas530],
> >    935          },
> >    936          [yas532] = {
> >    937                  .devid = YAS532_DEVICE_ID,
> >    938                  .product_name = yas5xx_product_name[yas532],
> >    939                  .version_name = yas5xx_version_names[yas532],
> >    940          },
> >    941          [yas533] = {
> >    942                  .devid = YAS532_DEVICE_ID,
> >    943                  .product_name = yas5xx_product_name[yas533],
> >    944                  .version_name = yas5xx_version_names[yas533],
> >    945          },
> >    946  };

-- 
With Best Regards,
Andy Shevchenko
