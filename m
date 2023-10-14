Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F13C63B0
	for <llvm@lists.linux.dev>; Sat, 14 Oct 2023 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RaWJ/fOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7897C43397
	for <llvm@lists.linux.dev>; Sat, 14 Oct 2023 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697275605;
	bh=aGl4g3Sh3c+rQVAipdArG0sIEhyzdN1YpzpNOg38+TI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RaWJ/fOo5o9ngjwhlR5S1QxO8pKwquGkpkBM6XON34hCB9ktWAhmItUaTCPG8EXPv
	 Q0rN9mTSYY5a22niHACtv8SKegbOBoDoy7ux0LbcOwvMhGDsU8avWdT0Piye8E3wCR
	 OMvDD9CglE649f8pRbJlRWA6XZlz/T6PTXmo0D6w2a5IUWzOqgkzWIW5vMVMvF4h++
	 zrK9Joklh91odonXxDzQybPy2znw0P+/NjNs/2nYQhN8Pab9pT79S86VGIYcHhAOH+
	 T0hcJpbTAisMpbG+aDEiReqd3yLtGEv88A4WcelCwp6IAj0P5wIAkrDd+8PBHZrrQD
	 bV8c2MdvRQIlQ==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1e9db321ed1so912765fac.3
        for <llvm@lists.linux.dev>; Sat, 14 Oct 2023 02:26:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzi68xh13HV+FIYAcbtG8jXkWJpRb9BLNtQ19Lvm9l/w0vZZbXR
	GdTL4kJ29hCuiE37WV9EeMY10wxdP+FRNXY6llg=
X-Google-Smtp-Source: AGHT+IEwEQUUC1JNZqjlzEvZLXYqnFViuoo3sDCGG2QuSlxycV452MkTdFFBAni9pTPEblM/p69MXbyOyylRdCUdRis=
X-Received: by 2002:a05:6870:d905:b0:1e9:f4e4:2882 with SMTP id
 gq5-20020a056870d90500b001e9f4e42882mr3597436oab.38.1697275604992; Sat, 14
 Oct 2023 02:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com> <CAK7LNATBBk-a0EJcxpWGJ9n+9BHQUw3a4s41LTtC-R8fYrVMpw@mail.gmail.com>
 <CANiq72=Dsaa77n-OKDZCcv6TWgxZf7R00n=X137WbsUzwgU4RA@mail.gmail.com>
In-Reply-To: <CANiq72=Dsaa77n-OKDZCcv6TWgxZf7R00n=X137WbsUzwgU4RA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Oct 2023 18:26:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmscONw-Sy7tkgEY=z9i7Rgt0G0Mq9+FV8nN_vP+Q4mg@mail.gmail.com>
Message-ID: <CAK7LNATmscONw-Sy7tkgEY=z9i7Rgt0G0Mq9+FV8nN_vP+Q4mg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Respect HOSTCC when linking for host
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 7:00=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Oct 7, 2023 at 5:38=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > if Miguel picked this up.
> >
> > Please let me know if I should pick this up.
>
> Thanks a lot for taking a look Masahiro -- either way is fine for me.
> If you want to take it, please feel free to add my `Acked-by`.
>
> Cheers,
> Miguel

I do not see this yet in linux-next.

So, I applied to linux-kbuild with Miguel's Ack now.



--=20
Best Regards
Masahiro Yamada
