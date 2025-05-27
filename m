Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026327AC3F
	for <llvm@lists.linux.dev>; Tue, 27 May 2025 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359904; cv=none; b=qTwuget1CTp4dteHEOuLnO19ehH7IZivpW5NTGLlcOlNB0S3/tg1qQlvs+J1yUW32NibGZqp/1yRq2PVehVTZja+e5see+iZRz0pJjuKwB7iHhZ/+y6V36S47RGHj1l6bX6ZKuz7xp/5TyoDwuHeqG2yC/ZIps2gGM0QwN3uTKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359904; c=relaxed/simple;
	bh=iznhlCHEPeP5gtUawFfO/CMtIcM+gezphiFD8zog8f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0jr/POZGk/GGXE2D/JuI+f6ZPykgJgXolFo8+ECWiZVyPyzxu/UKlmtzSIeBWCRfSKbiMQv+McoYQ2RDcdX77I9A+BLjkBXvRLTEHSaEfseoOmS6Hybsjr8qBHUrY0eUmBpoixgL97PyY9xXm74FpJN9VfHWw1py9uZr7NjGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8Pb9yEf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8Pb9yEf"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso30767741fa.0
        for <llvm@lists.linux.dev>; Tue, 27 May 2025 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748359901; x=1748964701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iznhlCHEPeP5gtUawFfO/CMtIcM+gezphiFD8zog8f4=;
        b=j8Pb9yEflD4+gtfjEipsyk4eXN7QoS4cUl6H8WZcYPrrJQf5myuIx2BFqXsZwLcXo/
         WSiFfRMr9NtEcGqTVDiPYjEzwP7M65nJkD7T6wpX+S+LP4/v7c+W1D5CBQk2nVU2xH9I
         bv2Pog8s6vnIKC+iBx82uvIEv06geCoLHJNg/9ZOKTV4T0vIPWjx/h1IT6fmdtAOVq6o
         ATEPRP1/xBPRzSVss8NBXcXCzE7Ddfdoo+kx6Z0fjFEGUrFkDdCDFOBcddyWmW6XpG+r
         ymmXuStGqGFnzAZb9KOhuxA2xWx4FYklFii6POLjlEgNNguCn+BNuzW9yarMGtLERdK/
         +IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359901; x=1748964701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iznhlCHEPeP5gtUawFfO/CMtIcM+gezphiFD8zog8f4=;
        b=h/JfsIGuz5SSfnB8P0fzemN/uGluTOsguGHk+HiotVCadbgBWYu+Qg7kYRuN4hLd3/
         YpfngqwDDNuscn5ePAoMDQ16nTUKmQ6g91Gp7dFQx+OQ6HDVeI2W1uEFuFtMtOTzdSuH
         HvXcpTiCc6VF+TFAxDuvZacYtAU205o3BhFHHCJOlsUvNU7rdOPjLXTNvjVmjdsgVMDT
         dVheH5WoOECfxRftrvJI5NcZU6q55Bxa1gJECZmJv1JgTKwxZTm+mwC4ZDBMBj45AJLf
         pRodAeBHlVcyZcdb/igKZMw1ZA6pBBXjtq5ZxnqIYuih6VafK6Ud+Yju6ILdGFD2Eljp
         Uw0A==
X-Forwarded-Encrypted: i=1; AJvYcCWo59MEI4ou2nTKd4GlIzUKgrItcpqGqcH1XUrNDKyNwMu9P4hTzrYpNCfM9bYdCzS5mO1d@lists.linux.dev
X-Gm-Message-State: AOJu0YwOJIpIbETpxrOlfwVcJMSVcEQGAhSWnmsBTgh849JrbyTvnzw6
	IM6dcih7xfwVrIu9aofDsBQHXpUmmO4GEKlAaKyPCe7uHr/MWvWtDPvOm4CQc8dxm1AFzFIp4Wc
	smwtqIm8sjnGkeV4FnZTv9JRWSqmyQNU=
X-Gm-Gg: ASbGncsXFXV1nNIEymjTmXeoMsc8mvrBs0ZCkKTNmG6BYtG/ejpnVw/xtgqlsbb6f6z
	BML+hd+rE6T+bHx5vLx18M2KNoyhKiP3KIpsK3mT5tCCCagDwJ56o8XfRAE2loyROsE60hELqUG
	1Ea16jbGuhb6KP/f9Rv7j7sp33GaMr0Oi1n1LLLM9ejCWj2XWa
X-Google-Smtp-Source: AGHT+IGh7j3R2Lz5ku1NP2jO6jmUvppwAP/M8QfRt/BCMIbepGXx0xkMd+/B+0FfsH2Ts/09nLW8pSm9EZf3hMbUgb0=
X-Received: by 2002:a05:651c:304c:b0:30d:895d:2fa5 with SMTP id
 38308e7fff4ca-3295ba248d3mr26953991fa.14.1748359900905; Tue, 27 May 2025
 08:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-3-6412a94d9d75@gmail.com> <DA66HHUA8ANF.BI2FH7POFSRJ@kernel.org>
 <CAJ-ks9kmDiOV_qH_s-r4Z4iQf2k6H7ZnqOf5okaQxWWxrj5Deg@mail.gmail.com> <DA6GUB3YOVBD.RWGBCC8CTE7K@kernel.org>
In-Reply-To: <DA6GUB3YOVBD.RWGBCC8CTE7K@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 May 2025 11:31:04 -0400
X-Gm-Features: AX0GCFt3TZm7A3lWw22HaGxbcPpRtWDbLI6U-f3H-j7VP2POqxnjTzuj9-Y7MDw
Message-ID: <CAJ-ks9mCZ5rKUFmkM=KPdw=gALjCjdMrMzedu89w7TxwvPyREg@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] rust: replace `CStr` with `core::ffi::CStr`
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 7:03=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue May 27, 2025 at 12:24 AM CEST, Tamir Duberstein wrote:
> > On Mon, May 26, 2025 at 10:56=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
> >>
> >> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> > `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64. Replac=
e
> >> > `kernel::str::CStr` with `core::ffi::CStr` now that we can.
> >>
> >> What's this supposed to mean?
> >
> > It means that kernel::str::CStr was introduced before core::ffi:CStr
> > was available. I didn't check this before, but it is indeed true - see
> > https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f8e43f1=
d8d5c0860d98a23f.
>
> I see, then just write that and mention the commit.

=F0=9F=91=8D

> >> > C-String literals were added in Rust 1.77. Opportunistically replace
> >> > instances of `kernel::c_str!` with C-String literals where other cod=
e
> >> > changes were already necessary; the rest will be done in a later com=
mit.
> >>
> >> Similarly this, the message should explain the motivation for the
> >> change, the change itself and can include additional information.
> >
> > The motivation is implied (that using standard types is preferable to
> > having custom ones; this is also implicit rather than explicit in
> > https://github.com/Rust-for-Linux/linux/issues/1075), but I can
> > sharpen it.
>
> Please add this information to the commit message.

=F0=9F=91=8D
