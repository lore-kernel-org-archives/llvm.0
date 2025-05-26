Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7C198E91
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748298695; cv=none; b=INOcOl393l4OHPtOZnO+a8cEo8TM3mZ6xkSinUtyd0znYyQXdyVxKIL7Cwau+eBG8QjITYR181UYUTOJj4eksJxQfu/cR9R6eLEltGhXP2A5KeaYpBl+Dhoyb+B5kyA0D0wcHbGHlLxYqF64WqP8rPA58pxSIm217Bn1IgOxnDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748298695; c=relaxed/simple;
	bh=P4mDwunV/VK6ZdqBCM8ixj0ovsAxRm+C2bbqZqX2aJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPyeZyNYMxwXHU1wJjfgaDNP1AaM1I1oz0HZ//kvhHBs/Y4YtTG2eNUohGvmjv6UNhn5fpDM4lPpdtxgoVNLXmUhdZwDC8e/e0MwIH58TnNtBEkO8x+jDv5fiOvxa/KnP9y2YlVv6Qieoz/pDFDTNGsTes7LhNLfeHuZOPLCDKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0vW3enX; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0vW3enX"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-310447fe59aso28850411fa.0
        for <llvm@lists.linux.dev>; Mon, 26 May 2025 15:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748298692; x=1748903492; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvLHYVJDLL1tRu00kxb4TV63RHH86AdnGIzbeTcCyBM=;
        b=G0vW3enXre9BwtSW51csD7Co1y9S98ZI6i/nJDJWGxXwVRuB+9krZVrx2nI4yFYIUJ
         bhKa8ELPoU5Q8yZ+gEJAO47thHkMR+7aUijAXvBDqjvPoQDZB8vr5snRj74K4oqy8DJE
         FaMyZBDLnD83YldQ3rjnUwHxfx8dClEExI7bIetVt4fRgh8AFQ/VHWXrdcN1zBx6PdJ5
         5VfWfgcvw8tgHnHZcaEjwq24fcmfmVOEO1oVfXLeOBjtDkzl0J5kuzPt9w6Ye8hlcuhO
         jqJHhMOCgqImojrfFuy8FMMdeR+1HXpnMraJWY0aHn9+hY1i8r7be4YZwT8mXMEmevVr
         QpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748298692; x=1748903492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvLHYVJDLL1tRu00kxb4TV63RHH86AdnGIzbeTcCyBM=;
        b=VRMCnDU4oEckO5riiRxfTYt2sSmM5AB1i1jRrkIlIaXd32KeJ4eaYMaXPPM0nhoOK3
         hnYEowsIcDDjB1jpb9kKXcgoTRfZi0SGJ1AtHTvRqiRlIJE0vrtzTVgSk78L/favZuH/
         byCF9qt5AuhiZrtiT1hodB5Ui4zeebLPAN1zIgHEvreKd7SNS1FNSEeTVZZuY0U0LWgH
         Z7L8fBmvVT1cWg8+FDDl1eUqSeJl2iipY+5rbl+Ox48XyxaIeVzfR2O9P0OwYzfgDsUV
         UPwkdLgxaUMyIPCxSJWjUZITiJMpqpcVM1chvQ9ZqErJCkey6gY9xlgl7C/FlaU96tnm
         v/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWmIPCvPB8pm9dOiUHhofs/vluYWUaQioDlL5J+M9M8hAQxQonApssKsToS754DlohRq+k3@lists.linux.dev
X-Gm-Message-State: AOJu0YwRWB6V4O6//qAnmk51CY8OedIG8mn+3ByIqP95VCELrGyfPOMJ
	LXn5S+9eYMfqduB33OPtuAtZHnpNwMmH4H0Es6wZi4gjV2EtJnoV/IRAHdeFnffmi9ycjs6wkYF
	8InJVX6P232HTk9O28DeerYZe2dPcEpE=
X-Gm-Gg: ASbGnctLOD3qB45R3tO97S+kT1Y/Pw4nW7of+uZ6md9z6YyH6k7expA+yTnrInQYgJ9
	H6h9nJ0HGZ6yPR+1cb++346AQm8xHaBQws7CCW7j2tfxmtHfYtUGd7n/ij0srRb8GduLgQfO2cv
	yrgFdsF5/IvmnUskfuiK7H/uP3xGo/9m/Gb+MR00ecaxLV85R1PTouZZakYvHOPsCTazE=
X-Google-Smtp-Source: AGHT+IEJfWzc6VPUDuyUq0aTn+WE4sTfnbgvmOYP1K86Po8lb+CyhSBKVylPu7Ej7IoVB3uFqztWGvTQz/dCfNqAd+Q=
X-Received: by 2002:a05:651c:f01:b0:32a:664e:a923 with SMTP id
 38308e7fff4ca-32a664ea9e0mr10313091fa.22.1748298691742; Mon, 26 May 2025
 15:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-5-6412a94d9d75@gmail.com> <DA66OFXQCWUK.31LM78DIVABZV@kernel.org>
In-Reply-To: <DA66OFXQCWUK.31LM78DIVABZV@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 18:30:55 -0400
X-Gm-Features: AX0GCFuHGuPmwsi9tWeeUypjxRW1UrvRCX_LVo0C-ggOVzUmGabC1z1bBuoaiZU
Message-ID: <CAJ-ks9m=okC9_K2MJU80xbnO+3+Z0hvC_FYzCtzW9pD=WA_xqQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] rust: remove core::ffi::CStr reexport
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

On Mon, May 26, 2025 at 11:05=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> > Clean up references to `kernel::str::CStr`.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_panic_qr.rs   |  3 ++-
> >  drivers/gpu/nova-core/firmware.rs |  2 +-
> >  drivers/net/phy/ax88796b_rust.rs  |  1 +
> >  drivers/net/phy/qt2025.rs         |  1 +
> >  rust/kernel/device.rs             |  3 +--
> >  rust/kernel/driver.rs             |  4 ++--
> >  rust/kernel/error.rs              |  6 ++----
> >  rust/kernel/faux.rs               |  5 ++++-
> >  rust/kernel/firmware.rs           | 15 ++++-----------
> >  rust/kernel/kunit.rs              |  6 +++---
> >  rust/kernel/lib.rs                |  2 +-
> >  rust/kernel/miscdevice.rs         |  3 +--
> >  rust/kernel/net/phy.rs            |  4 +++-
> >  rust/kernel/of.rs                 |  3 ++-
> >  rust/kernel/pci.rs                |  2 +-
> >  rust/kernel/platform.rs           |  2 +-
> >  rust/kernel/prelude.rs            |  5 +----
> >  rust/kernel/str.rs                | 22 ++++++++++------------
> >  rust/kernel/sync/condvar.rs       |  4 ++--
> >  rust/kernel/sync/lock.rs          |  4 ++--
> >  rust/kernel/sync/lock/global.rs   |  5 +++--
> >  rust/kernel/sync/poll.rs          |  1 +
> >  rust/kernel/workqueue.rs          |  1 +
> >  rust/macros/module.rs             |  2 +-
> >  24 files changed, 51 insertions(+), 55 deletions(-)
>
> Haven't compile tested this series yet, but this commit seems to suggest
> to me that some of the previous commits introduced code that doesn't
> compile or emits warnings? If so that needs to be fixed.

That's not the case. There are no warnings and no compilation failures
in prior commits.
