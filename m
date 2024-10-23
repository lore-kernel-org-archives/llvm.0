Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D511155303
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668561; cv=none; b=sS6K3ew5zsrH55i+JnDZ7asOpqyna12Yg4hquq2R4urQKxJqLKF7PYflHSYJBmtgWErnjjic7/R0bWvOz2cig6Y0BeySV7YP6yDD7ijmFOh0ZA15roEC4gKv+77tn/YCdjDh+fSny15R8t/JLOzPCcW+C6VGAB8SvF8tHyS6jPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668561; c=relaxed/simple;
	bh=0cjxPN3gVvAN5DsaYQ7B4tJsV1CxyxDi0m1/lvLw0r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcI4qAPcFiXpu85MAr/LkFnErQd9mjQURdKgmfCZ+9QMGFK43zyPxeQThn/kNlrVeBr1lGz8tkweJslilShI8DSLoK1czPPD4+0F6HYWtsBf7tEKY0zSXeMixdvHtVcit1nyRK41LeT7Mg+5gYgHWTbA+2vAmsTMpoJMhjxhDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gxw3CcUJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gxw3CcUJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30E9C4CEC7
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729668560;
	bh=0cjxPN3gVvAN5DsaYQ7B4tJsV1CxyxDi0m1/lvLw0r8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gxw3CcUJg5oP58z7MrQd8UIGeHCddRvn1YusmHPBAl+ImMbVUrsCml6oz8px54bek
	 qXGvhlPnJjSdvGWYhKjxNComu9zaBxtL4XgiCQC5pnWk6hKSde6qbqtQRdaAA699tW
	 Dlh/9FAkbWLGdEenSMra/dnJliOIUEhT+6ligXbWNvunr1iT9uSN+KVDyN74aD5uzD
	 v0fXJQNPkDM7ri7gaID5ooPyDJ0uVFQrCkAoM7m+SUao7lNISM7fwNwoHTsCZPQJiB
	 mgvH8WV0fYapQ5uloEQ0CieMa4T+pQT9OrXjP9MOWeZJGv/bJEYhs/Lub0xS6nlmms
	 H8Yb6hZwNfeqw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so2695517e87.2
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 00:29:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXVarqYw+GI2svQS7+HWgIPEarXJVyIIVs4a2zeZtWOe+f2ChitEHaha2+/nf4ukIHgz7R@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsjaa7UQPJ+UpTJG13zjnZJCNo3KNrmQFAzUkTx3jhZjxw+IwO
	qZf7BmKdiVy6ijb49nvgA0nDkFIhBvuarRt9wRzNexVaYtKMp8QRsuOqXCV5VxdrXAr24OJeyqi
	777lTnTksnOLcWqPIprG8X14xy+4=
X-Google-Smtp-Source: AGHT+IFRea2Ijszif9VG8m68iTuteEaOPa/SvXFPAj+mSpGZe25TCijKQGifGZl6tE77eNXwEgasc4gRFeTgNxcsDso=
X-Received: by 2002:a05:6512:3d09:b0:536:7377:7d23 with SMTP id
 2adb3069b0e04-53b1a39b073mr1285874e87.40.1729668559599; Wed, 23 Oct 2024
 00:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-7-xur@google.com>
 <CAK7LNARfm7HBx-wLCak1w0sfH7LML1ErWO=2sLj4ovR38RsnTA@mail.gmail.com>
 <CAF1bQ=Qi9hyKbc5H3N36W=MukT3321rZMCas0ndpRf0YszAfOA@mail.gmail.com>
 <CAK7LNAQr_EusZyy-dPcV=5o9UckStaUfXLSCQh7APbYh15NC3w@mail.gmail.com> <a38a883e-d887-4d79-bb52-f28f5efc99a8@app.fastmail.com>
In-Reply-To: <a38a883e-d887-4d79-bb52-f28f5efc99a8@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 16:28:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATfdxBvFxhAQhAuWhVfqfFptCXvjRS2xcWmFFqYo8Qp-w@mail.gmail.com>
Message-ID: <CAK7LNATfdxBvFxhAQhAuWhVfqfFptCXvjRS2xcWmFFqYo8Qp-w@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] Add Propeller configuration for kernel build.
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rong Xu <xur@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 4:25=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Oct 23, 2024, at 07:06, Masahiro Yamada wrote:
> > On Tue, Oct 22, 2024 at 9:00=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> >> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> > > +
> >> > > +Configure the kernel with::
> >> > > +
> >> > > +   CONFIG_AUTOFDO_CLANG=3Dy
> >> >
> >> >
> >> > This is automatically met due to "depends on AUTOFDO_CLANG".
> >>
> >> Agreed. But we will remove the dependency from PROPELlER_CLANG to AUTO=
FDO_CLANG.
> >> So we will keep the part.
> >
> >
> > You can replace "depends on AUTOFDO_CLANG" with
> > "imply AUTOFDO_CLANG" if it is sensible.
> >
> > Up to you.
>
> I don't think we should ever encourage the use of 'imply'
> because it is almost always used incorrectly.

If we are able to delete the 'imply' keyword, Kconfig would be a bit cleane=
r.

In most cases, it can be replaced with 'default'.



--=20
Best Regards
Masahiro Yamada
