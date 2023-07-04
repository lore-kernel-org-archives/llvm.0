Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3B53B1
	for <llvm@lists.linux.dev>; Tue,  4 Jul 2023 13:29:36 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-440c5960b58so1708418137.3
        for <llvm@lists.linux.dev>; Tue, 04 Jul 2023 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688477375; x=1691069375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XmB7Lt1kdBVFrZQRN7GBaRqYcNVkYfgU/8oYqlFezt4=;
        b=ajJ4UiuFndj1QghyWQgPkL/JxKC3j1CBoSonKOyfUJJL7j07mh4qPoGIsk56/chegt
         xpzBz4hA+2qF8Iyg+suTKjFLkDI9hiAyA43m8+N0/78KMweoPyissSbRCxDPlEZlbe9B
         QQq2iQaIM63wFhEmEq36Es23XFItAVroZiyNHk0nsjNxChQS4gcw5rx0S+jPQJsKNUDF
         qgt/yD4FKjpTxS/+okX250KkIfpcfwON3oS8NF1OyVkfF/+c6WS0nNI/C+dSZIpBKbWs
         v+0j+vAEGllmImrMMhN+l6gMWa+85tjTmTlkC8lX6fitTHJJ5jx3Q8ckwwVni/moruf8
         7wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688477375; x=1691069375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmB7Lt1kdBVFrZQRN7GBaRqYcNVkYfgU/8oYqlFezt4=;
        b=XAFKZULbVpdpmfgMKRjn75or6oT9IUk+M56xSzBnsBEA17/N8Qrgni4FLrg11C8OKq
         46xh1q7Y4emYfb+MAAX7Ct0V+qm6iDgM0Y8AKiUZjYVMhCBsVutaCXxsE8I/qaeoTfPh
         4NmoTJ76Epx2DjqI0NuCEqVwEA7ttIbo5E160GcQbdXBGN54YPmGqLait1FKSslv7ib/
         i+6axBh/H4fE42rkHHILqVuJH418j+hiqhWp5e+r11UtyBs3FL2XWYLgKnBofKi72jFP
         5qkfFfyhOgoKEvd2r6nGrZfEv387MDcHNvfAr9I/zP98Z8nM8VYOlnxsCPXDJRzfxdvK
         ZuJA==
X-Gm-Message-State: ABy/qLbimkZ/RSetPHM8H41E1Z8HumosM+JECOk4H9grlifImr7BlsjF
	v9wllW83L6LqPUVwbxyjTVc=
X-Google-Smtp-Source: APBJJlG6UXeTK7QCoVEmWgU5r0gDS1LYzy0V2HuWLufr6jmxSy6vhodnImbYXmBhc6oWC5DcwYECTg==
X-Received: by 2002:a05:6102:50d:b0:443:92af:a851 with SMTP id l13-20020a056102050d00b0044392afa851mr5784886vsa.32.1688477375412;
        Tue, 04 Jul 2023 06:29:35 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id v13-20020a67ac0d000000b00440978082a6sm3673732vse.8.2023.07.04.06.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 06:29:34 -0700 (PDT)
Message-ID: <5164d21e-1ceb-35cf-1d1d-6c32fcdcc4c5@gmail.com>
Date: Tue, 4 Jul 2023 10:29:29 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] btf, scripts: rust: drop is_rust_module.sh
To: Andrea Righi <andrea.righi@canonical.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20230704052136.155445-1-andrea.righi@canonical.com>
Content-Language: en-US
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230704052136.155445-1-andrea.righi@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/23 02:21, Andrea Righi wrote:
> With commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> we are now able to use pahole directly to identify Rust compilation
> units (CUs) and exclude them from generating BTF debugging information
> (when DEBUG_INFO_BTF is enabled).
> 
> And if pahole doesn't support the --lang-exclude flag, we can't enable
> both RUST and DEBUG_INFO_BTF at the same time.
> 
> So, in any case, the script is_rust_module.sh is just redundant and we
> can drop it.
> 
> NOTE: we may also be able to drop the "Rust loadable module" mark
> inside Rust modules, but it seems safer to keep it for now to make sure
> we are not breaking any external tool that may potentially rely on it.

Keep it, I think it can be useful with tooling like kmod.

> 
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> ---
> [...]

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
