Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A55155303
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943311; cv=none; b=JM9U8ykLWyVjljMndnOXeEblln1JCPb3AO4JO+zYq93LuP0uZrukBSqDfcFkYNnHkyLoZcqbfQJcK8f+ECtiNF9FLVRwphw8GBCmCKL7iZQX6zV41vequ3ERpsgEXRy+hWTkalBP/a5CzThkFFNwavPj2Ld7MZh9XU/jXSxEFj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943311; c=relaxed/simple;
	bh=w0eH7wHm5QrllrptMfPJ9Ae95nzstT4bo2M9ylaeA54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKu+03eCBJbOukQWgvUxw2uKhPXfmmggCBQrw+pHuQ6xsZ/de6aMgfBwlsRLWvXAL/mRRycde+9yHajMmZ4iLcWjWeqFj+TvtA4+VHwXERecRt1S4qaJtGSdXSoCda06c7YZPkl8MpCvKeMQ5AlpQtngpvt8UYsyaLQz1ExEwpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmFaf+kH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmFaf+kH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c7a14ca26so2449785ad.3
        for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943309; x=1729548109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0eH7wHm5QrllrptMfPJ9Ae95nzstT4bo2M9ylaeA54=;
        b=mmFaf+kHRrUnA2vZq4grMuqk1gpneNFTXDgwZopY5rlG+vEEjbLwiy2Ni+cWQ4BgR3
         vLVNfXR+4NAWRDDbUG9JMz7fSfLA65gRDaBLasQwv1NXas1S2Wr7qoZpHLlitT+9V3PT
         EeyCsRngt94aKhR0ZZik0473rBhdrGGj/HKRer9HBCkjoWFX3h8ZfD13eDOKlThfTJQ/
         mWeFpZM5xcGwlR2ue0V1pHHQFUdsyQDsuBhjRDo+JoOdb1rJM4cQQ1u8+BS8HgVYz7HB
         DBA6Lp0z2d0BUXK5ti5KieQ9bMsjvLzLTdDakVqd7WZs+ZofpKl/sF/WcraWijdlwixl
         Gp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943309; x=1729548109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0eH7wHm5QrllrptMfPJ9Ae95nzstT4bo2M9ylaeA54=;
        b=kkKK6H0phO2r/PxDnrfz78GZTIYbUa7fk1bwgOPRbH6pWJSQVehw/MxZ5H1QZI2BPE
         z6NykGedj+ZutqwTKKqQG52pr4FhenD/FKx5n5LsNyBC2x0Kpbr+p5XVLyIHBjlMCdzE
         BDMVfjFRPqJbUY4ivoeRIaGpW3laehegl2qfjphzSgp6UeTAFyYORCziwJMfdWa6Kjn8
         Ax7Q0c6IlOwGzFJfD4M1hcJb9P7ozhhNbtdhpfVxKPWLjis2wSYspkLjI5kaaixM98C6
         1ca0DDfHgCWbK84pv+DPXei5SCAxwNG1qDoI/bwCzL2+cZ0AF2nkE0GrFzKsLeyvg+tn
         Dfkw==
X-Forwarded-Encrypted: i=1; AJvYcCX7TVraZ5QB2mbDa6HWdU/hcJaIfBTxujlnbUbW4zAG32CAqcxCfgTuNK12hpaACb8l9A28@lists.linux.dev
X-Gm-Message-State: AOJu0YwkPGMwS96wqBjNp142YPfpVsSrqrTIGceFGPQpvrZk/fvwCrX4
	k+uo8Gz56jtrJDY9I7Lx+b1b6borub9CSAsas3HPUf1Nit8Dc+bloahtYtwWnIp55PUPwI2ryHC
	D5vhzFd3xjn8QGobHwfdRYyDCLwc=
X-Google-Smtp-Source: AGHT+IHnhxAVDkgOT+mi3KUK6Cy+WclA3bv9+kx3a7Mh94ckcLybBH6zumPddcBSCiixnkz1eRryDdvVpcVyG6Fobs8=
X-Received: by 2002:a17:90b:1d01:b0:2e3:1af7:6ead with SMTP id
 98e67ed59e1d1-2e31af76f40mr4797130a91.5.1728943309364; Mon, 14 Oct 2024
 15:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
In-Reply-To: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 00:01:36 +0200
Message-ID: <CANiq72k9h2iOgmfG82RPtq2EzwhRhh=GUDm+WF0PJPxPFu6B1w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Normalized CFI integer tags Kconfig fixes
To: Alice Ryhl <aliceryhl@google.com>
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

On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This series adds a config option for the LLVM version in rustc and uses
> it to fix the detection for the CFI integer tags constructors bugfix.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` (using Gary's alternative patch) -- thanks everyone=
!

Cheers,
Miguel
