Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877AF9E7
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 23:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVnzX5dV"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5a90d6ab962so30634927b3.2
        for <llvm@lists.linux.dev>; Fri, 03 Nov 2023 16:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699053426; x=1699658226; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jKvHzkRZX2X3VBhvRihWnoFQA9z7HSth6wpISZ7pu5s=;
        b=cVnzX5dVXjZ8/tz3KdULPvPuB1kQYA7an3ceLWlWhqv7miRkDugJIdEOibg5FGKIgg
         WFtNmaLG4xHnh8utrUjRSk9fXYArz+KDuBnsburQEXFfiBW7C8ri9wpKZrMkxZFlx91w
         1HB+BTBGETaB8m7+vEUAYCxjMY/lWzScWD7HAnGltgZDCVholwKd0ksgblxw279k+Cbz
         7IEC6XJCkp7y9BpsU1fkIBGIw/rLbQsEe6K99nLJ5H9LEQOAU+sYDGFaiu1iltz1iNn8
         yG9KtOFdbADH2ldZY9lqa38nhHwnbHXbKYJ5D30RxF6Gj9rww756zY+EeXbZtO7rCRph
         /e2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699053426; x=1699658226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKvHzkRZX2X3VBhvRihWnoFQA9z7HSth6wpISZ7pu5s=;
        b=hu/DpOd+cDw7i6mdjt1hzvVclPGlY8zDCduzuBHPYqcAb69xTv2VP8hAd2wbRucc9r
         XWqtfWksRWnI/6MmjPudzZTsBSTpQOWQYrEqZDLAFypnz1OzBYWj+kAGB4GERd3yFi5k
         NwRTkOwZmoaWn1tsCBVxtuYgadKrUpYm9/SBoPmFzjtcNfBhEAG7EmPwCO1Uqf/1KUTz
         /6bM+5atZAzDQh/MRtUnfSSX52RBlX2Oclpt6IKqu9DJbz2bbTwybym5GZY/g/37PIcN
         YnGCITU1z7YOPpW8c5YvhcTjsoKeidck/QFuPE2c4wrkKj1JtG71PZZTOMkNafIqIe7R
         9nIA==
X-Gm-Message-State: AOJu0YzqNUMLINheThvnhFnaTsb1kPiLrNJ5NVdToZZ5qPTbkq9R1x0T
	osx6IJiyk7HVQVEnRqbVL2E=
X-Google-Smtp-Source: AGHT+IGia3NWALECsqt8+/eQ2wXEvO24FtckYIBNGVTIquCDYr6/VdVZwvZAPt4F7ZkJk6ny7c4ZrQ==
X-Received: by 2002:a0d:d8d7:0:b0:59f:9c08:8f12 with SMTP id a206-20020a0dd8d7000000b0059f9c088f12mr4817824ywe.38.1699053426252;
        Fri, 03 Nov 2023 16:17:06 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id w82-20020a0dd455000000b0059c8387f673sm1511192ywd.51.2023.11.03.16.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 16:17:05 -0700 (PDT)
Message-ID: <1750d6ba-b874-4fca-bb29-b98f94fe94c0@gmail.com>
Date: Fri, 3 Nov 2023 20:17:02 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Ignore preserve-most functions
Content-Language: en-US
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Tom Rix <trix@redhat.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20231031201945.1412345-1-mmaurer@google.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20231031201945.1412345-1-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/23 17:19, Matthew Maurer wrote:
> Neither bindgen nor Rust know about the preserve-most calling
> convention, and Clang describes it as unstable. Since we aren't using
> functions with this calling convention from Rust, blocklist them.
> 
> These functions are only added to the build when list hardening is
> enabled, which is likely why others didn't notice this yet.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> [...]
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
