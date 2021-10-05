Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB733FF5
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 00:40:44 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id i8so13689284uae.7
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=eu6xQaZ+L/7SEbm2kM+MqievePKlsmmZKrxh7/j0Gx0=;
        b=bYFTdC458YYvLwQWaj0LutyFeNvzV2xOB8z/FiTrRLph+G40abtUQCO7uUSITFUICI
         Q6cb7RZQtPqpGs1yeUuyknrm9ehOepAPItJA8O2rB7N9n70BN4qJD5/t5kPv0rOI0Olo
         z+WrLDXkCwM0aBqbChhu8CfCefkTcdgpyO95qPPdXZo2FLQ11C484aoaDvJM5o9Mky2r
         0a3Fx1sjtyjW9RyIr49QLvfFzsBMDZpA/g9eacX+dNIQGaE4K57YpCuR6FAcdRC9ab7f
         ahCVe92QuHDG7m5m1873+sqz6WK3jJ+wF4u0SVZ5H6bnIJz83eua1IRqSJyST4qk98SY
         IODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=eu6xQaZ+L/7SEbm2kM+MqievePKlsmmZKrxh7/j0Gx0=;
        b=Bhm01VNGUM8Z7OwDzXq4sG0HOKXSpdbumqAXzbmmsyGDGEDvgGNdKpyvzWOPoElLOk
         Hsuq2f9X+QVGWNsNAdG3cvlrQeDXDBDpQX5A2jxwGzx0VxewNPts2eoe4g9UeeWT8il+
         p7fI32FBJHiL+X08FKpYtQbIpoKAl58ThlwIri2QgzBbqPw+xou8Ryn7RUqf0BuvtQJG
         PgyCDbi5Xq5sYr4afEHifInsjGSZr/A+yuzg71bvB12/b70ynl0Y2jEAGNVW/rspZdVa
         azTjCVYFG1wtm/TJWR1g+ZB/uS0ppN1B6ctn9WurMQt0iUopUn3WIryQCFH3CzQBKSTU
         hMNw==
X-Gm-Message-State: AOAM530MfyB8lXW8JW9tGHvCEmaveJn0i9hr2FzBbErA1VLrxQADtaJp
	SczORLiw78yhMYVf9fR2eXomTg==
X-Google-Smtp-Source: ABdhPJww3mVtU7cqIbTqZq2nACjciZnsKEYgEPbhUhT9+QN5X45mMFKcavhdWpRrezYolgErPY2PnA==
X-Received: by 2002:ab0:494a:: with SMTP id a10mr10097245uad.90.1633394443206;
        Mon, 04 Oct 2021 17:40:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id g20sm8030772vkf.33.2021.10.04.17.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:40:42 -0700 (PDT)
Date: Mon, 04 Oct 2021 17:40:42 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 17:40:37 PDT (-0700)
Subject:     Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for ARCH_RV64I
In-Reply-To: <202109130923.E294BFD5C@keescook>
CC: ndesaulniers@google.com, akpm@linux-foundation.org,
  Linus Torvalds <torvalds@linux-foundation.org>, linux@rasmusvillemoes.dk, nathan@kernel.org, masahiroy@kernel.org,
  joe@perches.com, arnd@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com, keescook@chromium.org
Message-ID: <mhng-387507df-2708-4ea1-9854-780fcb35eb1d@palmerdabbelt-glaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 13 Sep 2021 09:23:45 PDT (-0700), keescook@chromium.org wrote:
> On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
>> The minimum supported version of GCC is now 5.1. The check wasn't
>> correct as written anyways since GCC_VERSION is 0 when CC=clang.
>>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Yeah, good catch for Clang too.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Only this patch ended up in my inbox.  Where you guys planning on 
keeping this whole series together, or did you want me to pick this for 
the RISC-V tree?
