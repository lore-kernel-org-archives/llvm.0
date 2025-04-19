Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48086A47
	for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075585; cv=none; b=Sw5aQt+wSsvy7sU4lzSTYtRfgiOI18JZldTuMkFc2UphGLRh35O6LUR8Dc3EAG6xgnkK1bURfm6QcZSqpMqUvv6AdoeyH1fyAYimn7e9ipaCUp6PrDghO7/SNj6groyPKskvX/Pz6nsn/C0IkLf3RjwrMfPBd6qo8yGJlt1x638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075585; c=relaxed/simple;
	bh=AWWKKzYmc9IVZA3SgaMZf0tabllSk5IbLZQqzMMobPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzzhkWWvZqhL6cRHsIr11qgHXp4kkNEFJNo1NKNbf775/W326NLnkPxuTaJWJdkRQYIJIBVFNwC6T6tbbBZgleWU7FwlQaZesch22W4QntDY3ezZTafWb5Px+ffBU2DxpgDB7Uc5cAvV3WuoEkpdcAObryypBaHo27pLmEdgW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykvna4sQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykvna4sQ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3054e2d13a7so430668a91.2
        for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075583; x=1745680383; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWWKKzYmc9IVZA3SgaMZf0tabllSk5IbLZQqzMMobPg=;
        b=Ykvna4sQ2a9ru4sfsuoe7uw41KDAaWxuIL1HsWkwPuH6ld6QpwEsodLR2KX7JjOvux
         m2P6/yjx6+yZ6RYVX/ec/EWzJ8XAl7k9w8XpcyeLagZzXAnXzqs/2C1iO29/1IONlvie
         T3Cwhpnqtpj3ALaSDDrX0WpmN5oODkw0DS+eHBVoPPC4d69GcBnQuSGOgeRst3iQ3jsg
         xrk7gFsY9/+y6FjsCwOITAkBwC8rgL8eYEMKek0AOXq8ef2e4fF0vT3dzYNttSJBdl/v
         Thj6t2HJgbwv3n1BOUpLweMkS4A/JDbObDr5sepgRQayvocS7wXNXqVLHoLAURni0rZp
         8+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075583; x=1745680383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWWKKzYmc9IVZA3SgaMZf0tabllSk5IbLZQqzMMobPg=;
        b=vCDYQXPbJC3UhZPMv66iatrCB1n0R7yHScnetIP8d/VhiY6pV/D8kjwA39uoOHeEU4
         /sGaA5PvYKxKMp0nlsTomIfK1QLr/7aehu7eN3Dfw9qwIOlvFbrgi56jbVByLdzgmchX
         0pNKxGjyGWTI+zQpOSI0fYzOPD1/cxyk32II8IAalJwnLaE4xte4ROHhMLt6rGeTeIc8
         6/UhzU57nNR91A1MZ7cXVQEK2/cOjNPfP7HCoMFrU8mTEMtQFXu9PweZWTTHP33rsazS
         LpmgfqDF1+MELNz5ctGB57gYn1q2nj1gLBOyptwZC0fGLTc6weHeEOPKAkU7LhTaTHkv
         1DLw==
X-Gm-Message-State: AOJu0Yyr2v1xJBbOhk5qZMBAAnjOhokrCCkPa82gJ6mUSMHiWka2SURU
	rTFCp4FE5yoUzdr97ErS3ZmmlsU7BfH27c/E6QL/jRKphJRNxCkfdXJtMIHdpMb/SgwXddw6o4X
	y3xx3bztCtm8elOwL5ryncy+UbeA=
X-Gm-Gg: ASbGncvDev8ey0eQ4nEVUOg6P2dH/m38li89IoJpZQyiT5OS66FkUDAt2Mb6V/ZdQlY
	lCbQ15xO6bl4HtWM1/CFwoZ2L0OGfkWChX1JsDWFIw5hXuBjT+TeH+usHC9+pX67yUNP5mDnSUk
	ejMpjyTX+0VZWBzRKyYWta+Q==
X-Google-Smtp-Source: AGHT+IFy7kXd0JqlXptok6RmBFLaRWEBkMjR7nEvMBdI4nHtelneF8i6wJ+PqkEICbTjQS8hOWXQj8vTsrvjZ/uwLPA=
X-Received: by 2002:a17:90b:3851:b0:306:e75e:dbc7 with SMTP id
 98e67ed59e1d1-3087ba58fb6mr3524690a91.0.1745075583514; Sat, 19 Apr 2025
 08:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305202652.GA2791050@ax162>
In-Reply-To: <20250305202652.GA2791050@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:12:49 +0200
X-Gm-Features: ATxdqUGdTQDpPBTYJdSCg0gsZLBOl3nBtXsaLNgCQc0u3vhdfwX1jWlcvlByDpo
Message-ID: <CANiq72=W7T6UW862TZ-c0+Ygr_VxOB_q-WBcL_yjeoJOo9egAg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.0 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 9:26=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 20.1.0 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Build-tested with a native defconfig+Rust x86_64 build -- thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
