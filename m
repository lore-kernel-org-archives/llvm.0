Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094A5584DB
	for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U6WCyGTk"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-548db776f6cso649a12.1
        for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 13:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700602246; x=1701207046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXRXOHrIRmnNFfmvROVe8lKDFwRW7hSZ8Iy3oG731k4=;
        b=U6WCyGTkC322R3kcz8XfZAS2DnoRU7c2pKSyTXjpB4sRQ+PEcPzy8Rre10LS7cE00t
         2X1B0oWrkkAeueVRZfwzmXWyvDYGhIuFG7oVBeX0+ysax9obuyOdd933mCwjP8DK7k00
         auT9ThqS3vPQIR785ycHqywLVxZgebJrBQHZ6319FpI/Xh24Ni0z4LEhl+ypCSxlOQiy
         RePT77PwYJVHWPPWfLPctTHAyH7xA+BQQmrNs/9UFC2SXDDWclLOywdXLyM/0WCiyGwX
         TPuOyiljJf795ovl3fIEoIvoQokDSU+RLvDnWOvhr/1ArJL2KJYKoyllpSSN4H2YOVsm
         T9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700602246; x=1701207046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXRXOHrIRmnNFfmvROVe8lKDFwRW7hSZ8Iy3oG731k4=;
        b=CTl8VvA230F7BAPR+wcIDGvEZySElT8eH4pvp7Oulrent9pklGbYhPjaO671xVTfan
         bcDs3fBcTz7BQ3QPbYCtCwbtIQrhdFvDEI9LJy99nqhaaPa3r1QpqOPt8ts7q+8kJbHl
         3aIHcUFXHHqUK8q0u/HHAbFpXL7ybUmvQ5IETTOfXxg0Z9BtLhjrXfBsSSNjLtYMa0MK
         Tog8//9Mw98AgDT/9YVjRnPS5yW02WxGFWsThFWh+bBD3Y9Mdg+vDsMocJ2IAqPQtqKu
         2yN/Vce7ammsz6daM/JX8hT/7K/1m7j101IOZWr+sLj5YFG0hOF3iS4ManXtYSknj+GU
         Aj3w==
X-Gm-Message-State: AOJu0YyRfoB1yZAWLWQgmtuDkLu5ciyoXYcNa28fJkXpwoWy6SVQkBpc
	VTf4u8W/1857bYC6VUOuCtpY8EjW92P9f/2g8mUz
X-Google-Smtp-Source: AGHT+IHOtAA86g7jwkpaavoDBRqXKPir59yYYqgAnqkDI3hxqIE8E0l3kuP8HHpkUDJfRxjrgyK41yk/p5NeVcpEmRU=
X-Received: by 2002:a05:6402:27cd:b0:547:e5b:6e17 with SMTP id
 c13-20020a05640227cd00b005470e5b6e17mr56442ede.2.1700602246100; Tue, 21 Nov
 2023 13:30:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com> <CA+icZUXFGp-yoWUHhbowz6YJyoULCgtjSZ-fTpRg8YvVD9V5gg@mail.gmail.com>
In-Reply-To: <CA+icZUXFGp-yoWUHhbowz6YJyoULCgtjSZ-fTpRg8YvVD9V5gg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 21 Nov 2023 13:30:27 -0800
Message-ID: <CAGG=3QUTLTiD=4aj62YXUvLy0jCufMY_-+G-dYrtqN8i=tcqmA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: sedat.dilek@gmail.com
Cc: ndesaulniers@google.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 2:58=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> On Fri, Nov 17, 2023 at 8:24=E2=80=AFPM <ndesaulniers@google.com> wrote:
> >
> > As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux P=
lumbers
> > Conf '23), I'll be taking a step back from kernel work to focus on my g=
rowing
> > family and helping Google figure out its libc story. So I think it's ti=
me to
> > formally hand over the reigns to my co-maintainer Nathan.
> >
>
> Hi Nick,
>
> WoW (C)lang(B)uilt(L)inux baby coming soon - your best patch well done!
> (  "Catherine Beatrix Luana" might be a good first-name (my
> Suggested-by when it's female) ).
>
I vote for Ada Grace or Emmy Sophia, in honor of some amazing women
mathematicians. (I'm trying to get my friends' children to become
mathematicians!)

-bw
