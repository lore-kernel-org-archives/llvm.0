Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA4C2F2737
	for <llvm@lists.linux.dev>; Thu,  3 Jul 2025 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751569075; cv=none; b=CU3qScnHpLEv8/A4gQZ7PJ/1RjtZcmHuvUjEAavT5FscmjyRxBRY946j0L4BOXFPQfX1/CteX+j5szf4L2zah6x4sWSlg7oXAP0Tfs8lC9wQmTa1bBM34p2h284BS+4J2ECbd1fgjGWPzqieCxwWklL2iLNfXP1TXZPtyAiv98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751569075; c=relaxed/simple;
	bh=FiAe0ywj3ALVyYeVpMIymC5Jme4Ulve8NgwE7MU7/y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PA27fL4i9MPHVY/rLBns83/Cp624qvIrcseazZwYllkE4kqzpjTFVroyce2DMYWLNu9U+eTFd5pr1qFPps/w8o7MrIhiSQICcXCW4E5u/vzRmZ5ewarrnpaUrJMtLSoT6dpsZ5FVmT/Iw3aXiAgiDefAwLVGXir03ulspBpAx1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlI/y8s/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlI/y8s/"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-555024588b1so250436e87.1
        for <llvm@lists.linux.dev>; Thu, 03 Jul 2025 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751569072; x=1752173872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiAe0ywj3ALVyYeVpMIymC5Jme4Ulve8NgwE7MU7/y0=;
        b=NlI/y8s/7zcmVCibOYQPtd87iWqeVHcLUpTqJ5A2foYe96YF66AhMcvMsJzBQO4iVh
         ybQAlaGGmvco3tpjdFUSqi86Lz/VTP/zgu1OpHgqXONu63NGvESuYYby0PSO5GCTMPvo
         HLM/hqYeOuE8jlyfCKt3KuGY4I7W3N49hJbi3S2l7oWx2//j3OYXF6MNrSOGpB1P57XG
         w48ycU3iz2XHY7+g8c9Zx17BWrju5370nIgb2lwJTQYbc0qEXYt5Bjgp2LVNZfDR07wL
         xFgcxPZHqZGj9vrHXmEOOAs4eQuKpaFLkyiOJ+WcCV1kjsxs7zmcQvsskydGhngPLqqb
         ABCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751569072; x=1752173872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiAe0ywj3ALVyYeVpMIymC5Jme4Ulve8NgwE7MU7/y0=;
        b=JAHmfe0tvHuGryT1svujY5k4kfAJM8uox3QqzvAvf+D6h9VF/ERN+taRS2ZeuNqsG0
         ubkKqafmbCvi05E7NI4qBpNgZZwn3QMM7c+t/hoa2E+rwykXlM37z7cAk/VWz2VgW3UJ
         gYz0tzUqEWaw9Kvgx9dhMJw/TBrjiJaDIYKWqzpNGdBEcVBZSHcpN1r+w8+88psMuGxs
         wE9GcmJ8v3iMmD+ukA4LQf1yXHRo1YH+rzZCbEwFZGVTCyWn8iKAXF2+PHw3R6hnMNH8
         SUd2R8guTq5OPBTEqN8X6wXUb0ulWXfSxIIBj4liGxEObUAoBi47yBuPoCddsvNlPY/U
         FFSw==
X-Forwarded-Encrypted: i=1; AJvYcCVAMDyGrZkFucGn83W5kbX+Ikavboziim5hRNo0rh7L5gUF3UDtsnwrsTKKl1+7yI4d6Q7U@lists.linux.dev
X-Gm-Message-State: AOJu0YzeeQTdnz7lETBGv9qrnojVxKo2HImYCxhQbTv9dSLpnv6tHjiN
	ORp0uA6+QEAEhGZiFmHUynVMubWVU7du9ADcT5kWieGYSf1gbPH2+PTLUXeU9AmuQTCy2St89hk
	BP4bKAddDOKb3i+7rT09FS4/5ojYzEsY=
X-Gm-Gg: ASbGnctWrO6+4wZ34zzgNOU1nb1XRn55Jm1b6LE+XqlXQvF9CbAg7A9fyA15QUYijNB
	ExhHdZIp62bZSYGDuiooqgMrc9BN/4mkUiJucVsoFjGiVk78U05akbW/hseOiDTx7kidN6pCI+6
	kbEQnK0+Q9xXworRrncobmwF3kroZPn67ZXUO59USMOS/s7A==
X-Google-Smtp-Source: AGHT+IG03u1s/dKr5lqrvPNQ09T92o4JjB8rN5Nj67CbTA0x433vtUSLN5UqSf5eZDmLPvVjVfuvUqvcmHi9wOrWOOw=
X-Received: by 2002:a05:6512:31c6:b0:550:d4f3:8491 with SMTP id
 2adb3069b0e04-556283804d8mr3415342e87.41.1751569071362; Thu, 03 Jul 2025
 11:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com> <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com> <CANiq72=61JhEf97JTkineo+FX+JG+Q9x9x86MC_hukSa9YSX3g@mail.gmail.com>
In-Reply-To: <CANiq72=61JhEf97JTkineo+FX+JG+Q9x9x86MC_hukSa9YSX3g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 14:57:15 -0400
X-Gm-Features: Ac12FXyZZloauRegGbOIuXfH_Sgil7e4CwfUR1COZp9IX8xKJZCjuiY3W9nvJEk
Message-ID: <CAJ-ks9mvLEPLMJS6E_UPc4bkRN1q09zYC_oL_pZ=E_Ff161USA@mail.gmail.com>
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

On Thu, Jul 3, 2025 at 12:26=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jul 3, 2025 at 3:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Can you help me understand why? The changes you ask to be separated
> > would all be in different files, so why would separate commits make it
> > easier to review?
>
> By the way, if we are talking about splitting, it is easier to land
> patches that can go independently into different subsystems and
> avoiding flag day changes (or making those as small as possible), i.e.
> ideally being able to land big changes across more than one kernel
> cycle.

Understood, though in this case I don't see how it's workable. The
formatting macros can either wrap in fmt::Adapter (and thus require
kernel::fmt::Display) or not (and thus require core::fmt::Display),
but I don't see how they can work in a mixed world. We can't have half
the subsystems implement core::fmt::Display and the other half
implement kernel::fmt::Display.
