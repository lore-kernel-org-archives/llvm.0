Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795040335;
	b=ThXjcuK6HGmaPkWISMqCsk+lQDWHdKnJJOB264IjBwrFuMz2TwKXqvlIIfe17rT4z+9X
	 WNn7S3vSia3v3rFujR3RZCRRYOmSVqPcvajWItCqnFVb0e/rQI25qFAx2E2X1ulwMT2Tl
	 MZT52irohnrGHkr0hE+xHRNmgn0usFmvxzTkWqXLMZor1i3wMlTeush4pyJOjKoGktLmy
	 c8hvo10U69WSCxiWCyTQzLj61TTCx80BP3GLZCCkRgdjkBoPYR/8UoquydXY3Lu8oGMvn
	 2Ve0ePmEt/TAT9xHtNFmfrUrcwlUgi0PXK7RuBZuVNZib2rpIouuVB3/dqiL1kGdB1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
	b=K1eOB4ICIXUYtU368/ojETorVz9HhnvYHcfzKimZuoQ3NjBATOwg7hjPRWcZ114Q9v6H
	 42gltiSqzy4uzyEhRV5Yip/J8Y5tkC7Ik4uv/cXpSvcq5Ta5HH7aAMTZDzVjvFfcdMfEG
	 cYNXudnc5tQfUWK7c0u+P3WNEa3U/YLs0A9Vl7kRPR5/PxKpV2uSp9Bku0RwpqR2yxAhL
	 r0tO65nx3dg278e2QeCumkLky2VVi8pKBN3SW21yDOJslTpLKzVJK4mMbqVulxTT0eUk8
	 FsuSctW6dWPniYbLpw6rkbhlmqS3QOyfgSh8GtvyGm5KKE0mSHo6qgXc1SLZAOYbxVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oVKqCRMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB245606A320
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 22:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB245606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oVKqCRMN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018493d57so20275e9.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 14:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795040333; cv=none;
        d=google.com; s=arc-20260327;
        b=rjOfEtHl9/FMId/Ek3+0KITcQZ53eRnirYHEjelamtS+MmxoiVnLiCJaJXD1l+Clvb
         gPzkmCEYvxznrJHoN8AsgEMcGHfgP7kbibkI7Ggdp0n8gh7qU1Crrer8zF11jJNTlQmL
         cSJCg9OUgEjudUTP1IDOx+VV9TXnAd5ECD3YhPSvG3myDb9pft/9+/MU/2RibTNrvIDI
         1Fp11dIn1VJ9X0TRyshHTe3SYORq5GOJoUCqi2183IFkDJ/dIuLORERnGdHENepe/WcH
         bIfp9MaT+eG7C67HFQEXDkvx2txT0qumkddNVCpWiNmR7fwwvLiCkw6mlTQAT2lShmY6
         tUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        fh=Kg3cuCgbtOAJsgadTHNSFYBB5u5y9xTYeS3CUIkafN0=;
        b=lMH6u7ZH9CKOJz5sFvRUrbtXXC+CnWlB85XEbwPCjTDXaHRUzg2+hvMDeE7NMBVxZ4
         rJ6sKu4ivqZQc+XQzcUoI+wexrvtt0znsax6KF6DobxstU5EY2nFQvJYMmuTRJoI855S
         IY56KPXVXisMcCEX2Q6ZXtgIi2e0tGi9maZRK4xB321f/WA3g0rGchjN+qoPBytAXYFa
         NMarD6bbcnewB/NqGruHartv1XP8LAmjXe1v+zvrCya+eRWsOxESxRGBmupZXCpETocx
         GOPZankBpbwBsuIVhQ9QElIXqCZfn67RpMAGSmom8QfHmOs5PjaLUOeJ1bRQbtuOlgx9
         f/Xw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795040333; x=1795645133; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=oVKqCRMN2kM2isiKm8BOysv/ObRHFNGwzMK+UCME+OpA2lYhi0zL5pcLATkwK9bVGm
         9l/coiAU+RHjCeByuev7jvyIqYddYNq8fLR5de+xaZvlNLxnsnMbAR27nuK+vTq2nHdA
         OrHTtdqy4n7MNFjVyKDJhvf8UYdhZlJNR3yFlc1MvtoEqlXLIofZ2Y2y8EDozf23cFfd
         84F8i/fR1BitqWwnRKmBfM0yr2/m82SQt8F98bseZptiCfBGsNfICNNHmJc7mN9qqhDC
         g9yhxo8wX5VObLJENnDWWcRtX/LbS0dqaZaFpeZBF6SEmIBcffUZHyKq4PSvNgQ63zqF
         OBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040333; x=1795645133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=N3tt+1Wkcl6g5/ljf4UCIVWWRbl0rIOykndkTy4Cr4r1j3A4D0rBdMXadjeoZSAsQo
         hOBrG1kAW4TvaxIo+8CvnevN8jiV7O2AV7ZcRjed8nh4YNyUqBe+p+Q8zEo/giBEW6fv
         cPooxFRlJ8NdZClHvp9ycLkmJ2197WVQiHbq/oO7zEzzZtU6McKtyY7jEMGID7bcU7dp
         7uoSsUI4crw5h02yueMiUXmnPS3k9KpPNg4bTAzQdZp90foZU/vZOVZq9yyXwEskJI10
         TlxiYf1lRi2MmA/zn2RUStyRC/u2bwIozwYKdZ5v+wKOhvyzoMe9TMyNdRoVXXR+EsON
         yvDA==
X-Forwarded-Encrypted: i=1; AL+hErEj0pGtPxQUa3gaKgOIItpLSOUPa5bvysTgn7tibbadpCCEcCEYMi1eKXDUHbfSvRa898jl@lists.linux.dev
X-Gm-Message-State: APuU4Z85BJk5rKfzqQlQWYguJac6YT2DgvvsStqfAJ/f37OHlO9+YW8z
	olLzvoLC7mCSmG40S+e2wnVsm6F6zvFxFSZxTm2zBZOK4g56MUEeLf/ICUSkS/xYqoyEjnWn7+D
	CuV+Sl/1tYvwJVbwX/X3vQPOi3Y922t4x1GybKpXq
X-Gm-Gg: AYBFou1XWhHcev8NKXzhjzgjdw+T/TEqHDOWgbRQ3Qt/b5FN0SyDCnecIYpQ97eE0An
	14BkQ0m1aEmqx+RHEZpjTDtHxKTRcksrIHEHvZoNksbSTXvr7A2KUwbqkcgc1aNjblvTEN86BAl
	1hRcw8xIKB2XsFSUVM8FwvDoIH1x+IRmjttsMYrfmd6H46laEdgmZH+7YzR0+8m5qcMih6aSvPD
	oyaaI8av9lUTQ0oM2VtZG2+eh6BnxoxUtxNWvXEEyV9GarUWZOa2N4NB2TMhxoY7Kd7trCQnJ3v
	BM90SJ+0vQXBxPOiTFqlzvMVKkzv2u+baOLBZnP514NIsTQIHGqWt3ikdOIr7cBy7PtFpDHS2LQ
	/acylc4geoIgxUPFb0/GiNtn7o+ckfIE7gA==
X-Received: by 2002:a05:600c:c083:b0:4a2:a8c:22ae with SMTP id
 5b1f17b1804b1-4bb840fdcf6mr76245e9.12.1795040332631; Wed, 18 Nov 2026
 14:18:52 -0800 (PST)
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
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 14:18:15 -0800
X-Gm-Features: Aa3M54qrYLCi1kdI6tOsVZ4Mm-8YCYtqxNVjxhU4bWLFHJjIpemXwQLKhaF114s
Message-ID: <CABCJKucCD8RTVTg=_PuWTDLVaV+h8T7=whx+kLuxKq1Bpi3NrQ@mail.gmail.com>
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
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
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
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
