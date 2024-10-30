Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B91EF095
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730301865; cv=none; b=IhHKvRws+vZnjMdbXR7bxPr7HwvuEWxcU0uSDy2Zj2c47drfTnIoa7Di0jHS+syDVPByRgJ1MGnK82u0fVmNebzN9TkWcDp+VgdoK+NNiyDakMv+p3lMWDupk1D0GNHt+cCxFCaJ855aVV8sUaSrxY9CFjEz1xkORjRmALwmwB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730301865; c=relaxed/simple;
	bh=simIDRgpNIogo8rlcxsHSl0Byfsdzt7txDP9IEyqBpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqZ6PVom1AmVdoW7H1SzwDS5tJKr17WPLrJWETM0af/NgdgULaDh9tm9J/Kq8YVWTeQGdYNoHYRtXXxg0HWi7qe4USOnUyhQsOYPykDOmsQscD5g88h8PIYQj/YseRFgvw0255wseKX6Oy1ykuyNe52IPgmr96Z06LF3rbRWiSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGA4FH2+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGA4FH2+"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb599aac99so64374811fa.1
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730301861; x=1730906661; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=simIDRgpNIogo8rlcxsHSl0Byfsdzt7txDP9IEyqBpQ=;
        b=PGA4FH2+xFFwuTwMaUUM3s9AOAnCzivvtptXi+D0bNRNewWUiqUkcrJxdc7zbi5bTy
         +q+caoy4BfQMncNUD9GcD2SBLVXA2G8+Z7xoP0eN+J0WM7fL2EeLcCLwnQ14YtDsdtOz
         iBK34UwbwrA9XhIFRMnh9tHadCzt3PJ6wHXe8/ugO5wmQ8cgw7Zlc+7dUYo/U6981hhs
         N5ufyJCsNpmOGPJNILGHrEMu/zr4vhGZR9/O4yGwjD2w7IpKCxEeLdb20aRkgrz0Xj8k
         Sa3uBCupDqgYWfb3Kc1oPW07fsVyk4PlgK3I19uK8Ollp6DBhvfybtdTm3yzwGf/fKAw
         313A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301861; x=1730906661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=simIDRgpNIogo8rlcxsHSl0Byfsdzt7txDP9IEyqBpQ=;
        b=Na13+fpPyfPm4tsktqioF4PwQzjc0qtlE/VKvohnJqAsabczEyrES89RoQF3tpmZIx
         n3DktMsJfMADLh0YCMvoyV9HXnWoSKoCZrwdDkTeKwzfXyn5UbbT5zIS3AUQ85vOeelc
         wP2wX5sCQ9zdLPwiV9JKd0Faj6qS6k5qQKnfw1S4mGglQpS1H/L0TvTl5mP0xvEBVx7Q
         K2MDV1VC0AZUYn4v2xQFghL/PFVGYsJw6arRy2FVx9VFWdnZR6JesDI3m3vgYKOvhd+E
         4+1rqVfj6x17tdCeJj5T+6afTOw5MbC639Yp16zpE0MvnCU/1mriiRKgsOgDwjZ0P/7D
         7dBw==
X-Forwarded-Encrypted: i=1; AJvYcCVF4rkagxPH1UCEo00CxZKmTvPa45GvKpX4wdAa0ELLe6FQeIWMV1Mp6/WcBQbTvKqmXzBD@lists.linux.dev
X-Gm-Message-State: AOJu0YynDDXjf7buL1JPnsoeTgOsVODsBzNtP9Sf7+p6r9Kxr3yNji08
	a6kQ7rMgjephHq7e80JCJQlUdfT7mnK7anuoBifI+KKTE0mxuiiMUe+fxfhnsJhlMSwR3ocWLZU
	+HG9bzmeqQASshvRfj5ybMNxZ0tY=
X-Google-Smtp-Source: AGHT+IE4gyDMqwRdbc7hHX51MJvkoKiADiZ7VWRVyXvrDWfOZoF+Anaaz/unns94k1ZD5ofwBDuthn9jLfGYzBCvxfM=
X-Received: by 2002:a05:651c:19a1:b0:2fb:5138:a615 with SMTP id
 38308e7fff4ca-2fcbddfcba6mr82028751fa.0.1730301861242; Wed, 30 Oct 2024
 08:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com>
 <CAJ-ks9=8Bo94Fg_By956ce8X0r-6xBWGO_Ka+rCQ2h3tF2nkRA@mail.gmail.com> <CANiq72=2ALWH-TeHH+=YEmkWw9CEyNUp5EZoBFU=xvqewheeWA@mail.gmail.com>
In-Reply-To: <CANiq72=2ALWH-TeHH+=YEmkWw9CEyNUp5EZoBFU=xvqewheeWA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 30 Oct 2024 11:23:44 -0400
Message-ID: <CAJ-ks9k8S3g_DaWYOdLs6JYr32OZfexqOoJ3XNf87HQ221-JZA@mail.gmail.com>
Subject: Re: [PATCH] rust: warn when using libclang >=19.1 with bindgen <0.70
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 11:22=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 30, 2024 at 3:14=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Might be time to rename this script - in another patch of course.
>
> Why?

It seems to do a lot more than report whether or not rust is available.
