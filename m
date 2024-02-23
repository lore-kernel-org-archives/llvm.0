Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EBD6A000
	for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708699202; cv=none; b=B7A8/+7tLG2eDBrjhvtqFIy1VM+D9/ROO5U1/XbnjFmtPAsMwAL1QQhSr7ZCSE2BHPhbw/8O6HUSllX4Vz0ES5bXeqbbBN3eJjBOYYVEi3y0g74EsH8lPltnQjmcrQM0ms1MS4zxFLF50886QKHOPF3l6cHOKIPIdx44s7Q30nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708699202; c=relaxed/simple;
	bh=F8ArNbtydFiL0D6k2+Q831xONNh/JINNubofnCWr6EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j59otzoiD3MoXlyaAT9Z4BqJHQoSuhlh4i+wO5VrClLIfDy8gDHexr+CSEta71KEQVpAY4Vhyd+HNfePaZC27SJwJYJ6tikK+GMlJVGfkHwlF6EXFiy8GpGazoSndBh6wd4CO7qRpWrnjA0Z8qg5WR7p/dRV+6eoUkGtIifizWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl9Pf8ul; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl9Pf8ul"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e4ca46ab04so251044b3a.3
        for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708699200; x=1709304000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KymCeXAdOwhnbLLu7sHJyesb6UapRJI/5wmiDLXWjq8=;
        b=gl9Pf8ul4o8abr28OFWyVFgc2bZ+gbP5cj+7YuxN6fUWkiWLNml2ifY3IRBemHAsOH
         Sx+3HJIg9AvCBatX0K9RNPpWKJOEmAneY2cd4orRYRXhLJVB+fPiO3RlEFShpNEfqLPC
         b/J/5Slzdzm6LGFlfmAPKlYFKnCB8XWbL6NMjQJy0ZkPcyPsYpWB9ciZGePyKoCH0S5d
         LkVWKwuRx2o3RNgESSq5v5clVIXvyhM2R7GRvC4LhjlMiyUqoivZb91Vgp6XLI1Y6LWh
         SDRNMx2WIg0gnO/kJ/j6lghFWidsJuXv+IeJmTfmpzRVmz/dLqkKm+g8xUGd1iB31NJd
         cV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708699200; x=1709304000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KymCeXAdOwhnbLLu7sHJyesb6UapRJI/5wmiDLXWjq8=;
        b=EYUUu7GSNTTsLJW4PJT8W7hWD0F7GEkkjIlNM0P+RGHR3yWzPuEMSLtHLKeJI+EhNO
         m0DBJloPYnGsyeCRdtuMRaRddzu9kstfEHQ122RRwtuwdAs9kWi7sQrCpRtNiuM0PX0f
         VI56MOv+7uJhizS1/0uLYcxdLUr0oo59CHjJwfV42dxa4POWGUTExGzD6IjWYGZp22hl
         AFZ8bU4ydQJedT4TuXfBrMODPTN+KRU+Z9mR3ke17OcdEMeBOBo/hbRntqBStBXab3fS
         pZRMJTlcf9g9sAPAibZEkKCbrEpYKE4t2oPdjFRxFWf8EV5yasRbAimff9q3Y/i9uvaw
         pz+g==
X-Forwarded-Encrypted: i=1; AJvYcCVrKbj3qldsrVB+HUBgwWa6iRF3lNU6xPOTP0LjdA4t8iYL069i58GZ9CGWU6W4hY31xiga6Hh6GTtdAfSkEX5yKtGqsQ==
X-Gm-Message-State: AOJu0YyjMmoae4RdUqjLbAbTfJvOAUk4vEWyiiidIMDPaKFoOZQwETL9
	5a0fmXdBrktZ2Dn5AI2vFIZE4E+ShmvQBprDkSW8O54O36D1p/dMefFoI9NBbxCOiLn+zUuI94o
	gWl9W8OvWHykfviP/W5AEPDhVL0I=
X-Google-Smtp-Source: AGHT+IHwDwRlHf/VCvl3JY5KZpo2YjDUVeb5So1ID2OBba3Z4WVPb5UzKpoEEDoA/9Zp+8R5HJYMwh7wafY2OKOm9SM=
X-Received: by 2002:a05:6a21:3943:b0:1a0:5841:6756 with SMTP id
 ac3-20020a056a21394300b001a058416756mr81570pzc.4.1708699200297; Fri, 23 Feb
 2024 06:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
In-Reply-To: <20240223-employee-pessimism-03ba0b58db6b@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Feb 2024 15:39:47 +0100
Message-ID: <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 2:38=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Add the required bits from rust-for-linux to enable generating a RISC-V
> target for rust. The script, written by Miguel, was originally a
> config file contributed by Gary.

Thanks for this Connor!

arm64 is sending these for 6.9:

    https://git.kernel.org/arm64/c/f82811e22b48
    https://git.kernel.org/arm64/c/724a75ac9542

So it would be nice to see if it may be already possible to enable it
via a builtin target + flags instead of the custom target, e.g. arm64
does:

    KBUILD_RUSTFLAGS +=3D --target=3Daarch64-unknown-none -Ctarget-feature=
=3D"-neon"

and so on.

If it does not work, it would be good to know what would be needed for
RISC-V and put it into the unstable features / wanted features list
for Rust.

Either way, it is not a blocker (although you will need a rebase after
arm64 lands to use the `target.json` in the right places).

Cheers,
Miguel
