Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B23D993
	for <llvm@lists.linux.dev>; Sun,  7 Apr 2024 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712520212; cv=none; b=RmWPZI9SLBz8FApKgkTm6rPLVlT1Q+1nK8xr2O2bZYikoczT5Wp65cWdR2wYaJUKmWQCOePaR9FmYKaEIkbQPOFkmDsZyhiqeenQrrmGbXdPYFAem9syVtlEJsiExMWP/pbr7EhvuELZpXNRIuVKTcp7KN7vuGWuTUnPsq3NG3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712520212; c=relaxed/simple;
	bh=zzYff9yQtgJXPQgk/ATjyS1y8lhCcN/zh2bqNrpQlq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTnQoS/Mqx6OzCNkQB+NDIIWkFF4KB3IJinCLaGC07nCfjlw/23VXaqaJ4HQoC1mm7GMvelq7UmrRSxXZFfte9Kip4tIRtaVpaM89r4DwMACjiaauv+AwqLY3d4J1f4Ct0dcFlsv43HKYKj9xadzXDkFzZ6HFyAcFT5wjUIq3R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1ScCS8B; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1ScCS8B"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29c14800a7fso2628255a91.2
        for <llvm@lists.linux.dev>; Sun, 07 Apr 2024 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712520210; x=1713125010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfMh48UYa1lhTnaBkcMEl7zleuPMjILYPz6KbF68Au8=;
        b=i1ScCS8BTKJeJvJed21eoPcd2sJQgPNk9takcYYTr+h95U3CVrre8y9ahFiQNnMlaM
         OJJ5uzBrHHVk2dsaA1+nM+3mkKM4rgk4MoEDgOoOKOETtEYj4fNPheQIDpWJLqsbFxNe
         M6Nbpp25e0O+BcNbBnvF1vgB0DXDJ2+7k36Va9KfYAy9RTz/S1p0QRouyNDW2MXRk0q+
         SMU/0BGDbG/5F+ZH6QAzRCy6kagFLDMdnPaWEH+kw9pMYpV4MsIBxQZDMelUjRINE+MD
         DcSAdBiRdiGdiMzMMMBC8qgYeuIcvtTRmd/wQDTvIxzzjv7k+/IbPXt4cM8hcwhOaw+D
         cFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712520210; x=1713125010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfMh48UYa1lhTnaBkcMEl7zleuPMjILYPz6KbF68Au8=;
        b=IkQxA9M6SZG1SZBWX3Pv4iDozaoMf2+Z/EA3CghS10Hzo16HvfJhk2GjhrdrE2AjSg
         kLTEqmDB6pldfoLv4l54fW3l/iw1UmAA+nPSA4CsXmlzZbg936+mKexzLLcu5ovxJiKj
         pLcY7kwIy0RZyNcZqAFucr7LnvgQYs9SLPs3A78cL5x3eNCyTRz0o6QzdrLANUpmGoPg
         wNDqME2aV4+3IIB/bactJUEgkHqP91FrGDu6B70QYhXhUMafAtcuTKljm+jk2sslHgtS
         wqtPsj/NDYzmo9lDDzH3ukgNw5KzvmmgLEUcZxFQw782yXXrDatDCWtqupcrZVoawxbw
         jo+w==
X-Forwarded-Encrypted: i=1; AJvYcCWrmlVdRV0OH5IrRHb+LuMSFU7pBTyMg/K8iCO0L9zDGRPYZRpWjeVsC4qj1LpTPlgSiODaZhyge+S6rVzw0XYMsae8gw==
X-Gm-Message-State: AOJu0YzWs1EQdS/aTEROY3vc/nZ6sV76Mki6+cyLws/kUlo+LVrFixcq
	33wcuu2Ukki1LHi10ydnPPePkt2OhpfY7pYGy5TDc1VBFQCRchWhR/xWfnToIwCkv2HsXTCt3LI
	XEmLkVeBfSr9PRLngkJOuMRovLXs=
X-Google-Smtp-Source: AGHT+IEIt1Lru4k/Tnepu4IBYtQBsXst4gyHMFJlhgjYVHRQdcRfEYeE8aY/BvrRmgDuYCRzjKItROgB6OPb0gkL7mQ=
X-Received: by 2002:a17:90a:4dc6:b0:2a4:f53d:e732 with SMTP id
 r6-20020a17090a4dc600b002a4f53de732mr810440pjl.13.1712520210362; Sun, 07 Apr
 2024 13:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
In-Reply-To: <20240404-providing-emporium-e652e359c711@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Apr 2024 22:02:46 +0200
Message-ID: <CANiq72mUGAXj+ajfojfMgOD7S22Q0Y0Y4QCTxNLoNxwCSpksdg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 4:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On RISC-V and arm64, and presumably x86, if CFI_CLANG is enabled,
> loading a rust module will trigger a kernel panic. Support for
> sanitisers, including kcfi (CFI_CLANG), is in the works, but for now
> they're nightly-only options in rustc. Make RUST depend on !CFI_CLANG
> to prevent configuring a kernel without symmetrical support for kfi.
>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> cc: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

[ Matthew Maurer writes [1]:

    This patch is fine by me - the last patch needed for KCFI to be
    functional in Rust just landed upstream last night, so we should
    revisit this (in the form of enabling it) once we move to
    `rustc-1.79.0` or later.

  Ramon de C Valle also gave feedback [2] on the status of KCFI for
  Rust and created a tracking issue [3] in upstream Rust.   - Miguel ]

[ Added feedback from the list, links, and used Cc for the tag. ]

Applied to `rust-fixes` -- thanks everyone! Please feel free to send
more tags for this one.

Cheers,
Miguel
