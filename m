Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA25C98
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 21:07:34 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3af603da0d1so1436341b6e.1
        for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 14:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695935253; x=1696540053; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIlKEJnw0fFoB8aDGwN3C/vOYWFmYPRhpPxSRX2qmyg=;
        b=Axxy9u2RJlfRKAmH/0WdPHZKyYHxElReABnsJp3iG0ny6NapzvX5u2AekN8RJ7Iy/0
         lFY7bAcbWhIkUjSkXfTc/PKd28IsGqXauQ4trkUQQOAUgXcKn6Vnok7+JLhSBWP+atYZ
         UH2q7LF3hDZKUtFy7agagrpd2oRvpJQ1vY6sRO9G+G7M6b94CJX13g5Nqd0nHY0AcSow
         txg5et4J2ie0tiMJUpWTuoXBVje/kZEpW197V/woHfATt2pa0ZkIUtaKfEeCULmTb8qQ
         ny5CFvWcTJse7be4goTycRcjTlLg1/Tw3Y+FP7WFq3lUkK5AL8e/PvokqYMaewnF2jR9
         wZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695935253; x=1696540053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIlKEJnw0fFoB8aDGwN3C/vOYWFmYPRhpPxSRX2qmyg=;
        b=LHj95zy5567U3WbZG7l5uXCOIzCQIXApN7Cv75p+TXq51K4Xc39oTJ3ywzgTYAVSDC
         9CXBDGxJgfgQ8vn49GJtYExCra92Wr0JX8q5sRroxwF+wxkLVNg8XYySr3MOFvpjdL6W
         bfNUglyPuUFx39w8LFJ4uszbB4PPYRVqA03gNIarjR2Z97lUrU16fvlcSL6lXtyKwAwz
         xFB05WtzqJW5ypoFobjG+Y53NtAVLlpM1TdigbIqj6LWhgkPIZ1m50WJL/5PYjB0ga3Y
         VY8KTcAuDFDSXE4XsRUe9ud7vKtH0KzWMhTdTzjLZ6J4u/H9HzU4xLP294ZdMTJaPEL+
         +IeQ==
X-Gm-Message-State: AOJu0YwHF21WmZ6ROJhtywE+dQRpWFcYLsIGlodIFVQyoZKXBzq5pWfZ
	lQaE9ZMIiDVx3Q1oo6oLIHI=
X-Google-Smtp-Source: AGHT+IG/wdC9TA1MZk6fSBU2RRw1BACeiIsuv/wTqo+LvBSGWzHVlF55AtGJGT7QdWxF+oHCueXdoQ==
X-Received: by 2002:a05:6808:1450:b0:3a7:5309:f1f with SMTP id x16-20020a056808145000b003a753090f1fmr2846373oiv.45.1695935253446;
        Thu, 28 Sep 2023 14:07:33 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0068fda1db80bsm13766692pfi.75.2023.09.28.14.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 14:07:32 -0700 (PDT)
Message-ID: <91c25e18-ff97-46a2-a50a-493c00bbc156@gmail.com>
Date: Thu, 28 Sep 2023 18:02:59 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: Respect HOSTCC when linking for host
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
 Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230928194801.2278999-1-mmaurer@google.com>
Content-Language: en-US
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230928194801.2278999-1-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/23 16:48, Matthew Maurer wrote:
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
> 
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---

Psst, next time I'd recommend putting patch version to version changes
here. Still, LGTM.

> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
