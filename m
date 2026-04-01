Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420852C21DF
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050312; cv=pass; b=fWWdKY1x2DT3kcOFuK3ZczopgOvtE7UHHMA2H2uyEON6G0FATVG9S2jKIdkpeiWYnwu/AvJ45QRLtun99eICm+Xu4MRd89MPDyW9W84COf5cUGs2qeh+l/4ba7C09rL6h5LeuxDH/SoEC2EIZaffjJkKiaS24PGP/hkZ9gfK82Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050312; c=relaxed/simple;
	bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJyLW62d1N539xjN6P9Sv1F9W65ceWEY6ub+kTUmbWfcvJeebwa7/6iINDDR4Tm44MjMKKCjoNn9VzoyLjJzCoSWWRhk7GLixtpvoLTb2qE94FAeuBUS5E9SfsrTvSg4Yj5/8FkJlTOFnF+SZXfK2uwhPzJe51QnagFRtBstfNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaiIR8ys; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaiIR8ys"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c6f5574d07so109606eec.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 06:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=YqoJoXqSEOTCexBsymdc3icjhV8KGGZzY9HT+kJyQEs2AgegNkWfv2FRPkVF5MoCyc
         1TAYx4P7+4Wa5xSs1C/j3VGIw8QHk885HMonHymrWpVBYQBHKbr81Rt23mNDAA3h9UlX
         X4oEReXTPSf/vN8GZVy/G4CF9hKekUAppNc6tmjO+85IdgVEQ1gA6pKq60yDdrJUwnDl
         iRFCX9sIHLFNhwu4WGqnPgMqnviX5sTOro/bcgA4yfGPJUIQiCa61S7m9lM5XOGR65t3
         ly5phxHfQNTDHj/dbtsnhq7gbW+eTBtVlEXK+gkja2SKUCTu7Zssn33BGdUUfMg2oEoY
         ByRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=7ZeqEwnV4SUuXV2/PtU+wRO2Do6JFdEPG3tLOe9AnOQ=;
        b=TquWNaWS77IoqPQUcS3myvpgD5Oz8MJ6B1e9KKL0u0RNaecsHkp6PWVLr4Rgy+dL+9
         h2xkVnnypo+xppoRfxeFC+qVDbUF0nJF4Ckd5c3g3fvM3Beuh2rbeg77urZI2YzaNISH
         Q9w55NvXWQ9oKGPYKoo8P4RenizjzedAFKWcZSza5mcv9+8n52lrIiIUD7I08aTicK9X
         /PHPIBhv5gWaru29tpxvkZsktZTjP7XRezxzoyn98Y7+D6e4Pd6HhDL7Muf/WQWvolB+
         PVLjFc/2rL7syBsjSe1p6tXyg8JpNmEOdyTJiKnsO7ssjXC3SrMJU5Sz7cfgnc7VOwjR
         K+Ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=DaiIR8ys5gPgIn8B4UC7hmznyPqoDDNrykRKKeTX+KOG2x0+f8CjER/xIinkIo/HZo
         MTQQ8z4xtyRkJeOgtKau5mFA+Od81uaZO+36i5RBgiW5PTK5yRIUXn9LO4+kNryYw3vZ
         DAjbhHI73m1J7DY5g597MCTljGaR9mwtSwuZ4SFT8Z16uQWOFpgbYk82sLYgpzxeMO+D
         uJiTgzji8uUhky5IEHE3RGH6Ag70ZFb9M1k2LE1fPJAydbtqKIJeKlg6aarkazHvEWzF
         nHv0YUsUfiUeb5EZZMesHAPXo2jz0Yb1vBb6f0tJr9aweJ5/RMo4LrrbVlrMNSw1B8tj
         O9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=Dgy6cDpiGMaUT5NrpA2y9Bg2VBFEHEKGr23uk8u1F07grwmpnXaqlWIcQWNBNUd1n7
         +YPdno/okKuidallbsrXDbtNK3U5lYND9cPs/ZJpCF8xOO0+ibcgP9dFQ97AgOgISP9W
         3yQq1Z4NXovK4DohktNakeAVHCSbIlJ7NQxL69eh8BsND6QLGIZvNf71oeIJYtGVW6U5
         CvmbBFanMDEHDmK1bFOq7DqUYdFMLr4BNiCqFUWGf0XPFe2aC8YUGg30vcEoAUd4NsmM
         YmaS2YWjFQel6SGFypT/+qiun+34dGgvbYcImQZqb/2QDJZdZideitZn32e0gobE5L+K
         mjVw==
X-Forwarded-Encrypted: i=1; AJvYcCX8p5onyc3MUHfRvyjrGRFy2UqCGJ94uRlfw+UgR66BnH3zirEGi6y6zBGRIZitBp5ymhT0@lists.linux.dev
X-Gm-Message-State: AOJu0YzghVzlNrq8TamfI7LjBg3W04R3hGdICmH8jBfX5shVbTdRKvNT
	0NO/3qi6u6lLlr1P0hbh+O/5WY/QHxkfIO1ufAENDs6mUUF2gjkT9oRghHIcM7PofYQ1PZbe7J8
	7t5VNDRB2WhToGi3hRQENPSaeXnm5wvc=
X-Gm-Gg: ATEYQzwXEpR1PzaBJqovSH4JXzGeTquB4Zx9DeKyD90D/EFDc8PBy2fpEnxoq4BDuyn
	yKxJbR6ZgLjekqp1kMDtu82EO+bNjU9UvGdX4r9JK6eU4TvKt2k+XcRzs2klnag+iFXnOzwgYwv
	GdtlHxObQ7rV5x8lAyu2EUR1K1YR9+aKhPmcx6N5knpDSrnUkRmYnHAUISwIYbvz3GZl/LfO0Nd
	2IGHNXl3VVrUXTx4IhxSKgKEH9KBLzPJ7DV4JdOb9ag6YyPoc2LAtnWqNieg3y/hWiQa5/oJnPk
	XEZyFXbAoNQxmvCojTJk6FEePy33WXm3zBug7oeETEESGLO5M+EDjH1W/le+SauZ5NpKDQzJJV0
	2Yzy2bFEEMHLi7MGM+tfztxd6VpWz4kSx5Q==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This diff fails to apply on linux-next, due to conflict with ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists").

Yeah, sorry, I should have added `--base-commit` -- it is `rust-next`,
i.e. 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

There will be other conflicts too, e.g. in the list of features in
`scripts/Makefile.build`.

Cheers,
Miguel
