Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995878;
	b=dNmC2dqpzP49Yzzi2Csz7FgHxu2lSH8YYcHroIPmqXidG/UxwoxYKL6PG72UblIkeTTn
	 JuTk4qv6PRp9WbSg0uuAGQDTtugrrhuUwoniCQW8dYi5zyP7Du8Dn1OWvci9YlN2mO3cd
	 HOsgS9Wdj/V2OfJ/gr2J6HUbcBzio0tjfE8bDaSNCLWOBzJjNlZPoUNc9WirI7eOeCli5
	 TPUlnrXLkMgfd3wc0CvUhWyRn9PTb42Xnp87KBJykPI0z6W7C3/CeAFtygSXh8VYCjwni
	 x24j8qpdxNSagUQSttogWuWOmWnz18mfjQKScz2DrA6fiT+ACauZwRVpJePbHx48KcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
	b=k8EZawyJpXGhLVESgOkLIpMBQS+el4lwn/1HmtS2ZzYjKNYDBLs2GWJFu6z2l1EG9ssS
	 IQ3efaFlL4A8n0QW9DmT7yTiPPIKWIMDFzKnhPJhJTiBAuFSv8OaJ7oWaz5GBDGXxlhHz
	 j0/QEcJ9kr6Li667yC8MdSrCEbPLi7WQOp/SbZn4wEq+Ski811nHp5HK6dTFEo7dxu6L7
	 kLXxpaN6ddlIV9B0OAYDVRneFPwGzrP7K4W0ABrkwHhW/3xYYkJ1EgkpjzkMi5Nt39KSB
	 dQw8Q9b7s//hPhcPspcmmXhPK7K6zf8HNHIVi3holozPYM8KBzD/ORzFOuZmM3tmWtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lsNntpgX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F15606A32F
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F15606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lsNntpgX
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so6055195e9.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 01:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995876; cv=none;
        d=google.com; s=arc-20260327;
        b=DuJ+1MpsbIscNLCug+GPBId85JhZ4xzY7hjBxU3681u9CJaLfH4+DbnhRBJDC2iMBX
         bP+QdnUg117c4x7025vEpZguF+JFRIjVUB8u0hHCkWEDgm6PyDXAMghBhUNo5rJjEb83
         DZpORnw9zlJO86D2aKPRyYsu7/G1pztFKhX24+ySZeEkWpMr/8paJYVMrnFwON4JpZwg
         RRy+mDPKnVQ88LgWrufDIt8iDiMm59VPTnfW6G95XU4r1TEoDsmlsEvqA8cb6KkE3b5G
         ZaQ4fmNcsRpred/y/5hzc2w0IdJz6NEWV9m0pPFEOZfPCPwjzrLKaakxCIAYoww2rBWD
         VHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        fh=hKq4cSHcyck3x9WQJmar+ZjL/8z0AAGvdPWQ7PggF9g=;
        b=XbklAJJcpLMrfF5EIVG/1qCpBEnUlC4SoTLS9nYRnecSmS54tJyRIZBcBTM8+T/k0t
         fvyShtLFd7+JWDFBR3YrOp0XZssxXQWG1EhgWDyM6pptzdT3RFLuu8OuxS/LeXUJwgkz
         kSHmOcFkexfGRs6qV3BO6FTmrQh3erqQqjH9/9gbILgNVrVEfMA2QTSPUbAh8fPPmZS3
         4zFj4Xv7GpA8YORZEznfXkl383NLfK+6o5/irB8OmRbFeG+eNUKMiV3Q5aNn6EvLO4/8
         UwX1FCYdB+7XwBe3vnI6M4RqJBvl1Fg6o8a+eZkCS60WyUmCsa38VmFv/SCxI6ZFKk1G
         /ScA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794995876; x=1795600676; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=lsNntpgXe7UWFh+LiGgEi+2RvtoaC+2VfR0feuJp1xTYAqrNDwg0AnWFvqLScR0A/w
         VVNQpwWnjkqApQQldvdtUrBWHMaiRvyQPjAvx7HRLDjNbRUjfpm2qebF4IAB8bCE0eud
         ll/Zy/HoYHcDtaOCE/yP73d5IqSp/L/6Sbsh1ujp96u6uwsQwNJGBYir98w9j6Mdw7DP
         AEogdaIVVRLO+LzSJG2iFXGTdgw1n/MhQXBxJlOWPZnXU0JqJeI0IZpd8Eq33jqSkZx5
         SzXAWx723rRbKCEx6l+9zQwpVJrG/o1xHcpLsRugPP7sVx4AvSyIW2jU13LJOHYa2Mtp
         CHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995876; x=1795600676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=sK6mgBHp7LhxRMbX5C8T+C6pUQYNFPVW8t9NGsPcJ/JDT0JJEB+tqKIW5L8CgY6uyN
         Z8YPgC3N1xy4T5Pxf0MRRb+2nPp78fm2CfzGFCPAQJwIWjhsCXcxuMNNGN+7c/TI/HRh
         UYDKfjh+ztNNsb7aBxlxVVLV6dwJgQ10QVwE0ClQKD5lrC6uMLmUpTlNi9PK2U3byxnp
         q/vd/cAjsXOt1UkmA21C0+/m8pedH7MzeVEab8wjmF4O7CB7dlAheofowj7J2MZAa58C
         e3I9CMNjKsBeNxP4Sg3XN47YJ76Yjw6ip3vokHc0FXYWCEzCsZ6dlWo2wjPrMK/RQOSh
         SOJA==
X-Forwarded-Encrypted: i=1; AL+hErHLsR/9yKadR/2eL6Lb9UAYq/GcqM6S1LmyrAqQhipfm4PB+FIXarJBko07A+g6hGNEI1UA@lists.linux.dev
X-Gm-Message-State: APuU4Z/7YoMH2lArlSeBdT0enONaNGKP10leUzWvqa2qSGgWml9p/fAN
	pNSsy/mjMkb7Mc/UdBsYuz58l5DdKzlDeUvfvhPuu5i0UBzlC/rBV7YSTefkRFRGh/oFKFEpS3R
	nfg2BBWi6KCgpwuzBuAu6A70yi9L0W/MsxzqYJGL8
X-Gm-Gg: AYBFou3joOxwsHgrT0MVCSgVEyJk5gYBDjX+6STxQ5EnoYmtLp2G/IQOAJcICoE3wNd
	JgJMPDx7U3bEXOyMLPI7nVwOfFycSXlfGxZml25HpPYdv/IBjxmhrjT3m3J8HguJyG6Vsm2VbwC
	r+xzPWrN7BMXyjwJQ8t9zt933Sj+MpkgibHuOlAWZ8SYxNXOi0Ag/IyYr4DpFFHundNaGH6vHj2
	hrAHQIa6IkXSoOsaeBM+oP0vbEpsBER+vOvrNqHIOjBfkDdTqrqArFw/NvnzLNZFLC8tZdq05G1
	i2BcMzhGVc0XDTod3npjmprtZOiA9qP7UhncHbhVutZzkkClfuRVfPwiOjnSdeI+Pjm3dVUtTLo
	tGCBlrr3J2iLco2wK7XXueNGkiabx6x9CHGcIihgD9mPqRGjF2MLX3824/6EVscos+99UITS1Yk
	TQ+Sht1hRTqrljU7QPJNVx0A9LZfueFw==
X-Received: by 2002:a05:600c:6095:b0:4bb:6238:cd81 with SMTP id
 5b1f17b1804b1-4bb7d9fb3e1mr33299535e9.10.1794995875720; Wed, 18 Nov 2026
 01:57:55 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com> <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
In-Reply-To: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 10:57:43 +0100
X-Gm-Features: Aa3M54owhO-6y_6OcVgrrG5ngHvNLszf1Fezq3bAT0KDUQTiMvc4EQOCOXnAIEg
Message-ID: <CAH5fLggoZNruFqpXsUP+rUP7L3g252Mvs+_=A01w7NiBBfT+bA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:03=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Sounds reasonable to me. Although, I assume this is only really a
> problem if the functions stop being merged later on, e.g. because
> they're no longer ABI compatible?

They take pointers to different things, so the one that got merged
definitely got the wrong CRC. They do not have the same signature.

Alice
