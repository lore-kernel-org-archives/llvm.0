Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFA6D1B0
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 06:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061752; cv=none; b=lFKLGXrrnN3HWcW20XhDpXI8UdkMI/82r1cYsP+FW+SqOGrDCVhvNLuf4ImwKiJm46T1+O/HZb2b6/yOnbg4knxjxce14nbu9zSqRIxV3IWCSTvbcrODOAGprb0ny6e+S8p0gu4Xgm2nB/jRD9BH1DSRVuTHhACNp+2raf1WEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061752; c=relaxed/simple;
	bh=6eEciy/4SiqwVexa3/ji17TY6bxHxOC7vE5JCvobeHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLP8E/p/Sulo5ZOdUiLRT/acPEcGPbtT/v5k1HsYlW06eR9zv/ovfgzyqTDn4Gt6buURMkeODRqJN2lN08qvu/iRp73E7ZDeq0oHKWeDj+V9WPTBlOdG/OLMZqFWobHHkoY5FdPlFJL0G/QL9BAf8Tiv67Neq8zs0jITE6WX5ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aMqe2CU9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aMqe2CU9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-418820e6effso31115e9.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715061749; x=1715666549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r27a+5j0jPbKzuSHQx0I4ZiLeBi7lavOITwf6ioG1UA=;
        b=aMqe2CU9gJVt5hGjN1bZSm8ZAXNDBPrsNQIhmXvgY/OQsb6pKq4WrcqZRDcT10TN3h
         JTXYQ4vcAwNN89y0d+AbS0wap79x2LW7yhSAAk/JUgkUGIyIZhE7a7vi0jZRi652zD7Z
         VRWmzFZsM84ziwtRKktS+vWtpUtfgJC+0IVi4J35qHNJDwEOhn0W8/AS1wZ/tMSpv4t9
         9IdB8EPFRzDrKe3r/f+GUqJuwCcu8F2hCIFDKKuaD9jMNZjmRfMMUFOy7Ayn2Clbh9EI
         WjufcCCR8yedzoJ5H5ibBSmOClB5t0T2aiNXbViZ2A4f8rouU5QsleOvA0LLndMNnXKv
         3h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715061749; x=1715666549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r27a+5j0jPbKzuSHQx0I4ZiLeBi7lavOITwf6ioG1UA=;
        b=aY48q61MD4dlLZd/LMSNlFk3YU1/kbMsxTShK3AbzSwb0IxGL18bAneglTKYzSBuFg
         zNZJ5qU6VFdXNtJIin345sLjtxL21DUK0tWJOlS7bOvlAFZvso+fgZoa9ESOMVHNEtIw
         V2mV3+Eva6soE9CS133DdNU/9vMWgEBJKMDNAI0+n58fEHAJZL1UPWki0j4tXyNrQTt1
         85HmHCVPSNpV70rrh2xZ3rxh2zp9i3fH3CT95XPjHQaqILtCnat45cBJj+WiF+t5JP8R
         PJbXzjscJYQUpUBWOQ2hsTmARkL398wBwwcN4wSe7TStVEIlMVNmZj9BxvFsF2vQXWdz
         bWtw==
X-Forwarded-Encrypted: i=1; AJvYcCV3D4w7cSwaR4o4Z+ewDCMAdUC9pa6D1YL/tQx/b8t3XwSWXL1D4OV5TYeUI8Ur9Te0AqR4/zMw/nasvFn1JCOp2kC8wg==
X-Gm-Message-State: AOJu0YyDMM6P4Zhuj3G3UO/9TI51WvfdxWwApRFIMci0acfiblucPJfG
	sDtatuun76MtDu7lR0qf1opv/V8PkdSzuWBSi6LV5E/L95453cBMxLjZlq4JbR/6OslIaWITjqd
	PNBEJPLc35wX2NQwcoWMcSlMXFUGLvNigMlo=
X-Google-Smtp-Source: AGHT+IEFTsooy9lTXdBUnPXWeLAjuOxu0cUYFTFhxumq/HmIbzVGnFqUYBuaCwPPtc5cLMJXcfjrnfkuzEiIB2JL7cs=
X-Received: by 2002:a05:600c:511f:b0:41b:4c6a:de6d with SMTP id
 5b1f17b1804b1-41f3bed8783mr780285e9.5.1715061748872; Mon, 06 May 2024
 23:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-b4-sio-ntp-c-v1-1-a01281aa01ba@google.com>
In-Reply-To: <20240506-b4-sio-ntp-c-v1-1-a01281aa01ba@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 6 May 2024 23:02:17 -0700
Message-ID: <CANDhNCps8qE1a+Vp2HNgU=-vA5RwhrLd2_D0EMZiNv1j_OOYWA@mail.gmail.com>
Subject: Re: [PATCH] ntp: safeguard against time_constant overflow case
To: Justin Stitt <justinstitt@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 3:01=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
> Nonetheless, let's slightly rework the logic surrounding time_constant
> and how it is incremented such that we avoid unintentional wrap-around
> (even though it is extremely unlikely to be hit in non-fuzzing scenarios)=
.
>
> [1]: https://github.com/llvm/llvm-project/pull/82432
>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  kernel/time/ntp.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
> index 406dccb79c2b..a9f039601968 100644
> --- a/kernel/time/ntp.c
> +++ b/kernel/time/ntp.c
> @@ -65,6 +65,9 @@ static s64                    time_offset;
>  /* pll time constant:                                                  *=
/
>  static long                    time_constant =3D 2;
>
> +/* pll time constant increment:                                         =
       */
> +static long                    time_constant_inc =3D 4;
> +

I'd probably use a `#define TIME_CONSTANT_INC 4` for this.

>  /* maximum error (usecs):                                              *=
/
>  static long                    time_maxerror =3D NTP_PHASE_LIMIT;
>
> @@ -734,10 +737,10 @@ static inline void process_adjtimex_modes(const str=
uct __kernel_timex *txc,
>
>         if (txc->modes & ADJ_TIMECONST) {
>                 time_constant =3D txc->constant;
> -               if (!(time_status & STA_NANO))
> -                       time_constant +=3D 4;
> -               time_constant =3D min(time_constant, (long)MAXTC);
> -               time_constant =3D max(time_constant, 0l);
> +               if (!(time_status & STA_NANO) &&
> +                   unlikely(LONG_MAX - time_constant_inc >=3D time_const=
ant))
> +                       time_constant +=3D time_constant_inc;
> +               time_constant =3D clamp_t(long, time_constant, 0, MAXTC);
>         }

Overall, this looks fine. Though the time_status conditional is now a
little unwieldy.

I wonder if some sort of a helper like:
      time_constant =3D safe_add(time_constant, TIME_CONSTANT_INC, LONG_MAX=
);

Might make this a little easier to read?

thanks
-john
