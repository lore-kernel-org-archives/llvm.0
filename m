Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857216EB49
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061286; cv=none; b=JoPDJuTQ6FMKioDmQhq5dPfnI800F1qCZcJyu16xfPuhM6ZbqCZpEBwzPmKit2xeL3ySZ7QyaQFYhxlPJxrByW7t4YdL2ka8hJAcgd1WPDqxtNEWmWRo22Eqb6y5xHk1wsij1G4Ae0bsAo7hsr9m7AdqoXVlXRlF7IRIl/3GK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061286; c=relaxed/simple;
	bh=zycI60GD/v+qvEnAFNouzBUTO1V9JiQnJpX3TM+77ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHMqD+jAHN5gHqjM6me2+vS+WXdbfrdlwA+HHmK9McN4XBSjmtlTWa2uhy1e62loKSTm5hWODGkyFdsrxukf5femO22kaNqaloi0PMY0OLQiKt1ugEfSGkXILzivtsr2Z6LOTjCVVCmRe5usb+/b+8YPt2XqG3QEM75EhGpmySE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kj5WNWXp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kj5WNWXp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41b48daaaf4so30445e9.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 22:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715061283; x=1715666083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2+XprmFK+IYeTTDNzHuz3jEWMm6Vi+YQ+2eFOmblGY=;
        b=kj5WNWXp9Bdsu6v3iWebAihJFCWo6MMdV6rnmEbxMvazop/2mvH9hAeYmkM+Is6Y+t
         C/bZFzPU4rwl4OKC6zM9r3+M0tfvpiuC6sCwjMq5BUXO97Qb7LjaVZ5WUcwcjQsodsU9
         CYgpXVv3Tad9eIbYvnkuivM5TsBQJnW7w5UOP9YHgSXuuu3/sDhKg3aTNJsln0L68Aqs
         yob3RUoILDbCrttBZ3awTYLknuRMVsF+EHZFEIZk24bzTRuib7SeOwEaePYnH17L5G1x
         wsCTgJDax3I12pMQRpBK0NS/53BCgc0iGuN0zY3+EkZ/lKPujQ+Fw/KjhG/Z5/9j10ft
         mlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715061283; x=1715666083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2+XprmFK+IYeTTDNzHuz3jEWMm6Vi+YQ+2eFOmblGY=;
        b=mfvW8al/Ye7Wth1Q4u2OTrlRJYM5QLklIB8OTuy5amBcRLRF4ZR44uuEwxoq8u4kq4
         sz/xq4he5sBpbw8RYYGIb4qdMsUWPEyjAergl2PaelSYBmEjmPiITQROXFG5eyRvPyfc
         Bl+N3AUF5FfxqbLxdpexnw4YUN2cvnARjnfs7uoL1/uprThVPBN3k69XSc0PIy5gXPfn
         jNFisd3VmRxKnNqVMuY5VsEOusH4yFxJEJ5xrKfT2S2mQpZ3G7OncY37Aw10IJPl8pvC
         pENOcPh4dvRV5+VYi8A/Hj8mPhufW72kuYCuJJxWcWabNtipNmrcYBw2xsuIFeYsM2u0
         0GJw==
X-Forwarded-Encrypted: i=1; AJvYcCWDU6AVM2nDjQrG3759IJ51VVdIutATjjiWxToNUfQ9IdsHcnbIJxAihMpYngBWz6FjzcvZYRI6AOsbooGxNhEgv/sU7Q==
X-Gm-Message-State: AOJu0YzBYT5vb545Wu/Hfo5Ah3TdFKQ7qG0/eGyTMkjm+1ZLap9Sf9h1
	47lrGIsf/j2PlnHbWkdN6HM0vLewTUMVB9ah5LWLlOyk8SKRJUteO5dZHpwqtodBsO+k0yZyD8W
	OOA+wCi3I4KYHoQJUO9rfWNbDo8XyhH5KRuE=
X-Google-Smtp-Source: AGHT+IH9BUY3Ybiuaq2U0mzo8WOYrWHauZfCI6q8FsareAMFaYi33OS8f5Moj2dq6e2fcauU1f/k5k92JiyJ5b89cS8=
X-Received: by 2002:a05:600c:3ba8:b0:418:5aaa:7db1 with SMTP id
 5b1f17b1804b1-41f3b8affaemr886575e9.1.1715061282789; Mon, 06 May 2024
 22:54:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507-b4-sio-ntp-usec-v1-1-15003fc9c2b4@google.com>
In-Reply-To: <20240507-b4-sio-ntp-usec-v1-1-15003fc9c2b4@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 6 May 2024 22:54:30 -0700
Message-ID: <CANDhNCqQPGjhSDnCOvHFqQx6vaPb1U-nyaacJSNMxcoKWwRi-g@mail.gmail.com>
Subject: Re: [PATCH] ntp: remove accidental integer wrap-around
To: Justin Stitt <justinstitt@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 9:34=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
> Let's introduce a new macro and use that against NTP_PHASE_LIMIT to
> properly limit the max size of time_maxerror without overflowing during
> the check itself.
>
> Link: https://github.com/llvm/llvm-project/pull/82432 [1]
> Closes: https://github.com/KSPP/linux/issues/354
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  include/linux/timex.h | 1 +
>  kernel/time/ntp.c     | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/timex.h b/include/linux/timex.h
> index 3871b06bd302..976490a06915 100644
> --- a/include/linux/timex.h
> +++ b/include/linux/timex.h
> @@ -138,6 +138,7 @@ unsigned long random_get_entropy_fallback(void);
>  #define MINSEC 256             /* min interval between updates (s) */
>  #define MAXSEC 2048            /* max interval between updates (s) */
>  #define NTP_PHASE_LIMIT ((MAXPHASE / NSEC_PER_USEC) << 5) /* beyond max.=
 dispersion */
> +#define NTP_MAXFREQ_USEC (MAXFREQ / NSEC_PER_USEC) /* scaled to microsec=
onds */
>
>  /*
>   * kernel variables
> diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
> index 406dccb79c2b..19027b6d0827 100644
> --- a/kernel/time/ntp.c
> +++ b/kernel/time/ntp.c
> @@ -454,12 +454,12 @@ int second_overflow(time64_t secs)
>         }
>
>
> -       /* Bump the maxerror field */
> -       time_maxerror +=3D MAXFREQ / NSEC_PER_USEC;
> -       if (time_maxerror > NTP_PHASE_LIMIT) {
> +       /* Bump the maxerror field, making sure not to exceed NTP_PHASE_L=
IMIT */
> +       if (NTP_PHASE_LIMIT - NTP_MAXFREQ_USEC < time_maxerror) {
>                 time_maxerror =3D NTP_PHASE_LIMIT;
>                 time_status |=3D STA_UNSYNC;
> -       }
> +       } else
> +               time_maxerror +=3D NTP_MAXFREQ_USEC;
>
>         /* Compute the phase adjustment for the next second */
>         tick_length      =3D tick_length_base;
>

Looks reasonable to me.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
