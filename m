Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEF3630BF
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026404; cv=pass; b=QUvn+Z9EkXKvCMDa1Om1nDcR3wPFxCPXjM6MQJI8J0HtprzIEB6mWjVUizjNKspk1pbtWHkCAvdcJP79GGoo9zN0Vmrq0VqqiG9wS5LO229W5XO6j1Qh1D7/1J6g7nV7bnso5DG1EILQKQJh2febR/Taw6jbVf/D39SPP2Eg21U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026404; c=relaxed/simple;
	bh=akrD/7yNgCJ2hr9qe1CwVyZoBGQGlAkQEpZNlJzWaec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9qI4YviLSP4/uzXGFxR/BAmdU5asW3ls0F1rpk3MNFt1YRE9n/RdErtWvEPrdnPDQIABq98Q3pHkgbh/75eOpZs60WBiUWRL9GC4GZ7bvjMNOkM7NtMCk3HfoYivuz5ShV9kLXqWpxAE6vX8Gp5UuT96v0t8UuF2K7kjfAVT1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNeItjQ8; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNeItjQ8"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2d958ce9921so552912eec.0
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 03:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777026402; cv=none;
        d=google.com; s=arc-20240605;
        b=du64OH/v7bUBc8AAgIn4G5RGJH6RmfxInNqgBRRSLfoyTDuBqhTNSDGv+55gY4fNc9
         j4pI7lK5bLtYFunh+tAyXtGJkThvY6te7grwu0CbvbsT2D2Rgflg7lwKNjooZW14rO1f
         eG2gNCs4aDgKs/6k6fx4MaZ9fTXQuadw9wuOHD37fs9hdxiZskioxBDAtCniBR70a5+M
         Zk+Ut91kXW5zz6UJ39YLzq/n5Ftib5rBAv6uwu+JcTSA97bjfiEH/iD23Ia9szVoF9WT
         0nGDg65P8tukYJRaQTnjzCx1x+8X2liPmWrJclTwHKQD2oLDDbQhV0wAyomezooGvDsU
         g5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        fh=ZBkGQrxxfSY3EQuurim6LlgWDqvEaBgyH79N25Mh3tQ=;
        b=PLSV3pc1OT/Qswjf0RI2Qdh1pfRDQ8ww9dOltM2j8HLuO/4S1s4P1/skAywfHgQxB4
         UjUDntUK8Q6RmBO3FYYJBrySGYK9jvL5kN99enkHtU74OZx9ABbZENSGuADY56U060o2
         4SW3NqDdv2BUJvFIQgki5bsvwZmdr/W40gY6qy/79iwONzUypkLRzyhnIQVeJvOuhB9E
         PlkmFmKJI7LDnPGqHPNfInBL/Z4NA5eH7M0bkt9EkC0zPfR3NGNJsHuYy8dOOeVo2qGR
         RpF/SwQsPP8Vg/qDKGu14MP8xJF7BOsr2K6ID0JQj+o4WybX0+1EibuzuDhoxGDxR4K0
         3vMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777026402; x=1777631202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        b=mNeItjQ8UTeLZ2hirBf8qjalazeRqXrNKFe/CwXkT+ZNT1hsuJjywctM34iOGL1f3j
         xGImzPUdjZ1VOcCITS9nBV+p3Ora54B4J1bvbG1cqFPSJ5vCITSHUx8I+WV0EeOEfGA+
         JCCc8SXFHnPcXf9nxr6Ad/jIwz3dycXzqaKKq4kcNSVzcbJXoOxsvF3UQe6lRQLRTnI5
         LxSYprgHlxMim54I8l2lJ3zBy5qEhoUsXW+uJls6ghBGVmR3ih3cj86ZBqTSpK4MhOHC
         au0ORgjSZuY/QtylvxatDhKMVYteOLUW1kZMuFlruuakzeJOAu64lua9zRdDTXLBmS/T
         PV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026402; x=1777631202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        b=VK9Axc0irmzGtoMSOMKzlituJMFtbDkeNdkHEWR51aoYcX4i3l8oYf4P7x1C/EYSYe
         ZrbrfuGYlyKyUyq81XYSGJTmfMJwVHyKylXDlrSPuEh7P8ScqNPYB0z7knYvHkWrCXZs
         nZp+DX2O9qolJSAKARV3WrRuetBTvW/IPsxMGtUMcLnK16u7PBj4iusZGsvc5HarWu1Z
         Qc7SntuK2BLj9n9BW+Ft0pnw/9Nbm/+HM8QEOcKhlo4gWW38oUrNbIOnw/+IasE6GhbW
         XyK8kTFgqnc1C8tqeWVlThAwOy4/9uAvpcfLajeQ8ksJsqmMtKDy0wWiwLt9I5JprvB9
         r6wA==
X-Forwarded-Encrypted: i=1; AFNElJ/IEzkcO1TMN62G0t+g1dqkmXWnt1L37814KC/Scsw8qANzhsR446ZjL9+rprJIPVQ53TMX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4VoAsAME/smRmFgyR6vou1uIBJhmqzu24icGnPrJTkHUbyQQI
	PH5xkuF5FpNY3vzvHuuPm/p4BX5S1zK77Ilsx8Py1fA2FHnX8nhz2X74FgTC0NW6CtikHRqjKb2
	jwqptVS67qjAQ/PUF/MXeSuuylJnyK3k=
X-Gm-Gg: AeBDiesXQFpUrgyOFfOfIVBy8tD5+uragNjl1dt7/hZWYCml2pVZrUKsUA/NI27kJcH
	p1m2MNd6XNOa2B1MRf5Io58OumDkytE6rUPfJ7aDt0SHFIkY+tzITe1EL6q0vAnSgy99OLrIf/Z
	7MvykPZZtAS5qjESqlhA426OVHzWaBTZpNeMQPAZz5aTtjKSmcipc/IdWTsTW4JlrZBj7kpzuYh
	OZNolkH3hR7XiBu+1HzLqi4TFJ/B7ULW+yo3jV/VQeOot09NCpIv5kKeyjkCvu29/8ZnkwPtp4A
	3tw/XyHq2YvRGwPwrj1FLJG4dfG4jXKCi1Q2KUG4zI85DCodGe2MWS6EGhaY+u0NaBPesw6Pt8C
	uQXjb8NkOk4kJNkUVpHbIIizDWJo5w8TbxQ==
X-Received: by 2002:a05:7301:9f03:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2e478a2e850mr6554300eec.3.1777026402324; Fri, 24 Apr 2026
 03:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424054742.45832-1-mkchauras@gmail.com> <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Apr 2026 12:26:28 +0200
X-Gm-Features: AQROBzDET6d-0hjNl0HV899j9TcLUcNjD1kIJArKfIFhDWI5iKiWhVLnvOkXFjo
Message-ID: <CANiq72nsYy-EUSMynykb=6QyR62M7hT61RoTO3F0-vw1oBMh+w@mail.gmail.com>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: David Laight <david.laight.linux@gmail.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 11:43=E2=80=AFAM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> A possible solution would be to change the core crate to not divide
> u64s, but the last time I tried to do that I couldn=E2=80=99t quite figur=
e out
> how to do formatting without it, maybe I will just open an issue against
> Rust.

Yeah, I have some context at:

  https://github.com/Rust-for-Linux/linux/issues/2 ->
feature(compiler_builtins) and a way to avoid certain intrinsics (f32,
f64, i128, u128 and 64-bit divisions/modulos).

We have discussed it at some points with upstream Rust (including
related discussions about having more `cfg`s in `core` or a
`cfg(linux_kernel)` etc.). I don't think we have an open issue
concretely for it, apart from the Clippy one to flag the use the use
of the 64-bit division, but if you open a more general one with some
details, that would be great.

Thanks!

Cheers,
Miguel
