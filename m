Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180953AF;
	Fri, 14 Jul 2023 20:37:54 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a1ebb85f99so1948776b6e.2;
        Fri, 14 Jul 2023 13:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689367073; x=1691959073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PYAqewVax5HL+fWUDbqh6UrtMzJWX9lEo4WEAOX/mI=;
        b=D3xt2IHKlZYOWMGKxFcdpr3Ci7XvlhAh0yS7s9RFAhvwgK0Hf4F2xW4bMpvXHfwN+F
         AbHlA7upHcu6RM89upM0WgFJOcdD9T8tx0qkymY4pFpI+XbK5QZrVz9mYDrBpIpVRgwb
         47pveQDNymhrkrQ28Hz4bV4pKivFcY3bixNSdRAI5rQhWyl1A6x03ZvBU1X9Z6nKqys+
         hi7zK5cU+Wp3OM4BmDlyWQpcjwBNfN2U8nQKB0MBPyVvxtk8+5+bv0SUd0FJacsAb935
         CokPEFGGA9F8QeZb2XUaV56LNzuBHnSESIcW3dgQwddxRqIejj5xF15MigNLY0qyI6Od
         tKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689367073; x=1691959073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PYAqewVax5HL+fWUDbqh6UrtMzJWX9lEo4WEAOX/mI=;
        b=E1AKmmU+enqKxEdoXgeWQE13Nt1X0ImENXcaVB7avQFZMHtLzhgQZnfqx3/2zIwzpC
         K+zKzOI6qAnRegFXZjsjPF9GW5F2/nCHLjCydin5Q8oZyFWdurr174KuYm3zGIXXvq3O
         +vFVHp+hT7gE0/tQnwFlj4/NGcgskm8vHaqbBsXjkgsHF34FYLhP3p1um77yiE4/lxsW
         KLeHaRtwO38rEnC8VQxCh2lcnEoLIXuVllpbktdkXmBuV2gq4o6O6G4YAIxBbBOWBS9a
         VKspmdYnJ5KPFqjbYNqZ5pr+TK1xnGAQBhjh+al6lT7z7Z2e9eFrEasr27P/OelRDk++
         Wy2w==
X-Gm-Message-State: ABy/qLavtDALaBCAwo8MGbh0eBU5hYbJsnYap9Cr9mWRSbD4Q983k58x
	8z5MnMy6fm7O9Vrq9GpOvLY=
X-Google-Smtp-Source: APBJJlHswb6iEr1H/PIicl7XpNnngq1kB50YKs3UNb3s0g+wwQ3pmylrmgZchXnE1uKK+53fNTQ+kg==
X-Received: by 2002:a05:6808:13c9:b0:3a3:f67b:876f with SMTP id d9-20020a05680813c900b003a3f67b876fmr7967810oiw.46.1689367073159;
        Fri, 14 Jul 2023 13:37:53 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id j5-20020a544805000000b0039ee1de4e6esm4255680oij.38.2023.07.14.13.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 13:37:52 -0700 (PDT)
Message-ID: <75146bf9-7bd3-d638-5c6b-23c7327a6f49@gmail.com>
Date: Fri, 14 Jul 2023 12:10:19 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC 06/11] rust: sync: Replace static LockClassKey refs
 with a pointer wrapper
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20230714-classless_lockdep-v1-0-229b9671ce31@asahilina.net>
 <20230714-classless_lockdep-v1-6-229b9671ce31@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230714-classless_lockdep-v1-6-229b9671ce31@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/23 06:13, Asahi Lina wrote:
> We want to be able to handle dynamic lock class creation and using
> pointers to things that aren't a real lock_class_key as lock classes.
> Doing this by casting around Rust references is difficult without
> accidentally invoking UB.
> 
> Instead, switch LockClassKey to being a raw pointer wrapper around a
> lock_class_key, which means there is no UB possible on the Rust side
> just by creating and consuming these objects. The C code also should
> never actually dereference lock classes, only use their address
> (possibly with an offset).
> 
> We still provide a dummy ZST version of this wrapper, to be used when
> lockdep is disabled.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
> [...]
> diff --git a/rust/kernel/sync/lockdep.rs b/rust/kernel/sync/lockdep.rs
> index cb68b18dc0ad..d8328f4275fb 100644
> --- a/rust/kernel/sync/lockdep.rs
> +++ b/rust/kernel/sync/lockdep.rs
> @@ -9,19 +9,36 @@
>   
>   /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
>   #[repr(transparent)]
> -pub struct LockClassKey(Opaque<bindings::lock_class_key>);
> +pub struct StaticLockClassKey(Opaque<bindings::lock_class_key>);
>   
> -impl LockClassKey {
> +impl StaticLockClassKey {
>       /// Creates a new lock class key.
>       pub const fn new() -> Self {
>           Self(Opaque::uninit())
>       }
>   
> +    /// Returns the lock class key reference for this static lock class.
> +    pub const fn key(&self) -> LockClassKey {
> +        LockClassKey(self.0.get())

`Opaque::get` is not a `const fn` so this will not compile.

> +    }
> +}
> +
> +// SAFETY: `bindings::lock_class_key` just represents an opaque memory location, and is never
> +// actually dereferenced.
> +unsafe impl Sync for StaticLockClassKey {}
> +
> +/// A reference to a lock class key. This is a raw pointer to a lock_class_key,
> +/// which is required to have a static lifetime.
> +#[derive(Copy, Clone)]
> +pub struct LockClassKey(*mut bindings::lock_class_key);
> +
> +impl LockClassKey {
>       pub(crate) fn as_ptr(&self) -> *mut bindings::lock_class_key {

I think this can be made into a `const fn`. What do you all think?

> -        self.0.get()
> +        self.0
>       }
>   }
>   
> [...]
