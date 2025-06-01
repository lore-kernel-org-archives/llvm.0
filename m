Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C923370C
	for <llvm@lists.linux.dev>; Sun,  1 Jun 2025 19:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748806991; cv=none; b=jtLKDyCWz5dIYPSk/CLa+KqAu6MSJD00gw6O+u+ZmYuRqhJ+nJfQ4I79TCCn6+3o3RshzcM5+/s0blZ8p1fzl7zti5U5armnqGKOqLbO+r9M4sTeE7GzatNWXxsucJoJ4Ky+4dRSaTkUnZyHULj5IBoJc+xjQjPmB6kXtN02WEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748806991; c=relaxed/simple;
	bh=zlttJep6rq3I8+o8EQ7DmNCSKFq6mJq8IUZsLPjanpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2PTK5G1eNNnh0FyOPGL5z5AsfEqH2BeehgVbEB2ICByL8THO4Psirm3c5xMG69WuystQAUN050HFl8dTb+eXeOQPhXtBIpdT+aFYmfDBY77sK1IcZPd60o99/Gps9jzn9DHx20RiXIi3Hd6wl9OFn0MY6LH7Xl/Cj5MfNjOdh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWVK29SC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWVK29SC"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5532f6d184eso4693946e87.0
        for <llvm@lists.linux.dev>; Sun, 01 Jun 2025 12:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748806988; x=1749411788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlttJep6rq3I8+o8EQ7DmNCSKFq6mJq8IUZsLPjanpw=;
        b=EWVK29SCmhX9bUsScLBBRi9Tae0wlcB9ccMfKnXCIPldOWmVFdNysbW8dC9Qn2q/cw
         o+NkCseauyfh5uKgzuf/Cd+9UfmGFH1j1TUcgXylL7R7IA5VhxhbX12gzWYTs82mvzm/
         M+jVgUw7lGc8opev/AV7AaA7T+MbJ4QvEDTmsKD/lFyS0ORpQm9A8zkEZ50IgJg5vdg+
         zsUtKn/J9ppGXCHjE9kd4kdLXAKu7Lqh93a9NF9/gy9gdQ0Sl2n5gGGvxWAy6mo8lzZL
         RwYjAO0ecOWZtXtKhWgFx4ynBg61PdcfeExEwjT0UpIbuoQ6tDXYlU1pNeVvP7PMmRbB
         +KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748806988; x=1749411788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlttJep6rq3I8+o8EQ7DmNCSKFq6mJq8IUZsLPjanpw=;
        b=sPnRKVesqHqrwGJ8EAn3F5QMTO9hJ5nAlk2orpreorQYcKvFO4gaoklcyg+cxB4kYc
         JYbdLJnx34XCK9KPDdFIK2ZKMS276X3uHc70xbpDsL8+Vs2PlsSMesGNny1wZYLbRm9A
         Uz/vzEJN883A2WAdz0vqLxGMF58aGggYcUmoXzJF/LRf3wywR8Ah9WFble6RrwarnaCO
         JN6XO3gRQAJhb4r/4MBwNTCJ0LPU/N1GUFAHbgj5xcqTkO8KMuo9l065PmCKmCLQxzXN
         rQzekioZTvrAXa0f9F5OJMPsSNOSUcnyjtilathJ78pAUmd2bDClRa7aVYo/w+ABsf/f
         mB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYxu54vS8YPhin2skZPQeJkN5DZmD2MC2iVzN8gzSciJs6CDSvS9xDQTVo1WKPcFquHL1K@lists.linux.dev
X-Gm-Message-State: AOJu0YytszjNq6FnpiXFt4G3Qljm0kgvgPKycDUPQrT1uwQ1E4jQlvcu
	qHLYriDd+RuYNPrqYQNmz+FNKNEcs1Sng+cu9vz2M+HxwWFn7gT65OetpJrXoChQnU4NF7YdkTC
	BDzBcTVjk+gDelcrMu8hQj8ZnylDb68o=
X-Gm-Gg: ASbGncu360evXl9C1Z9H7ebT4KDHwUeBH8gFjtlS+oscPxJ72EgpdSAhI2B2ZeBoyJ2
	UzZT9Ukyei0a3LyadPxOrdBsr53I9abX9CCmX1N9J4NKw/y5jbQTQehSYDxQszRE8SHLkJ1mSg0
	3ozDgT3HxA7wLc4k0i8qhA3ZvfWPgslAhjBf5IcJedjZ45RSVE10kFUDjfC5eFdO0RICY=
X-Google-Smtp-Source: AGHT+IHtRgXkoammUnbUpN1dYXGck9bKGEUGn5GT5cV3fPbuB+pGOqAmc7vwPC05DiWkj0JlBHypesZfOXv6vLdnG6Q=
X-Received: by 2002:a05:6512:3d28:b0:553:2c58:f967 with SMTP id
 2adb3069b0e04-5533b93b8f9mr3282822e87.56.1748806987505; Sun, 01 Jun 2025
 12:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
 <20250530-cstr-core-v11-1-cd9c0cbcb902@gmail.com> <DABC3ZAQ01GG.1VT5NL7PIMTEO@kernel.org>
In-Reply-To: <DABC3ZAQ01GG.1VT5NL7PIMTEO@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 1 Jun 2025 15:42:30 -0400
X-Gm-Features: AX0GCFsKjS9hgEwmEsRuHll_MOXzoBWv1p_-8FxpcxZc3tsgxztATvJimliHSmg
Message-ID: <CAJ-ks9=awTggTjr-_dkaWLQRkQVwkBQKiJzdP9dA7_=zFKRY+g@mail.gmail.com>
Subject: Re: [PATCH v11 1/5] rust: macros: reduce collections in `quote!` macro
To: Benno Lossin <lossin@kernel.org>
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
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 12:24=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Fri May 30, 2025 at 2:27 PM CEST, Tamir Duberstein wrote:
> > Remove a handful of unncessary intermediate vectors and token streams;
> > mainly the top-level stream can be directly extended with the notable
> > exception of groups.
>
> What's the motivation for this?

I was squinting at the macro to understand how it worked and spotted
these oddities.

> I wouldn't spend much effort on this file, as it'll go away when we add t=
he `quote` crate.

Eh, this seems to be in the "I'll believe it when I see it" category.
