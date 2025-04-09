Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6042214A69
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231289; cv=none; b=eTcygHa2062Lq/0yFLHE1PUBaOeywS7GCHIVCNUb5jK1uNg4YoLnfJQsM8DrU+C8SutMML0NqSRqOcnpFEhWQDCCDakSsYNJLKu0NcwvfteEAiUem7ulkSir3pjrHi7LlJKPl6DNVq3YCxYk97tgXRaVU6JVEYmWrWLW4eY6imM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231289; c=relaxed/simple;
	bh=08M4Cu8f4/GZ76LZsMQ4KuG2gM4zTrxyaw5Ut0KXJPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCCveQIfNhQV0XGZij+YcS+moOa7E8gfQiTHZpDFXKuz1AS6XP+N+aQAIKumWWtXrZQPZ2OOQtf+J+1/p5Nl12uTw5jIq9crW41URV7yi6O/n74OefBAqYNW/ZeRjiEME7Ov4+aOl+qBaEf9P5gl2NQnWq3DtgnnG+z+4FNeg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMxuYAIq; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMxuYAIq"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301a6347494so11042a91.3
        for <llvm@lists.linux.dev>; Wed, 09 Apr 2025 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744231287; x=1744836087; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08M4Cu8f4/GZ76LZsMQ4KuG2gM4zTrxyaw5Ut0KXJPg=;
        b=dMxuYAIqjp2GPYvDD/Eh60rVqYCwX0I46DqZGPGhGYYD+xY+USizWCmutozAWpu4jf
         ujvi8ok1zM2DQFhqavJyi/IajuuFlzJ6WS7t+qS1DEi7Ggc9rAHFGv6EIUV5lKtYbH1g
         +TFHFpNrrB3lFcr6oHpELaD4nXmMhBIkjQo7LqZQeGUbrdxSMkdodff6yU63BkHSLkVT
         vRIp4HaHlkJdT+1LKB9BBDMt/sz+Zw2BuZZ5kWdM8H6joYcPRhiEjfI6ZTwOYvGPh1YB
         ciks0+YexJmKTZ190h6NMk6AznSmoeO1PJlmUVtOMMYzwg7agNUrCsPpip1r1ZN2q3lx
         nTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231287; x=1744836087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08M4Cu8f4/GZ76LZsMQ4KuG2gM4zTrxyaw5Ut0KXJPg=;
        b=jITnJUJYvtQ0vWr2UlG3SS/DAD8nTgFbkn/uPMwpaCObPgaAGv4/Rzpe1Z7nK1x2Jw
         kciboLjJw75Zk7/+hNjXsNfjHeLcURmz2d21UbGPUFv3Ev1/xW+EKTGoZZObRiCU9opJ
         erwYOr+k6ZZkUtTzI6ehOoyk3XnCy40wuwHOSXQ8fihdgypt56Lu13NXR0TrosYSaeO+
         rcWbC+cLVFoz5nz71iwnMXj8hHscadQ/7DbobOWeBighPWabU0n/c4tYm/UC8i+pN758
         qAiUrPICN8+7H8TFIXigekJ2442Uj3EZyHtgRgBoXik/atnnd0G5bp1E+M74V+s/qvBt
         1nrA==
X-Forwarded-Encrypted: i=1; AJvYcCV+E5TtmbNdh86UlVT0NjWHP/tqDNI1iUxMTO6Gia4d1KLmwd1D8rh6Gj5E0AV0NN44WnAa@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp6FnQDo9VcAaiX3brfNAHVIh5q2A5LC5k20WrPdjxbDn2rzxh
	+zmxZIbBfoxihcvbGW+BhmeNfF9A84HjA+9c94F+M+/DGhhdhLNh7WP7g6G0WDzSMSgpo7PhFEj
	80/+eVp2iku1DGjOZgUU1DHs/Yo0=
X-Gm-Gg: ASbGncs4f/K/4yLjvaaFFX4Mgfo82mu7CWFocdLzFdeT24fnG9sbdA04EWCfo/hZrzH
	dlYzxbTj7DQq+KRo0bBJHs9yLTVguC1IfXBRzKIp1CPNUotEWeCQ3HZWHhyyeueoVG6hx++0rjd
	0tz5hjpPKm6zuHsLPD1Mta
X-Google-Smtp-Source: AGHT+IFlUdAp7iMiSSgLlCglw5++ynmRK8YOdTyTyQRlrOIa5H/c9zmUX9o1zmMc1bgLsmOJg8/hInWZSh1WIL81/3w=
X-Received: by 2002:a17:90b:4d05:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-306dbc0d00fmr2047978a91.4.1744231286958; Wed, 09 Apr 2025
 13:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
 <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
In-Reply-To: <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Apr 2025 22:41:14 +0200
X-Gm-Features: ATxdqUF2RSyMHln2rE54PHHogZqs6zCAKePrIc8_VSy9IDLlXknSuaNOZ6Lvaxg
Message-ID: <CANiq72nc-A2WZn4xgfKyqr3GbgenhXjZztHqnf=12xY16ggHkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Is this compatible with DEBUG_INFO_BTF? I'm concerned that we have the
> same issue as in commit 5daa0c35a1f0 ("rust: Disallow BTF generation
> with Rust + LTO").
>
> The commit message should either explain why we don't have the same
> issue, or this patch should prevent configurations from enabling both.

In addition, from what we discussed in the call, it would be nice to
have some performance numbers compared to not enabling it, as well as
compared to cross-language LTO.

It would also help to know which users out there need/want to have this.

Thanks!

Cheers,
Miguel
