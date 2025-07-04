Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4CF28EA53
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631343; cv=none; b=qowAPULxaaBbloBZg1USvbNPiwVgE3VgzjBIzx2T7CEx1PbhAXZnFkRetVk7I42lGzWMTn9w+knLeslKL65DriF0VTYGMQ1UEYzsyE7GCcS3OdYB46uP5W09iAccVKt6GeZ5j2xwPu/Ot1t3aC2Z+aX4VO0gIk6eXNedH9Rqcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631343; c=relaxed/simple;
	bh=JTF27XEasyApS1nP/vyqUwBctBYmx+jAOL8SGdjCGlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vc0irpMvrUqfxVl5VHuM+0/jRBEiSdJwYukQDR/RBpoR4ucn7gFiZ5Z4+I1DsxoTV9AAQkvxW5MeiWxu2GnZ/q9SO7uOz+WI47Pby1bAQzRCiLHzGzNsIAJk/HujF8fJh9p1Mf1SoPEfK2B+BWzCP8bHc4HfgfYhmKG/bLYFNs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6TUSk0u; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6TUSk0u"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so162593a91.0
        for <llvm@lists.linux.dev>; Fri, 04 Jul 2025 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751631340; x=1752236140; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTF27XEasyApS1nP/vyqUwBctBYmx+jAOL8SGdjCGlg=;
        b=A6TUSk0u0Is1GST869s73YBlumP4x0aYYCx0MUBla5AS7/vRkwAvz6uJXamafaejoy
         zC1HOCXG4Nf0Ly0tYhUb+t89lynAfwWObgQpukcdw2v4tSSMFsNzvOCUc++NqZRNohPb
         3asU1BwtFsVk3gWZ6aakWemgfThbtVytwpqdpmRW35L7M7Tkf28xppweuWJTKboQhQFz
         8123u4zZitX5ZgcLmWqIU/2tXZ+o6nns1pWnlgdiZlygQ0xMc+PXVEv/Ib2lS7078kS4
         Gb4RVwPx4CwCAseCmkg7NQmOAmpVR9E/GpmgQXWUB62e7Yu9u4Q3QpqnXPQinefvW3sE
         hoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631340; x=1752236140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTF27XEasyApS1nP/vyqUwBctBYmx+jAOL8SGdjCGlg=;
        b=ojzOfTmOVnV2w1l/M9f6o9P8zuPP6HGOoqxCreIb0R6Sr8+METHStyRNkj4lrf2fZ9
         5ZEqYlXDfXr/KzacrepISh6D3WwBn4MPcXQnu3umGfu7UPTvd9qePDV9lyZ2kJKDGrhc
         GtDNOUK6iKhWDO8nhRZN//MamrjksmG46Dp9C0/O3zSQNdZgOOWCoRvSeOwmp0U1YoAx
         WSXjDc84GFmUb0KcfxIZQgio+ko4UZQoAUTJ01wCRN6RHBsjzYHMl9jhQbTvnh2GwAn8
         t+m+ZQvvrUNjH2Jb0fFeU6EtsN0O+PJ45cV/6T12qHvrLu52I9TKYqxReGvlvuOQ8Grh
         7X9g==
X-Forwarded-Encrypted: i=1; AJvYcCVxDjPRykrRgmJLsS5ObtW6xif9toRhmNfHblw5FB0mD/D+RuvrLhMusrtvJrPL08snaYSd@lists.linux.dev
X-Gm-Message-State: AOJu0YzYdeG0POfO5g5R67JYw9+c/5j/E7o0Ookpgi1uwD9IPdmHy1p2
	7u8vXp41wHKzo/MHtdynt5vt5fLsCEjkiUgRrcocz6IlP+uhq5JYwbHl+tro1fNUBCTfA3Bwgyr
	yGHM/rJx+xiJRwwdyX+GqcMB44s6mUfU=
X-Gm-Gg: ASbGncvEHO/iQmXws8Q+eXkCz9duQ7xf4eVgd9SOyGF0HGUNhwmx5x+4f0QhI1BKfvx
	+lCL8vmsLZurczl+cePo+2eY6GpRzC6ju5nYOYhgCWg05q3WzOnmw5wi+b+7I1Dr4KzOX44Zg7l
	29Q6U3v/1kFMLX4tEjeR4gkUx3sF2Dcu2AQsuesKmUUOg=
X-Google-Smtp-Source: AGHT+IGMzjCKsb3QoFjzETIEVKGlrEiZLPHE+Z9w68l6rNpjdGz0kB0KwvlouvJt/ly+yLKAz3cW4FDCb2lbzAAjjzI=
X-Received: by 2002:a17:90b:3fc3:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-31aac44a149mr1478613a91.1.1751631340480; Fri, 04 Jul 2025
 05:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com> <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org> <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org> <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
 <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com>
 <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org> <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Jul 2025 14:15:26 +0200
X-Gm-Features: Ac12FXzPtonKP26H72mazeNQheIxGcJYasTsJs3cNwtUf90Sdk9qUBYY8YzvhN4
Message-ID: <CANiq72nZhgpbWOD4Evy-qw2J=G=RY4Hsoq9_rj6HGWMQW=2kTw@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Michal Rostecki <vadorovsky@protonmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Fri, Jul 4, 2025 at 1:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> That would probably work. We will probably see regressions because we
> can't just replace `core::fmt` imports with `kernel::fmt`, so new code
> may appear that uses the former.

That is fine -- it happens all the time with this sort of approach.

Cheers,
Miguel
