Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83A2D0C7B
	for <llvm@lists.linux.dev>; Thu,  3 Jul 2025 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582792; cv=none; b=kcJwF5qgvioHgQMk0IWNm3+st2pGtVNqRh86t7r3WGMi70QmFMYSs4+65QfeZRK4EomHlz3roXkUvb72p2Z7OPBLN2XQ9Jx23bOEIRMus8GoG/eynKmZ7FsvGjYEuINaR/kelNAdZ5duKO5by5c1PRqi6a13Fibu8KZWJUHdQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582792; c=relaxed/simple;
	bh=YQ89OCdtlbGh5+E9e/L5GelOcn+S1I4YLQnLaEx1cYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjAKtVlYpb6RpPXkZ3gXAlcx4sSbHmO1YCqz1KSFSb/w4Li5MzGdQ56V5ocxV9W3ShEKs7/BlpBu2VjvDtqH4Cw6+aYFFqTwPR807M+a3TCC7drfWjuR7QL7L0b8fFzG7GmeXZZhx1JYSRqpaAqR+ArV7sigq+e7E6nyxSsHjx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4Y2rRkd; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Y2rRkd"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32aabfd3813so4214251fa.3
        for <llvm@lists.linux.dev>; Thu, 03 Jul 2025 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751582789; x=1752187589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ89OCdtlbGh5+E9e/L5GelOcn+S1I4YLQnLaEx1cYY=;
        b=X4Y2rRkdBidhcDuJrasObESDlCSIKaGUd+Ex73vCP8qrL/aRdT72Adva/n8Ap1ZFCN
         8hrYWxzC3RYdvfQiXOI60/OjkaEWGwgWFJJ0yaNU2EGE0iRHCTH8nrJ8//1o/xwsIMWQ
         EDpa0bCmci8+0POtalX8p3V5dz4RqZ9tsr7ijJL80LHJkAmgjJcTGygL1T7WuPID8qOz
         3ILJozSHzhtAgr9jy3jawsKuiTZjbN30+26WV/YnPQ07PCHTRLbnQnHAS0AnKb2qeEr7
         E7xrVM7Dwzk6ROA2n3a1xYWPcQqDZcyz1Dxv9je5YAKLCvfI72WmvNO2zt9fIUtCj0oC
         XeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582789; x=1752187589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ89OCdtlbGh5+E9e/L5GelOcn+S1I4YLQnLaEx1cYY=;
        b=KjC4cNYfiTbTZmMcGsYRYAvSeJ8wXayuD68aasXxdCQRh0GItzu2jyguCCNr9aEStC
         RIt5E1vKK+a96KkFTorLj4MYyR/yAQqlcOxcUZN8XuWW3VkMjI76d/6JZhN/hROjiMqX
         EQcSdhv+pxnsYilB8sNBnFnCZGACUExDZhiudNUw3T8bYAteiI2esJ8nFLHaeIvixylT
         K/Y0GMVqTMVzavdRVlbmAkcbTlIqLh1mHMp8Ean+AEoWuN4ejxgynhtAg56dQKsDBlpY
         cSvA4QkNzZonsiqQi9i3dCRW5NbuV+og0GtGCPyGWgH8Kq0zn0irnt/fZQJgcZzob2BW
         hpHw==
X-Forwarded-Encrypted: i=1; AJvYcCWX4eEfY7VKMz5xGsY1bToS11mDuoamxAc0lWtqfa/1Netg87zqkcXj/6M6Nz355RkGeeBv@lists.linux.dev
X-Gm-Message-State: AOJu0YwBZkh0IUQF/E2Y/JWj9x81gTayGvKh5C0bm981v2nos41ofq8/
	nAeYNJee8n1qU3bo2uzvlZQqIuovV5PL7lWgs5k0uxQ/j+BVJoVa88lCTyLbcMjafP4bQsmgjj/
	dBZ+KR86VF28qKirVlVFN+5zKpY0XFJ4=
X-Gm-Gg: ASbGncu8TfCcjzFyxmYm+jG7Akqg4onSVS6Hhracb73COOALyW8o/FWZF87iD21TlAv
	CcfzeOJTGMB46cmLa0IXBzEJFWr/LTmnr6hiugaRWsVlS1N3Bs7rK1DnsuOMFd+xeT1esiOnoCh
	WgZs2MyeM8MbRPB3LNLCHm0UCnssPkw/K8x1nMc2X74Uofn7879K8heDPd+WRPKCNChP1c4aFv2
	3SYMQ==
X-Google-Smtp-Source: AGHT+IEl+sPP1B8mCxMl52InEsjqgDrQhGFgZ4gKQQCtMPmYktkmfkeMhqG8tc4KCe8e7E7L2nh/1DkqsMZO1oU3bHY=
X-Received: by 2002:a05:651c:4013:b0:32a:7856:7412 with SMTP id
 38308e7fff4ca-32e5f617942mr529651fa.27.1751582788733; Thu, 03 Jul 2025
 15:46:28 -0700 (PDT)
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
 <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch> <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
In-Reply-To: <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 18:45:52 -0400
X-Gm-Features: Ac12FXzLoSh37LekSqc1NAd_zq6FaEAH_wUVbUZ0bDWsTpL5vqgS5iCX-O9_oZo
Message-ID: <CAJ-ks9mkC3ncTeTiJo54p2nAgoBgTKdRsAwEEwZE2CtwbAS7BA@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Benno Lossin <lossin@kernel.org>, 
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

On Thu, Jul 3, 2025 at 5:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jul 3, 2025 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > A small patch tends to be more obviously correct than a big patch. The
> > commit message is more focused and helpful because it refers to a
> > small chunk of code. Because the commit message is more focused, it
> > can answer questions reviewers might ask, before they ask them. If i
>
> Yeah, also better for smaller reverts, as well as typically easier to
> backport if needed, etc.

I appreciate that this advice is well-intentioned, thank you. I agree
that all things being equal, small changes are better. In this
particular case, there are specific downsides to splitting for its own
sake which I tried to explain in previous replies: splitting the proc
macro from the rest of the machinery risks forcing a reviewer to
assess a chunk of code without seeing how it is used; in my experience
this limits the scope of the review. Splitting by subsystem has other
downsides, which I attempted to enumerate in my reply to Benno in the
other fork of this discussion (let's discuss those there, please).

There's also a tactical question about splitting by subsystem: are
there any tools that would assist in doing this, or is it a matter of
manually consulting MAINTAINERS to figure out file groupings?
