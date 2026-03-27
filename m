Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B0E280A29
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601830; cv=pass; b=PWekxNIzafyOusRNe9QXIwAqrqTehRWsxZLH/0CFEGIJKD+YR1Li4XST/lfcozraljvo6x9rTS+6T91ZY0wTEOlEAkH54PgLHwE/szoFLyQvuQ5kDVEuzSIofPcdy6FuCBmyUFuAtNS3ilPb/9isR8DaulVVqR/2/AA2PucXMbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601830; c=relaxed/simple;
	bh=kBO4iiA32cnxwKGzj+juzvgNMZmd4iWHksmtiGUJvKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpUwh6jRcYyvCE+OV/zdnbVec0GYm9Nu+YUWT96EraA/ZQd+lNQrLrJnkK2sZdUNepLTF73vmwBoSuWkBS7AQ3+R4V5eawajfKq5U+O4U4XsSpJ5zCBtX4eEz6Z6H9cDQUUTF/yN53Zwn2JR7qWokX/kbghm3J6dwf87atCGFKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tpo1G5R+; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tpo1G5R+"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-128eb45835cso108803c88.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 01:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774601827; cv=none;
        d=google.com; s=arc-20240605;
        b=WC/ghfFPx5UuCU9u7I61D9FHKu/xnS3pY4v1K4NW0iTVIC6P4g50v09xCg2NJsIj7z
         pzSeJekyZB4AyVoViEX3cVok/qWB4R3t6hs7RylwXk2ECZq+oDonvlMNxciE5MM09TbN
         /W9lmJkAsJ0RrI/+L39RheLrNWAfHrCCueNx/8ovhXFiDMQJkYRrg0f0XluY/mlSK8WM
         ICeYWCPoJjbx2bCJt0IZ7hXZB4iwRH2qm5mfG4K1HJ5RHNn3CWWeY91uL9Ne1jhpp3IU
         OnF3OAG8Y83wU++ZPUlYmEbbI3QhIMP6rz6jixb2PoYq1FNzuIAlcQRqsWQFx1nX8kCm
         9O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kBO4iiA32cnxwKGzj+juzvgNMZmd4iWHksmtiGUJvKg=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=AVkzitmBM7l65i6krsL6vCw3qjFNjlvB73IRHJ6fC7oanarGqVFbAWjGPBcB4m3ipv
         U4SVDl30z3NA3dIAe9vwuKGHJ1yLvodL+25X4B5CpTcVB/iarLqgnRA8T1tz/R8tnQGm
         V3EEIqxG9olBxd7yK8knH6el35Hm2y/OwTDBpH8qMQH3m7orJ/+sy0t0wESGsWILABQO
         FrovrPgmNc7brqvk1RSiz1MAIM6KI3OJAj0RouDOB0/KelHpsAZtDX9PA1HXkh6LO2VZ
         jhlfxZyZ/8GVvKMtNTaqrKWvPQ2v1V4orK/0zskZ/zPfNI99tWJaaxjKrNlirgGqu85t
         R9fA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774601827; x=1775206627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBO4iiA32cnxwKGzj+juzvgNMZmd4iWHksmtiGUJvKg=;
        b=Tpo1G5R+KMGOpCwD+d2tVprC5uBNscvgb5jnIyfqIYN9fE3VveZfLAGV+SzBKy7zEu
         sNujyr/tVY5TvDIBt6XOzCUIIlCq1FYqpt9oW3HE48MCg9eRg5hqsHo441LBn+n2bqOT
         J9WsLwDC0Os8acljqNu3048onBa6I4kizZc6W1xVs91Bx3NsFZ02nZ2GDyBq+JhwAMkg
         J7ML8dswC6JSUd2hoNtI5ZPADdOxK8gHfskwtQfJ85NgHdy5ilbiA4NOAiIMxrDQTNYU
         N5oL7quQN5I8oNG1l3SEv6mK8uqmqS/r51jKP7id6NxGjh2UHSW4XRNVrokEV6wW2yVX
         BJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601827; x=1775206627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kBO4iiA32cnxwKGzj+juzvgNMZmd4iWHksmtiGUJvKg=;
        b=Tw4D1EndTrd8w7B0psusoMjcLRO/mVokuNPiSoWwhpUNkw0G/caT6nEN8TwXl5oxaR
         v/D6E71y9dTouBB2g3nJfgVpsl0RycYL8ddp7u0P95QVl1TYmClf8FDpypozUyEqFvUh
         Z0zK4vpwmb2CjplthnIZ/wM5A/lJhSXwjZqE17YJeISjLZbAVEHLbzFKKLlHKAN0x8XN
         0h+mzfTEnYdhQeiShVDrrLbID0dnKY1nUQZSOnqsy6f7AcyjF1PUzT+8fSJWIoLfCSTh
         pdeCZkev9jqIhMau20ui33LYNASCVANX4HeIrkH2OmyD/8xVlkQ1Ga9IGPP88ml70zzi
         /73w==
X-Gm-Message-State: AOJu0YzMrTproHzKhuobwPBngoBX2gu7xnTPeWvzHeSdPC4cifQWHk33
	S09LLhHev6rEDAxIV8L3GNf/gDBRf+cJuBeJxxCpaQiiYxz8Aj8SliV0S+ogOYypdg/rawcYyW2
	yqMz9B+tW2BdTRsrMIAaHyZfNJk7BEBU=
X-Gm-Gg: ATEYQzwe48PGL9kPaM97b8jp8q/6xXfkFfH4RZuqRhI+dC108QM4f9mtQGLzNb32q/V
	Os+A0eQglfefLX5gXgCyWD3EI85an4DpAE4DVLVxtYVyoJJWzDQmO+KXETWXR3pllZU8nGI1bH/
	9xUWSP41RZpW/0PC5yHOa3Ds3v0+AywvNaXucgG4eCVa8XmCw9bUShNWAZq5i2ZCgnDOGWe0RDD
	r0WqjA60nJ8GWFoDt+yFDn2L4A9qm3jYAGv4l0WUx1eDa5x1rb2bbVAo3jv1WOAaQZyD31KEM5E
	2z0B6AyQ8Pnr5dm4MkVmDzLR11sFVysnB6fLP44vdSEpfrWqNJEUUcXyIQ30m7z+FDPv1uUjQUz
	r7Pe+a8gu3x/pFQUuNC1kXr2upvCfN//J7w==
X-Received: by 2002:a05:7300:3254:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c185e6b478mr416977eec.3.1774601826841; Fri, 27 Mar 2026
 01:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325000809.GA618985@ax162>
In-Reply-To: <20260325000809.GA618985@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 09:56:54 +0100
X-Gm-Features: AQROBzCf-e2VbK4X7E1SV3PnA3xigEDYgvHGUnmgBxKKh0VrvS619qex1UYpI3I
Message-ID: <CANiq72nHibowuTvFv4oiDjq_asRO_89DNzD1dmMnhiWfGu5WKw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:08=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.2 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 22.x
> series is no longer supported.

As usual, I ran a test with Rust enabled for x86_64 using this LLVM
toolchain for the C side:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
