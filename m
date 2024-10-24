Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE022B642
	for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729800087; cv=none; b=CspLqIPUpODXhZF8LoU+rX90cEZt4fpEu+mT+RUCxzqUXqFVLFoSvTEUCFxSBIH/3FpnzmZpY8O7dycqH/scgCsDC5z0ZNwSxgpeNvSqB3JH4/oNShwFGcAdhSEXKV0j1Pd5XpZZAbw9X+n77tlQ8lnuo6eFm1FfJWFiFhHGj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729800087; c=relaxed/simple;
	bh=cP3EFX1XKkwzDlHRU/Tinf5F+8Lo1JlpsJ4fkUOrdM8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Of2EL2r8m2zeSOkx4W8LRhYglnfUQ3rg7rqlCgg7mY6lYYsUoCnm7+8DyUARjC4x+qzhi04po2zePeph0U1s3wFC/RgVak69GK8/gwOYK1aBTP9p3HmcRioNdnuYpBuFGEWuj2G7oOVjgK7dg+rTw0opKNgsl4YirlRkRXjj+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q8DiXAff; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q8DiXAff"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 104914188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729800085; bh=cP3EFX1XKkwzDlHRU/Tinf5F+8Lo1JlpsJ4fkUOrdM8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q8DiXAff7Y08od7QiqRocFJMqUxYVgSF9RwWy1JVVulDnoK3uCDfJt3nQ+fn2Qhx3
	 tX8O3ZDgoxaLYwqdhAGWKEy+8u/mfliimFQId7VptucjpR9AQpCKZsdyALc5qhhpHu
	 Olo9jkcjXXzXHzcdGX3sOWqdAJCBvpxj1nJ82bceUZ4G76r2W0h6EtW1HWt9PCHFa5
	 jQy5lHvBVZD7ikfTfZypuSSSjlOSNOzXSAwQZ5miodFWAtE7w5zDWDbntHOmahoUWF
	 0Ox5NzLPMEJWmsOXeNE6ir0wkax0abn/sl1LNhxJAZxemnQA9PRKEOPo6G/4GUxTHr
	 f5htw0tpBWyUQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 104914188F;
	Thu, 24 Oct 2024 20:01:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Dongliang Mu
 <dzm91@hust.edu.cn>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3] docs/zh_CN: update the translation of
 process/programming-language.rst
In-Reply-To: <20241023062750.849951-1-dzm91@hust.edu.cn>
References: <20241023062750.849951-1-dzm91@hust.edu.cn>
Date: Thu, 24 Oct 2024 14:01:23 -0600
Message-ID: <874j5146ek.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Update to commit 0b02076f9953 ("docs: programming-language: add Rust
> programming language section")
>
> scripts/checktransupdate.py reports:
>
> Documentation/translations/zh_CN/process/programming-language.rst
> commit 0b02076f9953 ("docs: programming-language: add Rust programming
> language section")
> commit 38484a1d0c50 ("docs: programming-language: remove mention of the
> Intel compiler")
> 2 commits needs resolving in total
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> v2->v3: fix warnings in the make htmldocs

This still generates warnings:

Documentation/translations/zh_CN/mm/physical_memory.rst:131: WARNING: duplicate label nodes, other instance in /home/corbet/kernel/Documentation/mm/physical_memory.rst
Documentation/translations/zh_CN/mm/physical_memory.rst:325: WARNING: duplicate label zones, other instance in /home/corbet/kernel/Documentation/mm/physical_memory.rst
Documentation/translations/zh_CN/mm/physical_memory.rst:334: WARNING: duplicate label pages, other instance in /home/corbet/kernel/Documentation/mm/physical_memory.rst
Documentation/translations/zh_CN/mm/physical_memory.rst:350: WARNING: duplicate label initialization, other instance in /home/corbet/kernel/Documentation/mm/physical_memory.rst

jon
