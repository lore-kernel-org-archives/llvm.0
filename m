Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776887F
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 16:44:36 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-19f3550bcceso5013902fac.0
        for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686761075; x=1689353075;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGL7yKszvXa2cHQQt1GT6R3oKRDiN6LOViSYfGPWdZo=;
        b=lBQX5SXd0WDA3PYTUq+DPijuVWmtojhq1FptFGztY9lgLFeSHQH/K4mxr6HYUbkwaV
         Rxhv1T6U2qgxuGbubeXSajtOcHfgJdNPQyE8Wdej8d0HgHSdYreUERKq+39go1Gss04V
         UgpbIQYsXgFRU31sfTPAXXoudV2mQppbgiiLSjGzhU4BSQIeEVf1OZPKvYNEHWPtWnsS
         Y9t5+iX7fx8udI37abgmFnKIyte9AUsvjpbv4fyIYX56tSBWb5CGLlwhjoBbGB3vjyRK
         F+UA14eBgKGYnr3jt8zWGEcDtpWMZFzjP4KKwoeXQgO0ECiGPy9pMrIhMnCHHE/SHkBv
         Y7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761075; x=1689353075;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGL7yKszvXa2cHQQt1GT6R3oKRDiN6LOViSYfGPWdZo=;
        b=TCi+gMKuz1fbGZwdhs7l0kvWQr68DLZsa1BnVaU3GA8V/UelOQIadTehR+Ves0Qeeg
         3pC+tDfj8UXIheeazmdnP7rZiCqioMIGvqnbh4ir0SBnK8nAaaFf8ORhW4c3Kn6w+Hod
         HR8q1+uUdI7NIyi4M4F/WL2lnWYj+M4cML+pZdFlK8y9HsUtq0GBfU5HYMVuigwMdiFc
         ViQ/vFgOy+IJISe+JGDaZ5SDcg0TzybwkBG8TRx4+h0QRn1TM00LiFC/xuQc++7/E3mV
         rGL6M5qPVfdpDZBGWfBJr3a+YtYdmKC08dYqEFOD7o5fmi6vbL/iPErxovbbTyDRKfZv
         DZNA==
X-Gm-Message-State: AC+VfDz1bEwf7MFg8V0boQ33ngaarYmBB0IsGRCAJNZE+FhW8JcYzrW6
	x29A73gwp9nlEzVToMnUjr0=
X-Google-Smtp-Source: ACHHUZ4r1WlTv/EKwLsLnrfaKpz6dKG+rQYC1+TpjBZJkEfor9XmpN+kRPszhoK90YWMTA4IbWSNDg==
X-Received: by 2002:a05:6870:772d:b0:184:39e3:9c85 with SMTP id dw45-20020a056870772d00b0018439e39c85mr11651838oab.29.1686761075300;
        Wed, 14 Jun 2023 09:44:35 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id el18-20020a056870f69200b001a6d15fc52fsm1501154oab.4.2023.06.14.09.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:44:34 -0700 (PDT)
Message-ID: <4a1096e9-500e-d764-0a79-289e6559cfb1@gmail.com>
Date: Wed, 14 Jun 2023 13:44:30 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/1] scripts/rust_is_available: Fix clang version check
Content-Language: en-US
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
 <525fee98-c694-6a38-cd1e-dd7efd806620@gmail.com>
 <CTCD11G9NVTB.3SYR2GFA5VAB3@hackbook>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <CTCD11G9NVTB.3SYR2GFA5VAB3@hackbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/23 09:08, Ethan D. Twardy wrote:
> Greetings, Martin!
> 
> Thanks very much for your testing and review. Do I need to take any
> further action to make this patch ready for review? I sent out a v3
> version of the patch, where the only change was adding Reviewed-By and
> Tested-By tags to my git commit--since this is my first time
> contributing to this community, I wasn't sure whether I needed to do
> that. Thanks!
> 
> Sincerely,
> 
> Ethan Twardy

Unless other reviewers requested changes, you have to rebase your
work or you want to make a modification, it is not necessary to send a
new version of the patch series, generally, maintainers will, and have
to, add any Reviewed-bys or Tested-bys prior to merging.
