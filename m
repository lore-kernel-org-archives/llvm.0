Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FBE30148C
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616884; cv=pass; b=L1DnuIfVWbJhW9LRKy8hyrREVDkIHdVE6oAEXVtWNeYSVv+c8PDwneI3xT2LwYeNa8JNHw0/Tp36WQxAqPQBx2lj/KsPl9dq2rY8p25OGpPLFc3A4RQ5QKrXKfTuzB5FngacGIkJRh6LKTKGOwB3gz7tsH/2rfQZKf3rqcHptw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616884; c=relaxed/simple;
	bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijzYrdcuX97sDFMGvCdTOZCMXTpvDEardi3QhKyx4p5+L8osniqeP9y7EWnCmm2vdDAAvidQCsXtcCM2N8ClsgydJqzY+o5o3pw/rpI2jqW9zCgrZxzKtuYpyytzDahEo0N1pYC39uHTwv7xpG8I5ukChp+JEc5VTrS1KHHNZYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq49p7FT; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq49p7FT"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bc5fa5a2aso6723eec.0
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 06:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781616882; cv=none;
        d=google.com; s=arc-20240605;
        b=RMeeBMuObWpn4cAt8TUj+7bjX6SbtfEHZSvAC/KuXBMCqYgN2wnktnz1Q4eTzYnnIt
         Bq1tmEnIU8+Acct1SfvUKy9fkcLT2giyN/8ffTf3w2GtjM+z2It5YnPy5231HKuii+/D
         5xaNaKXX1s3gTCVPTRSdC0+sonZFGu5xK6+n0iwHu7X9lR6XjPX0qsoWFuuuLr5sJQlA
         h/k/PgGqJckIC6MgCWnjwsFPhoKC9zUnniNr1e7yvWNby/B5mQ6o9xezOECvxwMV19eD
         PIMFO3qonnEb7yNk2edGKvnjonov4DC/5sxzTUOyBhrqCiQ6/hgW2cFQuZE7hRYY2mf/
         DKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        fh=G6WIHQ6vpQDGQrJwtPm603cLFZWypB8gq+ly4KmQaf4=;
        b=Nmm0gsDBg6H83ZHoUVNfjt+dRaXuvoDZKR8qkE9xBzDYsu/coMZ/ij/YO73vtnnNVc
         uEqS9VzOnT3uRVEc1+J2z1RrOAASZqucJ8DX8RUbbETv+kxtsRubY1diu6yklYZG+B5o
         XCI8TpHOTa3xwoaOO0eDQLwE0ZH8dqtL/x5EGuHTh9zZvPR/nheKLFrrvd0ODkwuTFiv
         rMiEl8+0do7R1SfQCOuzGWX+V1lfTMqxTONR81zKPbPbCDgdO6dL+fOoXgjP/R+qHCyj
         Kg+2LvlSKe4tX03AhpOje9j8H+5W4vI8QOzQV6c04swhcqu1wyg0nzeaRBo8TPJ6lM/7
         GGkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781616882; x=1782221682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        b=iq49p7FTu13vMibL02eueJ0d/RjmrSwx9132Thr73GrK8RG/6ZJ5aXBSWoHFTOVdDH
         hnZ6R/lTpZSixVVTDj3mDrOB9A1VPw1M7+sOWSopYaoNdHvWJ+M8xJZdmRWsyZr1fRt2
         mzur2JwRRoBcb7bOMQrRJ0R+sFZcpnZ/dlCw7ZOsNBzznJ+L8+P4V7Yswev1sh5Uncnb
         MEU2HhST37umn+EQRchAs/2QMKJFJ/gVgJrNFBcWUjAwsGHBF1MYrc/v/0htgnvZIzR/
         afNLiG2DyXgBnkuLN6uDwptnRE+5vYsvbvgXTUH/sZ6y7XRibkt5gLKYRmS26zEP7gu8
         IF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616882; x=1782221682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        b=gTzRdbvD7ziOUtnIH0WFJwKTlFTlq7IHZY9iPD9VL0Q71E/40Rap0h8CbT8czaGOpF
         g1pQd3B5U0t+PVYRynTQGpAEZyq+kRblOL6a6gkW3jEw6F8d2Q2cCpM9zZgITTlj/Qp4
         V6vUA+8lijwoBhYfziVrolUNmHxW84iKK758zjgfdwu2vyKc03dnZJm+elCJ9+QTNCsP
         nqYl7Zz5OlaTbO5d5xpgLVeDMIMTvNu6q8G7EQ3u4De5Qe6oc0W6eEcKgBNX5vXW4tnD
         HjgsdDLFHguW8UA5xgmdkKgRUPkuJQbHo1KSBVGFQ3vmRl7OFlwmGQaFF2fiEwjYtVW8
         1u/A==
X-Forwarded-Encrypted: i=1; AFNElJ84E5g7gRNrRg642Sj8YKtN+14OQ9FP48nPVkv0OfPKuWxuZwFxVZS5Z+ZSvTb/VFGyRvcH@lists.linux.dev
X-Gm-Message-State: AOJu0YwxcqFyCasPFBmYEEZV5t6PunL9iISI6C97A5gwRStHlVNG3NMW
	Dl3lyrX6zuNwv3EvXrHTLRPIiZExbstF9arTztyBkPc9xoCkRaCg/Wrpk22sdf40o4Tt5UohJKU
	QHqAKP95UjSAZMNIVrkk5VejeuBbHFw4=
X-Gm-Gg: Acq92OHAbGC0ZXHcQ1n+TyvNrFXOPTO+S22sgLtx5fiIDY0v3aTPFy8w2EoanZ9PCoP
	vgLqSGwVSpxZu1kTRjZpMGaBzXwtIY5ZGPTWhWlrKkHITVJdqzcxhha7SoB1DVMd0F0DjUtOpHx
	+PjZPbl13J9goqzYQVUi06jx2ruUQfRSkLbcsgZTNG2jHF3+b7faQJhofkirEmIz4le3NRP67kV
	ERbXFeJa+Ds8xOBvfIGykP34jB2hYbeSyUcmppW1xsfEbVTeTF/4VWo6MuwcsFB5cKZVvfVOTAg
	EbdkPE+BDFiab3qLrAgpU4ewE5czFKaprW0BEiN7p8qPRaNySApAHAV9MJzdO3hbI+tfL5GNhlf
	cd1ibQXs6/a/zaree2ke2IrU=
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-3081ff5d099mr5382252eec.1.1781616882115; Tue, 16 Jun 2026
 06:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
In-Reply-To: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jun 2026 15:34:29 +0200
X-Gm-Features: AVVi8CdWOkZz4CAAFIgrXWReHUHZXx2ovGTrzpr4YooCnTaJIfPp_aHfeTivWuk
Message-ID: <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Cc: stable@kernel.org
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")

For 6.1.y, we use Rust 1.62.0, so we don't have `-Zllvm_module_flag`,
so we cannot go that far back. I guess we will need to accept the
issue there.

For 6.6.y, we use Rust 1.73.0, so we don't have it either.

For 6.12.y onward, we support Rust 1.78.0, so it is fine --
`-Zllvm_module_flag` got added in Rust 1.76.0.

In both 6.1.y and 6.6.y, we also don't have `rustc-min-version`,
because the version is pinned there. That part happens to work,
though, just due to how lax Make is... However, if the flag had been
available, then we should probably still do it cleanly with a custom
patch to avoid confusion.

So I will instead do:

Cc: stable@vger.kernel.org # 6.12.y and later (flag not available in
pinned Rust in older LTSs).

Cheers,
Miguel
