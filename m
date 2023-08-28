Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E1711C9F
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 12:27:51 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-79d8edd6d99so961687241.3
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693225670; x=1693830470;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mD8rjBVWRUnVFIrMO4cA1ZPhi9N2+KrE61nTEBLn+r8=;
        b=w2wX8EBOtv0qHfJ40DEvdYIUkVY21B1Li/gT5HMgGkzlmFM75fFKNc3D6dVlQ7YQv2
         b/ZNO4vnByOP/dUANkhAq+6bRSPeVB/bw5kbGpEOq4x/eu/DLbBVwFpIFNKqbRNQiLsj
         TxrxcHFIvd6bp0TkUSeVXXvZ/PO296+4OgMQqPnUYGvnTbG82lXs/qdTPLXgQ+V76fj+
         J7pvLOKe3GgKu+mB/iowEbK2UwyxT5qZkChG4+MAZHMA39GzTYxrSIbGrkscdXFNntac
         hkQO6hnYR2s9VWJ9nJMouraPmYAhyK7GYNH5ZtuIWf/6BRD1cYITQXg0RwcLzu3OzL7X
         cOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693225670; x=1693830470;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mD8rjBVWRUnVFIrMO4cA1ZPhi9N2+KrE61nTEBLn+r8=;
        b=P7WgLKAIsniLbhwCh3pPXy+YnWWsT7csvO+LsoFgh1YicEe+4mqQ3jVPWAcdz3dX1m
         0OZlKWIDmRcti9kLnFuCcGebxXWHIgZi1omP+5EYGX6jF04KDH4ZRJh8fENnQp7GToaO
         o1rmMSmfYmZoXD6ODlaQKYH4FkLwBagu5c9toiwr2cUur4tkwCIJZXONDLp2y3Yvcdo/
         JA9bcdPoF/AFNG63tFgYnzc8elSoSBagz4xCjp8iyF5VqcL5tov6ps79ApY3Mwo8l7UR
         nx1Q9sEPBnDexgVpqCdd9F/YzHN0eVEeJHl4FEia65KC3Gth6R1oFjkiCAlJuPLQ4m3W
         nlhQ==
X-Gm-Message-State: AOJu0YwCMKBHIIo8uv1o0MBZzfLssKQedsEyfmQ43iznPkPjINl+TQeg
	ZQvM76ngRHM6glu9UyOttv+QawT4SPfoCav7Z4rVU64NcxnJ2OLlon0=
X-Google-Smtp-Source: AGHT+IF0RiZ0dNfm1hl6bCcyi1b7qOZTEPlRkMEvYAZgrIt+/7pxC7vY4qFsDn3YySHb9VtQ1bv6mghrSZupPrXVSTg=
X-Received: by 2002:a05:6102:3bc4:b0:44d:4aa1:9d3e with SMTP id
 a4-20020a0561023bc400b0044d4aa19d3emr19174288vsv.0.1693225670012; Mon, 28 Aug
 2023 05:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 28 Aug 2023 17:57:38 +0530
Message-ID: <CA+G9fYscGFiG1TVLyfETVu3NV5BAe8sCOXRGDnky-w31aB6yVQ@mail.gmail.com>
Subject: clang: net: qed_main.c:1227:3: error: 'snprintf' will always be
 truncated; specified size is 16, but format string expands to at least 18 [-Werror,-Wfortify-source]
To: clang-built-linux <llvm@lists.linux.dev>, linux-stable <stable@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Sasha Levin <sashal@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

[My two cents]

stable-rc linux-6.1.y and linux-6.4.y x86 clang-nightly builds fail with
following warnings / errors.

Build errors:
--------------
drivers/net/ethernet/qlogic/qed/qed_main.c:1227:3: error: 'snprintf'
will always be truncated; specified size is 16, but format string
expands to at least 18 [-Werror,-Wfortify-source]
 1227 |                 snprintf(name, NAME_SIZE, "slowpath-%02x:%02x.%02x",
      |                 ^
1 error generated.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
