Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB830B51A
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065562; cv=pass; b=lSJxhXScNw1VX/+gBtGxCiX1Tv1Bfr7RvxU/XVHrYOoUqXFCOMpIfBKg9NDKr/NzgmI3qcTmY0cVnrUkJsiscHzPLH/k7F5aFsvFZ8NfYmnzQlbig/qXmtWZ8bE7Lvt1JDWaw1Y+3dPymSKb0PNxRwsM1dZ0INbgekPUWDtJRIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065562; c=relaxed/simple;
	bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfnnQ6Uol8OxGeUg+ifuHBqc2Gfp5RaFouwkmfOsCYj7av9jYwuiKvtQlz0QcoOZmBdoiZeB4fUgKmwDiwsGFzGXP0CYTkusVBhXxpr+tFxz6aeCwiXMS/pWJBzTddlUO3pznEFZlvUPQDaYiGzhGBz2Lk7eOw7wvw+CnFlOkq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSlcSBBz; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSlcSBBz"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bda3b4318dso5599eec.1
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=AWmYMMts1Jw24OWkmlap0wd0mNIJAW4upXcJlobbxVeUcazhLGzqrLqkWzLRGwwyP6
         kbs+oV33zQZHr3e11BqBhZhng/THu/LwjHrUusrIhWd7CP2CdXyT4649qomT1SWFyy7o
         EMbUjmWC81b50hvV8y39naRO2bdZ06LLmzsjR+Kkv1E/VswdrTj9GT+CR4Fb+JUE8INt
         EOnlzEeJOq1vAGqpVNOsokRdpPOc/MfU7EePoyO9kF57LL7288GpbV59X7IK6YkuZOkv
         1G6yPu1AgO4LnsIY3ci/IUbLz+XXWJC4vk9L0GICbg7uvisoQwSYc34iJOyzR2e8Lpme
         Vq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=Hlhs8wkogMCxk0GOpvFGhC2YxgsrT6Bl6dzXGjY7I6M=;
        b=fqL9Ow8TY3PPLtQ9NEadn4HaB7Cu6g6tCiywp9BgzDWJ7UIed13kACGIM/fO6IEPEm
         XAIsUuAPxOiJ5z/iTyfY4+F8O576yWyDG/ufvFo5EoUEAdQBIBmisoX3fdZTvBJf2EIU
         L5133vt0xo054IooN0Hu5RHCdyc9dGmR7ZSfSFxg5YbzwW8ghei7+3k7CdwSQwKalBkh
         H5QMoUteF04tT3LcaySvSLlYn2bE19PFhgP8ulUqlMQ+YgnoXxwYoQa2z6Wzgks83jym
         hL6usmKpoGcRG6qYAZOf9xdkeoXTlVoIAWBTy2d7lubI0+OxJ5HsClCRzjadDEA5ZVpG
         w0sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=TSlcSBBzN7xyiiSdD3kAIz6B0uU+JGYGPr0E7Fn8f2CjR4e7w4smuYLU1e+enENtjm
         4Qvo4ZBHJJyWY3IWctqX+TQvN1lTel1CArztkIR6tIE80jy5rgw5XNnhOG1icf7uN2PO
         VzixTR4Ik2XpZuOXdBfXVnS6vdtugYx3w2RvDm5miV1DKjuIlvXLohxDydjJd+ly5D9p
         Fvc85M3bpTtmB31ud5A8xtqi9YInagqxGVJAwQDx/Fi5QD9wQd1a7txJGm1RB5TyUeae
         Mv4i8UFqRtBrDEVshu7mL9M3VQ9K3aoGwFn1ExlC1EinB9siNQUrIIykp+rww05/ImIy
         RmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=tKMCT2XQ5BBAtVBa/iwkceeJMD/yqRZTJ6lo4fu6OVVw2u04W+jZV+IUksGnDhIcIv
         bXDktfkvhhlJSFaQQTbtepnECxW8YAqYpI/Dm9p/2h2uv9tK3Aa9J9oyxd/FYNPNNoNs
         23SJxeNFuZIKPNcNThGHmJYr/fuPfUpBRaRBgVy5kb3Az/O1WfITJt36DI+5hkZzRKxe
         YKCzAupm0kYoVt01FWWaX2y+HGp9MP8KiEeSImONb7CZQ6cbtiGxzTxTFV3tcK1mw8C3
         0xcAS1pK7IwOYHkDt/lmc/EJ5q7nAIq51CxS3egaMnoJLZsStbhqcBa2H+KXDYuEMDzy
         zQHA==
X-Forwarded-Encrypted: i=1; AJvYcCVA7k35yiE0Rgu9tZ49v4WBUeaA2QKYpFJk4EM5QGTtbWC3WEf4LMGMwtTMmxZbNevIwMaM@lists.linux.dev
X-Gm-Message-State: AOJu0YwsR+nH2yO/SMCUMrvMVesZL3B5Sv7T3N8DvQK62v0UFdaSe1Io
	DYHvw0Xr+oRdh9CoyGpwnc4bsyMGYTJYw9b9TYcCKadw1vLSQxbSTNsCoZti5AuuyAAhKpnwSXW
	w4BLwI79mT4zv9BzGwTWGFuhsGoQSZyU=
X-Gm-Gg: ATEYQzyT28sdEwlfGbXdKvnqPayNUSV+7WWfeYtSTkX/bbrr6i0Ue0LrrSghxiG5G/4
	KYd92Rm2BWpPKSJbDzINuC5Z7lyYIyJVirPgRa7wez+Bj9KOxdefKWMqw+rAjyq7PxmIoyIB6Av
	bS/Jmh3FJ7SZQoUyQwxTkUE8/skXWgj+LmY76RlBt5n99ZA8HcKfX3z2yJbZfXmjEeuiUXYY/ve
	Old2IqQuVFb7YhCG2dULgxVL39lgpGRDDwd7kf9lo+ERcwK5iODczD8AHd6+tbZk5Yv1DYRrnku
	+GIhT5XEHzMzoR6IKbNifcmsrY1OQ2ruT8lRlhvuuP41XGxlWHpBFg5JTRKd5meKPtgBigMTQAi
	g02Y0xh4ZPaKGaiIvYn3FVX9tU49wESU6hQ==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When I write the comment the intention is to enable the unstable feature =
and
> switch.

Yeah, that is what I meant as the alternative in the commit message.

I am OK with either.

(By the way, I wondered why you mentioned 1.85 in the comment, I guess
it was supposed to be 1.86 instead originally, i.e. "above" as in >
1.86)

Cheers,
Miguel
