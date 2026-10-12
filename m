Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5DD49B1E5
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818168; cv=pass; b=WdrbVKg0jpsoNcwD3TGCq1RGtUbptN+/Qt1wHpptpmz+WApw/BbkvWmTM2JPcSSSmTVn+hbKO6LC4ljDQueYwF1Igj5/tQFKtbpxV4WezZMVoWjZq1kjTJ/kIDMfjMX/lUsF8Tza4q37/F+JgParVhucMizKYhLXTsOJk2pKkrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818168; c=relaxed/simple;
	bh=Qh8/jPpdQb1uoYLtiV+P2F0fMSrInIfSg+J+6byfOcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ng6RCXckz8pbfbupnUIrwFGXisb9gchD8uLa6DeBp2vRhtPNZZSaIVu/BuArq6nAmkAOzKIPb9AFUPcqxWFb+y85vxfNryGphvsm4BCCrnQhhkLG/is+7C52IwDD6HNslxWPooK+Gin+8O1lsaXYFCaR9pe1Hoyf30P4td+YMi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ieveOXF4; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ieveOXF4"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab3d3c5761so15067207b3.1
        for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818164; cv=none;
        d=google.com; s=arc-20260327;
        b=kxllniPt9VSJUqG/nkYVpYheAWPiiIw1f3+2Z+eMiZx+YEILx9hSc+AANYxaES27QJ
         sYgQCIr5VJUldF3GjOTpfTrOFvl6YWT1XR4F6zXt769TrQL/j+oE94ELu5cRfhXQJ+tg
         mQFpSVaR/n4H2SJZUKmEFdtqEX6J7xp+9T4BFZmjXitfXsvswL+hrDmOS/5MrzlyBslR
         OjDIYwmbyq/x8CYKwIntTGSOohPJtV96vH9/AzIkoValYBb0TcrtMPsTso7ld5twyX+a
         7wE4DWAXOMkImeLVqtLJYVClw4k1AJxvJs6UTjpbJMBMEyBltx7MDtiOBc4bsN0zAo/J
         Q/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        fh=q/dZyVXzPQBYr6hmgySv97xEK5B8ubbWMpUXYIkqUzI=;
        b=EUi0DUs62WrJhF5TdxObsOrSJBRCbr7Wv5LinMUIZgtwWIIPNAPuf8WRr2XuqEEex1
         CiYdMHXrf0yVMhch7o/PpFRGkvfvyiGK1OEqDt95K7iD6sYnB8masgwfgXkgVBHn0u4i
         eCAuMYboHVK7OIakVb+5aOci+KASCt3u3bM7EUxgJQvBqclvMg0fdU04HWQ/Sxlldvld
         X8FRIvcZnS4OWGAquAYSGVr4a/bDHUXvTeRYM1esUl55cSmE8uEXHyQl4LWGKpdjMzZs
         oBUX3fBkTosxvvt+FVxo8/mcgamurx0Hx3Vx9BB0AqMLm8wgnj/9WlVA8QkDy8X8FONj
         61KQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791818164; x=1792422964; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=ieveOXF4iJYY1uDgXFZ3SGoAiicwG5PZnc2SqjK5a+atrjDonk11WhRDRJDktFU+Xb
         VJFdN9t8WwZi5EEQtn5Gz0JAq47L4omfUfxnkq4x1gyZvy3HwiJnk/+1d1nTDATmkvLZ
         xxoKI3oK3fc4O/gatb/61/RnyQ+GB6WoQeMyRUYp1k7nwJ4ZFwPNpK+CbhBgK6XNgjT2
         q5od5AicU0RpcHZr+awqnOcjOtH3Qj9ihnn9uYz+ClyFA5wk6ksiQquvSYvzV+mY25gP
         Rv3KVcU9fjhxyRlS0IjVL02dF8VKjvA/VIbFgGzcFbWhbB66hbpI8canxey6uW7PtZ/p
         eIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818164; x=1792422964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=V8AeZTo+IaNRZk4dPAKz3qjrwNEoF9awGrXGyjNEN2dYU9aUNFj+Wlg04npDUSqx+8
         6xASr0+dd0zhVBO5M3ZBUTyeYWtfTX4iuMv6MSBkHxw+VTWrFiceLgGhq5/+itOT5Em3
         cUJgY1xQ46n1k37h+grCiAJEFmLVn4qLIQjTrwViv11wrraGnBLdk2BY2Dm8ZauvDPPA
         rAHm5HFQdubOAlTdNBheduoOsX3J4Z0nciqmAzbEyE5uRkRn5swAY2XB10CKkwl+vlIj
         ehBoNJPm1CZVAnspzzCOV8K7yeA2ClzEcpd4Zx6JS4HLktxGqsa9pZxxpqPCD7MLzuyJ
         Femg==
X-Forwarded-Encrypted: i=1; AKwUvBy7BA794LWWeoBzBy+Slg+lqT8iiZbfcGfdwkLnrx5Ui7F4H6aqF2c/GebGLq1DC+pKJlLN@lists.linux.dev
X-Gm-Message-State: AFq9FYIv0taVqgtVXjNyZ6yWBWcKm8WcKeq35y4rxAf67b2/u2rHwn1j
	zH+T/pyl83SqmAP9g1rO9Yx8G3kaw8PtFdYl5XGc2vNEoJiDKbfe6783OvgNFmVi5alrnVzNKhF
	bnyKjDC8yLOgUOBfNK7zclQWgu4LC3in4iFpPyM45
X-Gm-Gg: AYBFou0lINN5vviNj7rD6imCZWVVYfS/HIT0WRsy1uUpaXHg2+HEB7q+ZP0hvC1wKHX
	kdR/uOZeKzTpB3nk0TCKIwMbOnC6t/tKvudgpGJwzCY43/CmhdBDXhR/ZbnG1UNkcD3OhG6LpWh
	LuCS3bWbUvB5WT6tKObBSfFpsPGKT1AyvVD+zJIwrnBA42bNA8ndoM3sc+oB3Qko1mq/oF5OOiE
	4kEdeIJXUHCdjtWaC6t7T0pKXj+5nvpDW1veLSu4byjRri82Soh1hfEtVQPRvkg2+H9ybtSiVcZ
	XH64f7aOa1maQlsWSRfMLXMCAdvtnR7xv8FgiU30yRfG2Ve032NC38iuI4U1LZl6FdSCJBTd924
	4GdpHAw0WGuZJBBVkl7kE
X-Received: by 2002:a05:690c:f04:b0:8ae:b617:713d with SMTP id
 00721157ae682-8b07edfaf6amr35969547b3.19.1791818163556; Mon, 12 Oct 2026
 08:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 17:15:25 +0200
X-Gm-Features: AclHuK-ngdayfpaG9DdBIWGDrVoRKwhiuwWtMtaRRkzMdsYW60BnSKb-GUjELAE
Message-ID: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Alexander Potapenko <glider@google.com>
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

On Mon, 12 Oct 2026 at 17:04, Alexander Potapenko <glider@google.com> wrote:
>
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/Kconfig.test        |  11 +++
> >  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |   2 +
> >  5 files changed, 135 insertions(+)
> >  create mode 100644 rust/kernel/kcsan_test.rs
>
> FWIW `make rustfmtcheck` fails for me on kcsan_test.rs

Oops. I guess we'll make a v2.
