Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92119E97B
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193659; cv=none; b=iPEUjjJnRK7BfFC7V+ExE+ny1KD4cqXPj+p2rEZR50FZHygMd1bPojGUszeusu8LpscbVml9fRddvtAFiYhohQrigLOHZNbmGF6k+WvXJ5Ew8zsFMW+ujXGAahC83vN+/sdisLuyP69PN3Jq4Jyuzy1QcaI8d11myMvz+X9DOZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193659; c=relaxed/simple;
	bh=YO7DeRcZqOkyyJp/N9tF4f54dRAU+mGMvwJb68kNOUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=foN2BiBH01lImjVtlJLzDdfpWp+nhGa4r0V7/aryAjYMyF/OBBGZRCoty9+VKdqSXPJ0DK37UgZ5O+LCi9SYSb9JdaHBYghJeXe4hy5elqvbEkXLwZcsw6ny5WAgbFH/wQraIrVT5DE8thxNaiqr/la5pEJu8yNJXHJ9m0M7bgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z54ovY+R; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z54ovY+R"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c50beb0d5so3569215ad.3
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746193657; x=1746798457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO7DeRcZqOkyyJp/N9tF4f54dRAU+mGMvwJb68kNOUs=;
        b=Z54ovY+Rr+1ZNEXoMWpe0X3QSv7HYuVEHTQsFQV0cpkw2CJfJ6HUWoYSVHuHhy13gg
         uNF+oSELtlxFnzwwkxo94OY82h8tL7mph5f7KIQ6cKSPGWE1wcFs7GLMnd2wT5UactNA
         KTzCc3kpMwTUmO+uk23+yh5mDh2fwXZcTpkLowry/vyuyueFZEWZg9M9156Oysu6vz8v
         6iXin6KAlKj/WDvEOBZnmDjWUNilV9WM+iKd2gFSBLykQCRN83GAH9ZoggJlrBkEON2e
         Zk/x7FhVHiUVn2xGB0XKSWosH4J93fwJrsUTKH+IIYnq2rNlaMzvnSQksxS0uKq19xHD
         5RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746193657; x=1746798457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO7DeRcZqOkyyJp/N9tF4f54dRAU+mGMvwJb68kNOUs=;
        b=T3aE1pee5Eu+HxRR6uKl5xiU3+gb3hgoXKD7Vu4DGV+qT8VU5mYJwV91gqzdN6uiI4
         aG72KxEZBKVepG4BrpwjdwI7vKmLN3OSN3OrK5wR/WHYhkLT3e6BA5pnSvT8hMWwwpvP
         +VHcEo2epZmWrqwfVsgfuNmLWBbPMiV2MwPIriBkaKqJDy4eDgpb+2AOeAXTir4Bv8Kp
         DcTrR1B9/zO6Pahp0qlciR/HOitJE1FF6qL0kPrcuCfzjSQkYTwI6bE3ORBJcHQN1aF0
         0ov67OwBcxO73rb57OPcWerwnXRyFEdxELGUiJP1I1e7ubb283H8/EHdwU7wJ49LcdbG
         ajPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGWnIkGwmmHpy+aKn9ydFaNMBfpsYIWpJh9ZFcBvs3nMZWzRevkvm8v6UHIu7lVCUU1fmz@lists.linux.dev
X-Gm-Message-State: AOJu0YwV/H04J0+bI1F+rSwh5itTkeuLTgFGS2UnLA9uUyafqqfNTK0m
	5WvuCsoZ7cqHGHh1r838lL01j/oEEHwMw+jFxhdqX5WuH+ab0nlr6/p6l5lzbvu6MP14xusT9Fl
	r3nDPiPQh8kGSNxNShrdk5f1u2ws=
X-Gm-Gg: ASbGncshuZdIH/7tQZAtQ/cr8Kvuacgf0lYJjGGWsOr8w/r0kvVsY1ihK4D1J0PdC9F
	PMQdXf7l1q+sSHMMWb2pSRYT8nY3zaX26NpTmNnIkLwRitNPkV0tNma7ONAFGifeuPYFzR1Bz76
	lCRkcXomF7e9yMEGnXfjSfiw==
X-Google-Smtp-Source: AGHT+IGvS8ysehRTmkpn/MLH73wWVl8uhQ2dVyiEZQB9+BX+Cc/I214Nibn1sSJ0p2PSB3EHImIX9TR/DCb1IZQeD1I=
X-Received: by 2002:a17:903:2f45:b0:22c:336f:cb5c with SMTP id
 d9443c01a7336-22e1031f5a7mr16755265ad.6.1746193657040; Fri, 02 May 2025
 06:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com> <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com>
In-Reply-To: <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 May 2025 15:47:24 +0200
X-Gm-Features: ATxdqUHPzjJxM4ztTNooAwhiGBxmesfG9DnCr-xy_d1ASwZ94NEytM0G2eVkbK0
Message-ID: <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:36=E2=80=AFPM Aleksandr Nogikh <nogikh@google.com>=
 wrote:
>
> Thanks for incorporating the core.o change!
> I've tested the v2 patch on my local setup and it works well.
>
> Tested-by: Aleksandr Nogikh <nogikh@google.com>

Thanks for testing, very much appreciated.

Dmitry/Andrey: I guess you may want this to go through your tree
(although I don't see a `M:` there), but if not, please let me know:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
