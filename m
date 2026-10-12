Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BCF496D3A
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817454; cv=pass; b=TV5zv00k57HzDLWgMpSKKhBqFCqh0ed9PIVylJ29W9T8O3+RP1sD3e+rsydpcID/J/ZfBMXm5Paz+5YVEQ0K2M1/1O0E5AWbBpTic35m0d8OWLC1c6h1ee/1KLmkkjZyXBQvP1g1ITyNm1SGrkXrPn22ETqp3IBwVhhwF5tnUaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817454; c=relaxed/simple;
	bh=ct2YHHtAR1NATrFfSOMu/0HJEb3d5oH3R82Bkhe1BMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eX88Qz9aVvaGlScP7GSDy6zDLKu4iRCPYBXM7DgdxQCvHdVqhiA3WE3ny3e3hx/9V5PJrvhPfMF9zOq65cgReWgVDjPiHw6ctgm+QDVCE1VSevitBKZxHpxAHMWFVk1gaZ80hPQ5QUFe2dElxEpUusEypbLcbfo6TeQkD0SULZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UuNs/es+; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UuNs/es+"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-141395927feso3522140c88.0
        for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 08:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817452; cv=none;
        d=google.com; s=arc-20260327;
        b=FMFLMqoDriIdacINUkCeY97rIOQ5eoWnXlPY7OiMcx6blTOmtXivxCdRfQjdKiSE2V
         E49TkjfmTkVHqCAYv0x3VFZAE0bRdXtfqlV1/uTcwcxi49MLr2945tVIfUyAiBUgWIQ+
         EPmxUMiNwxZoyFOoSB0hVfbfFSAhVUA0YHeGTS1lJNAlr9RTf9l/HyKj5AxA/XPL9uqK
         aD3rQqzPisVRTFUs+Irvm3grvF4s6E0qo28eZn3dWsVGfidwFbIBzxeBTcNb7E+6Jrql
         APPb4K8qwig/iQR9X31KaVEVrz8UjnvlXbvGlypmL9yLVFoBGsbL30cvz2iKuRyOG7hl
         yI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        fh=3bG2xt0sVJBdGJKaBqr3f/NeZ/FwVnfFb/4rvFSFpII=;
        b=ZY2ydL+051yZXJWX/kMW20Qk4SvVB9vD1UwhefEyHOJI4grr4qlYvoxv8gTHkvJcuR
         S/LsesiUHwJ2Se+4zUfojy+GIPAo+Xzcl2uoEA3dPJi4W0uK2OkX7jCl/qwwrp1nR6or
         7hOVixW7kRgXOdN2MOcgtHb7cXYm0HDBLt8+rkc7/sj5QJudadY03QP3O5SZ/ZqTLj+S
         9UQKNqyiLQlW8P2BbDP9v80hev1pDXZVwYm8RIv5X4tVN8NkAo8KlGiVgmPyp4CcFacJ
         S9yvAQ04MUm+s7Lg3gK1+V+KGxXVLVEKZTxe9/U3lKYtxltuW0WsFtKtkKSR1hGj7wkS
         eEQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791817452; x=1792422252; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=UuNs/es+ittDgFmwfSi50Y2c2sB3u0gtGJHxqM99ihvbjWLszb02VsRWKWd1Qk2f0q
         FxP/tzAQuUzf8dMV3TFUXrmehm41YWZgupJi6jPivtDdSD972lT6rVCHyxMGZxnyksqT
         vfWYG5gPLszfPXeZl4bDaB4ew4BQcqNu9bQiGJ0awVQi7XukH4IlpQkJEqwfJBLt3X7A
         yr+RdWHqsK6RhuUcBUVXVMQzni8GRJNRtg8dcGyn4nqvGDuvi7k5vCX/P3W99+dbn+fJ
         5pvJcA07x/mc8+CCFLvGkTWnI3U4JGSmzZvj7Xddy6IsIMw1NIY4vEEyLoGdzfnaA3C2
         N0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817452; x=1792422252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=UEXXy6RBIntnCCShgcdkjWKCewMLhdNdIOIOQ8dBBK2UHx5lNw+ZSyRACbCpNqvSv/
         9r+ijo1OewyvnVK1bzgxGjtdEYax99C70l163iNccUj0IZgfQo5IAD03Qi8pFiTTuRmk
         m6IjC0WS3NGu3qvyhhUc2ZPlwYplux9FXzcv5FlrcrwfwyfbSoy7KU5EzMrgZkXMRMGB
         3WyV3NVvnpVnLvXTJ46G+F9iYU7OPhw64mCch7wOSvrpWD6izumZwb1UY+e48X8TlCkm
         y01DFaBmT98ruc91oZxA+o4+lXBcbmZIaxM4sYD5jrNJAFikBthSz417/lfaF1yPz6sl
         F3tA==
X-Forwarded-Encrypted: i=1; AKwUvBw+wJqdtFWe1r3Ha9VZks7hIPG5cf/jN/+ynaHpIf3ZgetDo1IBLo75VC1/0wlB4aKvg88K@lists.linux.dev
X-Gm-Message-State: AFq9FYL9+s0iCEcA7CHPsRMq09ksSwRzLLNGZ+d2yNE2NpN7O8guWUNW
	0eOR01BiVOH8OazTPTi+jgEJdYeUkk9H7AEB7gtC/nrI4WeqDOJTEGNb3S1LYIK+ljd2M7ErpkD
	jBvmheBtq1KxYmOzIG0UbQ614RonBwUcaWFkHsFLm
X-Gm-Gg: AYBFou3ULRu6Y+x20/soskW/UcNIr1nTf1lmBBL4tfvkMppxVxWraQFQlum0Tc47fx6
	DgbOlPLXgno/cEhhoqggHQfPlDDhP/mFSLVUTZJ728tevA0Ui0FgPbHJpLdghSAfHB2mRUFPUWn
	tbej7VdSUtSovs/5BvS+UW+CDFCGV9xBhH2QAGw/H05ptVbTfTC6FNH/kIGGJqCV3OasUJlxWUv
	m0ZOTlTvt5E/sFezfAjyO0ceoA0VZb4SjBOFeUMAXJnrSW2Gwr8bjEqTcqlk4BvgdpKuCktpu5S
	XWSxG+i9X6JeyZFVCE+uw37BQ+Geyj6yxAuq8RyRqr7LpzVeCOZVT/+p5UF1Zo3/nBn9RLUHB5Z
	orcx8l6Uj4w==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id
 a92af1059eb24-16a5dbfde08mr14809417c88.13.1791817451365; Mon, 12 Oct 2026
 08:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 12 Oct 2026 17:03:34 +0200
X-Gm-Features: AclHuK88gg1MNQf0tKC3CQVs4jdrfXCck0NjLOHXH7T1xUhHlrbtWu0XiGM6pmY
Message-ID: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/Kconfig.test        |  11 +++
>  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 135 insertions(+)
>  create mode 100644 rust/kernel/kcsan_test.rs

FWIW `make rustfmtcheck` fails for me on kcsan_test.rs
