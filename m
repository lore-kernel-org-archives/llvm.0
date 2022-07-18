Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7E33E7
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 18:58:14 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31caffa4a45so117687667b3.3
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=osBLY7pWKf4zzjIUgrcUY5WBHpct5ScokcNbQfqR2hQ=;
        b=P6dRuy7rne1mioRFiNj6i9XgkdJCqrxJ6MH88oJTxDggLWxYM7VLzBCuFmUo3KZwMZ
         RbaAvDffal/7ijOMLPy8aPIi4zAzviylE+YpjOJg8WpzRLjZ01hZSGPZL+0ZIoOAKy4w
         Jlq6WRAkpYKMHGf3ls/lVfeZzliEAgNf1G+lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=osBLY7pWKf4zzjIUgrcUY5WBHpct5ScokcNbQfqR2hQ=;
        b=05U7C7UtiZ8/xh7AmPnp92wKsGCom19v35J/a9u+IQyp5vf3TdWCkg084vlHX2gBnK
         7ZvVLRzlldKS1DmDgoVLFpB4oT7nVu/2lKcl9PeaDzL6FrKVCMiGe5AEAQROSY8jaLDm
         sn2Yba/nBoP2sUuWGd/U9NJRZjg48OPWPcERi71Uxp0DpzIQBzwJtRTXmby9RWAorh8C
         fGom7L2yJkizFO1eU49eeviXCP9AyMUzRb/KrrV8FgpFiZrjDaZMgeWK7h/X2BU5oNeI
         iY3kBcwXb5YNsihoAbKDWK42GGeB0gSokvSHUoXdguqlnhXLt2dHprTdA0Q0bBD8AIrI
         X7/g==
X-Gm-Message-State: AJIora9Yh88+v49NUN9SFWQ30iwfZ82uL5e1UYq2KzvwTIjbKVL15Thr
	/z8uevNKZ1MIcUFKAFLXFLTvXM/gQdIZvQOOZLvmvQ==
X-Google-Smtp-Source: AGRyM1szq8owamsB9PCWQy97R44KLI8X1kFziZ9xNt3caREOjwAMSrwEC2vVtD1bAz4wKznqzzRFGTD1oTeUFAtS+dE=
X-Received: by 2002:a81:c0f:0:b0:31c:f619:b02c with SMTP id
 15-20020a810c0f000000b0031cf619b02cmr30759932ywm.311.1658170693594; Mon, 18
 Jul 2022 11:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207170614.2HHvAplN-lkp@intel.com>
In-Reply-To: <202207170614.2HHvAplN-lkp@intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 18 Jul 2022 11:58:00 -0700
Message-ID: <CACeCKacewJbE4u-v0KMUTcjEV674MLgQZwU5vgtfY6MNZpfTww@mail.gmail.com>
Subject: Re: [usb:usb-testing 50/55] drivers/platform/chrome/cros_typec_switch.c:93:9:
 error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later
 do not support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 16, 2022 at 3:20 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> head:   c76d09da77d69d7f737540985912ad2bca654713
> commit: e54369058f3da181fcc4c893f224a0c5a8a526b6 [50/55] platform/chrome:=
 cros_typec_switch: Add switch driver
> config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/202=
20717/202207170614.2HHvAplN-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0702=
2e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/=
commit/?id=3De54369058f3da181fcc4c893f224a0c5a8a526b6
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/gi=
t/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout e54369058f3da181fcc4c893f224a0c5a8a526b6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/block/ drivers/=
iio/light/ drivers/media/i2c/ drivers/net/pcs/ drivers/pinctrl/nuvoton/ dri=
vers/platform/chrome/ drivers/spmi/ kernel/trace/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to undec=
lared function 'acpi_evaluate_integer'; ISO C99 and later do not support im=
plicit function declarations [-Wimplicit-function-declaration]
>                    ret =3D acpi_evaluate_integer(adev->handle, "_ADR", NU=
LL, &index);
>                          ^
>    drivers/platform/chrome/cros_typec_switch.c:93:9: note: did you mean '=
acpi_evaluate_object'?
>    include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared her=
e
>                                acpi_evaluate_object(acpi_handle object,
>                                ^
>    include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI=
_EXTERNAL_RETURN_STATUS'
>            static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
>                               ^
> >> drivers/platform/chrome/cros_typec_switch.c:93:35: error: incomplete d=
efinition of type 'struct acpi_device'
>                    ret =3D acpi_evaluate_integer(adev->handle, "_ADR", NU=
LL, &index);
>                                                ~~~~^
>    include/linux/acpi.h:790:8: note: forward declaration of 'struct acpi_=
device'
>    struct acpi_device;
>           ^
>    2 errors generated.
>

Sorry about this, fixed here:
https://lore.kernel.org/linux-usb/20220718185551.1025288-1-pmalani@chromium=
.org/
