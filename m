Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C9D277CAF
	for <llvm@lists.linux.dev>; Tue,  1 Jul 2025 17:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389677; cv=none; b=Ng1rDYD/6HEQRww+MAxQ91tEQwHlCxgYDejKZJYRQQXiyRXmeBUMLQqRub4lJXNAQ07AWxWq++WtJ2mghPomDhV/ngB1hNatEoOPheYctV3pUx8xAq79zN7ng6GiqZE3cX7ve4X2kbvh57KuL2kQqcyLxUj6EjeC0cmoB1D2dM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389677; c=relaxed/simple;
	bh=otvAmKrNgrGmm953h66f4Y1tIUJExy7j19EPbj8H6iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nd465FZ23/Iu6szVA5OEjUT/EBBUb/pZp+5paK8GwLaAocMsa48ExufpTHt4wJHVVT4bVRBeeafRMnKzyfiJ0O2ZTlB3IrEjrn/b4AYZQV04CDEiSw8hIb38XanrY2FWobJ4jWo43pwuFRlHMN1bXfx9oLlcwhgXGrC3h7LJeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUX1ZIYd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUX1ZIYd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3138e64fc73so857581a91.2
        for <llvm@lists.linux.dev>; Tue, 01 Jul 2025 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751389676; x=1751994476; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otvAmKrNgrGmm953h66f4Y1tIUJExy7j19EPbj8H6iA=;
        b=UUX1ZIYdWCASvHBEsLP8t5h9e4Dj0nzwRtymatm5u9K3bvNUkwyYV81bVZxc6dyU5u
         ElD7MGjfkU9HPXSg0yHV9Am9jeKxB2RZsHm8ZLc8TyHwJpaAiyOQ3KgtWfvgXoIDzm8d
         QrGZfEU+O69Hp5gIzez6Jf0kN1woSxEmaTIfWFJX1jsZlRo2IguMVMQPNJKehq5QHeqe
         BZhfClLCsX1mSBtJb8KfeZ71EDmqc2QlSMtq2YYadCAAxE7OYf8CTBqSIyuAk994h3mk
         fFZUVqjxXy2Wcz7uVsK9OIkJUBQzXiUzAZdfQJbu2CKTCmLn2ZP3CDUXMR+UTMdY7uwU
         g8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389676; x=1751994476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otvAmKrNgrGmm953h66f4Y1tIUJExy7j19EPbj8H6iA=;
        b=aNmh0VHbhkqsT5q1WslYjzpGnC7ptgvAujkpgmbc1qh/Ge0dPnhh0QQ7/4Psxczd7g
         ehwnnwrEwiB6j0GQffZcu5rKviFlu4A2QBpIuFktdfT4DGT5bY7NQyfq3xpUMLZ1mbzB
         0ZlIzD7TINXG4RdlbZMajVwvyo0uDrdgSBzP3ZR2VJrn13On5N5bKMF51QRkwE9YWWy0
         2+K0JCEZQ5UmpoHT0qW8eFzoUumA6jk0aPmZGWSl6fHviWYQImN4PJjHKC55bR1DO6wA
         0yb+dE//rKRvbGI7a4f20MjXEPYr7J8ULg5IanyRkiL6GcIfFnr6ADrxDFuHyUVXqRT/
         KkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkttM3ubqJdBci5bAUXioRW0dqCFMX6U8I0YhWEdc43inpk4HP8mZLgKNWSz+irKxmJqEW@lists.linux.dev
X-Gm-Message-State: AOJu0YxJNuIz+B/SCChmjXEAhybtTgCRX6ID9/swoLeOCVzIGDFPOqVi
	4n5POxXW1/CMi2tF/xgB8ubDd+4jAvrMld+h7OQrsRR1mql2WABZCezMaRv+f1QSf9X0hxp/edo
	BjaLcWNoygacbh0+0iBFn7I8SeQi+uDrHGE2VHxI=
X-Gm-Gg: ASbGncs22va00unTgSc+iUaHvXLc9Ub58wl2rxXazy6wSFHF1OMPaqtEsxv0FMj2dgz
	R6nlTNEdnndymfli8B1MnMNDevuSl78AvNfgOyVLAWVsme5a38qu69zRe7MJ4nXhsgp3pbBhdJ/
	QJk/P+gZ4M6Efm/tw7BZGM7ObMt2sG7tp925uSHdND2mgKdxyydj/tog==
X-Google-Smtp-Source: AGHT+IGgyj2cxaLL1I/RbT9oFzMdK+mMcfN6YoSZuvCYWImRFjEfnNWMRG/RDCPN3KNKY0Jv5Rbef8Y4TKqAiOAmPyk=
X-Received: by 2002:a17:90b:1843:b0:314:29ff:6845 with SMTP id
 98e67ed59e1d1-319519ee90bmr2461781a91.4.1751389675613; Tue, 01 Jul 2025
 10:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
In-Reply-To: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Jul 2025 19:07:43 +0200
X-Gm-Features: Ac12FXxPrxBmeSfKO3xPaPnHZ9Ojlak6uQ0jVcG0JF2jdPMZA5As1xRK0OZ6894
Message-ID: <CANiq72kb5b-Q4OwASfGg6gz94fCQSLH34u29umQRsF8MEhR+6g@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
	linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:49=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
>
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vador=
ovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks for keeping this up.

Let's see if we get some Acked-by's -- otherwise, we may want to split
by subsystem and avoid flagday changes wherever possible.

Cheers,
Miguel
