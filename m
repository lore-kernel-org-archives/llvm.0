Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9503D90
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 15:37:29 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id g20so482524ljg.7
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OgoaLpQ3yLM8sL8g85b58XwiPLmA9EGQIhDG7GYJi/Y=;
        b=U/jIWxOgoFz/4fL9IY1kUApVA9JT478amyvIMeWn+/9l5MAalm8L5UP7GL2AGnSeMl
         7CBbhsMsGSptl1Oun9YGw0Zmrf99ZTtyT5p8SyCAZBw6AOWz30Jk92GSJSruLxlFcDdc
         xUL80VdSuztcNx/54xsQrJ46sp580eOx6lIpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OgoaLpQ3yLM8sL8g85b58XwiPLmA9EGQIhDG7GYJi/Y=;
        b=P4TlwHUIsNpdEHVuPfBJIEtEpqvdUSiRqO2IQMbXP3zie7MTDsmA+N5GDRLsG22SQp
         GDKMKTzY425JvQjokc5/wdQtoeICyZ1ryhRgWZvKIn26bvYr1uphsR8KwLjnE8MUUvYv
         YTSQ9o0vtmJyBLAZOCM/p/nC3yeieRCSH0b87o1b1Z3gnwXB27ToqCOXzUsgNLmidOn6
         CGFLc7XPwIG/llQHOqakzaE1yae3triBRheE/W3a2esDJcU6cw9IWE7vQ5IWN5qyFtkD
         AvIuBJtm4VG27gTeO3SxdGWX5YWQWKg/3cXA+CzA1Z+BbSNAgia7f/F21kiP1F5GDTMG
         b4fw==
X-Gm-Message-State: ACrzQf1LzPhWHTRV9cEqh9DMZZpmKIKDAAiZ3XT02+k7F4+cxMMXiLqU
	HYeKZt+BUA1KcHut499d/Tqi9p55KWUzwNpAyLk=
X-Google-Smtp-Source: AMsMyM6kGt0T68s4LjjLBPYoT4Hd5qx66PFdoqr2FEQ16bej+JUI9sWrdnqyMBh2GSkYcwKFvUIGrQ==
X-Received: by 2002:a2e:978f:0:b0:26a:a62e:8f2c with SMTP id y15-20020a2e978f000000b0026aa62e8f2cmr3108104lji.153.1663947447167;
        Fri, 23 Sep 2022 08:37:27 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id x27-20020a2ea99b000000b0026c46788fa3sm1374931ljq.104.2022.09.23.08.37.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 08:37:26 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id b6so467109ljr.10
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 08:37:25 -0700 (PDT)
X-Received: by 2002:a05:6512:ba1:b0:498:9890:1bb4 with SMTP id
 b33-20020a0565120ba100b0049898901bb4mr3294634lfv.122.1663947434871; Fri, 23
 Sep 2022 08:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220921155205.1332614-1-rrangel@chromium.org> <Yyw12S3pstNrbGFO@smile.fi.intel.com>
In-Reply-To: <Yyw12S3pstNrbGFO@smile.fi.intel.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Fri, 23 Sep 2022 09:37:03 -0600
X-Gmail-Original-Message-ID: <CAHQZ30BpkQ4R-Wh_9zaUeFWVSJm79ebu5Lp4Xx=R6RUx_KYrrg@mail.gmail.com>
Message-ID: <CAHQZ30BpkQ4R-Wh_9zaUeFWVSJm79ebu5Lp4Xx=R6RUx_KYrrg@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] acpi: i2c: Use SharedAndWake and
 ExclusiveAndWake to enable wake irq
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tim Van Patten <timvp@google.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, "jingle.wu" <jingle.wu@emc.com.tw>, 
	Hans de Goede <hdegoede@redhat.com>, "Limonciello, Mario" <mario.limonciello@amd.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Alistair Francis <alistair@alistair23.me>, 
	Angela Czubak <acz@semihalf.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Szczepanek <bsz@semihalf.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Dan Williams <dan.j.williams@intel.com>, Douglas Anderson <dianders@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Jiri Kosina <jikos@kernel.org>, Johnny Chuang <johnny.chuang.emc@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Len Brown <lenb@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Rob Herring <robh@kernel.org>, 
	Terry Bowman <terry.bowman@amd.com>, Tom Rix <trix@redhat.com>, Wolfram Sang <wsa@kernel.org>, 
	Yang Li <yang.lee@linux.alibaba.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 4:16 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 21, 2022 at 09:51:52AM -0600, Raul E Rangel wrote:
> > Today, i2c drivers are making the assumption that their IRQs can also
> > be used as wake IRQs. This isn't always the case and it can lead to
> > spurious wakes. This has recently started to affect AMD Chromebooks.
> > With the introduction of
> > d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake"), the AMD GPIO
> > controller gained the capability to set the wake bit on each GPIO. The
> > ACPI specification defines two ways to inform the system if a device is
> > wake capable:
> > 1) The _PRW object defines the GPE that can be used to wake the system.
> > 2) Setting ExclusiveAndWake or SharedAndWake in the _CRS GpioInt.
> >
> > Currently only the first method is supported. The i2c drivers don't have
> > any indication that the IRQ is wake capable, so they guess. This causes
> > spurious interrupts, for example:
> > * We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
> >   `_PRW` or `ExclusiveAndWake` so that means the device can't wake the
> >   system.
> > * The IRQ line is active level low for this device and is pulled up by
> >   the power resource defined in `_PR0`/`_PR3`.
> > * The i2c driver will (incorrectly) arm the GPIO for wake by calling
> >   `enable_irq_wake` as part of its suspend hook.
> > * ACPI will power down the device since it doesn't have a wake GPE
> >   associated with it.
> > * When the device is powered down, the IRQ line will drop, and it will
> >   trigger a wake event.
> >
> > See the following debug log:
> > [   42.335804] PM: Suspending system (s2idle)
> > [   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
> > [   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
> > [   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
> > [   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
> > [   42.535293] PM: Wakeup unrelated to ACPI SCI
> > [   42.535294] PM: resume from suspend-to-idle
> >
> > In order to fix this, we need to take into account the wake capable bit
> > defined on the Interrupt/GpioInt. This is accomplished by:
> > * Migrating some of the i2c drivers over to using the PM subsystem to
> >   manage the wake IRQ.
> > * Expose the wake_capable bit from the ACPI Interrupt/GpioInt resource
> >   to the  i2c core.
> > * Use the wake_capable bit in the i2c core to call
> >   `dev_pm_set_wake_irq`. This reuses the existing device tree flow.
> > * Make the i2c drivers stop calling `dev_pm_set_wake_irq` since it's now
> >   handled by the i2c core.
> > * Make the ACPI device PM system aware of the wake_irq. This is
> >   necessary so the device doesn't incorrectly get powered down when a
> >   wake_irq is enabled.
> >
> > I've tested this code with various combinations of having _PRW,
> > ExclusiveAndWake and power resources all defined or not defined, but it
> > would be great if others could test this out on their hardware.
> >
> > I'm sure this will surface some devices where the IRQs were not
> > correctly marked as wake capable. Ideally the firmware can be fixed, but
> > if not we can work around this in the kernel by providing a board
> > specific `struct i2c_board_info` with the `I2C_CLIENT_WAKE` flag set.
> > See `chromeos_laptop.c` for an example of matching DMI properties and
> > setting the `I2C_CLIENT_WAKE` override.
> >
> > Thanks,
> > Raul
> >
> > Changes in v5:
> > - Added Acked-by: Benjamin Tissoires
> > - Removed clang-format white space changes
> > - Check irq return value before updating wake_capable pointer
>

> You are too fast with a new versions... I have comment on the v4 and I believe
> it applicable here (not settled yet).
>

I'll send out a new series with the change.

> > - Go back to using adev->wakeup.flags.valid to keep the diff cleaner
> > - Fix a typo in comment
> >
> > Changes in v4:
> > - Added Reviewed-by
> > - Reformatted with 96 char limit
> > - Added Reviewed-by
> > - Reformatted with 96 char limit
> > - Removed unnecessary !!
> > - Removed unrelated whitespace change
> > - Added Reviewed-by
> > - Renamed i2c_acpi_add_resource to i2c_acpi_add_irq_resource
> > - Expanded logic in i2c_acpi_add_i2c_resource to make it easier to read
> >
> > Changes in v3:
> > - Kept `acpi_dev_gpio_irq_get_by` unchanged to avoid having to touch
> >   unrelated drivers.
> > - Converted wake_capable parameter to bool.
> > - Fixed bad indent
> > - Convert wake_capable to bool
> > - Only update wake_capable pointer once
> > - Move wake_capable local into local block
> >
> > Changes in v2:
> > - Added elants_i2c to series
> > - Added raydium_ts_i2c to series
> > - Fixed call site in mlxbf_gige_probe
> > - Added ability to extract wake bit from Interrupt/IRQ resources
> > - Look at wake_cabple bit for IRQ/Interrupt resources
> > - I chose not to keep the legacy code around since systems without DT or ACPI should be rare.
> >
> > Raul E Rangel (13):
> >   HID: i2c-hid: Use PM subsystem to manage wake irq
> >   Input: elan_i2c - Use PM subsystem to manage wake irq
> >   Input: elants_i2c - Use PM subsystem to manage wake irq
> >   Input: raydium_ts_i2c - Use PM subsystem to manage wake irq
> >   gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
> >   ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
> >   i2c: acpi: Use ACPI wake capability bit to set wake_irq
> >   ACPI: PM: Take wake IRQ into consideration when entering
> >     suspend-to-idle
> >   HID: i2c-hid: acpi: Stop setting wakeup_capable
> >   HID: i2c-hid: Don't set wake_capable and wake_irq
> >   Input: elan_i2c - Don't set wake_capable and wake_irq
> >   Input: elants_i2c - Don't set wake_capable and wake_irq
> >   Input: raydium_ts_i2c - Don't set wake_capable and wake_irq
> >
> >  drivers/acpi/device_pm.c                   | 19 +++++++++--
> >  drivers/acpi/irq.c                         |  8 +++--
> >  drivers/acpi/resource.c                    | 16 +++++++---
> >  drivers/gpio/gpiolib-acpi.c                | 15 +++++++--
> >  drivers/gpio/gpiolib-acpi.h                |  2 ++
> >  drivers/hid/i2c-hid/i2c-hid-acpi.c         |  5 ---
> >  drivers/hid/i2c-hid/i2c-hid-core.c         | 24 ++------------
> >  drivers/i2c/i2c-core-acpi.c                | 37 ++++++++++++++++------
> >  drivers/i2c/i2c-core-base.c                |  6 +++-
> >  drivers/i2c/i2c-core.h                     |  4 +--
> >  drivers/input/mouse/elan_i2c_core.c        | 15 +--------
> >  drivers/input/touchscreen/elants_i2c.c     | 13 ++------
> >  drivers/input/touchscreen/raydium_i2c_ts.c |  7 +---
> >  drivers/pnp/pnpacpi/rsparser.c             |  7 ++--
> >  include/linux/acpi.h                       | 23 +++++++++++---
> >  include/linux/ioport.h                     |  3 +-
> >  16 files changed, 112 insertions(+), 92 deletions(-)
> >
> > --
> > 2.37.3.968.ga6b4b080e4-goog
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
