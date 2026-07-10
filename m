Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5262DF138
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692307; cv=pass; b=HXA6CfSgkhbG9dexYwAfu8y1tMKNDMpXgQvNA0BgGmHS/ZkJtKXoLCNvoj/HLx07Q42A79pJV3Z2aQtrPpy9edblYuLX9NmzIpglZVszgelgCQlaHgJhQV+ki5zC4JMwPazm3j5MaONOQCg9lK+YerYOQsw6+6d6ZVQI8hhbFSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692307; c=relaxed/simple;
	bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiSTbxIQpMlj5YQpz35jsF+6HN3V0pgmIQE2klDFbKf9Q1ENfN2aell7pGgbiMqVauK4IHOyjswlRDRjyWP4nM90Mo6aFQPrjisRb1rILX+22w2K5keRpnlIecIIBd2lAjGNV5xvb58NywtisC/gIbNOOgjFmOMnSlLJoI/jqrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6F4tDST; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6F4tDST"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38096590070so217171a91.3
        for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 07:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783692305; cv=none;
        d=google.com; s=arc-20260327;
        b=FCINQf72i+Im6S3/FrngltNHdMLzBkx1MFqZB3efJHSxvUEu7dp+PSlGVxRELkNDWb
         +/kiz3lg0Hl5wQxC4cK4HATx0Fkj5zHBdZswrY+RPersk1be4fcz0omSJ42EHlCPQlts
         2O2ZCzqimjvmwFsNznyDTnm01GGJBh0mFW01CfLdvrRuK2/9amvorjFtcVE7eUQgKxTa
         /SMmnhRnkXbKXXsx4vSWStiYdOieWFwk+lQ4UzDeeeKHuTUB08U7IxF4MlC/KJxvMH8o
         zEEh22o9xbd3v+N6BPGRZK47VRYSIjNOtYu/cC6xwm1dQPPkMNXvyVYqQ0M2Kepzz5DF
         juAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
        fh=gJ/tf1NxoCB9YzMQ7ZSSyJ4CuOEj30iTJtxbyHVkutY=;
        b=CPl5H8zMOQ+dLYNH8dwFYfxhZcJ2bv0N/vzOd31nLNsD2675Hq5HfUoURQxX4d1hR/
         SDIf6mJ7DR66dTRAeZN+cQK8xDuDnQWmltqiKZatd2ppRoJF6cApyLRwe2yWeYhcdp8E
         BrZQnzCYG87h2ayddIr62FMUgYh9YZRaomsQ1q4wZrMgoFLSnASZhNyE2ZuKFqZTplmQ
         dqyufH1JJgtgMZt89FqV+1ad9uwh9vpgY99+JC9rBGjCBoSGMGWtybX3ld1BBY2SMTnh
         bM6oae9v0y0stN94OfC7C5067I9meKkz0wN0dWAD6a2i53DcQE1AZUn7ybgOTx0umpLm
         InXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783692305; x=1784297105; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
        b=m6F4tDSTeapyjtVC8H1zXE2qEUqsyvwfL3Oe9oESwbT3X5lCizt946nSbIFfhSC74C
         vTdJkQpDE84X/WCuV5W8D9Bb3LDn+dCIMaNA5SR7Rh06HLvZbrr6q8J+BDEYmNj22icO
         hrco5/Ncz0ImqdJ3AmgDv7bFHQOiJuLI/8/HfbdDIS9Q4weUpZnaJFzdPQVqOMp/PDkY
         sIvkregpFV27Yj0KLsHwo1rBCcbyoKPYpx9hq467aJlrZRPcGNPPnOAx68VRDWS/2pIg
         AtFi4yOnJLxzU42vclLcmH5g50XnuORQ7XePmgeNeVRi8D2/4Eh4b0flQaj3xFwb9eun
         vUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692305; x=1784297105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwpPFFnyCPicH9+L5R29w0UNiY1SpI0uZyLIpIyzq4I=;
        b=CIpvRcrwPmUmsJ2nncJZI6ZCwqFIXtHAabkX3ZoeJYopBJkh6NI0Ojob5Dq50Gr2Ga
         nmF14C050XcVvPYdr0ZsYd2wepOPWh/cmv61HeZ1j+3D7/ObGOa8C7UbUIDg/qQcT7e5
         yLsk4Eubz5x8U8jlE/t9lFgYU0o4m31u2a89I8jaz58rNKY3kq3WOSrYm3dOVR7YOVjB
         gc+6hPDdF0/aPEB6Niw2oPYE56HqQcV466tHyMHoHDajeCcbLa2GcX0HZhwzziHws+at
         0vnxj3hyeUyyWCO8EVo5Lx1HgpDfVlW5V8NTbY+H1dnnl0DguC4MvrxFx8UkphEAsNzy
         SuAA==
X-Forwarded-Encrypted: i=1; AHgh+RrEacTpAzTG9TuackCImJ9vCrQxF3rEW57Hd0Sp8PopF4gsocpv4q4czWVG2gv6xI7G8HQQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzukKAA4uWYqiTRAoKcd+FtMN66KvfJ7mLJ3J78ZVzZKG9ulTz7
	DkIMYEmLvCQrQayfACvSNpmavX5Tc7CSPi4SpSH65sufrQFTmdYs3grhk3Is1UsYxyK8TRZMV5B
	a7gnG96fRkv/SVa67SB2ycWDpdpFGqBPnG6Xs
X-Gm-Gg: AfdE7cljv+i05Q/g7ie4Q9QbRk2MVJ4sqD1PsMw9eTb//4QRMX1P/bQ/W5FKhnF+PtR
	4Ud9rGOqBh68neKljQn9xEiYNTHjqFDjQ8yz718KZP7q+HB30MiAZD1aW/MDAIUcN6ZDizATaZ1
	hWr2lPOJyx5aPcdHu0KNW5WtqSqYj1i1ifAbYsqg6Vx9s6ssNv3m32aiUdYQcCEGXfOkcW8DNsX
	Owt39w3UkSMCsrfDgFAhqYE//dCYpSgf24iyEOryk81ALEenDyTxA9sAY/J2hb8kPpi6jGPNqxQ
	17lCIfu76Rxlz+knxtm64MbcWCgWZtsvu/Ns/nTPDFv4UqqCwU12Kc5/9lHpWrF/tQYx5wdhEZx
	/MY2wuL6f+NMF
X-Received: by 2002:a17:90a:d888:b0:36d:de94:f31 with SMTP id
 98e67ed59e1d1-38a21af4f70mr6170112a91.7.1783692305278; Fri, 10 Jul 2026
 07:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org> <20260406095820.465994-2-ojeda@kernel.org>
 <CANiq72=mCc3XQ-fpkxBdEVkjDyt4tKzrdCuWgqMkQOyqBMej3w@mail.gmail.com> <DJUY1ZYYW5K6.39XJ3ZV7DGZQW@garyguo.net>
In-Reply-To: <DJUY1ZYYW5K6.39XJ3ZV7DGZQW@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 16:04:53 +0200
X-Gm-Features: AUfX_mzejtr7NyRI1E2Lyx1jl6eWlUosGgZmdyaCHgMs0L4rP9NPA4uFjFJCVKc
Message-ID: <CANiq72m37+nKB_L5W3EraM5APnG+pEPemadF3sEt3fud_qKNpw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: std_vendor: add `likely()`, `unlikely()` and `cold_path()`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:00=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It might worth adding a user for this too in v3. `warn_flags!()` would be=
 a good
> example.

+1, yeah.

We will need to go back to v1 or similar (simpler now with the new
MSRV), because if I recall correctly, I noticed at some point that v3
wouldn't actually generate the same assembly, which is why I didn't
apply it yet. I have to re-recheck and send a new one.

Cheers,
Miguel
