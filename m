Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1242FAF
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 21:37:55 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2CEF03F128
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 21:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676065068;
	bh=eC2XZoUBnGDmxKSPMrW/XXx7BIGT4mv6vf3OxAuOY0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=qszRP6nfD5Z6e5yHuNoGB8vmCQ7fGoKFJ5HWoDzuBfu335hS1Drtd/iPNBrrEyObh
	 GJV6gZChzXwsYDAUBTw0RRwsFAnuabzV4hlIEnHvLyFxWoXN7/QTYavnrUgfO+G51v
	 iQtaahRsfjNoSvB/xldAOaImfkS3O81dADOaHKKaefn7jfm/821ntvbaOlOOsO+82Z
	 HPceLDhMvdwC1CSwvheEISwMWs9L1W8MhGfpwnhwJVY27dWUAeUCGuj3f9VEHFzQoD
	 2yQPprvPge8JLwlEm9yEIVMTlKYvmul6m45HSWEn6FVv0V8ag9q6jD0eS+V06p9v+4
	 zSyRDZd6HURdg==
Received: by mail-ej1-f69.google.com with SMTP id i7-20020a17090685c700b008ab19875638so4269336ejy.3
        for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 13:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC2XZoUBnGDmxKSPMrW/XXx7BIGT4mv6vf3OxAuOY0I=;
        b=ibBTxaxyF7AUFRBqpsvDgSXIUvf5Fe/I56k6OUG7if621FyR734qK9pfkdaAs+6rsf
         h2o+hf3MYRQ4nVjSa4I8eyD1CQCM2N0g+/63zkewenK0f+TRfefMvOwLqgYvGjRMG3EF
         hPN5FjNa+x6KQMEzK4PihY/juG2OWyzWJcPsNDEcdcvpnKIYOdA9Fimk/q90hWZCqQDh
         9mRcy0iJO98OKxpW8e3a+VbvlYRtaQPn954aPzMDVUskuXLGQoxRpteChVyRwP9eNaak
         JxfvyUwkH2hs6L+CEcLsSyY/w/u0cJo6J5l8/X3kmvOXTCWaXsIw1DCncpl7lWc0scc+
         0Pcw==
X-Gm-Message-State: AO0yUKXdBaRh03nb3GpWpr/WHPJybUIsn5Uf6iGnXNf4ZMzWCbLbVX6G
	+sRgK5wPZysQS1H1VTU2IS729rZ6xAgwJ94DbPrsBBqYZfzvkxrcRINpc0oBdpyfCxhwv8rw42a
	2ugDzVk5QbmWYE1PDBQPOeKdeUeMyPWk=
X-Received: by 2002:a17:906:d54f:b0:8aa:875d:9d9a with SMTP id cr15-20020a170906d54f00b008aa875d9d9amr19218553ejc.50.1676065067217;
        Fri, 10 Feb 2023 13:37:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9tQPWSKYHZI8inu8XKqYP5n9wE+26d1aWDJPmcuaYvCIZs5H3m4k+oT+RGH2S9Xw5DEwqt5w==
X-Received: by 2002:a17:906:d54f:b0:8aa:875d:9d9a with SMTP id cr15-20020a170906d54f00b008aa875d9d9amr19218529ejc.50.1676065067021;
        Fri, 10 Feb 2023 13:37:47 -0800 (PST)
Received: from localhost (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b0084d35ffbc20sm2906112ejo.68.2023.02.10.13.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 13:37:46 -0800 (PST)
Date: Fri, 10 Feb 2023 22:37:45 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: allow to use INIT_STACK_ALL_ZERO
Message-ID: <Y+a5KQjQopSXwVPJ@righiandr-XPS-13-7390>
References: <20230210172203.101331-1-andrea.righi@canonical.com>
 <Y+aBT8AD9RXde24X@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+aBT8AD9RXde24X@dev-arch.thelio-3990X>

On Fri, Feb 10, 2023 at 10:39:27AM -0700, Nathan Chancellor wrote:
> On Fri, Feb 10, 2023 at 06:22:03PM +0100, Andrea Righi wrote:
> > With CONFIG_INIT_STACK_ALL_ZERO enabled, bindgen is passing
> > -ftrivial-auto-var-init=zero to clang, that triggers the following:
> > 
> >   error: '-ftrivial-auto-var-init=zero' hasn't been enabled; enable it at your own peril for benchmarking purpose only with '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang'
> > 
> > This flag should be dropped in clang-17, but at the moment it seems more
> > reasonable to add it to the bindgen CFLAGS to prevent the error above.
> > 
> > In this way we can enable CONFIG_INIT_STACK_ALL_ZERO with CONFIG_RUST
> > without triggering any build error.
> > 
> > Link: https://reviews.llvm.org/D125142
> > Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> 
> If this went via the kbuild tree, would we be able to use
> $(CC_AUTO_VAR_INIT_ZERO_ENABLER)?
> 
> https://git.kernel.org/masahiroy/linux-kbuild/c/4e3feaad6ff8a7a57e3bf3308a93c93e3a2e17a6
> 
> Although, I suppose this could be a problem if the version of clang
> being used to build the kernel does not support this flag while the
> version of libclang in bindgen requires it?

I didn't have much success with CC_AUTO_VAR_INIT_ZERO_ENABLER, but maybe
a better way is to check if the version of libclang used by bindgen is
less than 17, considering that is extra clang option is supposed to be
dropped in clang-17:

https://github.com/llvm/llvm-project/issues/44842

I'll send a v2, unless we find a better way to support this auto var
zero-init feature.

-Andrea
