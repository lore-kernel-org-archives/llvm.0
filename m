Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87C21CC47
	for <llvm@lists.linux.dev>; Sun, 14 Sep 2025 23:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891959; cv=none; b=W2wo1JNdVonqs73D0AS5+o3jAhDcwwPYH8wpyhkft9bdTsTybd5z1gyEjJ61F/qrAcS6dNOrRmWggfhh9UocUKGk7B25zVKcbOzFtZ20Wpwsgib32MAFXUz0Cn08KCc9G9ozlxuhtpF2FZ+UnEJ5HKszVwn7hW/RqCivVJRY3H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891959; c=relaxed/simple;
	bh=omcPYzJjDcbZzUlVphuK5HmLBUOUCLdxi4R3x8sDZEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBsgnwhF0lR4aVigsA9Zw9Xr8JlLe9ZdUAcasu3tp9yIPHn/YvT9YKIGzke2xKRXTMscpRhqKSH67z5pRLwaQUWTqVsMTTD5Igikcan+DKReEPi5+PQfdpw/if8F+PIMffZ3mn5Xm6MLsXXs5ZgBTnxgEQqITOIvTZAtOeqOCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/+ZHGIr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/+ZHGIr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-264e0729c4aso1989205ad.0
        for <llvm@lists.linux.dev>; Sun, 14 Sep 2025 16:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757891957; x=1758496757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omcPYzJjDcbZzUlVphuK5HmLBUOUCLdxi4R3x8sDZEI=;
        b=k/+ZHGIr2fqR+Ppn7rkf+0kgD+zqCNsFVigkOAf+rMIn7+SOphxiSSm+1ddpoCbfK4
         xJ4+fUXs9uw7xP3eQ8P6qeY2EGM/h1122BSCNDXMLfzMmMIial1X//I1rvs5tF61JfMh
         cMWDpf0Q2muzZLmR4PyKB6X0Dlum/0pCujufenN9J7LGiwzkuKpPOT+4JIDQKE54df4o
         WZL037FadHCBRXJucrtlF23dBI+wD1gZXrwmIcZPijG9efRGGm9dg1aEVlSw6UwSghn/
         XnIqf8LBbsWlu+UBWVyOTJlsvrVVmheYSLi2pI2B/MajQrQgyEjacm6duKdeveQZbUzX
         lw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757891957; x=1758496757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omcPYzJjDcbZzUlVphuK5HmLBUOUCLdxi4R3x8sDZEI=;
        b=eWQgmWzBvxJhfAlfAw9GOc9yry9nDQXXoaSfPNkRxWPMKp8teeXP8tw/wA/WMMaCrm
         tWlUXS9O+RpCSTBMLkVpSuIK+wBDT1ZMiHpCZLoIRAXB9G2brEc8J2IkjHhE0fSJWYi0
         7ympI3g+r0EUWEipH9dFcBxIrfe/NQwWHPrmGK5J0IfRiBsQlmMDAuI1tcivPGYntdGh
         dussZqpj7fcawD2z2eX1hgUylCF3dElV74oZJzvmsrJ/slKeE34FxMKz83oixdJqQ0gS
         0D5tHkk7Joqb7Wc00zbQ0uev4R74JVFNOfNWB5XQjbsUlth8cvo3hXcC27R1Ia7IK0Z1
         Fv2A==
X-Forwarded-Encrypted: i=1; AJvYcCVsuEfNQj1pdkMhMlf90HcIRk3oUMtEyiewDTgBF+oUrqRdWI18JXtzzy+C1KdzeYRCA82V@lists.linux.dev
X-Gm-Message-State: AOJu0YxrWS3t8RsVbEa0XFx00nsAZrfrvukFF+vj3RNBxReNNZZP+ZGL
	2k7sNqzWa2iXdO9c2KErcO9nRV1nwkjlzalPZrTzVDrn/4CLOip5o9n15oA7HYuNFa7DamnhsCr
	oF00Qq2IPHoT+FjasHc3tGgYnOQS6dcc=
X-Gm-Gg: ASbGncuaxlcYQM0ESGwtjD0wD7wCRms8uic/Vy0uo5pdblEVHo1mL98PfwfG1bgj2l2
	IPT98WiX43vaMeGN3u0Hzlv6HxnCI5mnQA8Tqq5ez5StSdSYp0zUgMuGmOsTId1qfoYN2s6zbZj
	rFgftx5x8fvk8nrUmo393gHfwjXuQ5kGucoEg9oD3+w6tlYSyl0kuvUT2W0L5CDPzWWJMZo5D9O
	v6V/qVisFr4f5v0g/JwC0otQFq2oVdlhULha1wQS0P9uw/6ZnX7Nu6vo5qO+qRqXQoJnlbGY/3U
	8wsUUI6DlAXcZI/fs5Z0+5Cgy+bLJ9QfzRdW
X-Google-Smtp-Source: AGHT+IEqTWUrkgAg391naIf2SYlobFHRHjDHthJoC1Hi3VAJyaxY3GOaXFV76sfylnD3tU/KoicdHzIBmG4240mViMs=
X-Received: by 2002:a17:902:ea02:b0:266:a65:f531 with SMTP id
 d9443c01a7336-2660a6601afmr14295185ad.9.1757891957078; Sun, 14 Sep 2025
 16:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811012000.444173-1-ritvikfoss@gmail.com>
In-Reply-To: <20250811012000.444173-1-ritvikfoss@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Sep 2025 01:19:04 +0200
X-Gm-Features: AS18NWCMprE13pfkOk_iOgOEovBSGcWOl86_vfy935lEgAyXnMRFq7Jbua59akw
Message-ID: <CANiq72m-HcTSmLrzYsn6YEfHkaSy54=u+tgMwy_JSukjWaSOYA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: cpu: mark `CpuId::current()` inline
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 3:19=E2=80=AFAM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> When building the kernel using llvm-20.1.7-rust-1.89.0-x86_64,
> this symbol is generated:
>
> $ llvm-nm --demangle vmlinux | grep CpuId
> ffffffff84c77450 T <kernel::cpu::CpuId>::current
>
> However, this Rust symbol is a trivial wrapper around
> `raw_smp_processor_id` function. It doesn't make sense
> to go through a trivial wrapper for such functions,
> so mark it inline.
>
> After applying this patch, the above command will produce no output.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
