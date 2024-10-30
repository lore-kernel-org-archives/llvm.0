Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108401EF095
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730302056; cv=none; b=FSd/ALOac1RFVYhZEGHRmgKRye3/b+6b97H/TGCIR8Fdaa8VGFrFODH+M3HyBWKlbLEPifaYlP/5CuakRRwdYcKJClAaproMH4S3S1KI1jvkd8cpQxkxpiyMaJxeAQyxY+1wgGKrgD17ZMxSAkuauLhxkyGHq2gxn4dYTJEPo8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730302056; c=relaxed/simple;
	bh=Vp9pkwaDlcQA2MR5Vk7C+O+0ZH8fUUsq+HZZU2PNuy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZANCYrayfu/a6VxJp2PfKak4HfGm7Nyf2nypeyphHzdJsfzXhWITVm7OvzZdx5CdYBSQwdS/Lgu8k0kkdthvGtycj3hcW/VRhNtBqieppxgcvWLhHwd787q/SS5htfFnQiZ1qwM7jACjNCZl8C2CtIprKtT24xrmGr54jmWFXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbidCFgp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbidCFgp"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539d9bfc5d1so641341e87.0
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730302053; x=1730906853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp9pkwaDlcQA2MR5Vk7C+O+0ZH8fUUsq+HZZU2PNuy8=;
        b=UbidCFgprdSd+0IfvIHH8M/Rw4jZq9Z1YbCGl4pc+trpxCSjZr2nvpVRk/XtSXB+Rg
         mTigRhNgJklOXzOLPARX4GX8yV/PXw3E0d8P7aW7K+dB0HKrIiKR0ZvQJJ+zR/x1nnIS
         ui27gdzuJeET8YNBlxkvXD3bdds6otpX2l9dFetEP6xUyqP989GrlIZUUr1S/WOtpgcI
         T/1IG8e2B01uJGFLoCqp8kbZyZ659+iTFB7WPc0CBfxDnlHOnAim5af4EccwSPdqPa5p
         7Yt4fMzjeLOXnaIk2tKD4ow3DGUPtziixIUwinIKC4JMPoFKJaA2zPGA/Rvn+a7CoHfP
         FAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730302053; x=1730906853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vp9pkwaDlcQA2MR5Vk7C+O+0ZH8fUUsq+HZZU2PNuy8=;
        b=oSL4P2sOXQmT7cf/fDJGoWRbpI3SWbIg76z2VQQDK746RSl4/p3J4KhxNUllGrh3N6
         bZZApwlowrW/gz3xBRe/Ad+zAayymPwfNx61irfSpI6nFYwyQYSY72R6CxFuWOBhaW6P
         bBhAUO89IHmw3nO3TuiDs5Mv7A4RODbkNQr7ApTBrdsBSdwAbj5ztFikfAzxuXdFKOlx
         1E7NpOimMgqz+4l+gBIvoKqtVr7nyHxHH0WBIU8Mmk1MvoxYH5ZxaVtnPkJCTa4vaCdB
         f3oa+8zdfs+LMDYhYjp6sF2DZ4uIcvgESVpk+xcBh7B8ZlJJpkB4EIPjzIABxdMBXZxM
         dGEw==
X-Forwarded-Encrypted: i=1; AJvYcCWhdwBW1Di92+pv6VSMLv8JUsPRIo+fmJ5EX+aKZa+ll0pLjyc7+SXeAtTqYyc8GU0JuTdx@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3t9ietVci0O4c79jrBmQpnzItaqUJsjEqJyIRKcv5kYnhjlpf
	eWjIElBuchVt/HT/zbrzs9ctG25nCpxTkR+Aj9Cg6MxKqw3SShie1CbEkbFShuP3rKu9CIlhGK7
	+QZKaF75EERPCL4iUVhxaxnC9lyg=
X-Google-Smtp-Source: AGHT+IENK6j4uWzMzppluYi0B0zwjvnL0IPEkGkwxe+t4JBumOn/x+9goTnJmpguEkp831ljUYUceXq6ndhNJCFSgRw=
X-Received: by 2002:a2e:a9a4:0:b0:2fa:cf48:14a3 with SMTP id
 38308e7fff4ca-2fcbe062327mr23983151fa.7.1730302052943; Wed, 30 Oct 2024
 08:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com>
 <CAJ-ks9=8Bo94Fg_By956ce8X0r-6xBWGO_Ka+rCQ2h3tF2nkRA@mail.gmail.com>
 <CANiq72=2ALWH-TeHH+=YEmkWw9CEyNUp5EZoBFU=xvqewheeWA@mail.gmail.com> <CAJ-ks9k8S3g_DaWYOdLs6JYr32OZfexqOoJ3XNf87HQ221-JZA@mail.gmail.com>
In-Reply-To: <CAJ-ks9k8S3g_DaWYOdLs6JYr32OZfexqOoJ3XNf87HQ221-JZA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Oct 2024 16:27:18 +0100
Message-ID: <CANiq72nPgYGgtB_H+yJoSsoW8h7p4VvwfeoJL3348f-YpdrmqA@mail.gmail.com>
Subject: Re: [PATCH] rust: warn when using libclang >=19.1 with bindgen <0.70
To: Tamir Duberstein <tamird@gmail.com>
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

On Wed, Oct 30, 2024 at 4:24=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> It seems to do a lot more than report whether or not rust is available.

It checks a few things to decide whether it is available or not and to
inform the user of some situations that may not work/ideal, but that
is the goal. We don't do extra things unrelated to that, so I am not
sure what you mean.

Cheers,
Miguel
