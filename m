Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AF513BACC
	for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 02:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729736525; cv=none; b=Gtdq1IJjdiFMiF+H3sIj3RJBYQpGuBSfkpPioWjfN0BewHrxEAYOcWW4oG5DbpUipfh8/hS4RFixMmb/HJgGeTCaDLbKGeydGPS6WgJp+PGbtcjEFDHwSjPMFL7Xnx/bMR2lwSP6tvgfeSpBEt5pd1E/FD4iG/b8OHURTRU7pYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729736525; c=relaxed/simple;
	bh=m3Ot8oYn8Og7JeN1WvTnV4Zbz1ZuV/05Kmvb05VqKsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKBZHBYvPU9BPmopVbM2xsndbo7SDsuZIfd/kwKREUOKyDNvTXD88UZCX2T0bj/Lc5c5zVHloF+TycyF7Zq+/w5INt15gJgwW1Fq49XcciKDj9GIe70a/hFX+YiwVohbep0/IOAUVlqKIJkvVL6a7uF0jkwSWoHqdsnHdjVcJDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evHOE2N+; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evHOE2N+"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2974743675so442354276.1
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 19:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729736522; x=1730341322; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0GrkmMosGLeeGUqJPb2uCqk18kplfVZimJ2iFrxCRw=;
        b=evHOE2N+jvJodHE6UY5gQmVPt375CmaILtNBoHceHXSHhmpdXGHqhaeN8yllq1JaCO
         ci/xK2jFzWZ/q8mwnBQpHRR4O0Fe8EuwqrApanTL/A3QcpBsVX8O+9/NZzD8B+OdKPui
         bXTUlaF9mqXCHazBR+lJbhNhRcInNg/N/lpVbpG2Z+q166/BBi0FWM8ONkL5YR4y31Pm
         kk0kO5EgiXgKiu7vLCGG4pqQh1bCudaeUu0unEmUNr7y6VTq16qNWqvEMk6sQP1GSudN
         OL2gjfUDYo5yhJL90o2hmzqf/bCpvNIIdCOxdRT3HRRy1IdClG9FDmLXajNB0b2Xs0l8
         OghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729736522; x=1730341322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0GrkmMosGLeeGUqJPb2uCqk18kplfVZimJ2iFrxCRw=;
        b=h2qcJqt4SbQbbGq7a4W8VoajGmIRnFbUloA2LvXdgPQ5psZnUoEmGBlKX3EfPOQEDq
         lOcSqKfuC76KlXzSd8Q5UUbsBq4b9oJo3UVBioySZ8zLw42QLxmgZj4AQGuKmWfMPtQI
         OYaglTiBeU7Yw/OzcrtX0gjYzBxhmiL1aMGy9Crfx9qjoPCAJ7lTY434Lt6SyaWJwVm5
         cQYFDJ0JSjKHwlTYmzWnfBhyeb1KTqeS4EueSA6bo8rVmc3Iv8tD/Rqw1hQcnW6wWUhX
         O8oU9is9SdgTYX3K5XA9SDhenBcMYyBsA3TOorRmqljwDFJDUPhGhO6V9QXV2uuH90fW
         9mUg==
X-Forwarded-Encrypted: i=1; AJvYcCUwWpZwWp3yeXVTEr4sK+cUfPsVPZEsBEV5Tn5aQUfbvWHRP2PrhLE4qzviBfz/End/bPxP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0m5uUMuTruhrgLeDEMvRSDsoyXtbmzYeUJ6TTFuPWC/W/yqhW
	M+zMTNavvm2/SsBMkpXEiQBD5AxI2fm4S3c44Em3c7cbJKcjlPFa
X-Google-Smtp-Source: AGHT+IEUu7KXxZFkflqposC4YCLigCJ+qVgqi9aBnoX0dNZcQbmujiyi2eoO6po+vUlEAx1yw3ClKQ==
X-Received: by 2002:a05:6902:1a41:b0:e2b:ddbb:1337 with SMTP id 3f1490d57ef6-e2e3a6e4de9mr5367390276.53.1729736522062;
        Wed, 23 Oct 2024 19:22:02 -0700 (PDT)
Received: from [192.168.2.226] ([107.175.133.150])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdc974c47sm1794099276.4.2024.10.23.19.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 19:22:01 -0700 (PDT)
Message-ID: <46e54088-ad96-4387-8a39-2e4686c842bd@gmail.com>
Date: Thu, 24 Oct 2024 10:21:47 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/zh_CN: update the translation of
 process/programming-language.rst
To: Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241023062750.849951-1-dzm91@hust.edu.cn>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20241023062750.849951-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/23/24 14:27, Dongliang Mu wrote:
> Update to commit 0b02076f9953 ("docs: programming-language: add Rust
> programming language section")
> 
> scripts/checktransupdate.py reports:
> 
> Documentation/translations/zh_CN/process/programming-language.rst
> commit 0b02076f9953 ("docs: programming-language: add Rust programming
> language section")
> commit 38484a1d0c50 ("docs: programming-language: remove mention of the
> Intel compiler")
> 2 commits needs resolving in total
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> v2->v3: fix warnings in the make htmldocs
> v1->v2: revise the script name
>  .../zh_CN/process/programming-language.rst    | 78 +++++++------------
>  1 file changed, 30 insertions(+), 48 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/programming-language.rst b/Documentation/translations/zh_CN/process/programming-language.rst
> index fabdc338dbfb..95aa4829d78f 100644
> --- a/Documentation/translations/zh_CN/process/programming-language.rst
> +++ b/Documentation/translations/zh_CN/process/programming-language.rst
> @@ -3,25 +3,22 @@
>  :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
>  :Translator: Alex Shi <alex.shi@linux.alibaba.com>
>  
> -.. _cn_programming_language:
> -
>  程序设计语言
>  ============
>  
> -内核是用C语言 :ref:`c-language <cn_c-language>` 编写的。更准确地说，内核通常是用 :ref:`gcc <cn_gcc>`
> -在 ``-std=gnu11`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect-options>` 下编译的：ISO C11的 GNU 方言
> -
> -这种方言包含对语言 :ref:`gnu-extensions <cn_gnu-extensions>` 的许多扩展，当然，它们许多都在内核中使用。
> +内核是用 C 编程语言编写的 [zh_cn_c-language]_。更准确地说，内核通常使用 ``gcc`` [zh_cn_gcc]_ 编译，
> +并且使用 ``-std=gnu11`` [zh_cn_gcc-c-dialect-options]_：这是 ISO C11 的 GNU 方言。
> +``clang`` [zh_cn_clang]_ 也得到了支持，详见文档：
> +:ref:`使用 Clang/LLVM 构建 Linux <kbuild_llvm>`。
>  
> -对于一些体系结构，有一些使用 :ref:`clang <cn_clang>` 和 :ref:`icc <cn_icc>` 编译内核
> -的支持，尽管在编写此文档时还没有完成，仍需要第三方补丁。
> +这种方言包含对 C 语言的许多扩展 [zh_cn_gnu-extensions]_，当然，它们许多都在内核中使用。
>  
>  属性
>  ----
>  
> -在整个内核中使用的一个常见扩展是属性（attributes） :ref:`gcc-attribute-syntax <cn_gcc-attribute-syntax>`
> +在整个内核中使用的一个常见扩展是属性（attributes） [zh_cn_gcc-attribute-syntax]_。
>  属性允许将实现定义的语义引入语言实体（如变量、函数或类型），而无需对语言进行
> -重大的语法更改（例如添加新关键字） :ref:`n2049 <cn_n2049>`
> +重大的语法更改（例如添加新关键字） [zh_cn_n2049]_。
>  
>  在某些情况下，属性是可选的（即不支持这些属性的编译器仍然应该生成正确的代码，
>  即使其速度较慢或执行的编译时检查/诊断次数不够）
> @@ -30,42 +27,27 @@
>  ``__attribute__((__pure__))`` ），以检测可以使用哪些关键字和/或缩短代码, 具体
>  请参阅 ``include/linux/compiler_attributes.h``
>  
> -.. _cn_c-language:
> -
> -c-language
> -   http://www.open-std.org/jtc1/sc22/wg14/www/standards
> -
> -.. _cn_gcc:
> -
> -gcc
> -   https://gcc.gnu.org
> -
> -.. _cn_clang:
> -
> -clang
> -   https://clang.llvm.org
> -
> -.. _cn_icc:
> -
> -icc
> -   https://software.intel.com/en-us/c-compilers
> -
> -.. _cn_gcc-c-dialect-options:
> -
> -c-dialect-options
> -   https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
> -
> -.. _cn_gnu-extensions:
> -
> -gnu-extensions
> -   https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> -
> -.. _cn_gcc-attribute-syntax:
> -
> -gcc-attribute-syntax
> -   https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
> -
> -.. _cn_n2049:
> +Rust
> +----
>  
> -n2049
> -   http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +内核对 Rust 编程语言 [zh_cn_rust-language]_ 的支持是实验性的，并且可以通过配置选项
> +``CONFIG_RUST`` 来启用。Rust 代码使用 ``rustc`` [zh_cn_rustc]_ 编译器在
> +``--edition=2021`` [zh_cn_rust-editions]_ 选项下进行编译。版本（Editions）是一种
> +在语言中引入非后向兼容的小型变更的方式。
> +
> +除此之外，内核中还使用了一些不稳定的特性 [zh_cn_rust-unstable-features]_。这些不稳定
> +的特性将来可能会发生变化，因此，一个重要的目标是达到仅使用稳定特性的程度。
> +
> +具体请参阅 Documentation/rust/index.rst
> +
> +.. [zh_cn_c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> +.. [zh_cn_gcc] https://gcc.gnu.org
> +.. [zh_cn_clang] https://clang.llvm.org
> +.. [zh_cn_gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
> +.. [zh_cn_gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> +.. [zh_cn_gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
> +.. [zh_cn_n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +.. [zh_cn_rust-language] https://www.rust-lang.org
> +.. [zh_cn_rustc] https://doc.rust-lang.org/rustc/
> +.. [zh_cn_rust-editions] https://doc.rust-lang.org/edition-guide/editions/
> +.. [zh_cn_rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2

Hi Dongliang,

Good job! Most of translation are good.
Just the above doc seems still English version, give them a zh_cn name may cause misunderstand?
 
Thanks
