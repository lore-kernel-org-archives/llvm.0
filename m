Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476BE154C05
	for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739726581; cv=none; b=aSGYkn/2fAUQ6SW7OUom4ai4SnSwZ8rrU6x2ROijB9dvAp57mRbVDCztONgnvHsRFQPPQLFRjM7QIYoKP+cNnwoRR+VKwSyvclaiDYXFGLKkm8tUaWUpQfVrN3fO3tmk4IKZT4Bnoj9waQuBh4aWjqRw96Kuo8Xw8EcZ55fbhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739726581; c=relaxed/simple;
	bh=NAzaBhSr5n+TYvVmnCU1DeLwwCM+jSXTBiJA0WcbAq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTtuuGtFGGMVGXhKD9iu4H+urXp4t56NmcpbEGRODGqsCwcK7gM18hcON6B5mRzeyl5WTvxgGkjJZphHE/xslthld6Op4zYxDN10+EZwblUk2p1+V+5BPFY+jnDM78R1VUQyy+TYFSnMH49BIypNj9zzzy+QYBIEH170+VxmLbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnlFU9Rg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnlFU9Rg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2210f7cb393so2606715ad.2
        for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739726579; x=1740331379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAzaBhSr5n+TYvVmnCU1DeLwwCM+jSXTBiJA0WcbAq0=;
        b=hnlFU9RgTepvefQpQxVmfeijo21Rkc1hcRz/eHUTwGJiz6XHpo1QykotmGLCzdEkNU
         067aTuGZVEM8M9HF4VYAT10ZeR2/Ur9y9UuvbOeJhhA6ZG+Oyj2iLFj/rqnrZIGBg5Md
         Twx1i85HxsNXBiPik0g1ZhUOgIa0J/DxyQLLjHMLSY0pjn+qICUi/OmkotyE9BdrU/Qt
         6mNJSHXH7+ZuLdErz2WsRs9QOo/z+jwa5GW+CFgCwmU9E+nnWFsPpmBDoysDda84ViYg
         PncQ8SAJf0l24WUDKs3YgvQ+hfHQdmO1X1fkrcdM+JpUdRX6jmJfdo+oxheNe3gxYf4Z
         4UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739726579; x=1740331379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAzaBhSr5n+TYvVmnCU1DeLwwCM+jSXTBiJA0WcbAq0=;
        b=YL3VerNhJG4w42ZMm66BJHhJ9frADgdDqKYiRqjUksbUjC0KQmLEqSZWjUNO84HkAu
         6UkFqeIccVe8oBWMmX+obqArmbCiLl8nX88CIwPpKzqV3tsoCwucPk6cTDkWgSJE1elC
         RZh2dnK5ZkkmpvEFEXnG7FvPbYIDQEStnBNNediQ2zVB6IEWwq5Vvi65EXpcRuGPlGWH
         WsUik9hu8lgIOmiVg1CX3fct2fCkUd5rSLb2YYl1pY9XQDLiwNOqg7ofQr6wJ/XIpYiE
         r5RzRrQTpfhn4kRYEtXuKP21mWEb1glwcpyow+vTxiZIhddiBn4xy14A60UCkNAFQ7eA
         vRmw==
X-Forwarded-Encrypted: i=1; AJvYcCUCCfr0O3I6oW8//53UmNfg4mcXe8rog9BtLnYpcPfDQ4XMYKrhfsww8K8RO9DWkzdd6X8I@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ1RelGSB3qeVzlN9FsL4qrYyQJ2ntiqcrADY1bmie/fkemIHa
	758rPejrZLLAZUblHEjtye5fwFIwystMYasisQ/dLMS7rc90oTg2TbuwqXNMzT8db7JxdcEjJMp
	ywb9jRFtfB+NwpF2i7LO9vDReKfY=
X-Gm-Gg: ASbGncsv97ZdNI18rRFN6Y+ifUmVoOaQAHhA2NgW0CkHFptjVRMglYeB7vfJNNqeYkv
	HuFg/JivRa/hTjIKFNYx+y38xTHarHJ9Odn+2FpFIjoGWV9HGHv9B6+D8dWSHXoYyxPgd5jPI
X-Google-Smtp-Source: AGHT+IG/evLlrI4UrJbDJlkGEG/b6g1tNJfJ8LkVEgd2/l3HmpgO7AFsqYpgoH6COZaoJexw1WzBcMeSe7shaT6aU4Y=
X-Received: by 2002:a17:902:ce08:b0:215:2bfb:3cd7 with SMTP id
 d9443c01a7336-2210408b39dmr41676845ad.10.1739726579566; Sun, 16 Feb 2025
 09:22:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250215223106.2346285-1-benno.lossin@proton.me>
 <m21pvy927w.fsf@posteo.net> <10690211-eb3b-4b95-8d9d-35c62930d924@proton.me>
 <CANiq72myMWv87Me2C6Nmse-p=4YL=J+ZTEHe2hu7AhbpfZhgyw@mail.gmail.com> <10c0a50e-14de-4da3-a592-dc65753cec1b@proton.me>
In-Reply-To: <10c0a50e-14de-4da3-a592-dc65753cec1b@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Feb 2025 18:22:47 +0100
X-Gm-Features: AWEUYZnKZihZQ0XKpup7IK-Cwnls2vvFh5EIHt1gsg2kWZeIxWUQwWvr47RI_yU
Message-ID: <CANiq72=1QvWpBi8zc_9_irU_GEn_50Fqpmqj3ANKW1WbuOvWOQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fix clippy::too-long-first-doc-paragraph
To: Benno Lossin <benno.lossin@proton.me>
Cc: Charalampos Mitrodimas <charmitro@posteo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 2:30=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> I don't think that this one is bad. Of course it would be nice if only
> the rendered form would be considered, but there might also be people
> reading it directly in the code, so it could actually be a good idea to
> also keep the raw text short.
>
> In the case of long links, one can easily work around it by just not
> using an inline link. (so having [text with link] and then after the
> paragraph `[text with link]: link`.)

Agreed, I think this one should not be an issue and could in fact be a
good thing.

> This one just seems like a nice-to-have, but not a deal breaker.

Yeah.

> IMO we can enable the lint (since the instance fixed in this patch is
> the only error I get with that lint) and just see how it behaves.

Yeah, I am happy trying that one. If you want to submit the patch
formally, then we can see how it goes.

In general, though, I think for "nursery" lints we may want to be
extra careful, especially if it may look like they will have potential
behavior changes that end up triggering even more changes later until
they settle (e.g. suddenly they change the threshold length or other
heuristics). For now we don't have that much code, so it is OK.

I think eventually we may end up putting some extra lints into a
separate group that can be enabled opt-in, and then promote them as
time passes.

Cheers,
Miguel
