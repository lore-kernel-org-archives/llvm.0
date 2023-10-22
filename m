Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12B11C96
	for <llvm@lists.linux.dev>; Sun, 22 Oct 2023 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJyBooX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B244DC433CC
	for <llvm@lists.linux.dev>; Sun, 22 Oct 2023 18:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697998836;
	bh=mEp++I8t5CKsdkk+WGXyvZfMPyEBzD2ehBmGFgB2fjM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WJyBooX9TgkRDI+B9zaL4p4RP5fdDtwWfjBt61C3Ae9dzCbSOxa0OoxgEXJNVyVqn
	 c5x0vTTRPhxD4rcW0s626B2IHtq/llncMBsb2wvMSH2uo30dw4YJ9tn3dXx+i/QDYG
	 bn+epxYaW84/+AOEGkXZ4elNvCKFJlMXgoYNAjMwTqIQyWiWuYB4IvA1PWhPlrIH7i
	 aDyqJdNrC9ima2D9fasHb9coEpwdnIzxTpLou1oaT+6OqX81eKiI99o64mG5lljEYp
	 ZqJBEq/Ofz3Z4yD9H7iJNmHMZj0w+lgvi9bWWZmeg1rbLf789ouXuMTOI9aPrf+8YS
	 Eyz3Ti8m7dW0w==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-58410ce2f02so923243eaf.2
        for <llvm@lists.linux.dev>; Sun, 22 Oct 2023 11:20:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YxKttNjs27MkvhoFU32lIgBM31JqpxfsQd+klxO82gdh/ohXxN2
	l6cVTO8SerilMxyDlJ4K9UC+Gfork/l1ukQRxIY=
X-Google-Smtp-Source: AGHT+IEjD8Slx30IEYd+xtbzAF0sakEzBn1Rc2ae3BD/CHMYgVq0LPEVA7T4yjHFbvZoOqvvvDl1uSPNnrWsEBDvZzg=
X-Received: by 2002:a05:6870:6592:b0:1e9:858e:ff23 with SMTP id
 fp18-20020a056870659200b001e9858eff23mr6439038oab.55.1697998836006; Sun, 22
 Oct 2023 11:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231006155739.246381-1-yakoyoku@gmail.com> <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
 <ca2cd71c-0aa1-4365-961c-c10737a9e9a6@gmail.com> <CANiq72mM2BeWtZNqhvnbA3XR_ArfAi3CG3oxMuu+C74rB0+mBA@mail.gmail.com>
In-Reply-To: <CANiq72mM2BeWtZNqhvnbA3XR_ArfAi3CG3oxMuu+C74rB0+mBA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 23 Oct 2023 03:19:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWc8wn+wcf1qYPTtZvWx-VX27TwgdyimJ4kh1=4GBRcQ@mail.gmail.com>
Message-ID: <CAK7LNASWc8wn+wcf1qYPTtZvWx-VX27TwgdyimJ4kh1=4GBRcQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] rust: crates in other kernel directories
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 9:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Oct 7, 2023 at 1:07=E2=80=AFAM Martin Rodriguez Reboredo
> <yakoyoku@gmail.com> wrote:
> >
> > Well, there's the network PHY driver series that is stuck on this
> > topic, I (and probably others) have local work that have the same issue
>
> No, that series is not stuck on this.
>
> > and said general case might not arrive that soon. So it'd better to
> > start on a feature that will benefit API users right away and can be
> > updated to fit needs. That's what I think.
>
> If there is an in-tree use case that will really require a solution to
> this very soon, then please focus on explaining that (e.g. what "local
> work" do you have and what are your plans for landing it upstream?)
> and we will do our best to reschedule priorities or we can provide a
> workaround for the time being.
>
> In any case, please note that this RFC breaks the kernel build and
> does not really solve the overall issue.
>
> Cheers,
> Miguel
>


Does this rely on the assumption that usb.rlib is small enough
because usb.rlib will be linked to every usb driver.

So, usb.rlib is just a binding, not able to write the
subsystem code in Rust, correct?







--=20
Best Regards
Masahiro Yamada
