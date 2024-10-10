Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0F1BF324
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557903; cv=none; b=Fa4otDRpI3HHiABAcwGOfrRpaBIBOrYwf7odGs/F4ON2Mj6ey7rEAdJvGzJ59Bn8iy6XFcureQw7lopAWrXIuQVpS0znutaEj3CzGPRzh1QAnM3Mze6MuxcHoDQ+WvZqSbyZFx3YQwS7Jaxiqv0cPsfS342zKaUtPn99QRxcODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557903; c=relaxed/simple;
	bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SE3+O0q2dhudRDRPvcKqppLTluwU7er3BUmH8jNH7ycfy5la55U5D2191w+RX/KzGVYdKWczUzG48YGQi4kDQbfaKe3QA0c9zkXB50DFzEboEz6qDEgpGMpncsv5GO3DTlGZk2ydH3ulS1mUPfSfOwSpLXuWSFAXPhjdBNWPVU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=du3i9HR0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="du3i9HR0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d3ecad390so1057838f8f.1
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 03:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728557900; x=1729162700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
        b=du3i9HR0zElTyRkF2Y8tuiovLHjcBt29zIm7c+z66id+CoU2gOVJ2cUn5b0TCPKBkE
         WGIV70Wkl2kDMuReferekSHPSG/GO1Id8vLot863jscpISEyFGP+1xMzqhy9LPTFfAPi
         3vc68/ONc9LG2YHt242WJqqLHd+juxa4E1NDA6k9GbBvSsY7V0WEHmxJv4xih62S2A3O
         fsmW9xXg+3CYxnMuBsbUpJF4k/qIMgsec7cFjVRSVJVD7/6Q0EaPJ9FWFlr9Y3GNvvoD
         mDVEggLgz/gQkLjrsIlyZ+WFkBCZcANIfk8hfTBm1ZyH0F5b6UNgyznNBgGNDgn2Kcwo
         niPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557900; x=1729162700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
        b=Kln9L54WBuiqwPqIqiY9RxBjlog9yPOdIXQZ1RfnZy9trbB94iRJ+66pNCHexxn1bf
         V+pfi8vm0mU/wiNGBF89mEL5yh3fe3v1gjZSeGsRsttD6YMjXqC36s0EEhmSStKYwBAR
         C9X/wAU58ZcyGY9kyE5dtHibFtRBlN31vaVm2q0jXun1wxJwhgEKxaZZlD609dNa+FXp
         uwHR/ydjC+1Tvf2xQahe7Qcw/dptFRvk73LQnkgzurePOyvP8XFIaCdYrUELjMBnRqyy
         aRXE5wsaFYgSh4Ymrv7w4/sQMWPCs+fxuwAXQdzC4WCJTHCHstix7Cxe6C+GEfG/pu3z
         K2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVRtLuSvxIkEt4udivUmwiT12dD0zRQz+VFdzH8S3kxA+vVczNH2euYIqWdE4gugV2odboe@lists.linux.dev
X-Gm-Message-State: AOJu0YwtMEwDRw46e+rrmiCKOdv3pdtZm6QF4KB4hTXVkSgmSBpdN3lm
	WvjKOl5mi7j265ySDDPxhl1TpTZII/XMKiHjo2A1/c9OcLLyX8bjiSP0w3u5vtrQtfxY+lcpvc7
	s/kNXTWhXYdFn9//MlicT45qZKtLYiRuSlS65
X-Google-Smtp-Source: AGHT+IG6zteYy0eiXshByN3a31ubFooYapYA71mK/l2zbvcpHK0YoSgYWnV/kyVCloGT0HPQCGElonWjcU/HzmR4ZZE=
X-Received: by 2002:a5d:4092:0:b0:374:c613:7c58 with SMTP id
 ffacd0b85a97d-37d481d300dmr2263009f8f.29.1728557900384; Thu, 10 Oct 2024
 03:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com> <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
In-Reply-To: <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 12:58:07 +0200
Message-ID: <CAH5fLgiqwdKgEux9A-SFAWmhbosW15Ey8j8deKtQa9r336vXZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:55=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > Each version of Rust supports a range of LLVM versions. There are cases=
 where
> > we want to gate a config on the LLVM version instead of the Rust versio=
n.
> > Normalized cfi integer tags are one example [1].
> >
> > For consistency with cc-version and ld-version, the new version number =
is added
> > to the existing rustc-version script, rather than being added to a new =
script.
> >
> > The invocation of rustc-version is being moved from init/Kconfig to
> > scripts/Kconfig.include to avoid invoking rustc-version.sh twice and fo=
r
> > consistency with cc-version.
> >
> > Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328=
985cdf33@google.com/ [1]
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Alice: when I apply this, I will need to add your Signed-off-by here
> (i.e. when handling patches from others, you need to add your SoB
> too).

Oh, sorry I forgot about this.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
