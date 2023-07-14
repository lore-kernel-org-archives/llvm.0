Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141253AF;
	Fri, 14 Jul 2023 20:38:02 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1b049163c93so1547645fac.3;
        Fri, 14 Jul 2023 13:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689367081; x=1691959081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W89cgNy1eNMzHOiNr0LRyucV1brLsczr4weQChBoiQg=;
        b=f9kMHGWeKmTB6HbLltAi4/fyW22V2tWlSzB4grilg1liYKvNB8vtXLS/OKa836RCJf
         GL8qyoT1a7m1v2QJ5czSZdtD7UHD/GUhIZFP+If6GRN2F9EQdHLnAHDp2kLFylDtzT9u
         +ynfreEUnSLmwbOqDSIVdrCly8rnqnHjdSHv/Ko5yNlvGfhmXEzjUHl8ErcY6IwgVxiC
         ekIR3UirrbE48novxPQLRwYTPnoioKjFo5y5rysdA0nmuwyN2HaX117MllsThEcBw2G8
         VSSqFEc6N5zsDUzBYGNlweI5B4GQwnO1Qpofnu/Prx0YpndEP0Yh4WWC/40Zn8BcKFVE
         0fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689367081; x=1691959081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W89cgNy1eNMzHOiNr0LRyucV1brLsczr4weQChBoiQg=;
        b=kSCYCfcp1t3c6mAnHFFtBGoR6eFu4W9VKvzFHxOVIYBHJaZKr4qSHQhGWPu+DObel0
         1lJeAObCDEAeykpgCTQRP2I87de5/j8fP1nl3OJ+86ZqrckjpxKNLGKHElu+FTX9Mafg
         6yrZYh1hV1KuxOStjFQj7bONs8GRjhSscHOO55hoV1rSqwq8WPs2ScsYUdtzl55vrHLz
         yroMfOuq/k/j4ISWN/qx/PmBot+NzWf+cFYdAkv2T1WkzECpa/ogUypClIi1TYCBPW2r
         MYUV77BlznsjSqDX8G9hGpgcFZOtg2f+ADZzsFmtMxz0I2nnZpbz4CttVvkZ2rGhx7It
         Anvg==
X-Gm-Message-State: ABy/qLbqKneB5IkzJdhaRO8JCtGo/gmfLVV2S9viEyYG0hi2IAtLmUDR
	G1idOP9FGyOxPX7z5PKDRyk=
X-Google-Smtp-Source: APBJJlHVyCp5IxFJ6qO/h2cfiutewACkZl9hi48ptZGNOKVH0KtFwusHVfRsonFsvr6QR1es6WjUVQ==
X-Received: by 2002:a05:6870:934a:b0:1a2:c181:5c85 with SMTP id j10-20020a056870934a00b001a2c1815c85mr6561375oak.9.1689367081191;
        Fri, 14 Jul 2023 13:38:01 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id ee23-20020a056870c81700b001a69e7efd13sm4403908oab.5.2023.07.14.13.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 13:38:00 -0700 (PDT)
Message-ID: <28a747bb-2d14-61b6-b5b5-54f8a162155a@gmail.com>
Date: Fri, 14 Jul 2023 16:56:17 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC 07/11] rust: sync: Implement dynamic lockdep class
 creation
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
 <20230714-classless_lockdep-v1-7-229b9671ce31@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230714-classless_lockdep-v1-7-229b9671ce31@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/23 06:13, Asahi Lina wrote:
> Using macros to create lock classes all over the place is unergonomic,
> and makes it impossible to add new features that require lock classes to
> code such as Arc<> without changing all callers.
> 
> Rust has the ability to track the caller's identity by file/line/column
> number, and we can use that to dynamically generate lock classes
> instead.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
> [...]
> +
> +const LOCK_CLASS_BUCKETS: usize = 1024;
> +
> +#[track_caller]
> +fn caller_lock_class_inner() -> Result<&'static DynLockClassKey> {
> +    // This is just a hack to make the below static array initialization work.
> +    #[allow(clippy::declare_interior_mutable_const)]
> +    const ATOMIC_PTR: AtomicPtr<Mutex<Vec<&'static DynLockClassKey>>> =
> +        AtomicPtr::new(core::ptr::null_mut());
> +
> +    #[allow(clippy::complexity)]
> +    static LOCK_CLASSES: [AtomicPtr<Mutex<Vec<&'static DynLockClassKey>>>; LOCK_CLASS_BUCKETS] =
> +        [ATOMIC_PTR; LOCK_CLASS_BUCKETS];
> +
> +    let loc = core::panic::Location::caller();
> +    let loc_key = LocationKey::new(loc);
> +
> +    let index = (loc_key.hash % (LOCK_CLASS_BUCKETS as u64)) as usize;
> +    let slot = &LOCK_CLASSES[index];
> +
> +    let mut ptr = slot.load(Ordering::Relaxed);
> +    if ptr.is_null() {
> +        let new_element = Box::pin_init(new_mutex!(Vec::new()))?;
> +
> +        if let Err(e) = slot.compare_exchange(
> +            core::ptr::null_mut(),
> +            // SAFETY: We never move out of this Box
> +            Box::into_raw(unsafe { Pin::into_inner_unchecked(new_element) }),
> +            Ordering::Relaxed,
> +            Ordering::Relaxed,
> +        ) {
> +            // SAFETY: We just got this pointer from `into_raw()`
> +            unsafe { Box::from_raw(e) };
> +        }
> +
> +        ptr = slot.load(Ordering::Relaxed);
> +        assert!(!ptr.is_null());
> +    }
> +
> +    // SAFETY: This mutex was either just created above or previously allocated,
> +    // and we never free these objects so the pointer is guaranteed to be valid.
> +    let mut guard = unsafe { (*ptr).lock() };
> +
> +    for i in guard.iter() {
> +        if i.loc == loc_key {
> +            return Ok(i);
> +        }
> +    }
> +
> +    // We immediately leak the class, so it becomes 'static
> +    let new_class = Box::leak(Box::try_new(DynLockClassKey {
> +        key: Opaque::zeroed(),
> +        loc: loc_key,
> +        name: CString::try_from_fmt(fmt!("{}:{}:{}", loc.file(), loc.line(), loc.column()))?,
> +    })?);
> +
> +    // SAFETY: This is safe to call with a pointer to a dynamically allocated lockdep key,
> +    // and we never free the objects so it is safe to never unregister the key.
> +    unsafe { bindings::lockdep_register_key(new_class.key.get()) };
> +
> +    guard.try_push(new_class)?;
> +
> +    Ok(new_class)
> +}
> +
> [...]

Is there any problem if we have many `DynLockClassKey`s leaked or not?
