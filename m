Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B103225743
	for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DauCO2JK"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e2e4c88c39so8552827b3.1
        for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 10:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493047; x=1703097847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2LwifpOgXej1dsHd1KHJezfiI8h2hD12gEj1McMU+k=;
        b=DauCO2JKZ5KTgRQFKbcYttRoW0MqViGQcJhW/EM3b0voi3NlPchUYjEgV688kd6xqL
         F2TeywGZYUKJev2ftPyOgkciSU0fZBgkM9KKjscs0+MrN057rKdM9P2/NbwNxJrJflXo
         cTxpIGIfbazWUPbMHGXhXX3YjQhdURah/Tdy9tCRH0TAOv8rusYuYfdIGXYEkHKdE9DU
         tUwnkLs2+yNd6U+cFOeGgLzSn3+V6kBoV5jAAxmC/SjJRLQzPD7Hu0YUKgPXybdvMQ8I
         0yGoId2OeyAk8jUs0fNJ7v3o8GiuZoNrfuqgffydUHvoK7uE9zNaFmNWYDZx9aCkhppM
         CxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493047; x=1703097847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2LwifpOgXej1dsHd1KHJezfiI8h2hD12gEj1McMU+k=;
        b=IxFeGuH++rmJENOwj4qRQISD3noWGKzTJ5YUGom0cXlHhF7z7AvpHrJkB5to+/djuT
         AlZDyixJ3n4iYrewu2ChNDbtCqMMpCkD6PEh0hN6GiWL85eSty1+xtnjLIKCwjeyIDCK
         udUDBOP4FHr7GepU0Yg5B03y5Kj0g9Vz+ba2uDD7pZBrdQuQIMwlsCC+HhXuC9p6t4db
         MuHHKZBFOXVRm7quvuMy7DBTKg63X9aWaLA2XWChmr+3i7UhMxkmrD+ya2VorjXdHjXv
         +CXAmDRhT3Yh19+tUhd/MahATDsExks6YTWpKLgyvjgdixFOXABKmzyMeR96oK2Okg+m
         qnYg==
X-Gm-Message-State: AOJu0YxHDHLCuXR4Qtt3St6TIfitzPll0RHM8fz+QWWkj8uq9M6C9IaM
	etA/7BCNJep1Hb1hjwT79nrhkAbx6FJV1jf9OJQ=
X-Google-Smtp-Source: AGHT+IFd3K+SY9c18W79MkJVqB2q5KL7a71Eye1yZ2Yet4HXlhA9PPM7Cwa5kQtzyj27Aii8A7ptyLqtukiMGfgBB+A=
X-Received: by 2002:a81:8415:0:b0:5e2:f017:24b5 with SMTP id
 u21-20020a818415000000b005e2f01724b5mr989270ywf.21.1702493047731; Wed, 13 Dec
 2023 10:44:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231031201945.1412345-1-mmaurer@google.com>
In-Reply-To: <20231031201945.1412345-1-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Dec 2023 19:43:56 +0100
Message-ID: <CANiq72mmx01ow3fN_8uaWFOw1wDZ2DfN2ZgEA5O+412gzeYCCg@mail.gmail.com>
Subject: Re: [PATCH] rust: Ignore preserve-most functions
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 9:20=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Neither bindgen nor Rust know about the preserve-most calling
> convention, and Clang describes it as unstable. Since we aren't using
> functions with this calling convention from Rust, blocklist them.
>
> These functions are only added to the build when list hardening is
> enabled, which is likely why others didn't notice this yet.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Applied to `rust-next` (used Markdown for consistency with the other
comments in the file).

Thanks everyone!

Cheers,
Miguel
