Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE3F63DF
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGv6K3m5"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7ab31fb8bso1405147b3.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696852881; x=1697457681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8xlOdoGoANNG8/4z3J1BZ3qILcNZDx9JymkslqHebI=;
        b=jGv6K3m5yrNdMnhJs3XeGvmNDc9cf89nd+9djrWtaLJkesRK1PC3MDk9rWXSLNZ1Rx
         qIdHsRAKVhRjmxxj24r4ABv7x5/9P3fjBp40UPn6rhmgF6bHGmH6J3gYghJHJOzsz+Hh
         6O4gHjPDN2SY58A2Ket+QSJAQXhJGaOq1ILuSuDYHg7Nfx9OJKJE9QBbTFn5jggDha9z
         R9J5KmrG1UVMXKAgqCo5u+hZBGow8OmYLEML0G6HW9fZV8V1C3nHRHkAt8SLrj/qP+bU
         wYSzOpmQ71tpTRsIMAKH5rKE2ZGVAntMJL9lcVOEGYr1+cQ8OPCQqJr8BDoL7l+i1YPG
         Nw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696852881; x=1697457681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8xlOdoGoANNG8/4z3J1BZ3qILcNZDx9JymkslqHebI=;
        b=LNLBaCRFcmATfo6KoqAxnQ95FsDbBzqcWG4uPJ077nkYIUVHhOMI8sk2lTHkpC3Xo1
         AxdYlOojS1zgOFw7jLOgsfJlME+vMKt903soV9zjcdhpw/rjkCT/q5kdN99t7NUI+smN
         yLECq+SmR8+sqMwIehU6ZM/SEamfFucMwiMLe4mGw7qMbQm3bG1bYovjhp9m38E8U7oC
         4DPIKtAFt8WD7NRH11z/8ltKOD10cTxM7XD1D0zu/7xs2FHlXG4EsNWt7Q1TPKr4F+fO
         uuGWHddvkzS5IjoOrXmfkp1+TgQoc9CmG2ys7wWZ2D/wDQfEu084RLjOkppfYMQtr+xG
         G60g==
X-Gm-Message-State: AOJu0YwUSuBc9t8yZjxVkWpYzTnPpcXshlvXe9zdUkjwEuEqdO2UxRST
	XzmepScWaxhwQ1u1vvTdImG5DDWB853FIYjO6BM=
X-Google-Smtp-Source: AGHT+IH7s5WFh4TVf+bXzMwSO2Y6ijsHfTYRfD4CrHh3NkMPsS9azV+Yzbvm85DpSIEmX55bgdwBCe8HGeIEzKvFNEU=
X-Received: by 2002:a0d:c886:0:b0:59f:9c08:8f12 with SMTP id
 k128-20020a0dc886000000b0059f9c088f12mr18976846ywd.38.1696852881009; Mon, 09
 Oct 2023 05:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231006155739.246381-1-yakoyoku@gmail.com> <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
 <ca2cd71c-0aa1-4365-961c-c10737a9e9a6@gmail.com>
In-Reply-To: <ca2cd71c-0aa1-4365-961c-c10737a9e9a6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 14:01:10 +0200
Message-ID: <CANiq72mM2BeWtZNqhvnbA3XR_ArfAi3CG3oxMuu+C74rB0+mBA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] rust: crates in other kernel directories
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 7, 2023 at 1:07=E2=80=AFAM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Well, there's the network PHY driver series that is stuck on this
> topic, I (and probably others) have local work that have the same issue

No, that series is not stuck on this.

> and said general case might not arrive that soon. So it'd better to
> start on a feature that will benefit API users right away and can be
> updated to fit needs. That's what I think.

If there is an in-tree use case that will really require a solution to
this very soon, then please focus on explaining that (e.g. what "local
work" do you have and what are your plans for landing it upstream?)
and we will do our best to reschedule priorities or we can provide a
workaround for the time being.

In any case, please note that this RFC breaks the kernel build and
does not really solve the overall issue.

Cheers,
Miguel
