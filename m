Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084555;
	b=PkT91b6GY9+Fw97a3gslj7PxzifyuGvR47+SE+J7WnVG6XLLBTHRFPFudYf4A2SkK37S
	 W1ioJ0FEaFL6RBWMPREjM7VwAAug0LEy32Xl6IjMQNX/ARQy/v84Scum8g74Up7y4RpTm
	 aIwDpNPP8tGjVmrG6EcOv46l0QV6gUcEFB7puZY3jENGwhqlaah20sIt7xWrCWBaDoB8f
	 nFnF7OQN7PJUp9nQ5vhlTK9L++Ql0+ecBcWbxaIE+abTgzzC7hEWCxtGvKhx8Ol77iHfX
	 5dT0VNcGxX/ICfShyi/gvC6GKeYsinQiNRFqPn4JNAcOz908zO+zDXa1RlFm5OE31Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
	b=BLM46ah/bbKJUsgayV7joKn9lwQnh+j7A5swRO8l+1cjxifh6cAsINN1Lx3tik5kqvuU
	 WSb1Bc3K04PTTgorI7JToPLlLY6TxNbsxM2sa2l5fWe2dTzD13oTzO9btQBGZqzgCoCoG
	 GnTBHAwxNSNGmN8zOD9YCfd000DQVh5/hxKtItbL+I4+7Yldo3p4gczLQo2R/m0Q/Ddyl
	 Zybipvw6Atf4iw6NmijtycmuaY0ci4AToLzcBX7JTlDVCI7T0OMHxUir0mfnh0nQ5w6Yb
	 oDUrbiCR/tOtmGZzCtza13DWxrbkXHvcBKIP8nlrbpczuuTzlLgx97OQUOxeXq4WTZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCoV6Jvi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E90C606A325
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E90C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCoV6Jvi
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c09e2ed679so91931e87.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 02:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084553; cv=none;
        d=google.com; s=arc-20260327;
        b=WVL81+PRhbrnHnV62/SoL+jlOwqiyNmiEUJU95tYard8qbyRlHC8nSW+rBIttOYdRu
         RyZtR/GCocKqz/dgfHyS0io4cx7RkvZ4dD2g16FLOT83TalwjDONnVlmcNQUVwQxo1Xc
         doWMM4PAOC7dBJcAxxojE604X8PjCt+R5Mw71Lc21BREc0ysVeyIZ4T4KkCZEvdRdPQN
         ydnGKgVNlGAy46UnJLUlK1r4R5kbCUfP5PgdfGKGBB3dRSIRBhpuw/Tif0kp26EWtKpJ
         674lnRbzUE9Xhpk/d9PZyM1OXqIJRU4P/yth23pF0Hhrg1XXZXpXJ+KFKT+w1RBAVLUu
         0tMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        fh=1E84Lq8s3rIUdrRKxFsVTYzzKk41aDuB6AFwscoNNXQ=;
        b=m9XhwTB1wR/TqxrbYAz01t2a9XnK9zSRksHNStYlfUS9M3hOiyZCWaHKESLA4GIXBQ
         UPXKqNPtsVGLAqRmXS9j2K+PqhapDLBHMoZloOig43fnY+n5+0JELMb21qm0SDWzjVIs
         DoCRi4/ghK1xDNXLWAkWQNHI+qZshW4tXgftoHhN3h49xTe+ILrjwmkfySiT7hZ4wlpf
         cqjQUHCFz4LP4hdNoNdKOsCkESc9w+QkO7ce4z0NKZ2xdJEgheEucKdaMhsserb79cUY
         L5gKCT80e0nQYH8C2X0c8EFF5QuLdQQ6CgD+DsJmcC9usdRk0TsFBjaLzpVTW5v9Zfz/
         7M1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084553; x=1795689353; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=fCoV6Jvi1GceEI3FDkCkI6fZtJe1yhPkX6a6YYwH8IIVWspTDhgkB/mvVcRtEEAebt
         fYk5pqQRnqkF3PcRRTEKaKizkxNWNBeWE7X1tYvx9+daARnUsgFSz3gj+HPa5m3XpaSP
         PGAVQm1LIOUo8N7HbMWqWlOolLXfLu1HnR3n4nPn6Wt27dgh0RTUmkEO3kaOqB8hL7Rn
         OH11Rhq6J1uqjna7O1OR6qqTaiqCa9uttcuDmMsK3pzJKRMXwFkmuhhg5nEXzbdIhQOv
         3AbGU2O9tf05xOTBH1r8Iak7OKxq1gXYD0XvXkARz/8Bdf0hJkBIow5p0w1HyJtViy3m
         tgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084553; x=1795689353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=lW8uH3TspBukHpmy2WVfJvyqG0fDY5TtcetTwvU9NfF2u9J9aiuQQP+DejStB8HvLI
         XOqEQ0Vs3ZdlLOarFuOCBGA1GtLdHrXvEPhG8s3jFXZtY++JiTi3IhYyh5MNsksJ5zHZ
         ytZg3pwGxps6O868LAVintNFZdCcHGcdDb3SIr4daOUtjEEjzecpgGYRNFsMIewCL6tE
         EUiGUPzXNi/a+XytVJ2FhgrRrXtNMD7MOrWcY3oHm2VG1rJLg7JJwRlLIVnEXU38moOl
         7SfFgXfL6krtCkdNrseYBEmc7AwzjU5XmnzfemvS+XF4tdATn+oCQkgOaLFtqV4YmWjI
         uINw==
X-Forwarded-Encrypted: i=1; AL+hErFf0XHKGzFoj+BvM+PLzEXKl7Sj7uGmx/Y1RBX7yK96TqRfSHCTArWcJgRRuXVomm5DCaqf@lists.linux.dev
X-Gm-Message-State: APuU4Z8uI+pCo9FVO92VbBYWFuWgpJpdWDguDQjP5bmWLif9KpYGxx9U
	5t50OhySh8080WF03UDsn1ZHkW9RRWh382s6Q2S2tguJakp3Rj2o7khb2pjO4ZThjUvAyv2EqgG
	GspBlPrCi1O/RK6n1c1igOQoZFmGyijegymSN
X-Gm-Gg: AYBFou16GXWvgycbkAMUpq8p5jp732s5cBfKump9qsVUMhiKRMSslkQdAamT7QWXaLR
	vtvt3Ah3G7/CWIgmha4ikIw3POH+wJoCv1yHEuDMp++IKgvmsLYPoQdyJ/wtYabtjQrKvZWPKyA
	CkSt4/UADQEzLfjRIRxrhdp09gh3U6Y4siXlgje1CzMYAympK62hFf7AOC6lD71K/o/Ps6DSOKZ
	9MFbbf31JSq2BdhrCaXkvrOYXoP/tBbTWPxKxj5Dwbdp5Rw+Bi9/4MtIG+XA8kmzzwMA6xJCcWY
	DtjgscPan30nOLtBganIKVPbSGp4q9EQnIgdhsaM6QN1nSGRkj23GWpnywVFy8L2uZUs1e2DMjZ
	x7mk5o6TrGP6KEphWwfNhtld+61MbArFernvPBGeLk1SlIJUgQ21kQHuCN4n0CiKqOzLp1ZkFeW
	lo2zKov9rSAaGcMyQXEZUodXbVQlObtkWJPrhr1aXjB1Q3o+JsdFxtBWTY5LumabP2MyCWbJdu1
	icuVrbdpDLJx0/09iy7QWV7d9wV/eOLYsYOdo8Tw1AkvxVhRhXY+qRp/v+wP4fP0K0uiCyd
X-Received: by 2002:a05:6512:6201:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1aa04086amr2064153e87.4.1795084553237; Thu, 19 Nov 2026
 02:35:53 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Nov 2026 11:35:41 +0100
X-Gm-Features: Aa3M54oL5-b8rD0ZNwQf4CmOodKRTjORBepmsgS7qWBa91ie7LuuwJN18wbz1S0
Message-ID: <CANiq72m0uZRVWG=SwzUUzHo1nPX=2Q3npz-9jU_ORBSdcoAGeA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:09=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.
> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,
> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

I also added Cc: stable@

    [ The LLVM bug is tracked at [1]. Nick asked what function merging
      refers to here, and Alice writes [2]:

        No, this isn't linker ICF. rustc doesn't pass --icf, and in any cas=
e
        kbuild invokes rustc with --emit=3Dobj and does the final link itse=
lf, so
        rustc's linker arguments never come into play.

        What I'm referring to is LLVM's MergeFunctions IR pass
        (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of th=
e
        optimization pipeline, within a single codegen unit, before any obj=
ect
        file is emitted. Clang only enables it with the cc1-only flag
        -fmerge-functions, which the kernel never passes, so C code in the
        kernel never sees it.

        rustc, however, enables it by default whenever optimizing for speed=
 or
        size (opt-level 2, 3, s or z), which covers both kernel configurati=
ons.
        It uses the "aliases" mode: when two functions have identical bodie=
s,
        one is deleted and its symbol becomes a GlobalAlias to the other. Y=
ou
        can turn it off with -Zmerge-functions=3Ddisabled.

          - Miguel ]

Cheers,
Miguel
