Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA33207
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 20:32:34 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id j22so22672134ejs.2
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 13:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5uTJfbjnCnNY4L/Fr3ZU7lb8k5HMvtMkTOBlXtv0Il0=;
        b=AQasQ/MSGTbHW6t7ys2gXk6LP7V5bLGKVh0gfNqxetFMDc46uqliQx1vGDyExDaf6i
         SEM37qO6RpfOq9AAsrjiws9PL6LNDKboDBQzgVIWcGJgdPbtXgPEmlxtQJNFsB7D7AHw
         OVebDbKFOSLmCnK5DjCnXy8+GsaCQjneXxDoROmzClH+zA1eExpQK+Gcvnj+4++DyadP
         +sDFI0MkqW4X88dAtYspPnGXB359YsDTrPhhFn2+T0DenlqCaDS9EhBi8YAyRmOPtw3I
         9Zv2VAw98FeDlIkZQ8VKXwFTrs8EuqsRqxTaGHWX9rxo3XP3//pKMeYl+25vOyiIKmaC
         LtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5uTJfbjnCnNY4L/Fr3ZU7lb8k5HMvtMkTOBlXtv0Il0=;
        b=fYs2mWmALGvdXcCJZSc6EQKLr9Fomd45gpDc+mxDiPUnHlQS2ylD/DspoIUxm1SHL7
         H5ZGzyCz661cGQ11USUdOS5A8lEXlUrDQQ3Zz3UDSU153vVxPl4hXs5hDy7dKfHpjbMf
         flhyU21tjJBBCa5DKnUnx8MXbn1zuv48HkYGnOq28eAmBO0h+KtesMzzC+ppm3N5BGWa
         /Ro3DEJxfbf2zLNESY1LQkYIcx/23VgFihBJDXMORoVNvRldTJmgQrdZNSEL/T+/Lf4Y
         ZOt2+D601Y9dK4KHEFVxhhRf2Emf9U2pQb3p6MYdh93s2UAJg+5Bmi+ZPBMdt3qx0Bjx
         +TwA==
X-Gm-Message-State: AJIora+AD5pAdggb2f7MkCY2INt6O8W7RJgAVeT4DqGsAFQum7jK5N+M
	T3gAhfbI38S2IaIj3wP9xFLTnylSccmJ0rUMhe8=
X-Google-Smtp-Source: AGRyM1uyBNChG5ECz+p2Fd8YgOxxtmnwutdvyTx8z1E+g68+5PjLrzoMydGgCXDQwbro9Akd5Qttt3/aOY5ERzSxyLE=
X-Received: by 2002:a17:907:75da:b0:72b:3ce0:2524 with SMTP id
 jl26-20020a17090775da00b0072b3ce02524mr11434125ejc.394.1658781152514; Mon, 25
 Jul 2022 13:32:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220721080423.156151-2-nuno.sa@analog.com> <202207231228.n8l077iB-lkp@intel.com>
In-Reply-To: <202207231228.n8l077iB-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 22:31:56 +0200
Message-ID: <CAHp75VdY6qikNgvh4K5Ga4D5MHf7sEfm0kbNzN-xNanwj4yQgg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	linux-input <linux-input@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 23, 2022 at 6:57 AM kernel test robot <lkp@intel.com> wrote:


...

> All warnings (new ones prefixed by >>):
>
> >> drivers/input/keyboard/adp5588-keys.c:336:9: warning: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
>            return INVALID_HWIRQ;
>            ~~~~~~ ^~~~~~~~~~~~~
>    include/linux/irq.h:1245:24: note: expanded from macro 'INVALID_HWIRQ'
>    #define INVALID_HWIRQ   (~0UL)
>                             ^~~~

It requires irq.h, but hold on. Marc said that he wants to rather kill
that definition than having it spread over the kernel. So, please use
your own custom macro with an appropriate type.

-- 
With Best Regards,
Andy Shevchenko
