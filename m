Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA497190679
	for <llvm@lists.linux.dev>; Thu,  3 Jul 2025 21:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578722; cv=none; b=C6Ub8XSP2auVfSb7tLRUYCJy1KXLKz3FS42WpFwqaZp4T3x9gQ/K7dg3bbOhrsLsNsCj08kshfGO6+ds28lQ+jwZSY32REf70Wbq//zKzkrQGgo7Y4c8AurxbOV/zrsD4yCGhDgadylpZNOpm47ZQDIfa3ocRicpTHabpMLf3J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578722; c=relaxed/simple;
	bh=pHNodlGoraqosvL2in94YD46DI6OCuusa8x3ST+BCu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSzbT4SNIeEZmSlAiDs+sAid1kdstNJBP5y3r/uUGKTQ/HmYCYlb1RLCRs6j9htceKpzPJyqmsVF9vQHoN9N6P628sJ7rNiA7gx9QWv8nRUW1DnUCBPBAfpgRNzE/wkdrss4PwocRQ80W6KeYZBQZf6Tmhzic1zEvFGc4xqv4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCRYz8r4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCRYz8r4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2355360ea88so567265ad.2
        for <llvm@lists.linux.dev>; Thu, 03 Jul 2025 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751578720; x=1752183520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHNodlGoraqosvL2in94YD46DI6OCuusa8x3ST+BCu8=;
        b=dCRYz8r4dM5Vj9kHbWyZLQc+wUbRbUavpG3IEbIPGIpknE6bBH0K4j/D8uSEuCnG/G
         qJm9ky4IhAmBBbPVUiNI7Foan/EVSRT2V2xJq8buOi38eTbCm7/lW2VgJ59ibS/0V+uT
         OYdaIxPdlb/QhUWoj2lXJhV21rFJczdYSsmdkFVmV3WLIxv5Cx94EhwzANhslYVDRfzC
         fNJEHSfkEiCwdJDzmfRF9h91ebhhOcGtqgpdRqwHyiCq5i+dAoaOBZwsUYZngEzfS54v
         YCRVnNg9kJlvQV5ig5MAHnEVEJYpZl/w4hBc1KMbC5BZDHupua15jFwj0V0Y6RKzBv+m
         O0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578720; x=1752183520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHNodlGoraqosvL2in94YD46DI6OCuusa8x3ST+BCu8=;
        b=UZlCy9CnMkN70H2996uTwKIuMVIxct52l3VgUDBuqmhEG/s13mTjwBXsUzLDVWwB8F
         eTc8AmlMkBqDUb+tTHD6EQFOAfGt2SipuEQfnAWTf2oJNeXX2COLW7u3MiQsZjLv/ddD
         2T/dJo8b5tUJWPNDV4yutaqVDFImzNcL9CickrvmNQ0auF3pDdWSidq43j61XCRawsN0
         eLFDob6iRcr8wKJOg/6Hwx3/rBXpWZ5DT1+A1cidtXWCSDnAPzNQC3NxN98FiNj8VCJh
         Wn7fjELvdl9gRaXx7Hewa0SsIlGWehqP6FujFSYiiq17lCPydGn5CjRfvpW+T1+5tMwJ
         /RXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrcRGIBAcsB2FZtw5/Mnmai/c3fGRiHJaae/GCere49HnDKbQm10AUtcm/UFdvmlmRix1Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0mgZCxM0Hvlacg4SzQHHCv1IPafTcKTZi+f4GCyXQTQSvGXjl
	QsAhonWEJtMp+PKmcVZlSvfx3ZvZm9S47YEe7uqsFOBLGQE4ik/K0BJ3UI8duv/I8Vcnc0PKkk2
	GQA30sXi+thC6BBPn37XZOCdPtNFVq+8=
X-Gm-Gg: ASbGncsJnK8aNNvDRnmwnoWmO9ORQmZRnVTWYj4u3LqMIMGwRJTVlaGnguI446dLpPi
	waKnTtztK5CQaNhnDhtjbqSwcna2a8V9/o/d1nxUAaXGY0JYxGZ8H6v/ibG7luflTruf/1yd08E
	SrOl2awyvkA2aOIy/UfS5bsjIYuC6ZGSZe1x2ftTFl7V0=
X-Google-Smtp-Source: AGHT+IELtB5XgtVh1TIl503YSOBpKDzFFV0lUuu4UGNcygnKkLkVRq6ABgmlhe/GC2s+Ns1XtRhxYcb0/TcFag3V8H0=
X-Received: by 2002:a17:902:c404:b0:234:f4a3:f73e with SMTP id
 d9443c01a7336-23c85ec795bmr1697845ad.9.1751578720047; Thu, 03 Jul 2025
 14:38:40 -0700 (PDT)
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
 <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch>
In-Reply-To: <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Jul 2025 23:38:27 +0200
X-Gm-Features: Ac12FXwdXJJ0hQiiGaabkdHfelYANMQVK7rSTVhFAhKXDapeaUgG2_fvXL2LwP0
Message-ID: <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>, 
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
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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

On Thu, Jul 3, 2025 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> A small patch tends to be more obviously correct than a big patch. The
> commit message is more focused and helpful because it refers to a
> small chunk of code. Because the commit message is more focused, it
> can answer questions reviewers might ask, before they ask them. If i

Yeah, also better for smaller reverts, as well as typically easier to
backport if needed, etc.

Cheers,
Miguel
