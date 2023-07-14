Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EE63AA;
	Fri, 14 Jul 2023 20:37:37 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a41fbfd359so1814481b6e.0;
        Fri, 14 Jul 2023 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689367057; x=1691959057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mY5r74EsToyg15WyPiWjX1ZroHWYpVw9giMGrKp5JHA=;
        b=AJN5/qxg8i0gT7b4C7JV8YxHIbBH13eMOg2DhSZgcyeTwVmINt+uIR1UC7cffKvHa3
         3/bfbVb6OaoeS+/kSx4ONT1rQ/JADd8D03xutMFZu50rbkjCAOBm3ChncdDakkAjvCFR
         ZTMcUD0KglBQXRLgl0tkuw3bitTlQsJPYbqMNdxy5iNvBK2Lj1VgPfzPX4jgEu5V0fhN
         TbV2oVtYFJfwHCp9DGcH6P7H8JzVT5Q4lnmDf7b6cnveNHDh+oOz/kVQ4T61RQyMn+WY
         f7JBbUX7nXRprPIfE5Y1dCdU39NH5n5LQ18IzlSkyVG6yThBm+YX6MPtt9t+zXi3amdh
         a0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689367057; x=1691959057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mY5r74EsToyg15WyPiWjX1ZroHWYpVw9giMGrKp5JHA=;
        b=mDsJ3LOpDxQxL1ErwNu7jTTWvyoz0ge3UciNGf+7V+LoOWSHKVCTaruDHHnu2smT6Q
         cJf/JXk0UHLcGb7I91vc1D9tgSV1VF8p/maFTWzTp+8ju9/Tcvsf5up6wgFuH9XqwvmT
         +V03t0xwF9TjQKCJTS4EoAqtZwa9UFY8blElkLdYS+YBfFKLzHyIdl004eYGWsW1kxpW
         fGnk7coW72hd924VjkHCUvMdhQb05GBNSXl075r9E6n3PLW00wIIguh5yudI7xaKvEKf
         4sWxkung5ufr/lGg17g+Plyx3R4OwYTMOqqcoaynnv/cbT6sDyz43gtKLA8wrmb3tBc5
         u6PQ==
X-Gm-Message-State: ABy/qLbfZF000N+LU0qQm/5dD2frJtDaKtTr8ROyyZxYLzJJdpO4W1+I
	VftAqmucJZl4s5eY142VX+I=
X-Google-Smtp-Source: APBJJlFBrF1UdrLk9k1UzyB21a0BPI2S3IPzkt81x9e58ufSqkaA21DfyAMl9+w9uwHwKMk7wMrhDA==
X-Received: by 2002:a05:6808:d47:b0:396:e3a:9f2f with SMTP id w7-20020a0568080d4700b003960e3a9f2fmr6910430oik.5.1689367056789;
        Fri, 14 Jul 2023 13:37:36 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id bk12-20020a0568081a0c00b003a44b425c18sm293034oib.43.2023.07.14.13.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 13:37:36 -0700 (PDT)
Message-ID: <72aca706-c2ff-b363-717c-323ea24d3908@gmail.com>
Date: Fri, 14 Jul 2023 11:28:37 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC 04/11] rust: siphash: Add a simple siphash abstraction
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
 <20230714-classless_lockdep-v1-4-229b9671ce31@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230714-classless_lockdep-v1-4-229b9671ce31@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/23 06:13, Asahi Lina wrote:
> This simple wrapper allows Rust code to use the Hasher interface with
> the kernel siphash implementation. No fancy features supported for now,
> just basic bag-of-bytes hashing. No guarantee that hash outputs will
> remain stable in the future either.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
> [...]
> --- /dev/null
> +++ b/rust/kernel/siphash.rs
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A core::hash::Hasher wrapper for the kernel siphash implementation.
> +//!
> +//! This module allows Rust code to use the kernel's siphash implementation
> +//! to hash Rust objects.
> +
> +use core::hash::Hasher;
> +
> +/// A Hasher implementation that uses the kernel siphash implementation.
> +#[derive(Default)]
> +pub struct SipHasher {
> +    // SipHash state is 4xu64, but the Linux implementation
> +    // doesn't expose incremental hashing so let's just chain
> +    // individual SipHash calls for now, which return a u64
> +    // hash.

Isn't this detail relevant to mention in the doc comment? At least to
explain the difference between them.

> +    state: u64,
> +}
> [...]
