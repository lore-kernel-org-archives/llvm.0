Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05912C81
	for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 12:44:00 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id b188so3443099iof.8
        for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HDxKmOZ62FUht58FdXOSx5Qa1yp34Gywlo2BVog2d4k=;
        b=JD6O4ZfLxh8lT62FkFjA9y4GRGOql1L41J7By24XJWV1Tot3Aga8EnorZcDBx6JwSy
         O+hxUv6SYvUmpaXxk9V3Wz+Z8nmguLLjYr2Ku8u801A1YWrAI+rVZq9s/TwmOzY+KIq9
         BVOvXJqxvV+yH/84+LJjZjMhp/JilthjAJP3PdkFOsD8g3KH6vYAtMmeu9ivfGF4O9R/
         HyhVgaI0wT490I/coyp3XSy1krG376aNuw3+Rd68NGQaHc6lfja1CkHZfFxud44l1T+a
         oSjmCbivcVjG35a4p4MP1pyqdwI/JKch5MQebhpvlGrjDALa7Ir1gyAha12ZfiFkb0tq
         rzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HDxKmOZ62FUht58FdXOSx5Qa1yp34Gywlo2BVog2d4k=;
        b=Dsz753fTYGOPcJhbKe+idtMZsKL6Fw9tLJkx80o9BuJQXRJsshOYga+ghv1DvNW7EI
         7WaAVY2NV5wlnTgY+01vERqtiNvjVhZzbSY/ZmwOds4E+iJvR4u5Za9M/dxmW6B6+Q2/
         DIMxRorKgfDxGccO8IZI5wkeSO2I7ViQ1Lyz8fM6mvl+M0TPbnVTiZ/ZzvyIx1neMSjj
         IrJliY5lvh7A/u+6AKbFzFiJcAED1Aj8oVcLbHF4ygtSaigPWmzxaMzQ8LCnyZe9yrDs
         3ak5yfO9mR2kZ8WOhiFjgTcYI80B7IuY4EwbP2IcyfG79viNOf3DKodIo3FiRubnxhCY
         8xAA==
X-Gm-Message-State: AOAM533RAlNF78TfS1TFp+uz4Pyty/BE4CBIC9L5LeI2I/O8DnLtEiSn
	LHNBjKFLQbSVNpoS+famTuleJYpjGO5CmXoaDvqlNg==
X-Google-Smtp-Source: ABdhPJxraYfyEAPdAQGs1VHNpepQRGngxVf/3a/ovSme8ZzoFWFZBjIZBzs37dAcZqbudR76+NRe9KtzN2zrnxVmRmc=
X-Received: by 2002:a05:6602:148b:: with SMTP id a11mr20342831iow.85.1635338639393;
 Wed, 27 Oct 2021 05:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YXU2i0FtAGDRCMSu@fedora> <202110271450.Z8JPybLg-lkp@intel.com>
 <20211027061552.bb4fczniqp6b7amh@pengutronix.de> <20211027073204.GA3978@gofer.mess.org>
 <CAH7FV3nb8K2qKgGZh-uMCk_BykWJ_sOb7K-jEhNjazYSiXdqbw@mail.gmail.com>
In-Reply-To: <CAH7FV3nb8K2qKgGZh-uMCk_BykWJ_sOb7K-jEhNjazYSiXdqbw@mail.gmail.com>
From: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date: Wed, 27 Oct 2021 09:43:47 -0300
Message-ID: <CAH7FV3=7Y7Z0y+Mq5Ak12KDMiZpHQHXGixF_pcrnQkuqCO9kvQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: rc: pwm-ir-tx: Switch to atomic PWM API
To: Sean Young <sean@mess.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	kernel test robot <lkp@intel.com>, mchehab@kernel.org, thierry.reding@gmail.com, 
	Lee Jones <lee.jones@linaro.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[resend it in Plain Text]
Thank you for the feedback! I appreciate that! I'm new at the kernel
and I got a little confused about how to send the new patch. Should I
send a v4 of this patch or just send a new patch fixing this issue?
I'm sorry about the question and thank you for your attention.

> Em qua., 27 de out. de 2021 =C3=A0s 04:32, Sean Young <sean@mess.org> esc=
reveu:
>>
>> On Wed, Oct 27, 2021 at 08:15:52AM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> > On Wed, Oct 27, 2021 at 02:07:19PM +0800, kernel test robot wrote:
>> > > If you fix the issue, kindly add following tag as appropriate
>> > > Reported-by: kernel test robot <lkp@intel.com>
>> > >
>> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
>> > >
>> > > >> ERROR: modpost: "__udivdi3" [drivers/media/rc/pwm-ir-tx.ko] undef=
ined!
>> >
>> > This comes from the line:
>> >
>> >       state.duty_cycle =3D DIV_ROUND_CLOSEST(pwm_ir->duty_cycle * stat=
e.period, 100);
>> >
>> > where DIV_ROUND_CLOSEST expands to a normal division but state.period =
is
>> > a u64. So this should use DIV64_U64_ROUND_CLOSEST I guess.
>>
>> DIV64_U64_ROUND_CLOSEST is for dividing a u64 with a u64. We're dividing
>> by 100 here so this is not necessary.
>>
>> It should use DIV_ROUND_CLOSEST_ULL, however it might be nicer to use:
>>
>>         pwm_set_relative_duty_cycle(&state, pwm_ir->duty_cycle, 100);
>>
>> Thanks
>>
>> Sean
