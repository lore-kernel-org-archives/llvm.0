Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F7187F
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 11:18:44 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id a2so6166822qkk.2
        for <llvm@lists.linux.dev>; Mon, 08 Aug 2022 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Qo8m4+JaUBO8TwCYugZyrFg+A5kM5JeZCqY5kQmlmyU=;
        b=Pir+jptX8VRJ8EVAtD6tXT5+75IX0KYzsXb9bbzvlPsJI4v1ChlsSUQ7ERx7dk3IiD
         6Vyxl01O5eQ+gdH+SLwH5mCCzJk2nG3uFaUOCVQhIDdhFiRP/7/+c97MbodXqF0X55Cu
         PM/DcIRZOcUy+MYek5vf88HN1bDpUcETG98sx61TJhRbn6Qcx3U+s2smusNgAgbjdsjw
         96GZKaN4vc8R1s2kk7ysdIh7IcO98gKfWd/EYa9EsgSblJ7s7+LlrSRfkpTS51KVAdYZ
         Qwym4B0UhzOJtiYK3E7kR5jhR5RchxKxhdf1dSCteua13+7/D5TlUWMILmQcY7M8DCtk
         +d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Qo8m4+JaUBO8TwCYugZyrFg+A5kM5JeZCqY5kQmlmyU=;
        b=AIpVLHZHfSYKSqwtwnhl2yeRVcNiz3w1BepQsaJ+acXnD9lOrgiOaHcTdp99V1L5vw
         18fyr/Qn9UN6KMRSEsxaGLTD4VQVlQ9X7WoJV3jBNLJ3U2oQFoEVdt4MIzgFueeTAqTN
         ejLt3Xli15rXvdkTMnIVW8Pln4ka54n9jCXCPiu2MKi7rwztcaGF1qCiCyxw+Yw1cDvS
         d4h81W1mz2j3ZkgRUvAzCxAS2NZYFsDjEY0GOvjrHSc88gMhDF2FRIklqV5ltSM5/Voj
         4exvyzcKDOEiz4kRhnMHSFxOPRgXb9Y5Bft4S+b/2xpCt1DZwpZt6hiGCoyiK7D+HreZ
         DtKA==
X-Gm-Message-State: ACgBeo2QuDXpW7jb4T/arYk7BWUnwNiEc9GnpVGDXQ+OitXWPLkf9eOD
	jI8iEsFx2VkvxE6/O/rK5JcZko4W64M5gXhnV00=
X-Google-Smtp-Source: AA6agR4MPB6bchiE70z1ZxXE04FW0qRuKvTFfYUPlSOk6YpjiOc5I+b4ZgbaiH5i6eC9sCOplXqIf1+FTgSZmM9/U2g=
X-Received: by 2002:a05:620a:254d:b0:6ab:84b8:25eb with SMTP id
 s13-20020a05620a254d00b006ab84b825ebmr13544878qko.383.1659957522822; Mon, 08
 Aug 2022 04:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8f5f58c9bf0f4006fabd01b5564af071d20f2a2d.1659909060.git.jahau@rocketmail.com>
 <202208081346.EWHUWCSa-lkp@intel.com>
In-Reply-To: <202208081346.EWHUWCSa-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Aug 2022 13:18:06 +0200
Message-ID: <CAHp75VecMvtHwkA6=JxHbX0oeRg+-fXNraggBCaOxqhf9WUdzQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] iio: magnetometer: yas530: Introduce "chip_info" structure
To: kernel test robot <lkp@intel.com>
Cc: Jakob Hauser <jahau@rocketmail.com>, Jonathan Cameron <jic23@kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	linux-iio <linux-iio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 8, 2022 at 7:40 AM kernel test robot <lkp@intel.com> wrote:

...

> All errors (new ones prefixed by >>):
>
> >> drivers/iio/magnetometer/yamaha-yas530.c:933:19: error: initializer element is not a compile-time constant
>                    .product_name = yas5xx_product_name[yas530],
>                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.

What?!

The yas530 is a part of the enum, how come that compiler can't see
this? Looks like a Clang bug.

>    930  static const struct yas5xx_chip_info yas5xx_chip_info_tbl[] = {
>    931          [yas530] = {
>    932                  .devid = YAS530_DEVICE_ID,
>  > 933                  .product_name = yas5xx_product_name[yas530],
>    934                  .version_name = yas5xx_version_names[yas530],
>    935          },
>    936          [yas532] = {
>    937                  .devid = YAS532_DEVICE_ID,
>    938                  .product_name = yas5xx_product_name[yas532],
>    939                  .version_name = yas5xx_version_names[yas532],
>    940          },
>    941          [yas533] = {
>    942                  .devid = YAS532_DEVICE_ID,
>    943                  .product_name = yas5xx_product_name[yas533],
>    944                  .version_name = yas5xx_version_names[yas533],
>    945          },
>    946  };

-- 
With Best Regards,
Andy Shevchenko
