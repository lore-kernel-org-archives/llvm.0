Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C312B74
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhme7NKV"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6c4d625da40so1027837a34.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696544180; x=1697148980; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CLq7Ru6JO/XafGfaqX2puFSQKrvbgIFrK81byfRpEo=;
        b=Jhme7NKVluDwxB/6JYBUa+YGYQeV7iDYOCDMnQ3GuSz3ImS4uYvuV5EvjjBrLGI1Bk
         Z2Ze70LJCtTmwrGHDMF0miwWHMA/S9G5yhQSb1hNaAHTRQYqwpw3FQGWts3ps52JR/X0
         sBDVcqHVz8GQbTxFBv9u3TeYgccHjV3kUGsywvAAS2nSHcafqD87D5xPwHzZyk4Segpx
         06r5Z9Ns3Q/nn1TavjUHSHbzs9dwYKw/yrwu2hJ6HShPAiMlKcu2zlBsOaaZiBcgudn7
         fs6MZa/I2B56XoZii18cy5N1nDyKaDKgV8wpWzfhpu1aSFCXL0OEHQwpRZNYyx4kkZ/R
         TJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696544180; x=1697148980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CLq7Ru6JO/XafGfaqX2puFSQKrvbgIFrK81byfRpEo=;
        b=QFQuDDjiPr4tztVks9CSI2aUh3P89mmqtMl9DrpzZxYY4/w+h94+6vBL8igEqZz53B
         6zTUrpf6/sej+1l5DjmijtERT8pV4eK9gCFBZqYfhkQJYoW+HO/SuOll9MZaDTxaiBGN
         wpoXQFaxzZlaeVwUb9eqpdfMgcSBX2baA8eHXbol16CwxVzm03JbTrt+jBvnRSmzXRsV
         hYwgGe8tq2kEtNIGkrtezTloubrB8L69GPz5k+m3Wae5DNhAJOjDUeOYoIcAOIShznWm
         N4lgkU/iheKlaBrsCQV336d0oh3U9VRgksxk0hCiOcZayD9EVxhTvAzISiRsKHSe785j
         P83g==
X-Gm-Message-State: AOJu0YwFQJsLHTsEpnULO/MGZ3mkNAO7yA7dO/5ctL97dVAYtTxG3qVE
	zyvBfjzDiRtUk9ZRb/c6jcU=
X-Google-Smtp-Source: AGHT+IH98BqVGyK/k/oU7Mne+jf+9iNkFlEiTtZVtuB6Ggmo93JAZng1BoL01sTi3Kvov6V5PrYkIA==
X-Received: by 2002:a05:6358:938f:b0:139:5a46:ea7e with SMTP id h15-20020a056358938f00b001395a46ea7emr6326524rwb.28.1696544180255;
        Thu, 05 Oct 2023 15:16:20 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id w25-20020a639359000000b00553dcfc2179sm1950515pgm.52.2023.10.05.15.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 15:16:19 -0700 (PDT)
Message-ID: <fe189597-7cd5-493c-ac10-082ff50b3a1a@gmail.com>
Date: Thu, 5 Oct 2023 19:16:14 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] rust: Respect HOSTCC when linking for host
Content-Language: en-US
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
References: <20231005214057.759089-1-mmaurer@google.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20231005214057.759089-1-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/23 18:39, Matthew Maurer wrote:
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
> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
