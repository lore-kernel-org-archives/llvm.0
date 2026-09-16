Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8953FD3C
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577752; cv=none; b=knxqQDayDuZ744pFCuXqOx2kzFOV0z4Up8+vGtYmMaPqvCh+BF3bL/2njALToxv9lBi8YKnngm4hs08PBKSH1vzt9mLO6ov0ekFITWp6jbydRbadUXoglfn4DVL/lIpOh8TQRKNFsDlNWcp+NSUoaE1sOzSTXYRfmUFDNKSh/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577752; c=relaxed/simple;
	bh=3Rl9kH69FoIDw7gGLNXjdv5fuBqhGXd9XmucXEFUoPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZU+ZsZl3aSSNsi297nW9kI91JfldoSiDwRmcj6UoBim0hr4guruV5N8YTMMRWrh/xvbpuAHGPoxeLNnecthFXQPCCE6rt4Lw3RH2zYLH/GRCLSu1CgikSzSOpSqtGw1UWSQXqJe6CYgsl2+00xmvys2b/mKEjKJcS8+A7uaYEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQNgOhDe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQNgOhDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDF01F008A3
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577737;
	bh=3Rl9kH69FoIDw7gGLNXjdv5fuBqhGXd9XmucXEFUoPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hQNgOhDeYs1NQ6GmUOz0PqknKmSSCRJExdQxK4eKhpTd9nP0IM2kBWXiZm9kvDRXb
	 L/PYUsw6xxXwJ/qtkIykRBvErbfoAaTV1M/hxXLwv6rGmZM2GOuJg3nP60oKYk97+t
	 nRxefwpX+SzqwBwPGwjyGeKqcS4GtwuPbWuZjOtSlJvkzqAHsLEWEY9jtXDMpeD5SN
	 dZAoCXjRfbm48EIjLx9ETaeW5yuQu7biEtc5L+mJHKcsK2CF+Uupjw0ziAMCYqLqJT
	 ao2FuIIsC5N9PHOj97lpgYY5jXsaur/bcHh6vrTMt6tqdA/rRkyYW2XSendQYz4o2j
	 p22s8iOsMw+Ug==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d7eso11036811fa.3
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 09:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzdc1ozMu8sNK+gLq8cBP6AJYIT6Y2UwUNbTHvOlVhmzEudUoifiM/WBF7P9D2mR2fBZSV@lists.linux.dev
X-Gm-Message-State: AFuF++kK4W1Ewz26nDyYUDAwwCHmEWrnN0dwP192dOG46dH5recL6yQa
	pTFJ7DW5+UkWFC/ph8uL6XGJ0VwIEWK4dzjSb1PhqA309yHTtmM9tYT3duh4BOn55cEDQtT8aNY
	tiFnOnRRUYFD/bl4qXlrbWE+eonZ198I=
X-Received: by 2002:a05:6512:2c97:b0:5b4:ac27:6bb0 with SMTP id
 2adb3069b0e04-5b8b666abe2mr2187526e87.25.1789577736627; Wed, 16 Sep 2026
 09:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-7-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-7-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:55:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=7tuZWkXqn0gj14JDbsxkT=cU_1aFOXMRc=PmE-3X-eg@mail.gmail.com>
X-Gm-Features: AcwNN1XvcQ2YIjfo5CFBtXX11PIudi6lRGCv7LMnZ1tHaTMlEuKLFH_DVwfW2u8
Message-ID: <CAD++jL=7tuZWkXqn0gj14JDbsxkT=cU_1aFOXMRc=PmE-3X-eg@mail.gmail.com>
Subject: Re: [PATCH 06/14] mfd: remove unused da903x driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver was used on a handful of ARM/PXA boards until those
> got removed a few years ago. Without devicetree support, there is
> no way to use them upstream.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
