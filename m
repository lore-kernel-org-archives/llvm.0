Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAB7C
	for <llvm@lists.linux.dev>; Sun, 28 May 2023 14:39:39 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6af713338ccso1021613a34.0
        for <llvm@lists.linux.dev>; Sun, 28 May 2023 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685284778; x=1687876778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zqwAEtWjCPT8dGp7Hg7XLpqKdzj6HDs5vCuNUoe3jXY=;
        b=oC4dgXq5JL56+5e6LQPqolZoKF28dXEppYncf52s5VGYpuuP480KIoe2w3NO7sdpSN
         4h4eCP/jlUst3C1JHGKwir/s5b2LDtwR3ZbtMJPunUaJnw5PiJOfywUOJftuz+Owrv8O
         u05FmRg3d18D76IWldMwZZIAMDxsV4BuxY4knZ9WTNJLPn72Kkw9tGtnhCY9r3qFHK41
         W6MODjaBromzN8gMFlRCAtIiaozmxCzfMp189Y/64YziL9Gg+Kf4eqTzE6ArrtOkXvWc
         XrrrUBPSXbRw3aShePlzZ7EdDd25YdPFrxI1aVjZf9ywRJvWiALbZvv5i2O9lksvCAaV
         Wm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685284778; x=1687876778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqwAEtWjCPT8dGp7Hg7XLpqKdzj6HDs5vCuNUoe3jXY=;
        b=ANfeWXotI8W/vPPOnLR51b8M62uZ/DTaV3/Cka4tuQyuIyk1s9eR+dRU+nuPICCv+v
         I7GhOMptZCxVCZR610bRfQ4t8E2PqozQ+M89TBgZPS2i1ZAgBB7jzIUuGGmeuRsWl2tb
         2La5oWVrqAicimxa19Ve8jsSPVK2HWuDsDT8jdh8vIQc3rXNPSTv0VaAVXygIa5zOzWZ
         cqPnf5d1CFVBTqhUlmkeZjeNIfK5jsVSTBuUytxO0dGf+3L3zj0ggkBdu6y1WAZ7pwLS
         LbifeMoiKBHdurdpizna3BAkogfgS/l4gzWBebn/6GKco0vqua+6q464zaVgTf3AIgSD
         oGNw==
X-Gm-Message-State: AC+VfDzBkhTfG2zcL/x0jcrKS7RDfRZuJ0vvl0xFgvuTGs0S3dZa73Yc
	89fGVRF9TJe4DcU6oUrx7T0=
X-Google-Smtp-Source: ACHHUZ5Dwd/WEqOatrum1wODC6I6Zd0zd+J7X7PsjIvPXaoJbkkCMmdC04e9U8BkvLBnUlq1CfGnFQ==
X-Received: by 2002:a05:6830:4dc:b0:6a4:2ad5:9aa0 with SMTP id s28-20020a05683004dc00b006a42ad59aa0mr4087810otd.20.1685284778088;
        Sun, 28 May 2023 07:39:38 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id y23-20020a0568301d9700b006a662e9f074sm3647708oti.58.2023.05.28.07.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 May 2023 07:39:37 -0700 (PDT)
Message-ID: <525fee98-c694-6a38-cd1e-dd7efd806620@gmail.com>
Date: Sun, 28 May 2023 11:39:32 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/1] scripts/rust_is_available: Fix clang version check
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, Tiago Lam <tiagolam@gmail.com>,
 Kees Cook <keescook@chromium.org>, Finn Behrens <me@kloenk.de>,
 "open list:RUST" <rust-for-linux@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>
References: <20230528131802.6390-1-ethan.twardy@gmail.com>
 <20230528131802.6390-2-ethan.twardy@gmail.com>
Content-Language: en-US
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230528131802.6390-2-ethan.twardy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/23 10:18, Ethan D. Twardy wrote:
> [...]
> --- a/scripts/rust_is_available.sh
> +++ b/scripts/rust_is_available.sh
> @@ -102,8 +102,8 @@ fi
>   # Check that the `libclang` used by the Rust bindings generator is suitable.
>   bindgen_libclang_version=$( \
>   	LC_ALL=C "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_libclang.h 2>&1 >/dev/null \
> -		| grep -F 'clang version ' \
> -		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
> +		| grep -oE 'clang version [0-9]+\.[0-9]+\.[0-9]+' \
> +		| cut -d' ' -f3 \
>   		| head -n 1 \
>   )
>   bindgen_libclang_min_version=$($min_tool_version llvm)

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Tested-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
