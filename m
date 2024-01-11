Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B214F6B
	for <llvm@lists.linux.dev>; Thu, 11 Jan 2024 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWR9lzRR"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4b743ca0597so1248351e0c.1
        for <llvm@lists.linux.dev>; Thu, 11 Jan 2024 02:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704970400; x=1705575200; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2BxDnRoz+tciUL07Ky2uFARoSUgYzDQPvPnOjHTato0=;
        b=iWR9lzRRinqd1FLbBNQCEl8Cin7kfjuWM0Bu6fIK1dW1ppb3/qmEK7bcgIWDEWW3+H
         V780ppteHpm4zSENutQEDRdWt3LlHnm9ytJ4G9oghZrbG4K5HIc6HjHqUCR6/G67DWVs
         h2UX1L2ShyHDzk2puucODoCuK7RdxOo6rMUxsMbhAKhDSaQo9CZKDYwNqrHJQM6EAp6f
         TuQIxrpLnPJKbqGk2POlGKi5/xyC8aKV8pBjR5WJaeW5ODNYNodLmIBrcyDKKHJTerrD
         vcRTD1OQ8LIiM87nwN5sb0H4eaX5r2wbrhQWnbgaW1F7sljq0CN4NvkLCuZMcmXSyQUI
         2FuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704970400; x=1705575200;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2BxDnRoz+tciUL07Ky2uFARoSUgYzDQPvPnOjHTato0=;
        b=lGwtwkDs2uZmBw0t5QZXfhvq3L61KcURlOuAhtUMPpz/+EIoJBVUesHYpgHAkDSkTb
         IPCgOWHJf4DBvhQzj6pJPqljfjkkT5mwwGPnZWofNKRfKzdMtJkbwpoVD8a58VJI4xrd
         FG8jNtcqrfptdp6gz1w1mCwP/XO/SPK7FyWS3b4LkEQLg5JoxFivCpakQSNT1kf4yHRG
         NID3KzDAvZ/r0KoDZmYegtVvdBD1ZHrgc8Ncj8jyCduekM2t3bKyW+Es8cSd1XWlQhxE
         HQOYeSqeTEcG57Y30vSnWfRpvi3mCt8Wqcn0AyOcPBsRijRydyUTlWhsDXifp3qrxkj3
         0CqQ==
X-Gm-Message-State: AOJu0YzcfPGtrhy06S00hy1B/44MWXaByZP5clRw0/cAJ9EiGDBDgsVz
	pa8M43OkM7YyGfaJi0ReZJg7aNspkcBIlU34/fBy2Bor9XxERA==
X-Google-Smtp-Source: AGHT+IGgSmqv9Y1WJTe266dMtLWoOwKf822h2X6Qyg98fN6FvdHnX82UlDzXJD8BpoL+3lFdSku871Xabj7RMWn9Q/Q=
X-Received: by 2002:a05:6122:1499:b0:4b7:8d7c:3483 with SMTP id
 z25-20020a056122149900b004b78d7c3483mr254720vkp.19.1704970400539; Thu, 11 Jan
 2024 02:53:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 11 Jan 2024 16:23:09 +0530
Message-ID: <CA+G9fYvDNksfKNvtfERaBa9t2MJNucfD_s3LgKGw_z2otW+nyw@mail.gmail.com>
Subject: mm/vmalloc.c:4691:25: error: variable 'addr' is uninitialized when
 used here [-Werror,-Wuninitialized]
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following build failures noticed on i386 and x86 with clang builds on the
Linux next-20240111 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
----------
mm/vmalloc.c:4691:25: error: variable 'addr' is uninitialized when
used here [-Werror,-Wuninitialized]
 4691 |                 va = __find_vmap_area(addr, &vn->busy.root);
      |                                       ^~~~
mm/vmalloc.c:4684:20: note: initialize the variable 'addr' to silence
this warning
 4684 |         unsigned long addr;
      |                           ^
      |                            = 0
1 error generated.

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240111/testrun/22036090/suite/build/test/clang-lkftconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
