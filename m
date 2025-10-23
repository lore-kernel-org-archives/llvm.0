Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA391D555
	for <llvm@lists.linux.dev>; Thu, 23 Oct 2025 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222700; cv=none; b=SjDBmTw/cSUPfGFmS4aGFLiE00X23t/NwU+TEpFQpRQsgzKVqr8aHUGFjlhnO+w2OKyBchJE4Vsl5Ul/rM3LwexJHi/h1ae93ZEC2kMQIPwm+tcswlKadro75jfpreeju7gvPjB6IBh1ZRAF9GBaFSr4pzUa/ehzwzc7V71FRS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222700; c=relaxed/simple;
	bh=6eO+tiqu5gxWLPASRGodixCE3YW3+pELSH6ilut+fa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7cXKbinpoyHZ5AP7hZT4RrVK1ol81fXPcptCXWUorDQ6NwCpCJuHpgBFoVXNnEH+xmtu9quZP35sqqW5g5X3cYnaK1PIroUmaRh80Px9fYLQOdOt5oF64O+AgPyfpbUGuu5iba77n1TuMOggky0tLxuy1BJtI9i0SF0UqXlRfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k/s9593G; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k/s9593G"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-591ebf841ddso932689e87.0
        for <llvm@lists.linux.dev>; Thu, 23 Oct 2025 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761222697; x=1761827497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcxV7jlDfnvszGpLFODRk5JOPkRKywoQCJY/El6WesU=;
        b=k/s9593GHOeeDRg/kL8IXpBwGiqbC27mzHOyWlEqIYRqax4YJaHaW3z/RDyKlj2VE1
         nbwOEZVcS7Dprq9AbsBKdrG0gPeKVQuhigwYqiXT1rVZOLM+FOer+Adh8ZJrd72Yg/yF
         NeeYOcSdHebwQyVoY7eMppQ9GW0x9IHSyyCvmpU9L9Sxa93ivQpi6pXsZwAXUi1bPV7+
         0xW0xPnWNfh0LIe2wtSII6PLnf0Wpc3zF9b1ZoLwYzpR4HlIn5Bsusi89DTkMxS4m3cG
         XolVLio5ErHKEUjNdA/Kxez5EjR6Z/NpXz58eg+rvAkcqga7LW+6lLTjaWTnYK1lvYd/
         47gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761222697; x=1761827497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcxV7jlDfnvszGpLFODRk5JOPkRKywoQCJY/El6WesU=;
        b=FnCYKP4/RbKB5UXeTk9TYWW2udNP2FxdnzKjBIwKUQ236RtTHY9bFvMeoiVSQyQvJA
         FER/VoUdGyQJ1+S50NvlvsVpaHH8c4zhPP4BtexSLV6QZhJ1fP4Je0gzsP2/abb+LyAO
         ZKEcclEFanHIcGgq9cxhxuDxg/kduvy9urUjBJWR6coRUgtbwa9mEhz18jH+tNf/RjeD
         /+7cxFNDaaRam9hR+Ong+F0MkIyXY3DxuCYAKjQo9uZeSBtRgVCzhZdLr/c3hhI9he3i
         5hPN1lwCrlD+/Mzcu4KXoLq2mq/pOfVtQ1PU4N+6+TMrrstrs7g9QlKd9QOL42vWtumm
         Ah9w==
X-Forwarded-Encrypted: i=1; AJvYcCWZsiHqyKMgcxdnCjvePb3GyGIq8ChgAPOqEXxQ3F8qTq94/nerJbDrFoPkyMPCcDoGFJEg@lists.linux.dev
X-Gm-Message-State: AOJu0YxmyHPbApIPFEhjKvmfNcPxFjRrbg9hT5sz09okB6MzBvpY4LIA
	zkaMQq85Ki3+9Zn+s4ejrXEk5NL1obMRiZ8wHupzN/+4ARC96wNqo1ZA4TRvYTCTM7jjZE5NewC
	PlnI3dzClt6DiGyK+S+r97oivL3eGvWOaslAjpx3Vug==
X-Gm-Gg: ASbGncuJBG07xgBkce5i5hIc4F/oCdcMofZWUAGlYQxxe5nRMfn4b8Yut92hBABG+T7
	EFhhaIw8NnSVjRTRvZYdVg/PgaM03B1dMKZapswpetcb19CSZNNnuJUS9h5DIxcAow7pDSIa1O+
	7nuiMuMS6UuHIHWYFFp6+AXe5KVsZqOu3Fvsv5zRbv7hJ2TsG4lr6xHF+EvVT/3zwJj685CdY1P
	18PCfQ9aScb/7LucIXWFRMvWjJsu9bQlnNCA4sMwFnRIaefguPWWK9rLgteip1YnEpSA8C8apg/
	gYv639FrG+D9epE=
X-Google-Smtp-Source: AGHT+IHlWEw7YoXjgjgAjGD2T5nBasowO6S4qW+ucC1G5ZeTx1do26wR7Fl8YJLp91+jQww6oqOpu2KmSMLEueA8ups=
X-Received: by 2002:a05:6512:33d5:b0:58b:151:bc12 with SMTP id
 2adb3069b0e04-591d85a4b54mr9384401e87.51.1761222696489; Thu, 23 Oct 2025
 05:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510232205.La2t2fR7-lkp@intel.com>
In-Reply-To: <202510232205.La2t2fR7-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 14:31:22 +0200
X-Gm-Features: AS18NWC2DkPx8ZMhOw19k_GaWcX_KfEcv0khQYZBwNR09LWlWaCHjnBqkpnywIY
Message-ID: <CAMRc=MfhjG1RPS=Khv9us_n09Dzk1NAAHOt5jjWmR3dpB61gcg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-current 6/6] drivers/gpio/gpio-ljca.c:289:9:
 warning: unused variable 'irq'
To: kernel test robot <lkp@intel.com>
Cc: Haotian Zhang <vulab@iscas.ac.cn>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 2:29=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-current
> head:   7d168362aedeca451ac22724f90040296dccca14
> commit: 7d168362aedeca451ac22724f90040296dccca14 [6/6] gpio: ljca: Fix du=
plicated IRQ mapping
> config: x86_64-buildonly-randconfig-005-20251023 (https://download.01.org=
/0day-ci/archive/20251023/202510232205.La2t2fR7-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251023/202510232205.La2t2fR7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510232205.La2t2fR7-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpio/gpio-ljca.c:289:9: warning: unused variable 'irq' [-Wunus=
ed-variable]
>      289 |         int i, irq;
>          |                ^~~
>    1 warning generated.
>
>
> vim +/irq +289 drivers/gpio/gpio-ljca.c
>
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  283
> 1034cc423f1b4a Wentong Wu    2023-10-09  284  static void ljca_gpio_event=
_cb(void *context, u8 cmd, const void *evt_data,
> 1034cc423f1b4a Wentong Wu    2023-10-09  285                           in=
t len)
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  286  {
> 1034cc423f1b4a Wentong Wu    2023-10-09  287    const struct ljca_gpio_pa=
cket *packet =3D evt_data;
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  288    struct ljca_gpio_dev *ljc=
a_gpio =3D context;
> 1034cc423f1b4a Wentong Wu    2023-10-09 @289    int i, irq;
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  290
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  291    if (cmd !=3D LJCA_GPIO_IN=
T_EVENT)
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  292            return;
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  293
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  294    for (i =3D 0; i < packet-=
>num; i++) {
> 7d168362aedeca Haotian Zhang 2025-10-23  295            generic_handle_do=
main_irq(ljca_gpio->gc.irq.domain,
> 1034cc423f1b4a Wentong Wu    2023-10-09  296                             =
       packet->item[i].index);
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  297            set_bit(packet->i=
tem[i].index, ljca_gpio->reenable_irqs);
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  298    }
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  299
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  300    schedule_work(&ljca_gpio-=
>work);
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  301  }
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  302
>
> :::::: The code at line 289 was first introduced by commit
> :::::: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d gpio: update Intel LJCA U=
SB GPIO driver
>
> :::::: TO: Wentong Wu <wentong.wu@intel.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

I fixed this in tree.

Bartosz
