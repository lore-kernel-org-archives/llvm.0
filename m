Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389CA213EFF
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 15:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730301722; cv=none; b=KTFm3pwtJXuilrmPXpOJytLCIUiCu/cHVVabpwLVLAhfyxCePJW5GQNxVFUiRb1BOoK6JN/IbWcq4SLRVOTZZBnX0PL1SBtG4P7y/ASO2R2M0OWGqxFyjONRY/IzZdUMPC5haPp0Pbu4/q4mMxMJwh7GyjoNS05cHGZli0G9yjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730301722; c=relaxed/simple;
	bh=JydzLZhqjXRCq7g2UKg3bYrwl1nkaOaLwkN61TI7YMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmlrIVZ2yxhyoQVzGtCzpAQA4aioL5I/ec/WW4aXG+I1fDHRUp0tI9dpFLm4mvmDCyvyQEhP3tUcO5adFKkwVL1+iWzJJlvuSvRM+2NiZ99BWttsdbx/V9mAGjJZ5JjyMGet12C5dWXicV3aLwGE2LXQiX9oOBBHNvKdwGQ/LQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgfc3mKd; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgfc3mKd"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2b720a0bbso1294622a91.1
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730301719; x=1730906519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JydzLZhqjXRCq7g2UKg3bYrwl1nkaOaLwkN61TI7YMw=;
        b=jgfc3mKdhIDlORiMNJegFY9n0cTzToKrljRWNVx0YWnt55J21MJZA6lZZVGgj33vnU
         7uskFdbz4VXSslF9F3XCZouP2KPwUHCGfBl+4CGKZXYXLj5L25jj2EH4Ras5L6GdcQVp
         G90bmnXE0DaWyhxxfFzhhUbEdtX52EFCJNkOU28mynDXxz/TxcLiOuhXOxI1rUpgqN34
         GpiGpG7QW7p2vrqslOc4rFOnr5KywkdLR1j98PQ0Bhut3Yty9Uli+cSbNISQyKdvHbPm
         d3EUv39V2UICgZGHLe9gRI+83rQcgyR1AHfxWWwY88D9oufWjrTg97L8qUSu7189DJBH
         Lc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301719; x=1730906519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JydzLZhqjXRCq7g2UKg3bYrwl1nkaOaLwkN61TI7YMw=;
        b=i9n18wiohopbIJBaHcg7jZ5PCBYgM4QgkvpMzdswT1HHo2mI/Ykwam8+03uwO88WVS
         6lrMICYYWd6wQKqicsKgrtXJBG1Wf7UfKy0/c2MZTAOIeVzjR5ggXciLB7gAOi9z2MBU
         BGIjzpKdfNrlsOTJ9P1U8kmwLoS6wIZFK3PUPZiZNP4bPYi51UpwAXH8MgDzoEGu4QcO
         l/eEUpGWcFJTfvE8GZZiUgXuwe/jIeFHBXaUKB+8R5pXbYcQozeg16XFrfF3Oef7QXLF
         Bebzki3Op8o4+TZUV/r8IP+65n1WdTXWLxU2oyqcXnA68mP6J0RztQKuYKZsqbOPnCvP
         yzCA==
X-Forwarded-Encrypted: i=1; AJvYcCXTYwVz35zD7kyaT+0CEpp5Os5d9tMti/n09Hqam5dZCnD5bjYDR9/o++/9NAwsXOlY7ehU@lists.linux.dev
X-Gm-Message-State: AOJu0YwgLEGAdahU//WlM6Jvski94nknvsJQNC4s6VX376z7Xgcrj2p+
	4irqzNcivkXLlvTvYNC7ikPkdXEQTtXAXnnElYapcv+gUxUpClDD44z28+nbMDfmr9qxAc7Yv94
	bJkdA+lgynxIk3dTXtp0p4kG/LZw=
X-Google-Smtp-Source: AGHT+IE7jQ9WRHLpkOeR/LklnujY7N+PY2iPiiVk3DpZpglLmToxZygbsk3WDUR68evZ2V+qIqnlo6o+Rw77PFprrVE=
X-Received: by 2002:a17:90b:3b48:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e8f0f4ccbdmr7999916a91.1.1730301719568; Wed, 30 Oct 2024
 08:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com> <CAJ-ks9=8Bo94Fg_By956ce8X0r-6xBWGO_Ka+rCQ2h3tF2nkRA@mail.gmail.com>
In-Reply-To: <CAJ-ks9=8Bo94Fg_By956ce8X0r-6xBWGO_Ka+rCQ2h3tF2nkRA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Oct 2024 16:21:47 +0100
Message-ID: <CANiq72=2ALWH-TeHH+=YEmkWw9CEyNUp5EZoBFU=xvqewheeWA@mail.gmail.com>
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

On Wed, Oct 30, 2024 at 3:14=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Might be time to rename this script - in another patch of course.

Why?

Cheers,
Miguel
