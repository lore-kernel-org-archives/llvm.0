Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C11A269
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658903; cv=none; b=fPEoD+zqknxz42xhUzWi0caIvQ8bsiD3OcB8p7HudjWzX7POblqOYKUrBsMj8wIYvmK8X/lq7UQyeneyHyDtUq9tmcxMDE72qNQYn7eCB3afoXWfLmPKPtHiNTGRs+1xlkDsyN+Qhc9M7xd8k2CHDVB7qPC9ZUEbuUV2QESQw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658903; c=relaxed/simple;
	bh=nr1kTSxvBIb9LRmYw14N6GTTVefLFfgK/8kJVEww7WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUt++g4mwJFOyZJgEtZScQ8OpnO9vv5sniy9gBarTwWL2i4cusDeDI/4wlhvOhdX574Lut/Y5gUBZ3E7qocZfHQ/mgMkOYrAMTGBTBBV/wsjRINZx+/oppN/eJL/j2i/qec4w4kd5bOs7cT8U8ljL5Mu4TgNaZdSK6o9dy4t9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU6QoicC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU6QoicC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso2822694a12.1
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658899; x=1729263699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzELerGxwENbVERb4Z1vrEYFWmlmJCGafD6FOzDywR8=;
        b=SU6QoicCky728kaYcqfJF/fDR8nuHWRke4Ufg6WlK/IedrFBaGgPD305QeLMwhvO+V
         2DoqzA0cZ0AMQ6eM+UoLZnYKGcaGzgfsOR16JxrLd0NVctnLb55UpKviKm1eatJDHfR1
         ZKRBiSCtuyV6Hq+W+xubAa6D7oPgE+Nvk++lOwVfbIfajkqpga19+wH/WWUktZFYiFLT
         MK1LU4MOTNCDgakjh4++NU586rBYJRmZdcgONEHqsPbr8ZQYWq4Ee3W8CR2wg6Hso74m
         xotqPNqTkBEtbqE//j/wNECKZIqHuE+O1cQTPiUru2MnWEWSsavRlYHOYon+wSqEcHf0
         dG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658899; x=1729263699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzELerGxwENbVERb4Z1vrEYFWmlmJCGafD6FOzDywR8=;
        b=AyuTjp+e15UYKpSadTIccRDEGghAl2JCvM89KpAuXnCIjtiDAB8O8CwLv3vUDnVMQj
         uSlMQdd7RqDflJUF1CtpEF4oW9brfD6WGNP4ZsX2ovGrzHxz9Xdg8JumA5M7518uFkCm
         7kpxKVTLXe7FyU0R/4Y4yaDb/3ykqePJ8VlgLuOqq0EaYZxbTsE5CJEJfLi1zEJKnPKO
         iSnCLV/9Y3JByITt05a5mDvaImDDOJJiTNq2bQ7+i/DJlruEa2miV8kBUMMYpHYImfaN
         Vk/vf8V+kZEalX9igVjYLkJX5xVn7vvkDNJq99KlLLmfDChak3xSOSsrTc+Tnj0NIU9n
         ebkw==
X-Forwarded-Encrypted: i=1; AJvYcCUInkDKKaABDt6FthK5H/lq3zn3seV2GbEExgQO4neCGujdZhiHNvfOFA8Z8Sw4HwrG6QdX@lists.linux.dev
X-Gm-Message-State: AOJu0YzomiWLXM1esTJbrzdPo34r8ltff+DXowOR5WnPDNoOrvEQ5xn+
	wkmXMIq/NiW9VtyOqF1khb6RodMZ6GAb4kzP7OQsD2i5ZhRLYgSu12ty+2WyneIc3ohx5ysHUzB
	V0eWdV9IJ7lYYQ5bAW2Zy7uogXfo=
X-Google-Smtp-Source: AGHT+IGW/6FiYvt3urJzRIq5N0EHLG9l8NfLeEXHKSvHcWOKXSI41CWNhWYeebqTMgP9CGTXk+lib7CwbGIi9mWuiDE=
X-Received: by 2002:a05:6402:354c:b0:5c8:a4c1:d59a with SMTP id
 4fb4d7f45d1cf-5c933544dc4mr6299265a12.8.1728658897704; Fri, 11 Oct 2024
 08:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011093752.30685-1-0xff07@gmail.com> <20241011115334.367736-1-0xff07@gmail.com>
 <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
In-Reply-To: <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
From: Yo-Jung Lin <0xff07@gmail.com>
Date: Fri, 11 Oct 2024 23:01:25 +0800
Message-ID: <CAHhBtNr6rycOKjXvAR6nK9ZKF8Ze=wvki2yetCZDNz-LHA+FvQ@mail.gmail.com>
Subject: Re: [PATCH v2] iio: Fix uninitialized variable
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net, 
	skhan@linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Vasileios Amoiridis <vassilisamir@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Angel Iglesias <ang.iglesiasg@gmail.com>, Adam Rizkalla <ajarizzo@gmail.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Fri, Oct 11, 2024 at 8:31=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> On 11/10/2024 13:52, Yo-Jung (Leo) Lin wrote:
> > clang found that the "offset" in bmp580_trigger_handler doesn't get
> > initialized before access. Add proper initialization to this variable.
> >
> > Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> > ---
> > Change in v2:
> > - Make value initialization immediate before its first use.
> > - Link to v1: https://lore.kernel.org/all/20241011093752.30685-1-0xff07=
@gmail.com/
> >
> > ---
> >  drivers/iio/pressure/bmp280-core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/=
bmp280-core.c
> > index f4df222ed0c3..682329f81886 100644
> > --- a/drivers/iio/pressure/bmp280-core.c
> > +++ b/drivers/iio/pressure/bmp280-core.c
> > @@ -2222,6 +2222,8 @@ static irqreturn_t bmp580_trigger_handler(int irq=
, void *p)
> >               goto out;
> >       }
> >
> > +     offset =3D 0;
> > +
> >       /* Pressure calculations */
> >       memcpy(&data->sensor_data[offset], &data->buf[3], 3);
> >
>
> That was a quick reply. I would recommend you to wait a little bit while
> the first version is under discussion.

It was my bad not waiting for enough feedback to finalize another
patch. I=E2=80=99ll definitely do better next time.

I feel that initializing it as sizeof(s32) in the beginning and not
using it until the second memcpy() only widens the gap between value
initialization and its first access, which doesn=E2=80=99t address
Shevchenko=E2=80=99s concern.

>
> I still see the offset thing a bit weird. data->sensor_data uses an
> offset to avoid hard-coded numbers, but for data->buf we do exactly
> that, in the very same lines.
>
> Setting offset to 0 to access the first element i.e. no offset required,
> and then adding the actual offset sizeof(s32), which could even be a
> const if the first access was to sensor_data[0], looks to verbose.

While that is also true, it=E2=80=99ll take a more general refactoring to m=
ake
it driver-wise consistent. Maybe that refactoring should be on top of
a fix, instead of being part of a fix.

>
> These things are of course not critical, and the proposed fix is
> definitely ok, but I am missing some consistency here.

Best,
Leo
