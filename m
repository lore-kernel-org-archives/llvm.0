Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043922F33
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 20:45:01 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 192so34433938ybt.6
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 12:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SeLnyRcrosxbe7zf1NVtqwd15UENUyCvBtMhWBv4YcQ=;
        b=RgsXiF/LZxqKxVwy3PS7+xLpQTNa5yod6qXTeC6WE/1PoBqYtaLZEw+O1KnICdjsuF
         FVbislKOQciha5Os2si2N3f2G8cuUuMVJn+fk8OKGMSQYwcLMdpOn0/0Htijta8tVhGN
         2vU2rE6dyi1QmX2Sto+c47Vxcj7VlwgRPQCJQS1UeUd6qObj8wW0n+IxU1oirVG6KO+r
         fX5iytG4iLcfqzIa6kpPNDTQX3YYxYG4NY6Pa/xIRyZpX76K5KY5c4Yf9Pm0m9tY9rqc
         ts7HHaLxV2QINzyCIFqvIjaEqYDlWd9nWDY+UjW+//cGgGGPYyn5UjxyzvDpAozK0lVN
         yPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeLnyRcrosxbe7zf1NVtqwd15UENUyCvBtMhWBv4YcQ=;
        b=4sEEDLUOzFQJEIioKkmn2AehmNJSTeNFn+dbCml88sBR0XM+tJuRY9TUC7Xt05/zRo
         pSWrnr1DIFQw+HwNr0tLxaxZ9tfjrqRf62ATQCWK9b5lTwzWzT937wzUoNgVag6O77JJ
         CKtM1PFRcFYT/bRKUBJn4zhZeDovby+BTFiCzl4h7VLuKKl2tlklUyhuXNtU8Xz05p6w
         HREvxba5N3hnpmjeRMzITPuRsBtxGlJV9ytiw3yAkkd64RudEPopTCU31wuU0fusdclK
         DjFFzM3xEePn9MtL91ujlAaZIcYf5Ab2Lw4lOECa2wfBFIbmiSIPGzEbE++STdLICkkv
         k90Q==
X-Gm-Message-State: AFqh2koZpU0d9LYjljUQ6YzAvif83QUBbnA0D88bhQKDib30aJcjipaH
	b15M8XNfIiMvs2yAG6MJKa9UwQifBaCUMN/aCLg=
X-Google-Smtp-Source: AMrXdXu0aI6zgR44lJkZQk5J/ah2nhc8d7y8bZuvOHZmmoOGaXFvRF8UKRfA/3TxipvjPYEdZM+Vjy2tLh5Ul5tIvb4=
X-Received: by 2002:a25:ca4d:0:b0:771:56e1:e4e9 with SMTP id
 a74-20020a25ca4d000000b0077156e1e4e9mr4244307ybg.75.1672778701030; Tue, 03
 Jan 2023 12:45:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org> <20221231064203.1623793-2-masahiroy@kernel.org>
In-Reply-To: <20221231064203.1623793-2-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Jan 2023 21:44:49 +0100
Message-ID: <CANiq72k8LSqsnWNd_aa-M1=rMNLWD7KJWrK6Pv0Waq15Exv59g@mail.gmail.com>
Subject: Re: [PATCH 1/6] kbuild: specify output names separately for each
 emission type from rustc
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, llvm@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 7:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>   $ make -j$(nproc) samples/rust/rust_minimal.o samples/rust/rust_minimal.rsi \
>                     samples/rust/rust_minimal.s samples/rust/rust_minimal.ll

Yeah, we were testing the single targets, but not multiple at once, thanks!

> +               --emit=dep-info=$(depfile) --emit=obj=$@ --emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \

Perhaps a newline here to avoid the lengthy line?

>  hostc_flags    = -Wp,-MMD,$(depfile) $(_hostc_flags)
>  hostcxx_flags  = -Wp,-MMD,$(depfile) $(_hostcxx_flags)
> -hostrust_flags = $(_hostrust_flags)

This was originally meant to be consistent with C and C++ indeed, but
if you prefer less variables, I guess it is fine, in which case,
should we update the C/C++ side too (in another series)?

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
