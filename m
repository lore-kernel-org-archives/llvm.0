Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718F168
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 12:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C62C340EF
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 12:23:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YAi8qqDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1643113417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0daSbrlFhUGQBa4NrvEt61mYUrNnIWgDTSbk+DLVWQ=;
	b=YAi8qqDME9TueElwkEnU2PnRqDfqiosLaNVxLpl80ljalp7P8BpR+CK4o5gFedL8CZO/eb
	cq/iT2BcVfF8VYAkwduRgNo8+c7dc7dm9arcX5BCs1lcb8oU6/wuEh6qq32xAwmG785IDp
	JMkhIf319Ux53nyH/4QJuo3q7A3aCjE=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fadd98c3 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <llvm@lists.linux.dev>;
	Tue, 25 Jan 2022 12:23:37 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id m6so61110955ybc.9
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 04:23:36 -0800 (PST)
X-Gm-Message-State: AOAM532W6jeDv8506Hh94Es9RRa3hyrhfOFGTGHIaQZ6mY4KCJ4DqaWQ
	z2h/asPKy7BQHhECp9ORUcs92v7BRs20326YvLE=
X-Google-Smtp-Source: ABdhPJyUJnn5+nIAkLGSsrMbq+oJOt12e+lDPM0wxq8+GDwA0xFEB0LhtHzFxy0HtG1im5paHvbTdwpEDVxTYrfKUOg=
X-Received: by 2002:a05:6902:13c4:: with SMTP id y4mr146168ybu.115.1643113414984;
 Tue, 25 Jan 2022 04:23:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Tue, 25 Jan 2022
 04:23:34 -0800 (PST)
In-Reply-To: <Ye+bam3aSIjz8n9E@sol.localdomain>
References: <20220119135450.564115-1-Jason@zx2c4.com> <20220124192849.14755-1-Jason@zx2c4.com>
 <Ye+bam3aSIjz8n9E@sol.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Jan 2022 13:23:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9oQuKLo2D_OGMy-8PS-u=a-ERvP+1L7RvpjJ2_xBaM5eQ@mail.gmail.com>
Message-ID: <CAHmME9oQuKLo2D_OGMy-8PS-u=a-ERvP+1L7RvpjJ2_xBaM5eQ@mail.gmail.com>
Subject: Re: [PATCH v2] lib/crypto: blake2s: avoid indirect calls to
 compression function for Clang CFI
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miles Chen <miles.chen@mediatek.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On 1/25/22, Eric Biggers <ebiggers@kernel.org> wrote:
> On Mon, Jan 24, 2022 at 08:28:49PM +0100, Jason A. Donenfeld wrote:
>> blake2s_compress_generic is weakly aliased by blake2s_generic. The
>
> Don't you mean "weakly aliased by blake2s_compress"?

Grrrr. Thanks.

>> Changes v1->v2:
>> - Wrapped columns at 80 for Eric.
>
> It is the recommended coding style, so not just for me :-)

I was under the impression this increased to 100 mid-2020 or so, and
checkpatch.pl now makes noise at that width instead.
