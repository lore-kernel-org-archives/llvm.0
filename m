Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818F49651
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 20:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187009; cv=none; b=eR983t3pBiwXBVgQEVisaxRhVjjW9qT0cWe7uCBGZ5Cf83llIyco5mFtyuRWlaC5b75OqaKJYgkUVUgh3sIqUYYXpbVOI67Nti852s8MEaNU5F3IvJH6f3Q2lgwaFu+ca2klRlpgbxKhL9FtUKbBOiBOLgJYNlJNjyVJE24tpI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187009; c=relaxed/simple;
	bh=VzJFd4bvLYVyrRq91pLVKMp6cHYmymXxbjKHf0cCDsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg78Sw3HNUCVJdw34tAiP1APO5/D2qwTrxoUooi5QtTEvhh5YCu45qPu2sr/BWeu8zUzGrFfBlhPtdLbFmApu4FgfpCO4v9AUlYMUG4h0Vn+pP1CNI/aezLy+hj+RXZ7Yt3jJI7vlI7NfE+w3dzdChFTRsJJVi266lInAu372+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCAnfAGF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCAnfAGF"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53345676179so17284e87.0
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 13:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724187006; x=1724791806; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzJFd4bvLYVyrRq91pLVKMp6cHYmymXxbjKHf0cCDsY=;
        b=OCAnfAGFz/+3mBUbxNWpIcVsmeXytfyQjyjQS5jok1DmOA52WQAq8IgUBeoUPGQaAs
         eW33Vy+5yWQBoAjbNNSqkNveFDFKMsihrjH91Ee5Df3c9eDTPMtXppPiX9tMAgFJUhZ7
         HOq14H0WUeVMA7AE6w0riK5neQHmxu64FA4ba/+6hZ2Ya8ly9TMQP7aCb6KcsaUfJBOJ
         euC706sPeUvQfHMpNZQExWvhk0R3xhQp6bTXijq7MQoTHowS57FatiG/eh0UM9w7NWie
         g55rEy41AM5rlapeTR7Xri5OcXajW/tlahbydwUXZ9hxBfJ3UwyDNyH8J811iKlM8CfS
         dxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724187006; x=1724791806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzJFd4bvLYVyrRq91pLVKMp6cHYmymXxbjKHf0cCDsY=;
        b=EdTUInsLVVEoktpKtskSUA1Pk3ERC3ltVyl+3YbKmqcWga/r3CwaS+XyfzashhGvJk
         eZ5RmxnfBvJKs6P+UbRZ8V/8UU1mNUodG/KbETyItW8WbzAtfgxuU1TDwTyfHTaGRXK7
         Rb7HC3BHoJv3/TM0K9d2TIuDaKdDKgfol9GNUjRrBN7HvnjScns9FEmCH1LUF/3MuKJa
         cMPfR7fqX1elDz9CQ9Zxm5L6tsWCqkRYj9nW+FO+Lu0kYvTqOdR9fX0eQ1sVIrutv7w/
         qHz/ErgeHx3PllROLlZC4grT/QhiGaZNkXG+kjwPguJWe1gJAnbzRv8KAzcolyJH2xCe
         jzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8P9Nt+ZzuUWtJQGi4zq7MtfWslLHjcZj4GVuAn2iQ9u3ohBtd4TaHf2t2xz+bYON9/Pol@lists.linux.dev
X-Gm-Message-State: AOJu0YzCS39QKVMzWovoQi/LLr51HUVMJp0BVBTIuKjCU/xSwYtALp1R
	aK6XkVs3XdagfGlSt4RCmpNhd285WRNtznWLBNqvuE2Dgbi/eWHlDyoJG9nYKhuGrNA2zc2EC15
	WT5kxonA+/iLeFzRw9kSvwn9CvMQ=
X-Google-Smtp-Source: AGHT+IF4A2X5DHiMp2y/ISoHY4+FoDb2VARi23ScSmyW+z0nIW9IUdjYL2vjnS5voFYAV9Yn/hORkomSr0zeq2FvaaE=
X-Received: by 2002:a05:6512:b99:b0:52f:c337:4c1f with SMTP id
 2adb3069b0e04-533484ee187mr12476e87.0.1724187005190; Tue, 20 Aug 2024
 13:50:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-2-mmaurer@google.com>
 <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com> <CAGSQo03GVik5_yXFmCUnNUnPUwuwk-YFA0kqBd640PUjFOXcGA@mail.gmail.com>
In-Reply-To: <CAGSQo03GVik5_yXFmCUnNUnPUwuwk-YFA0kqBd640PUjFOXcGA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Aug 2024 22:49:51 +0200
Message-ID: <CANiq72kgw8YA_1yFrCbo-=okFC8Y5R1rc+QGhE0e7pVJ0bV=2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
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

On Tue, Aug 20, 2024 at 7:22=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Sorry, I did miss that in the refresh. To respond to a few points
> before I send up a replacement for this patch:

No problem at all -- thanks!

> I expect this to be potentially used for whether you're *allowed* to
> set `RUST=3Dy` - for example, if a particular sanitizer is enabled, you
> may need to probe whether Rust+LLVM supports that sanitizer before
> allowing RUST to be set to y.

Yeah, makes sense if we do the dependency that way.

> I don't think so - I can't think of a case where we'd want to error on
> a warning from an empty crate (though that may be a failure of
> imagination.) Do you have an example of a warning we might trip that
> we'd want to make the build reject an option's availability?

IIRC back then I was thinking about something like the "unknown target
feature forwarded to backend" one, i.e. to identify whether a target
feature was supported or not. However, that is not a warning even
under `-Dwarning`s (https://github.com/rust-lang/rust/issues/91262)
unless something recently changed.

We can add it if/when we need it.

Cheers,
Miguel
