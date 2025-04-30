Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C854227BA5
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029534; cv=none; b=Ug+vYJFEYaA4TNkj3BcDimbxLfzhIYcH2zSebrBHJPEIbNkRWPwHajwsjCgzox4mG1zk3vKGm1g8TmA509PENzvi5uqaIZBItwAxCYTTfFkstmc1Ug27zqJ8/yq4ZbrxoJ/8IwFW4FoqgMDQ6KZJww17upD/kceaCJt0ideJy9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029534; c=relaxed/simple;
	bh=d4mNU2googKmhmlSZf1BhrbHafu+MKvI216e5vmdtsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOtA5NSI+E48Ut2qnywLt06DwvdMbSfA9JZaMe/Hk5tGqPK8poHGn1Ou6wt2hkfB+c7w/35uoHXnQ7lCdMGbpdtaU/GBg08Q3hLruYl13arGBCu+7Nx9+BNlkFsAv9GqgID0xLyK4PGrL9U/HU+S4NyDFXGg3fmXPeSrAa7JhYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfAEhbuZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfAEhbuZ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so9677a91.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746029533; x=1746634333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4mNU2googKmhmlSZf1BhrbHafu+MKvI216e5vmdtsU=;
        b=CfAEhbuZCdP+4TH2zbjmWroh9deP0cO0aQIuMPEebfqgx8FN3IlC6W7vVT2pkjwhgB
         rK+k64kXgPrN69o5EowkoMJMgOKHJ62roizalEXWfAEUnsgDtbvYifaMiH0HOvnpHXx/
         kEitUVgCHSVtN1NiYLziuZrBpyzLWt2OJNRf3/E/6e570O31xC1EoBzXY4+guzeYU1RW
         rLLu5LN0BCKgTTeSANhYWz6y+EpfuVrtL5kqsCkR6HZDKUOt3U/eK7FcASw4TUXaOHIH
         rIUyR5Zjsxp/HuZyEBE44CHRHAj5LdnSCrQ3VXfzSs+plCJiOHOMBZFUgcYUYV9YuPRn
         xvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029533; x=1746634333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4mNU2googKmhmlSZf1BhrbHafu+MKvI216e5vmdtsU=;
        b=RLB7hG51ZUA9Nl6wzw8wjbK66xS+df9b87UxeFSVnk7FzWCla4W3CuuQLetX6oFyhe
         1RCbE8Gn4LiGtKGQJiOcsVeK8vDbleuWnsoLh/tFWQfjSFf7CrSmXP089Ppg0ZimsNbk
         cc/iETkvaNskBFBk/Sh4X8Sl3OdkKxUGCsOo1m4ufOszz6hD1XT1QV7F9MRgJqeVMp8W
         TqaEXgkktTGpb7mRDHj186lbW5IUyQ72N8TL7GbP4YMluQ0tQoopuORkjnMh9zKwdvJm
         Mly8I2F0N6AKt2zHySCEuaAV/xegYyq8IYg0xkRLCyQ3IORgcMvDvNjniPb1R+DE2BL+
         Rl/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFKEzH9j65LZzKmX2ptc0WNfGBT2mP97STqG+93ivomJ2z6BJEoEWoejJU99ljg6HhPXVd@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs0n2cs2X8SdTzOznyV2PWytYSJgXmOCa8+PZNQfiDTBtPSCJG
	MYERLHGsyHzxZ2sKrmZvNxUjGcrNtPEKtk6jAOLM3nP/XxV9iRjUQUnXnAq3mjPdDbuzr2+0K2g
	WRz9EQJTIWX3EFLbAUc+Mjdu0uH4=
X-Gm-Gg: ASbGncsTMwBAgs/3JU4JHyucq77aiXXWRYwkQweLHrsYo5a0lBaznSQYqwhLOjxalfn
	SdEo4MMyI6ooqFoXKBD8ZuCfCqPfL2KSEtam1G2ssy2BmyZdU+9wjEZJb5OfI2NvCyWDSGyQypJ
	ieaY0NUGuDefBT9D2a/muF6A==
X-Google-Smtp-Source: AGHT+IEbXpICMCZtMlEglv/6u6d9DeHKrHugJiPYxVYKnZgt1+Le0oAHSmnMXEPGZPs5sZ35AafOzpCaejzCGqqC/DI=
X-Received: by 2002:a17:90b:4d92:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-30a3bb7eb00mr654907a91.5.1746029532604; Wed, 30 Apr 2025
 09:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
 <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com> <CAGSQo01gLXKWLWcrxSytmCB4YmRnGDX++ZizTws0bEjJ1amWtA@mail.gmail.com>
In-Reply-To: <CAGSQo01gLXKWLWcrxSytmCB4YmRnGDX++ZizTws0bEjJ1amWtA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 18:12:00 +0200
X-Gm-Features: ATxdqUFaNOBfPlrz_zIIOgpzIG1_Zn-Ke3TH9fa3F3oDE9TplG5KBv8TWq9-lvI
Message-ID: <CANiq72mazsVZxXaw6RD66CfFXRR-sHWf6eVr3jke1mWxBcrTBA@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Matthew Maurer <mmaurer@google.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:52=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> `kernel.o` I think we should probably keep at least for now, because
> it's kernel-created source that we'd still like proved out. In a
> theoretical world where Rust has become more normalized in a decade,
> we could filter it out to refocus fuzzers on driver code rather than
> bindings, but right now the bindings themselves are worth fuzzing IMO.

Agreed, I think we should definitely keep `kernel` for a while.

Cheers,
Miguel
