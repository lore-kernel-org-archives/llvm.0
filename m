Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA933B3880
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084374; cv=pass; b=ry0fzSS1tCotlWwNjfsM624CjXF5R099AldPKT5YrCUjjwf3y9DV58dalo6eQZ2YRiXmUnx0Lk1InW9Y1e0ATe8xdNbCvmB+tMh/mpCR840/urzRL2gFXBjBwWtNtpsV2RLsf8c6NpJVVwJ3yvFFDwBIegAKRc2FFRFrlf09CSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084374; c=relaxed/simple;
	bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpwNh80W92NdYHer/fnpKnqWZWLNXLwDGzPUPMhRMuN6Q3tEPjdpc6FZfPZSFI3yWWEBcvXJwxnM7v/pRI4NEBLqIIeH5I9Rpjp7ndIEZA2JJXDXtpiF4Y5PZagmdLa/BtpMwvx6/ZeZ8nL5yRgAUtkSzNdPlrPUvEd3wTiNvbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=citD7WFA; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="citD7WFA"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a913a6ceb5so8807411fa.0
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 10:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084354; cv=none;
        d=google.com; s=arc-20260327;
        b=YlWU+EfWG8dGHBPXweA+L+jLwjkPHFrdovmsn8rfYXdg5S6V3onpFno6oDHjUggoDS
         QZ2h5c6bjntsc1zFZoZUOYAo2dCMdTyoJewl/QozK55qKgeV1CdxcJyXUjHOkR+J9sNR
         QRv0C0a08n4rH7CxMARPw5PASxHWnRz5OKrdac4E59X4rKZkij0qTyriTqU/lJlUqcd5
         sHS2E/Y3Xg7pgzwH0ih/3TJHoQVnub23n33UmWR2XAACd1cOfDhi8T9MfDK1m+q90FpQ
         65SZCY+z1NxcM19/O56UmeLZlTdQnfvNeo79RlNEVFh7lyj1TvNPhu9CJ4usc4M3k5Rl
         JhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=pXY271HzDnBITGs4uYQOu4dn65Ae0SAaMrxAQTehgDHMBvY4wDzlwpuPT89akcWaVn
         Gd1z8Z+52foaAcS/84U7pEkRSYkmaP7znfX+gnBUmIpvSm6afcuADTq7VlXUel/bm02+
         FHvmSufoqjWesA35Qh6667UVra3aIuz/phLebUrsOoRhKwoV0MUgOb+CQm1qxwIvTkQS
         RQzS9V0r2bghq8NK0I1Nr/Fe/hBCOZYRy+4EPcwqTyebzO81T+8ep9gmetRTW8luDkVY
         FA0ja7VgPx2MC12gJ1e9fFDwBrVBS9f0GgkeflRWmdA5PYAFM6IbACNJL/wIfJ7kCCPU
         w4zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084354; x=1792689154; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
        b=citD7WFAyqXcoBML29428rVoq524I46FBB9LtkaJWvlGVU07rnRnpoUYhp3D6aTOnx
         ZFWqEqhf9jtc0oHjC6tZnC/l34Zqs0mZA/ay5VMxoHAqvHGwbp55XrabPZ5BEIWsz8p1
         BspfXbPfpkCLty2BkgPEle+tWaW0iMMNJ/vntv0/wDNyZVVkxmCjBEFkc6wJKyKkZ5wm
         q2zPGi2o6o5ql7dc+QvCvDhd15qyrU+g1CVz1+tzijzxF8ER1WMYxQrhHO7GFt2p3m0X
         mQtg4metaEyd3k+Q7VyuHP7tJIk8jFVMtJfQb58GrcANCF7D7A2ez5mJD2dweO/YISdX
         qGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084354; x=1792689154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD4KsEaXnEP1yIinbRyVG2yxCHKl9vThb6+0s0ZuEkc=;
        b=fIEfO4Id2jpjCFpBG+/yFGRwDosxCW+5Np3YAYSooSC96qoq3oH5qJ7Y8fh5skUHNQ
         cts2uhj7qtDWtkdHmu/AhkrMIeveRDZenqN8nCEQhagPlUQ8tVowOmxzdDsy0eqEWY17
         lsHSfkiyIcAM6UI9U/youwU25FgfdOTJubaEBYqEpCNV+na8w7+MDxDmt+F+5/17Kfum
         TujBHEhZGg44iJKoJueyipMzl2Sg2JDFqsnanyGss5Zy78bLpEJNz1Ub/KuhtQUcyYZ8
         /V34QL527tFWSoGj0ClMhGRlMRwljgNfQv9blMXpI1BZyyh1dRG7s7o+VLPw5wPN4yjw
         ghFA==
X-Gm-Message-State: AFq9FYKGn2eoOP0HXij8sJBuJgZp1E0svQHkrIjOh8Crj+8Ibwu8qya/
	bSKiQfGPb0R2HDlO1u9zb2T+sMJzUw4NFGy2ueqkHCKKI4qqj2dKcftmkotrndIb/FdEM08oxX6
	1NVyOS20jpVG3arKFSDbIx/LW6B08nRWrt0I+
X-Gm-Gg: AYBFou3UvhHddJ+tyoPVpgAK9IGxmNJnrPvmwV3O3Oi0FeqZixVt65uMZaAZ7e8hm9f
	MmOzNryTGHC8RXXiCUZjwDRavpZKYJtPfFd9rtrXkkiA6fmqZf1sOBziadAqO64+l0F6YbKGwit
	Tu2cjtWuAYnWkb/TrvkOhinmPIrZtzaRVH8W1BTslI8UkmX9B07QbPewopivNcjRgxmnPa2Y0Qx
	un2x0XcqabwnKqoH+mk4vQxkX6tzg0NXyaPooooavVQ4tzjUf1y6X74X28voaiT4CX+1LZecJhj
	g0hUj7He/QSvcIK8+4IPdlkfD8dnQgA2wmwhc6kMeV2Byog/vn+XmlkVKt+mu1AlgERYmXh13oD
	unO/FbZkskt1PHJV7hxuII+9l3ybL+phJJJGx3Jvs3FVLJ/0JkSG8k+LuEwfP+XZyGt4+tfQpFA
	+xaj3itp1epkNEHiN0p58V5laRWcInHkoZhMaU+j/hDgGvj1p3P/o=
X-Received: by 2002:a05:6512:6882:10b0:5bc:e27a:5f91 with SMTP id
 2adb3069b0e04-5bce27a618amr4033303e87.5.1792084354377; Thu, 15 Oct 2026
 10:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014232030.GA3382959@ax162>
In-Reply-To: <20261014232030.GA3382959@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 19:12:19 +0200
X-Gm-Features: AclHuK-rFLQqM9_y82j8Ip7FLTl4UEhuh7F41F3OQw90CnQLbJzYm_7TdNUyycs
Message-ID: <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:20=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 23.1.2 and 23.1.3 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

It seems to work in my usual test:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

By the way, the `rust/` folder is fixed on Rust 1.97 which uses LLVM
22 -- not sure if we discussed it.

Thanks!

Cheers,
Miguel
