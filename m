Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460864E73DB
	for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675384; cv=pass; b=sDuLqubUZXzhilCg8KmL17J43Y9iHQ6ZnzbCYOEekm2q5fMdn8jUTmvnM2RRtm8fNQa7WRbkDzTFAC6NfZKL1g8jnDtxSI4i+Wct1n9tjIFoLq6pR9IbvwrTo80dTW6soXEaG+HCf395NUVWQi/aI6wPJuD0Rl2OwDni+DI7sDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675384; c=relaxed/simple;
	bh=GpHjDtqu+AzW6bYVn14IR7601Ha7EtaAYwvYSeYG9jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHgHd/T8RsCf7Vr2JiLFM2wfNHOkwgc7oCkGQHFGIzJJbQSRui0h5TKLMVAp0B7za+03PJG9TY/oVK5hbDIIMH4pSpws5DF4kNsHRRLizKDzU6cJPG+XJAacqhcWub46W2Q1Tai27NzHvF/looCwWylli1m0agzhhiraMmxiFDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AjujZvt0; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AjujZvt0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so206595e9.1
        for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 13:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789675380; cv=none;
        d=google.com; s=arc-20260327;
        b=HWEOD03AsYxf/crNYV9lmdxOduG0nUqNbgAp8glJr3OtXu63T0rZRa2zhLwhP8QRZt
         jZsVNer9U0jkwvL3hOfAzCq7XViXUfvWqloD2kqVYTrQNsOlqO8XZsMRWJukYpENAqp2
         3LhHcZdsppYYj9I0eSvwY31jZsFNk0L7TbZH2L+987hZAZAF84z9pSc0pKykg1c58qfe
         ac9013Ug7on7sYRWbjmLyvP4BlhA7QLQIw7OvGoSS70IF2iW0zLuN+3eQwb4uqxXOODb
         kP2BFloTgd56WW6O4siWUNvQ31ddb0XonDM3SlwADCr7AYWQq/GZAdNb2DGfiBVs+CeZ
         JiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        fh=LYKDs6dz4R/Br/HHJidEC2GlYLiC0c3S7c7x4XFYRao=;
        b=q6uo7UUxin2SGIylYDjOZ7BXkqCqZlveeYHFpKO7qN6kSEmqEo2+Pq6ZVYTHQASqtl
         qjKAarwA3y9OJ5h3NXtjoQA4s0cGgd2qLoRvOtaToWxU0dFp4dHGOl+pe1v0e4BMXHig
         9FOp4WouYnjebfka6ZGM6i90u/45E82c3I+3Zlpb0T4SPDXrKqG8LVgnp7SBbfVGhVyk
         zuIyyKzoehaEn6K0ZcJZV5cTcXrvTrosQNGywD71F/Gr448kt3mRC3PSmTv/xCr15VXF
         vSCajTxtMq9N2XuiBZioq0lK/jxDVPkfIZQGqj8WGYkIt+QD52eXCYh0khGuJtcVn8KE
         uJCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789675380; x=1790280180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=AjujZvt0Y4PAb8vDdACwTSBPGztHrppAOOb+w1MTkBg6JUipX99E/Z9ZpXqPn8C7+w
         7tTJKynCx3KfMmxe2xmFLbCNRKORZRpociRnkVa6d9EhMhv1XpgouDuBG4jSSYGqZuNi
         8x/uxNvnglPkkZiM/+aXc+e7O0vMitv2sCAJ0TQiDnhj+0x7RG6uIOUp2AUISpEK9wT7
         7JwBPJoFoIttzCXOwmhZKit1S7UfT9bMBhHa6Qzhmd0SKE+M45Ww3Hapb3aBdDKtq3QF
         MHkHVzyjG8OsSRVj5+++2tLg/RGbh/qMCfChlMGOXeFLj2lQa1PgGocGlUsxEXoi8mml
         flaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675380; x=1790280180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=AqOoEy2kxbPQSpy5rfjF3ky6OTFfwpJt3F4Wj539QO/PivlXaE8ERqNet/Es2UhYYX
         R/WdUqiulQMRgnhxYcwBOag2nMIbZX6UUt29WHmBneyP82oXs0nKRljpgGGch8jT+wBK
         f74WPjxmeSk45bQiT5+b6SsaV85qmBJKgia7Dm/47ZnMAC6h8E7TsYvtwkYHB74hAqc8
         Li7f+L351KhZ20xCQjgOjtYBTREKZlSAjK2yoVnrSa6D9F1td5GZHXNIWFnq+roiyYGX
         z4LfzDSeOakl7IIRId2s+juEpmzq9mIq8vpcjnCxodVCTu3VzX048hQ1TuMCo+d7LbaU
         E2qA==
X-Forwarded-Encrypted: i=1; AKwUvBw4BI7DF0vzXGmItiyiycB65EyYG8Lq/R3mwdR4CyzmrpPmraDmVcHETzJ7yFXhFO71Uaih@lists.linux.dev
X-Gm-Message-State: AFuF++kEhYiyGGu6Qu3izFS3CwWLVuK9djMxXyOQjHiZdAqN6zb+F7wK
	sQriiqCAOi4m4CirQ5RhkYgpypLVWkwroa2lnsd4oUtsWYZuzWmwgKvOHbWsbRKuMqwqQB4JZQ3
	nAY3Vq2iy3nImS5aj49+yjCv9h3rEoT14l0qfQRwL
X-Gm-Gg: AYBFou23WCcoHUqiDzuTzyomIXRzeqvAf+Q39u0unlV1MU1C7Z0AujTNHqPc9gPOD9n
	pyN4PGJxMY101Sw9gJFvbGATbw6WnQybbdICYNkxbynmWaOSxlhzJUGe6DnL7QMdXupZCjsv1R/
	HsVY7X4sfDo58eS7bNe+YQ1Hg0ZnVeF2T6KJc/8e+WjiqDTK2zRgLLDcWhmKpRLgqqCzYfnKDd5
	e97+Oup4/fndH05xjgTgL/Rt6RWYcrxMB3HaWjaC/bHCL/gqKXJX0KHNDR++5gO8Lc2Ujgx0hxB
	yk6eGFMVJ/EbFBl9KQgs7y2HiSGJquu2vdOPqSTWESoS3y0ysin9k5S90wKi5jx3of6QNoJtfa2
	OfMHeWbiEJzCpGS40UDlcXR5ie9CrfXRWGYbiwg4LLzfVwXuK+4xuCUY8QR9nO0JcREb9IcQ=
X-Received: by 2002:a05:600c:a013:b0:49e:6891:27a8 with SMTP id
 5b1f17b1804b1-49fc574a9bcmr72735e9.25.1789675379819; Thu, 17 Sep 2026
 13:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
 <aqwkk7FcQ0XWeqJW@gremlin> <aqxCNyxYRzN2Oher@gremlin>
In-Reply-To: <aqxCNyxYRzN2Oher@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 13:02:48 -0700
X-Gm-Features: AcwNN1XUt93HLe1Zu-oZLdknUZyAU05hxj4P7Ko_JzOHOx4U0fnT6yaI1XKYaw4
Message-ID: <CAKwvOd=zbE8MZXCNCBJNpd2WWn7f+AOfxYcmCp7e-8uFSM+D9g@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 12:42=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Thu, Sep 17, 2026 at 06:36:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 17, 2026 at 10:15:26AM -0700, Linus Torvalds wrote:
> > > On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org>=
 wrote:
> > > >
> > > >                 =3D=3D defconfig FULL build =3D=3D
> > > >
> > > >                         before    after     delta
> > > >                       ----------------------------------
> > > > Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> > > > Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> > > > EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> > > > EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> > > > M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> > > > M2, clang               634.5s   569.4s    -65.1s (-10%)
> > >
> > > There's something odd going on with that M2 gcc build. Why is it such
> > > an odd duck?
> >
> > Ugh dear lord I think the LLM somehow corrupted the numbers... Let me
> > re-run those myself locally and come back with the actual times!
>
> OK numbers are in:
>
> M2, gcc                 564.7s   512.1s    -52.6s (-9%)
> M2, clang               615.1s   564.1s    -51.0s (-8%)
>
> From the v1:
>
> M2, gcc                 564.0s   512.4s    -51.6s (-9%)
> M2, clang               616.1s   569.4s    -46.7s (-8%)
>
> (Tested as per the cover letter pre-reqs, i.e. applying dependent series
> first etc.)
>
> Not sure on the -5s delta on the clang build :) that might have been me

Clang is faster on Thursdays.

> being more disciplined this time to not use the laptop at the same time.
>
> But broadly in line with the original numbers.
>
> >
> > >
> > >              Linus
> >
> > --
> > Cheers, Lorenzo
>
> --
> Cheers, Lorenzo



--=20
Thanks,
~Nick Desaulniers
