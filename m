Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CB719E43
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 17:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93172C433C8;
	Wed, 21 Jun 2023 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687369877;
	bh=47uIKnKw2ZmtP3m7XAXg6y/7ErK+KJP6FPCWISl4Zpw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cludjbY8A0OmOUSGdXGXEAtWaET058YOwRyqV9eSI3tF7/aL4HlSEBp+3S+QFoEkJ
	 xUpbFf+BSS2vOu0dnhAPs6zrMl+WBk9RkpKsgs7Wh0hJd1OOFL/OxAYHrMaW79jiUg
	 IufRKhp/PY3TAnGBqwlDOVKnaKqhByaoVZ5IWRXXD9tT4lQ2J8IdUm5ywK6A1gqHKr
	 ZSa/vVG4Cqt25jZgHruRoyoJ0U5cw+zeATnvPDSlHi+IhFH/ME/F6rMbk2pJmCnNc8
	 kqWTJ9HDaLsjiOHcBPygAdyYFEAU+kqdQjJfbvhrZbHNV6hyyYWeK8uIr0Ip1jaP8D
	 iIFxgfteGJUcg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: ndesaulniers@google.com, jszhang@kernel.org, llvm@lists.linux.dev, Paul
 Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann
 <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <20230621-hungrily-pancake-9e1ff5b0b02a@spud>
References: <mhng-8caf7779-aa9e-496a-b2ee-2e6d6d1d76ff@palmer-ri-x1c9a>
 <mhng-861ea8a6-c92c-4a78-a1a6-dfb4df554aee@palmer-ri-x1c9a>
 <20230621-hungrily-pancake-9e1ff5b0b02a@spud>
Date: Wed, 21 Jun 2023 19:51:15 +0200
Message-ID: <87wmzwn1po.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> writes:

[...]

>> So I'm no longer actually sure there's a hang, just something slow.=20=20
>> That's even more of a grey area, but I think it's sane to call a 1-hour=
=20
>> link time a regression -- unless it's expected that this is just very=20
>> slow to link?
>
> I dunno, if it was only a thing for allyesconfig, then whatever - but
> it's gonna significantly increase build times for any large kernels if LLD
> is this much slower than LD. Regression in my book.
>
> I'm gonna go and experiment with mixed toolchain builds, I'll report
> back..

I took palmer/for-next (1bd2963b2175 ("Merge patch series "riscv: enable
HAVE_LD_DEAD_CODE_DATA_ELIMINATION"")) for a tuxmake build with llvm-16:

  | ~/src/tuxmake/run -v --wrapper ccache --target-arch riscv \
  |     --toolchain=3Dllvm-16 --runtime docker --directory . -k \
  |     allyesconfig

Took forever, but passed after 2.5h.

CONFIG_CC_VERSION_TEXT=3D"Debian clang version 16.0.6 (++20230610113307+7cb=
f1a259152-1~exp1~20230610233402.106)"


Bj=C3=B6rn

