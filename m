Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEA642AA3
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751657931; cv=none; b=Tt/sftTLwXZxuqYvvKHRSUXcUjXW9A/pWIKEkiyVN9W240cDNsbI801L/ABQ11DRrOecuv+B2Ix2DdHFTvpc2ZcsRgfOovQCWq/2hLU9rPguL6SsCONvccrRZbS9Qp8zImxWPPDPNKnD5gA1LO25H9sqXaA+ecGP5zYrDT04CVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751657931; c=relaxed/simple;
	bh=+1vlZgumgifEwNecl68EJAlB8Sprq//BvrO4WzNYsMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4UqPNW32Rh1SCOTZO87PQX/GFrZveNMutozpUdxltB7vkbg4pawbxJTabQpAbUuJTzhFZgBK/20OtDieb1w/cKWeD4NdF3wkf/Y+TAikX82d5QGEFufleSQIcfyUb2CpHujiUVagml3YgBOy03jNHVd85+hmSbx1gKxgPwIfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nej91hk4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nej91hk4"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32f1763673cso2314231fa.3
        for <llvm@lists.linux.dev>; Fri, 04 Jul 2025 12:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751657928; x=1752262728; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1vlZgumgifEwNecl68EJAlB8Sprq//BvrO4WzNYsMM=;
        b=Nej91hk4DWA6d1lTj797/bDfikIFgyG4NJ6U6kXyoiaQ72n2MsILHywZ+fV2yJHcE2
         5n853jZLmQIvq+qfo+0NWgYB7jTm/fQH9wL7ZyVbNsmAZD/IhA9jd8OA9hjvUCnRn+mU
         Yru6LaA/xEnkD/XG/IVqtcxD9IWeKBglW8Ls4PvVjgQVS21CYPm2vHU2/o6OR0gwhkFa
         yRuQwkgY7E8gZFiCiA0Gze+WPWkf6AqaZViF8cPRWkZlek1nr9xyhEFx3/kBXRPKFngz
         6u6dZRxST8mFiC8DPFNONnvDRxXJRzeDewj2ubyivEuQRDVHTV7Lmf5AlKwwDDS/CI16
         qOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751657928; x=1752262728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1vlZgumgifEwNecl68EJAlB8Sprq//BvrO4WzNYsMM=;
        b=bhKmXkraiVNrPdLH7As2zhG4dM88D5X/2sWpPu2JE2STSd45+wMGN18xH4CAEUVbpx
         HTEme0bc+k1n9cGwKOcUqfIYVd3YNtoqFCSWqbsIeNUETcLr2fTjndz/DUdYFG4qD61w
         Jzgl20sRY5YPUJ5q1iClAiQlXsOweRmIcgUrc9ZHNunKGbks558X0KrqU25TzAJwSwf9
         mNk6VgIV6AbdvA/AzTUljyJbd1jq/IrpvG5yvp70FRH5PXb7JLcCAeEiJvmPfj+b5VQL
         +K9LiVkOLBv2zi1vX7wlupsKqk1TXwu2PJy1KryUE+3kn2Q9uLLDpw7h+1yyS6mMGMpI
         nRnA==
X-Forwarded-Encrypted: i=1; AJvYcCUzxuAbSs9DuWr4pGR0SZvpYVwwAFW5JU7i8tG2E03qlN3v3L/TCQXHysodSqhhcaI4WG6e@lists.linux.dev
X-Gm-Message-State: AOJu0YwfOcp9wtKfSb6ZNLVvEkeRBjLDQnHiJHysCxdtNoau+9D0l7dy
	NWJ9GVX31h+hSaY4fK+nSDT7oGsJW+MIU0c3ENus4LFfb4wjJPN4+ruxQeJRF3GkgWRpQzOZdKn
	kEvg3aFsC0MgW6Wo9Vs3BOphoJgz32EQ=
X-Gm-Gg: ASbGncsvGxChoQF2gu8t8MUoOvoYPhmYWdv2YATbRPOcsgRcm04+pr1pDabj24+O1bg
	SVKJqQG8OpDBZX25/cqqc8xKkMLzZq/XJOVfr+/PktzmNBFn6SnHzKHYKCPZOF40lk1uiDQFx7G
	aM+z6z5ZIcf/3s5UQq9yO26AGvu6APPDaQSj4JyJAwtvodJXQetGSzKeevHiNPix8YeMBpP6C9/
	KKE8dvFL5X7iQ3y
X-Google-Smtp-Source: AGHT+IEtZIZHyQdOcRcbH+zRF5QnKwCn2iKXPxprHvYuNR2jSg6UqBw9KbMdEWrPUWxqoAE0oN54aToeuNsJtUiGyRY=
X-Received: by 2002:a05:651c:542:b0:32c:a097:4198 with SMTP id
 38308e7fff4ca-32f00c63744mr9980551fa.1.1751657927846; Fri, 04 Jul 2025
 12:38:47 -0700 (PDT)
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
 <CANiq72nZhgpbWOD4Evy-qw2J=G=RY4Hsoq9_rj6HGWMQW=2kTw@mail.gmail.com>
In-Reply-To: <CANiq72nZhgpbWOD4Evy-qw2J=G=RY4Hsoq9_rj6HGWMQW=2kTw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 15:38:11 -0400
X-Gm-Features: Ac12FXw768F_Lk3HRxkz7eCyR4EleC6ZiRWgAxdQvNU_x7ZQ7VCNlmwZ-Al3Xv8
Message-ID: <CAJ-ks9m4S1jujQvyt9TOvNMewjNSztps8vayGga+MnNU+0YUcQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Fri, Jul 4, 2025 at 8:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jul 4, 2025 at 1:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > That would probably work. We will probably see regressions because we
> > can't just replace `core::fmt` imports with `kernel::fmt`, so new code
> > may appear that uses the former.
>
> That is fine -- it happens all the time with this sort of approach.

OK, with all the splitting requested, this comes out to ~54 patches.
I'll send the first bit (which can go in cycle 0) as v14.
