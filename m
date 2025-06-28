Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13186BE4A;
	Sat, 28 Jun 2025 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751080622; cv=none; b=Gq9z/mnCpl2xNhWr24gbG48wktR4PTYL9+oqWMvsxwSyfPEzY0Qy3zEU+HxIVtJm8B7OY47Q91b81JoFwgQYJO7JA/3mMeurLN7adnIy3E80ZNbUSR3557leAgq9W03kImhtBO48hUFBeRB/sOkbjHmEE+YyG65GAk110wHmNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751080622; c=relaxed/simple;
	bh=6mAPUo5M30mh/gfv/HY1yAxEErHGF9CWTrvu3RVcfe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owqNHpGciyerwLnvSvupkQyyzgZjiIVS1nGQO/bVvL8MQhwrD/gMsc9ILU9a3QHLRdhpMiiZAyqRavUEfwi3W1VNr2CaUltpOMHLHqID6wTTl1L/eW3siOE/ijcQhNQXs9JJe+4QMWH/hgB1xoRGAgyzjp2bKQTSwa8PjqbG+Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeQ/UyyH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeQ/UyyH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso690135a12.0;
        Fri, 27 Jun 2025 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751080619; x=1751685419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9dPAwsn+P9UsNtzqpwYoo0ORtcX9rmxgV7CliMPtZM=;
        b=MeQ/UyyHNeMO86y4FojghPJhoqXzk822Z88IZXg6Oxss1KhoLJQInTYnnyFuAffBg7
         Uz8zGSsxD7lBTc/KeZ5WTzv4wToyPk+l832lwPhLhztYOh1KvWzw1OHbyiApl/PGw3Nw
         jIUjUje7pJ+Kctn8C/0HtKmEBZG9rkoA2twPhPxm2zjq8RqPaT6JPtwNocZsnbYKFgBV
         xywJFD3F+R1RUZ4qZ4kZ1jPnNqrwYMAMv3VaLb4+pYZnvIOFxePMaQ/JTaXTLsv4GEsp
         XbB/rx5xClH5Zzg52g9apdxDceBayzKA+lLLYfDyitemEEZTXAhur1VzIFeBfgM9CJRg
         we9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751080619; x=1751685419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9dPAwsn+P9UsNtzqpwYoo0ORtcX9rmxgV7CliMPtZM=;
        b=FDaGY5YqpyMeVXn9Utx8Uhh8AYnY4ohdGFR03NFSN+pEiXI6DBREL1+NsF4rSEZPQG
         Nv7ER1gYiloCAi0xLjKoBfyGgcBFMABCQkjYfcgFjICWyzh+Av6RzCv09TMIWtP5o2x0
         T1jxGH1KyXmBoCAiCNCy08O6AdhqZD/84wZiY8eXodIp1N1rtB7GuYIoeGYMqq0M4023
         +w/wngi17UXvA3HRK56mty1vTQKo+r5h8jzvTSCwx512VCqrEjr8OuCY1jDoY9ma8vI7
         oWGpJXcswenSp3SIU7VAYruz1zxwaemDZf/Djzya69fFwsOzQu0eSi390PI0P2q6I2Qf
         RpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUTZ5SQlDJKjGOmZpNe9n9NgYbrSHdg1obV9Q4GAlKvPOE0hrrDT/K9vvgUQM8yVXvfMLw5w==@lists.linux.dev, AJvYcCXK1VmW6v0oBIDjRgYGnsXsqmIv5CGoI58C7NoyDuQGpsvImitT9r5PPkM2xSV+uhJi2aLcWubhARraYuwD@lists.linux.dev
X-Gm-Message-State: AOJu0YwaMV3C5z0iHQoi7ZHO4Fb5UvrgQSTj+aZfbFOyae/uRK+AjTZh
	AtPVdAA3U5gBnlrFAXba26lEgBUQEtx4ilq0djkAadh0WRUSDjNUooelFBBfdBSWTKJMc/TSGZf
	dPC9PNk1lc8VQO6n9gSuRxUhxUrk2F0c=
X-Gm-Gg: ASbGncvZU0OE9SdIUzekvmZK6bhroMt+D4cOU0Ee4ryHoR/YkG9SzG0/xWMf6GhoEbd
	olCRKMw9zVLTPff3LqMtA81IauA30lZI85H+Gg69v+KmWrvD1EaAnJkA/LsLmrQiH9cbNkPd0/s
	lW1LKHg0I6hfMG9aoogduSkm3Z1BgDnUFbJ++9NImbCI/vPw==
X-Google-Smtp-Source: AGHT+IEteJajU9ian7N9eS7scey4zLc0G1Nzpgd7jSI+mWoqHjDGRUZ49Gk9VxMXNJBvOtj/Mpn85MpDdpYDRfRKTW0=
X-Received: by 2002:a17:907:720f:b0:ae0:c86a:12c2 with SMTP id
 a640c23a62f3a-ae35018f413mr583112166b.53.1751080619216; Fri, 27 Jun 2025
 20:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com> <e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org>
 <aF7EEAxXsurLvIt9@smile.fi.intel.com>
In-Reply-To: <aF7EEAxXsurLvIt9@smile.fi.intel.com>
From: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Date: Sat, 28 Jun 2025 11:16:47 +0800
X-Gm-Features: Ac12FXxsU5dpiPb917Qnz6Mirm0LCeuQaVZZ2cq-H5v4MpNZKgpLGFZPrQY3-yk
Message-ID: <CAKEtaPCibkPWtkRi5xJr8__jzsoPwrrb7LaG3p7_kTK-R5p6gQ@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Hans, Andy, and all,

Thank you for the detailed feedback.

I understand the patch is too large and unreviewable in its current
form. I also see now that splitting the clang-format changes and the
manual checkpatch.pl ERROR fixes into separate patches would make it
clearer and easier to review. I will also avoid touching any files
under drivers/staging/media/i2c/ and any other parts where future
plans involve rewriting or upstream work.

For the next version (v7), I plan to:

Separate the clang-format automated changes into a standalone patch.

Place the manual checkpatch.pl ERROR fixes into another patch.

Remove any changes in drivers/staging/media/i2c/ and leave those untouched.

Ensure that style changes such as macro alignment or tab changes
respect the existing code style and preferences.

I appreciate your guidance on this and will prepare the updated series
accordingly.

Best regards,
LiangCheng Wang

Andy Shevchenko <andriy.shevchenko@intel.com> =E6=96=BC 2025=E5=B9=B46=E6=
=9C=8828=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:18=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On Fri, Jun 27, 2025 at 06:05:08PM +0200, Hans de Goede wrote:
> > On 27-Jun-25 4:56 PM, LiangCheng Wang wrote:
>
> ...
>
> >       for (i =3D 0; i < count; i++) {
> > -             err =3D i2c_smbus_write_byte_data(client, reglist[i].reg,=
 reglist[i].val);
> > +             err =3D i2c_smbus_write_byte_data(client, reglist[i].reg,
> > +                                             reglist[i].val);
> >               if (err) {
> > -                     dev_err(&client->dev, "write error: wrote 0x%x to=
 offset 0x%x error %d",
> >
> > The original line here had a length below 100 chars, so it was fine
> > and log messages are allowed to go over the length limit
>
> Actually I tend to agree with clang-format on this case and that's why:
> until V4L2 becomes less pedantic and fanatic about 80 characters
> limit, the 100 is not applicable for this driver to be moved under
> their umbrella.
>
> > +                     dev_err(&client->dev,
> > +                             "write error: wrote 0x%x to offset 0x%x e=
rror %d",
> >                               reglist[i].val, reglist[i].reg, err);
> >                       return err;
> >               }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
