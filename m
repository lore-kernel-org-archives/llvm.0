Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73896DCE1
	for <llvm@lists.linux.dev>; Thu,  3 Jul 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559985; cv=none; b=M41YBnoF5MyvcJVyH7aPLZQTJGAfy57dBiXAcFMrnakmUXPgk8tj/7cA2jaZh5nY9uj5C4fkf+cf1pelbnjeZJs7C6hVqREPAWdbXGM9poj4gNV41IVXozacNBh9WHnBiEXxJjTMolLB7kVI2DFKMZs2v89PfcfpRlc1+u5Mw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559985; c=relaxed/simple;
	bh=rSyt4WnF+qHRwEMJ5395X7EAvgdTWUY/zMhaiamm5RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVC2h1s7nUxxGwV0yn+xms37AYNIAzrpqHpuakdc+t66nGlgg2O0bS40KAHgiOkdqveNY380mM4Hy9alXOiqgHS9QCxZi+pcl+Ni7JuRDDSkfEQ0kXNdVC9WjMR0DPk5Q9VcVPkJJl8ud7M9GhG/EnkTZbu4VI1pckSX6gCPCh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/YD4TZW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/YD4TZW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234d3103237so226185ad.0
        for <llvm@lists.linux.dev>; Thu, 03 Jul 2025 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751559983; x=1752164783; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSyt4WnF+qHRwEMJ5395X7EAvgdTWUY/zMhaiamm5RI=;
        b=h/YD4TZW26Ma5ODR3J0Sbbw/Hu/LJMiLtytbg0eEJ68IVWFm5ql5zTCpUwHFWex/9a
         HTFRCYYXB8Oku33kjmv4MjFlJI40KbEQszHKqWLU7pB/JXeqkOEWUsO6wO1khudndl1b
         tsdTti17aYuxO2Z3sEupoAc6wikEwijpAWFaHuOCMPCdozN6ShYUFhH2pCuBFRTSpn7o
         dnxSNfWXR5S8G7m/Hfn0t7NZS4HJ35ludN2ZeQzmgkTOFDgZH5tdE0weRbxbHxj/nOMS
         LuI1FDISwpZYc5Ad87m29Mypi2XKHFOGk1qH9HbH0NqrvKg/eXhHpQVrBas8pREN2+qn
         aWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751559983; x=1752164783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSyt4WnF+qHRwEMJ5395X7EAvgdTWUY/zMhaiamm5RI=;
        b=YoiBHOCMn9NQaFaoJoh8v96ZIjskDvNJ0fWuqN7cLaYREypqGi1eBDCRSYu6vCH03U
         oYZm5W1d9Z3MVAgEHujMjP6fNTLfb0grEMf0cxBTOAvG/K77ENVPqxuHbGXwjR1K7+Sy
         P/FBTZcv8LfTamtbmUbjIZYe5jyp/TQQuYeIyGLlXlY/9ir+sGv5UnDl7BuiTQZkUCTJ
         y9qoqyfQ8OfOBSE/HqNuDfnwVTgd4WXBCu5FsRPioUvvvntipM1flvW4+KSZZWYf4bN1
         2tgDRaTlvmxeqT0OPAjVr0Jd5WNPCdgBT85nntU5GLb3X7VXAMGyiKnkasThZCZBR72e
         6uvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAoW5jT1AVKSugKU3s1XhKVugw17h/ZmKXMh6bYctPPQNs/7UDhzbR8uaLZgRfR+tXhNR1@lists.linux.dev
X-Gm-Message-State: AOJu0YwyRfbrM+/FO+8EXixTVoB7GTzekmHOXGBNyDtIQS0TEJJBgSfz
	muFgtMDMyobc766kCj10zQXytSZJ5zdFWlCaQZeOv3sQsfyiqg6ve4k1WBqtY13otx3jHDoBlGR
	6hZqwZWjdXTQ6pCIMsilmSGQFFe2nFTk=
X-Gm-Gg: ASbGncuMXpIULgyeIhImMg4Dpxq1+YVgBiRhUVx3uIYUXJZdWUU9XKP1cbbNY1VYwAN
	gaRxEp3eAHQqKztAkt06Y0+HZlLfFNQB5MRa24Xqm9LzaBqPBC1Qm9dNBiadA9M0U76jeGbXs3H
	eUJ9ubwMALep9E5bbHWFNNC9Y/Zz7P6d5rdwKyoNRKi3TiGHzDz5oQew==
X-Google-Smtp-Source: AGHT+IE2AsrunGhRqAPTssN0vu1pH9T/puSPtq1EYmN/wZ3G149WG6FCC+weBXEH09090+WjrZpEYCR5WVBab3y8bBw=
X-Received: by 2002:a17:902:d50c:b0:234:cb4a:bc1c with SMTP id
 d9443c01a7336-23c7b2c48abmr14508535ad.6.1751559983011; Thu, 03 Jul 2025
 09:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com> <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Jul 2025 18:26:09 +0200
X-Gm-Features: Ac12FXyK3yF1o66pvRj95wQBg--_tN8783HmS0ZULfxKl6rLdQ-EP0UVIzak-4s
Message-ID: <CANiq72=61JhEf97JTkineo+FX+JG+Q9x9x86MC_hukSa9YSX3g@mail.gmail.com>
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

On Thu, Jul 3, 2025 at 3:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Can you help me understand why? The changes you ask to be separated
> would all be in different files, so why would separate commits make it
> easier to review?

By the way, if we are talking about splitting, it is easier to land
patches that can go independently into different subsystems and
avoiding flag day changes (or making those as small as possible), i.e.
ideally being able to land big changes across more than one kernel
cycle.

Cheers,
Miguel
