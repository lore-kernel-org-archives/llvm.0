Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ACE7E110
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748292148; cv=none; b=ERF7GGr2KT6SFP+R/ymqn9Bn56fwwFBUteDq2ncYuzCvYan8E8b/H23P3Rl0D9LW8DvIaM9vSTKXbMhU9MCI8ehO1QcqlHBXU9phAT8GkHVybY+ziqGmTmC/uTMYT6fLbJhW5HfXlPKCZZWZXxcQM1kH+IvC4TdSxvuXuH9bj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748292148; c=relaxed/simple;
	bh=3gRNXhmVhQUXXi3jmcxIfz8vm/k3JI7NUoNq7z7BuyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KprkRjATMgN2mi2hcqbi88gKGYZKgRBb+WxjeUV+QPD24e7roqSzvhMTnfz0RoLF5iwMa4O4qhOivn/Tl6OR5ybqQsBweYeNS61kAyO+SyFnH3HgYq0UowTmzG+zXRGYlpw1Fn6BkeiADSpQ+x7aUqMLnII/br6fScSqQrq+eUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2ZnEhIj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2ZnEhIj"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30f30200b51so27609431fa.3
        for <llvm@lists.linux.dev>; Mon, 26 May 2025 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748292145; x=1748896945; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUmUNbUCgQeGYiOspE2SyC9Ks1s3ZxLZ5UKKm2WjJzg=;
        b=L2ZnEhIj0LYCAL3S9gAFpk20kTHEf+UFtB8i/JgZMypmMsjKPxhVRYpLw1vhyVSEYA
         KdDewdHSgxtT2rHSmBqkCfnN6IIONaQQAz512qOkaJ14BXknRdFBFSF9Zv2i4QgLJJF2
         fIH1L67moM/F6IMx9+/HpF3XAOFvAVa2GzjAP3CEytoRhZMxe1el9sNVpwPpKecKy5ky
         wGuc4amm6M70h2oQtOSRW75aVie5zRmEH4WGyuilPlCfGzegbTmzYmmn78s+cWUiXJld
         f5bEim2qvhyfpYNtu/YmpbPbGfErwJEjHj5kD3ptwf3Zs0CrOO0iMVAq1q3/PbktDcWe
         4oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748292145; x=1748896945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUmUNbUCgQeGYiOspE2SyC9Ks1s3ZxLZ5UKKm2WjJzg=;
        b=xAnCGG7NloRKfIz8lmiIlrF5M32WDDUYrYPyQaNIZACmR42V9TPcs3lzX4wCb1fhil
         ubCSaH4HI3ogI8ldNVWFVotKXaLKSFV3nIsV2WWTZgDprSIpLRMKDe5raXQYaaAj7bJF
         bZZIyPoj+dlSiyuBYYr7czP0MoGqJqo1oiIoiZUAkRxHqPVgQ7jK5FiwLP0yjmReTkbm
         YYBUil7MtBeysr59A//+qLDUMqxq/9aUQ6PulGQAnaUKE8SqP1f43GXkFlzlUOQfGkQx
         E7ntUUlNSY1z9jzp0tSpGX7ui7uOopSvpmWUBwTiVmA8oeRSvRGcC1W+J5llJWksrLCn
         t3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN+CN42UPDtvzsA2+t2hLcD1ppf/WtVMb0sA/yJBWSHL5mS1pPElyCmcGgMm+vKuXFRlik@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkg0VP6XPJBu5UYatuy5C1sQVJFTdKRWkXi5URP2Ms94t0wCe9
	jrLjMaWzq3NrEtHErqR63MMZT96+zOOU7mg8kazYhgEjpLQk3+cvr6O29B2/0UePFaGxWsybIEp
	4xMpvQgcbClt18Mvjx6TMzc5MNd4CitI=
X-Gm-Gg: ASbGnctRUmVq5B+yoOh8h26eepeFJqd3fjVpja/9jK/Gm8D52DybJOtUMSPxcGqzn5J
	9QypbEvRIwbgQIH6WfLvZFru4Ipe2YSRDmT+YJKlri7qZ5+0jr8w7ybNdlZWrPzRZOMY/wJEQ/0
	MVjZk4Bx9IUUkKA8KZzmcYxbfTq0NTX27fabxvuFF+Hd61+VeZnw8n9CDUOE2I+++z6MP08ljvF
	GCF6w==
X-Google-Smtp-Source: AGHT+IGPgo+KZWDTPWJ/8ifTkY1Vatt42x8Q1KGRg7v+MsCMTuGoZeMjT/G3sX9/OWQr2VdJiIhB6KXrUJ+SLPtTc/w=
X-Received: by 2002:a2e:be8d:0:b0:30c:317:f3ec with SMTP id
 38308e7fff4ca-3295b9e2b19mr25881171fa.17.1748292144402; Mon, 26 May 2025
 13:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com> <CANiq72nhNmLMdFTzpSQSxxMLanFA7Od6tBZ+3CrVERv9Spou5Q@mail.gmail.com>
In-Reply-To: <CANiq72nhNmLMdFTzpSQSxxMLanFA7Od6tBZ+3CrVERv9Spou5Q@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 16:41:48 -0400
X-Gm-Features: AX0GCFtRDT-ngLir-CN5e7tolI7SMct6WsZy2xxM7WLN6cJzwd9Ur8Y0NvGqQWU
Message-ID: <CAJ-ks9=8QXn9wQSX8frRqN0p7=nL+eUwLC6UV8HdQyY13=wx-w@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: retitle "Example" section as "Examples"
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Patrick Miller <paddymills@proton.me>, Hridesh MG <hridesh699@gmail.com>, 
	Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 12:15=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, May 24, 2025 at 10:33=E2=80=AFPM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> >
> > This title is consistent with all other macros' documentation,
> > regardless of the number of examples contained in their "Examples"
> > sections.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> I was going to say that I could take this one independently, but we
> already had #1 of:
>
>     https://lore.kernel.org/rust-for-linux/20240906164448.2268368-1-paddy=
mills@proton.me/
>
> I will take that one (which given the `checkpatch.pl` one got stalled,
> I should have taken it separately as I mentioned at some point).

Sounds good. I'll drop this one.
