Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA7235894
	for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 07:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721115901; cv=none; b=lQvswc/KIbwPnVfXkT7kLZ1TaLvj0uaofKuh3WeTEKnKyk8XdokA4dNr6qmwEIkKUFwUCZFSG4BzRnWpGQckLX4QGZ+CHvUTw6SfXmNUsepJDxiPXn76S4MpwwzMWyI8k2LrwfwYgr7SwP5k4+jx/2RvH4SeAyOdxXKgAXeuQAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721115901; c=relaxed/simple;
	bh=LhvDWCz+qUg7uLWIVZVAd05xhIPqDLC5aQEUa5TAj/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKLfISJUucSdnYMkdyBetrgOCWGezqzFyyIyMmGv4MArvEAbSL5mZ4SQYrFYG65Rj96+pWMo4XbhT7UBeW2sZmebeMtzdSOKIwJpxIRNyEOiqJBgkAxrTxJdXESX60mSgoLfA6eePjQNtmOg6EH9UtIeTvG1ErfjDnIsYcmDXEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuxNFhn6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuxNFhn6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so3010079a12.1
        for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 00:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721115899; x=1721720699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbCWXGRuvzHfZO2VrOM/qCgFYRHsmheQfUlw+5FY2Pc=;
        b=CuxNFhn6vF48pwldGU/Rz85DPLXHL0cbXFnvFH90QOnOY9nHFKUskmJSXvlhej3d+Y
         Ck/g3VIhWkmBbHE6lGhCt+xV+dMRU+S3PK3HVLnS+jtjvOzTYDmx0bKXzG3mu/Jlpbl0
         UmBheY9FNUj5w51M72dKuAakYLwbotdE6Mv/E/NtYmh+XBFlQDn3UvdaAq8KjzOyzIuB
         LkO8cnr8XwHjXTHJ+edUzCtPGHtvMjp3w/shHDyHPgNrytkjM9rWDAWpf2snfgI18QJO
         Kt1icaHrdbYDkqobb9YPsnCyCtCjRywWU7oag958WMxzj7A358TzYvCPo1RkvFhNdMNb
         4Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721115899; x=1721720699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbCWXGRuvzHfZO2VrOM/qCgFYRHsmheQfUlw+5FY2Pc=;
        b=VqCW1lvSZ8SxC3TuWuRiBmgRzh7FqWO2fJShAlMmBAN/eAXmypKsAaQp61ObkIMUUg
         UtGu23SHb68RGxNGCSoyfzZkVVJIgRvtbDBFBjqV3upWcOIG+/mym/amf6Bz3qv/qd61
         wNbNOtGTElprI80/rDLENc14Bw+ohFXQ1AnrsFPtQW84HJZ+OHa/QPahx0LrM7tJZM3k
         rUZu4QKgu8m3Rd8WOoyHFr2stns9kbeCHC3YxB2r5UOS25kxhLGkXo3Wj3ItpJSEdvsM
         nfrJLkCpkFiyzpH306pSajHPGUXU/zQKAWeu5EAgJFUq+paYg/gKtCaPLnuWHEPBylNv
         QhoA==
X-Forwarded-Encrypted: i=1; AJvYcCUI4xUdQABaLhfQWByUvPk+Vtm5MRF1p608LUs+4R4S4yN+C0nMAp0lVAykFmIAFyt3Qp5Q+BoA5iuoLRsz5eOO5YKS8w==
X-Gm-Message-State: AOJu0Yzw5112sw3nmUodwock/hrbowZHpU4X+Iy27xokRO/lx+9IAyxO
	IkfMW8efntjNf+xVDUjPOsfEKgAFZstd9l76EzikIcVBrZlDvy0ZuoFtyzS6GUfTP9CECHWJYQu
	dc7CAXIaOr6DFZt7knFd0UgQlEWY=
X-Google-Smtp-Source: AGHT+IHKJ4A/6L2tAH7elOzCsqesMbEdr+mBHlIAhQKeuGXL0JGbvM+BD5UNGVOtYhJwy9ZQIVoEqnE6Pzw8x3iWzrA=
X-Received: by 2002:a05:6a20:72a2:b0:1c0:f5be:a3ca with SMTP id
 adf61e73a8af0-1c3f124b1bdmr1554068637.30.1721115898766; Tue, 16 Jul 2024
 00:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240714160238.238708-1-vadorovsky@gmail.com> <CANiq72=kchSt5XjAJRVgNWG-iNXbc2E64ojwsQYnB2pshULK1Q@mail.gmail.com>
 <52676577-372c-4a7f-aace-4cf100f93bfb@gmail.com>
In-Reply-To: <52676577-372c-4a7f-aace-4cf100f93bfb@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jul 2024 09:44:46 +0200
Message-ID: <CANiq72nbbtNp4vGGHkXVSgSW+WU=5Z9uGRO_LLg7+ezTqrZ_tQ@mail.gmail.com>
Subject: Re: [PATCH] rust: str: Use `core::CStr`, remove the custom `CStr` implementation
To: Michal Rostecki <vadorovsky@gmail.com>, Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Finn Behrens <me@kloenk.dev>, Manmohan Shukla <manmshuk@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Laine Taffin Altman <alexanderaltman@me.com>, 
	Danilo Krummrich <dakr@redhat.com>, Yutaro Ohno <yutaro.ono.418@gmail.com>, 
	Tiago Lam <tiagolam@gmail.com>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Ben Gooding <ben.gooding.dev@gmail.com>, Roland Xu <mu001999@outlook.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 6:12=E2=80=AFPM Michal Rostecki <vadorovsky@gmail.c=
om> wrote:
>
> @@ -71,11 +75,11 @@ macro_rules! kunit_assert {
>                   //
>                   // This mimics KUnit's failed assertion format.
>                   $crate::kunit::err(format_args!(
> -                    "    # {}: ASSERTION FAILED at {FILE}:{LINE}\n",
> +                    "    # {:?}: ASSERTION FAILED at {FILE:?}:{LINE:?}\n=
",
>                       $name
>                   ));
>                   $crate::kunit::err(format_args!(
> -                    "    Expected {CONDITION} to be true, but is false\n=
"
> +                    "    Expected {CONDITION:?} to be true, but is false=
\n"
>                   ));
>
> The only practical difference in switching from `Display` to `Debug`
> here is that the fallback kunit error messages are going to include
> quotation marks around conditions, files and lines.

That is a fairly important difference -- the messages are intended to
match the C KUnit ones.

Especially the file:line notation -- I don't think a user would expect
to have quotes there (regardless of KUnit).

In general, even if we didn't need it right now, I think it is
something we will need sooner or later.

> wording. My general point is that I've never seen `&mut str` being
> exposed in any core/std API to the external user, mutation usually
> implies usage of an owned String.

Not sure what you mean by exposed, but even if `&mut str`'s methods do
not count (used via `String`), there is also
`from_utf8_unchecked_mut()` that returns one, which is essentially the
same idea as what we had here.

So I am not sure about the "The rule of Rust std" part in the new
commit messages. And, to be clear, while the Rust standard library is
a good reference to look into, sometimes we want/need to do things
differently anyway (which is not really the case here given
`from_utf8_unchecked_mut()`, I would say).

In this case, regardless of the standard library, personally I would
have preferred to have a non-public function, but still have it (and
properly documented), rather than open code the `unsafe` block with
the casts.

> I think the best solution would be leaving `c_str` macro for that. The
> reason why I removed it is that the GitHub issue[0] mentions its
> removal. But for that case, I think it makes sense to leave it. What do
> you think?

Perhaps the issue was only taking into account the C string literal
case? Benno may know more.

Generally speaking, replacing a clean line with a bigger `unsafe`
block is something to be avoided.

Maybe a `c_stringify!` is what we need :)

Cheers,
Miguel
