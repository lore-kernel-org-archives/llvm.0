Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CED24113D
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 03:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763953730; cv=none; b=mQ780hpv2xvKIOQ4ZckNi1E7NyHDQ5XaNVv9ApEXkPAJoPFnWZeTht367Ywz/xBR1CY4CA8sUZ9iMQ1eJgNxKPt+CDo466uItUq0b80cL6VhHYOz67AYd0AEEmfp52JKVQ55ksrmWWUqmATsWfyElvPsmdt/U91Jryocikvm0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763953730; c=relaxed/simple;
	bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jyet+aqwRft/j1ffdYP9lXAWAM/7gyVydu15a5fH9IjVc5VDsJHzxi0Mboqkls8rFBWGOVlOrVlRTx6Fx7WEEwgKRTCteA+T23Ezq/4lOZS5G2d22Rt1OhXksQ/dsVt+4dCBafz8r8p1cz/bkPaGEEm7uf4DJT8c2MRqv+DNr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuFFR7yg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuFFR7yg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-295395ceda3so4705675ad.2
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 19:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763953728; x=1764558528; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=KuFFR7ygfdwmAxC1mBUiW1WLE+fwFAovB7oeycbug7mWirGpjrEdWx0ILQsgIFqshp
         Mp/x2y1BGIYdifp4t0XPftmVnStOUD1nmsC2bHjkMylb32Xc8Fh9FjLFtG8aAEjk3XpR
         i4bfHwaULLYJDxULz/qv7vFFykT4u95qWj8o5rldId3ABh+MBEcNs2IfaklvBh7g2W6Z
         rwKX3btvAhaZhnpGra18NKrc1ds80QRXQVymd8EL2DKKio+FjrPqJw1uZHl4wvo9elw5
         Y0lxQTKys7YJavwNLBFoIKiDEho+Yy40pr7dkRnFSlkttMe6+U9ORUWnSAaC0FYDJRi3
         clTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763953728; x=1764558528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=Wt2MHlGxG3nfHHsEvV4VE0a1QMkH2UWykn2JEa+u7BWpDhmYvWOVg8jyL7EnKmHHPh
         bewLpcH6Kbz/iQPNpJNR1OF1VLrdK0rvtXk+r5HjKSPKSCGNKMr9yC/XajtDAM8PX8tV
         YZ1B5Dht76qyFlFiOrnZNxD37ySzRlDJKReXQB43Emobs1pVsqGBH1wPeHDz9F2/TSor
         hjufE91g8SJfls8ZAQ49Fdpa0A+LSpxudCB4eZN0kLa2GRGLSYTfYAcO7aCzDf/EE1nv
         aQBDqb8Xl4qfZMzipzqe5VXXiHPHzEpn0mrxrcGPMRHx57Mo9N07dSrNlGLUWV9U7SY2
         aeeA==
X-Forwarded-Encrypted: i=1; AJvYcCV3X4VLibf65sbELT4NwXxavrxnHJY9GhDTV8qewu46WdaJbaohNljaRYfmCcyYiJL7oovp@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4wOs4yfYv7AuUokfPTe4e/nUPvYpNp3tSJws5wYF5Paz2ven3
	iq1rajCWs1O88Vyq6vY9bGCH51rpWskQQWvA7mZ6K57c/ZzDWqlY4/IW/z16StzRA1ar3yY9YSr
	pniL4Y1vtkmkko2fMw6eoRTkEX55JbWk=
X-Gm-Gg: ASbGncs8t65yFbhx8DAnzQ8dBCyrZEDbbUWHvwxXBKIICXU48lMgfT9d2RtWxqfgTW0
	Zvy5npLAFCRzzEK01hMBjYAV4DDZMyO5UGIw8qIpQfLft4Qw8hq9fVqgb8oknpGQ6Qr/Kv46vHj
	JhADhnPFbRw5vmHL+o4Dn0Smq5Wx+TeX/+Bq4ROE5Gikh7cmfcIdBAuPXAGumDz1NwrfprVt5nU
	q8uOIXzAyJoDrabdnd/gGPzJciMZJ6T31/yiUs/IUhFgPBnLZ19xYtExQ3FRrpYmsygK4tVi7tG
	8prJfGzQ+N0t1b3qKxmSWFfleBHMR/UjiS0A7iFwRRzW2fH+S8VfqMs6+6y+ubuUTyY/crPY/AC
	/2ztAVA/SbAUMbQ==
X-Google-Smtp-Source: AGHT+IHODcnccPs9iRgVIOwlcuA2DDRG3ls89WHmZSy8djjz85e63ugOsI0kgj+n0Sr7cHyi8QYJvH0K9Tj0s1pUI8E=
X-Received: by 2002:a05:7300:dc93:b0:2a6:9dbf:bbe1 with SMTP id
 5a478bee46e88-2a719324a83mr5922485eec.3.1763953728292; Sun, 23 Nov 2025
 19:08:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com> <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
 <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
In-Reply-To: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 04:08:36 +0100
X-Gm-Features: AWmQ_blIu7x6QT0VZIH89GBJq9q0tlaW_UfH33KPy6C0uRHf1k8ZydlwBKRhGvI
Message-ID: <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 3:42=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> I will separate them into two functions in the next revision,
> `bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`?
> Which one do you prefer?).

If we don't need `bindgen-option` (the normal one I mean) so far,
perhaps we should skip it. On the other hand, `rustc-option-yn` is
there and is not used either (it was added for consistency). Up to the
Kbuild team, I guess.

As for the name, no strong preference. `bindgen-backend-option` sounds
good, but `bindgen-cc-option` is more consistent with `cc-option` and
probably easier to understand for people new to `bindgen`, and anyway
the flags we pass there wouldn't make sense if the backend is not a C
compiler.

Thanks!

Cheers,
Miguel
