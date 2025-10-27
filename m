Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A12F692C
	for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 22:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605797; cv=none; b=JXchrtUsqfKgJw+q04EQ2g3D2S7ig7zGe982r3W8tTb6GZKHCNxnhFjqGjQnVRaMLdmHqr74wqM07pB1XPv20l2XK1lI3dvS84wdbU/YYhKjFIWDmR8ul99V0VQ883LoCLjFNzmf+Z0pej1uFwQ6CmqkKBFyV/j991kC9ANFFZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605797; c=relaxed/simple;
	bh=bON2espIER1dUwOh/hjOsA45ts5elF1x8z3D4LRtulM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3944qJZxCWeSfrPEi8Jz/hOk8ygTIph7T0GZ2QgNBBeiihwPfRj8gkCiq7AaUJKCcyU7W8YzxrwhJM4RR7zahwp7M4wk/XzhOmb+PR16xklqMzyicsHTY8JoLHrrMjbp2lG2teuSxKVaw7lMf0MsZxpcDCfBB23vKtrVmo60KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S15vw31n; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S15vw31n"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63b710f276fso5256542d50.1
        for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 15:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761605795; x=1762210595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fXrczP/tH9sGyN44YbyszhSBDmNu6JorF9M9mPbTjU=;
        b=S15vw31nNAtLtNsaMN1GSFvtsj+yZkFopgyqsFnB+3CDmCIC/tVe/RHZC5jQMyr1wt
         10aBI8FUDO/NzKfnY7NNusdmTbffqVIQpsFuwkwlZyIXlcHaRy6pZGUOrbfPQ1/7j5pZ
         N0STqr7x1l0ugA/9eoNPJkWb21OaQrt14d4tgWjB5US8QWWDO1pled5QslXVtVzXssXc
         fkpLf3usAlEOu6u8tsxxM6PZ76zuSJ+MmK0RwdIfsfD4jjRmDnRmFUt3g51zCPW8M8SN
         OJssasKWhf6i4+4QFfv/NbGjUBSV5x6zSl0oVh9Vxx/QDb9utBoO4ydht6K39gHm7Uob
         AbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605795; x=1762210595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fXrczP/tH9sGyN44YbyszhSBDmNu6JorF9M9mPbTjU=;
        b=lTfEutwo6xE8yB8/f8+/5quofFaGb5fZmPLquwxFPC+d0Eac8IjMb+HQltfkWOd5Kh
         f+DXarkHSAUw36iQrmGWXJRbZOY0u6dpRNgJ5r5WAFNzThDe4BaFmPKwasdvDW2fD5Rk
         +vC36W/vB5Z0GtOiWN+WODjvLUu5xjwDLXnMN+x3ZIYyrNRosS5414hiDoO3W4zIxhEu
         iqZWUAlRxlhPhEgsYXEE9w//Grh66ixfaKhgmj8HTAKtOCIEoJciTrAZKhA+feicqcnZ
         AglMc11F875n003LbhJBCxk7Fb1uRVDkPSEtMZGHiw5rIm48lnBZMuYMI1gq7Hg1wwPI
         m7LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm32nwsNwIeup3khfrldR8fTmyfkk2qD6W1YfmlGWxWJsITZ98WotbxH+G5hEVEsEd2nlf@lists.linux.dev
X-Gm-Message-State: AOJu0YxM/xInSC/nYu1hzYkWDjgYRr7KdkoC66dV4PtikoZN0ZFP7igy
	AoBr7WrOf5+ZiBF4Q+ib5rnHKHtIHq1w2yMtYDtFF98918Rh60U19afqc+riDbQyYwOXND+zI3A
	Dihk0OztylyZa2V1vIEENolECur96+p6hfr785GYSfQ==
X-Gm-Gg: ASbGncuyI2V+wfwJX7zZNCx5B2egUJQARtKN5wcGbMSAYILtU4/xdSBSSM3Prf8sGm3
	L3kkx7M90s2dAVLMjq/65SWjkLX35An2vNQ9Ndzza/CF8Qtx4I/+h+ngsnCuNBCJcZ9jpBDcix3
	hMxYbUQDnC9G8fkG6Ro568d0ZIDvT4enftSMkhk7rNCXnRHRwHc/dVQlOU1AaQYdrxVQHxBAGFX
	3gRDc3IgEmugP1WDsdcK3/Rk7mBIkqwEJhsRodJ0t9Kp9eDeg2xzOGMoIzM
X-Google-Smtp-Source: AGHT+IFJxZPsBn36jb9IqqtiTCDa4X0Ih3+3+W1DlxJFcn7w7OJaZooe7uHyHPMcjKs42kSUEEM7iqG3b3fxHPvN1mY=
X-Received: by 2002:a05:690e:4184:b0:63f:2b69:9a2a with SMTP id
 956f58d0204a3-63f6b8559e7mr1530051d50.0.1761605793644; Mon, 27 Oct 2025
 15:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org> <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
In-Reply-To: <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:56:21 +0100
X-Gm-Features: AWmQ_bno-qx6koLOtrZwcQNDXGnT81r2Gd96qzGlQrBISAXpENMYtJk71SRHkpM
Message-ID: <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Russell King <linux@armlinux.org.uk>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 4:54=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
> On Sat, Oct 25, 2025 at 1:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > Prior to clang 22.0.0 [1], ARM did not have an architecture specific
> > kCFI bundle lowering in the backend, which may cause issues. Select
> > CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS to enable use of __nocfi_generic=
.
> >
> > Link: https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aa=
cb506cb061c899558de [1]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2124
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I didn't know Kees stepped in and fixed this, christmas comes
early this year! I had it on my TODO to do this or get someone to
do this, but now it turns out I don't have to.

> > +       # https://github.com/llvm/llvm-project/commit/d130f402642fba3d0=
65aacb506cb061c899558de
> > +       select ARCH_USES_CFI_GENERIC_LLVM_PASS if CLANG_VERSION < 22000=
0
>
> Instead of working around issues with the generic pass, would it make
> more sense to just disable arm32 CFI with older Clang versions
> entirely? Linus, any thoughts?

We have people using this with the default compilers that come with
Debiand and Fedora. I would say as soon as the latest release of
the major distributions supports this, we can drop support for older
compilers.

Yours,
Linus Walleij
