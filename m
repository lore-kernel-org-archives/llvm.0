Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB8B1FB8
	for <llvm@lists.linux.dev>; Sat,  8 Apr 2023 18:25:00 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id c2-20020a056830348200b006a3ab0ba8a2so5098273otu.1
        for <llvm@lists.linux.dev>; Sat, 08 Apr 2023 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680978300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pwc/3AWMfEaAIvYsDnkVg0ci20u8p4CqXhM8i5egr5o=;
        b=gzDts5q0CNK6aNvIaGy8bjFLBbnMG9p8cNk01Z5ybEt1Ac2fqxvhsL+ev7UKPbPgsQ
         Ud6jJtmqURe2yNpIlyx5i7ytzeLnjRsRxAoogNyFZN5Rk7Mp/nO1uEB0tNS1wVlzX0qO
         MSAPPQU2ywrrAxsUHgt0NzOG+8kN+U7NXJ1LhSPcEUk2z4ZiIIx4vyhmd9ZN0B/HOdKc
         Dv+vfXs/joypJUkSpYTXTS4n4lm/YLiQY6OwIR1C6djuVRH9V6y9zoN1rQAQF8UqsF8i
         j5gk6NCXXV4C0BI885dIhpKri6y36zMVWlaoR8H5D0QdYORnDnANC1oaRmGPxIxK96UQ
         9o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680978300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwc/3AWMfEaAIvYsDnkVg0ci20u8p4CqXhM8i5egr5o=;
        b=56hJ6p0GhtXH4tXJUvB+TsNjYwtbnNqdLfNza+4lvgwjV11wewd2MhWUv57oMwBBnS
         4xZhckgOCCbhwZCOE5TnqrZ8iuS/XH81dr6plsqfYYDodAdSlcpmEuPqXa3e+nkEYBky
         +n1vkesSTcweXySdbdYiF3oybdsnCym9EUhOFyPHf8H5iJ9aMTbBxvzgdDfm3zXdGfUR
         9u6ncTXv/68zJiVt40OOIhyabR1SWHIpPQasKRMT9j88lwV4P8FVpeDzdoQdsDoOXQBm
         ristES0QfICBG3hE9y0omhYu921Pcw/rrjRH8RpJmBjw8xBi0ULyDel8yg4mPTBKdZuF
         Xhwg==
X-Gm-Message-State: AAQBX9eYyQSk3HZCpWaVWfPYOS8TLWr3CXFccUqzNjxXd9nIW3tk2ZH6
	T56UGwOKKbOTEqgLogrDBnE=
X-Google-Smtp-Source: AKy350YVWWK5LVrcIXkGkfiCOeOtBJu5JBLuctbC9AAS/sN/aoOr5liabuPstmjtoZ5nP3Uz6zCHZg==
X-Received: by 2002:a9d:7443:0:b0:6a1:21fc:653b with SMTP id p3-20020a9d7443000000b006a121fc653bmr2280347otk.14.1680978299895;
        Sat, 08 Apr 2023 11:24:59 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id b17-20020a9d7551000000b006a3bc285eeesm2670716otl.68.2023.04.08.11.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 11:24:59 -0700 (PDT)
Message-ID: <c0f47367-6352-e55d-1a87-fe2960a84838@gmail.com>
Date: Sat, 8 Apr 2023 15:24:53 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] scripts: rust: drop is_rust_module.sh
Content-Language: en-US
To: Andrea Righi <andrea.righi@canonical.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
 Eric Curtin <ecurtin@redhat.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Neal Gompa <neal@gompa.dev>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230407070517.204676-1-andrea.righi@canonical.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230407070517.204676-1-andrea.righi@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/23 04:05, Andrea Righi wrote:
> Commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> introduced the constraint "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE"
> to enable RUST.
> 
> With this constraint we don't need is_rust_module.sh anymore, because
> 'pahole --lang_exclude=rust' already has the capability to exclude Rust
> CUs. If pahole isn't recent enough (< 1.24) to support --lang_exclude,
> then DEBUG_INFO_BTF can't be enabled with RUST and is_rust_module.sh
> isn't used as well.
> 
> In any case is_rust_module.sh is obsolete and we can just drop it.
> 
> Link: https://lore.kernel.org/lkml/Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390/
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> ---
>  [...]

Go on

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
