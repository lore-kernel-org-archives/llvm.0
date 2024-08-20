Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403371B8E8A
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174576; cv=none; b=r/lvF8YI+vF1icypJsno4hmlbanuTrqekU+Mj2bWoehwt/tb8numnxHMt6t9nGEx2zwl/OOpluSFfkBEYHTZ4iTia1xrDmBmlN0xdQtIh6IKEnfC6im35glhLTtX5lADJJvoouryiagWjZcyYRQyGZ/f4FrnS8nhlJ3kvMQmWso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174576; c=relaxed/simple;
	bh=Yk067SnRDTB/yWZvQw5AoltCb9lkUfMXeEMYixaFhDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8I6rOSXziG9df5TgSF/TYQ7/lUjTJds0hKC/x+WYItSzbnnP3+E1zbbkop/X1In89BKCJWc8tB/MdunrHTxC2JbI6XZh2/0xJHqUHaeoLXNVzYk8rd+J7g8bYyWWKbkVUjesPV8+nW7PWCAA67D+1pZInGcuv9r+ogv697LIUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x5iF9mMs; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x5iF9mMs"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bec507f4ddso833a12.0
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724174572; x=1724779372; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/1WG/9ldCtAUxEKSi+2OpNUvCL9Q6L1YzxrQLiosWY=;
        b=x5iF9mMspHbOoXu95L7wO1sfR0GAsFdfcSC1pe7AmHPuV1+eY/YBMvKIiP8X+mexIK
         FgIzJDBnwDMKadDGv9eed9wN+YcjlpqpImDkbkvJf48d01jognMjonezdeutfqXTehg7
         OpreAz8JQyaHU38Qyy7XDfE0P3U14qPtEcFAIYWjakioqMAht+vboqNVociI9DC5Uuec
         A8JoLVMqc8NuZrnsz41FLS5kWX1qPP1uz1L4HtOAbdMzWgzr8Y0gWUGfMbXlTkzK9FaZ
         k6TwboeCb3Bwqm+33O40bH0iP0m0MrUOKXz2mumngWto+46E3HC9BBwc0O11VZ1PeBtg
         9Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174572; x=1724779372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/1WG/9ldCtAUxEKSi+2OpNUvCL9Q6L1YzxrQLiosWY=;
        b=mSMqQxivdaNmQcYtT9m5TFjyCU/Vpmd8CDNsU5x3/7NRbPVp6moCfXf4Pw0yq3m9bV
         MDsWzLT3vYDywrxXSY2qAc/6EjCgDvwDRrDahLTkc799Miksep17ldE3pmOjd61Txeya
         I3cw0Pc1/bdhfBYvbxdUzW5uDAOx5C6E3YJVtJWeP6Jdg1BNLwpwB9pREyeHR2/Bp/dH
         +iBRtSqVpzgbTiwlUEOPJpGAS3QQ7UoW0kGWCYin/2DthL6iCL/YJdqpthGeW+xZvauO
         VuystB8+qC8wYvF3qgWd9yBERUzGm80itbV2DUoxd6DCx91jbnc6jGuGt5YLB/oK0Oaw
         z9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdUZ8BcjVDdcnPlb1ubz3MgQBzUb/TjXD+wHLuxfTp4Qjvc6mrKw2CNCC7hPOwL8pLlvoW@lists.linux.dev
X-Gm-Message-State: AOJu0YxvYnKJrlV+26gz2bNWDzI6roqKLOzXKb1+m0XeOdLUh1tC5wwk
	zzHPYsZYXgWSNoDXIO0BQeImOQ1Bo+zJACZp3+RCxRR8lleoKpZFIKI4EMhQSkUClEMjHhxZjM/
	X4OJYZebG3HrYw6HfaK5Z/GgOcGD2YKXrOCfu
X-Google-Smtp-Source: AGHT+IHnzEjfKJoOP6zSpqnlVKYAp79gjJZtHxgxIKFwml3ILU+99PRFpoeiHBZGo2fYFeU5opRvNpd5SUSI7TMWSrI=
X-Received: by 2002:a05:6402:35c4:b0:5be:9bb0:1189 with SMTP id
 4fb4d7f45d1cf-5bf0be0c727mr163175a12.2.1724174572142; Tue, 20 Aug 2024
 10:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-2-mmaurer@google.com>
 <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com>
In-Reply-To: <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 20 Aug 2024 10:22:39 -0700
Message-ID: <CAGSQo03GVik5_yXFmCUnNUnPUwuwk-YFA0kqBd640PUjFOXcGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: rust: Define probing macros for rustc
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 7:20=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:

>
> I had some feedback on v2 -- was it missed?
>
>     https://lore.kernel.org/rust-for-linux/CANiq72khUrha-a+59KYZgc63w-3P9=
=3DDp_fs=3D+sgmV_A17q+PTA@mail.gmail.com/

Sorry, I did miss that in the refresh. To respond to a few points
before I send up a replacement for this patch:

>>
>> 1. `rustc` support will soon be a minimum rather than a pinned version.
> In the meantime, this happened, so we should update this sentence.

Will update.

>> 2. We already support multiple LLVMs linked into `rustc`, and these are
> I guess you mean `rustc` is able to use multiple major versions of
> LLVM -- or what do you mean by "multiple LLVMs linked"?

I meant that the `rustc` consumed by the kernel build may use a wide
range of different LLVMs, including unreleased ones. This means that
which options are valid fundamentally needs to be probed - there's not
necessarily a clean "LLVM version" for us to use. I'll rephrase.

>> +# $(rustc-option,<flag>)
>> +# Return y if the Rust compiler supports <flag>, n otherwise
>> +# Calls to this should be guarded so that they are not evaluated if
>> +# CONFIG_HAVE_RUST is not set.

>Hmm... why `HAVE_RUST`? Should that be `RUST_IS_AVAILABLE`? Or what is
t>he intention? Perhaps a comment would help here -- e.g. something
>like the comment I used in the original approach [1]. Otherwise we
>will forget... :)

Yes, this should be RUST_IS_AVAILABLE, will update.

>Also, I guess you wanted to relax the precondition as much as
>possible, which is great, just to double check, do we expect a case
>outside `RUST=3Dy`?

I expect this to be potentially used for whether you're *allowed* to
set `RUST=3Dy` - for example, if a particular sanitizer is enabled, you
may need to probe whether Rust+LLVM supports that sanitizer before
allowing RUST to be set to y.

>> rustc-option =3D $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(=
RUSTC) $(1) --crate-type=3Drlib /dev/null -o .tmp_$$/tmp.rlib)

>I also had `out-dir` [1] since, if I remember correctly, `rustc` may
>create temporary files in a potentially read-only location even in
>this case.

OK, I will add that.

>> Also, should we do `-Dwarnings` here?

I don't think so - I can't think of a case where we'd want to error on
a warning from an empty crate (though that may be a failure of
imagination.) Do you have an example of a warning we might trip that
we'd want to make the build reject an option's availability?

>
> Thanks!
>
> Cheers,
> Miguel
