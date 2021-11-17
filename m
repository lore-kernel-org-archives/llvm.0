Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379B768
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 20:29:14 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id b40so14430172lfv.10
        for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 12:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=JTtt4GacTz6h068c9xzxMOtk3DRlj8c7a1nugXLZciE=;
        b=ITCs6c2cQWUJjf5xUhoJUEtMnn72xyOH5wTcy14PaY6+esBYc7uMyfYUxf69ffkbvA
         F4JDSW5wbKY6cC1iox6p5h+9lsU79GDGMr5nj7gzKkKOcZqXExSkCup8XpG8uvGaN621
         D2cB7dqOn/+GybaCBFUYTiiFgEAZGaWvn51cnlVB+OKjDwUBzON3mtVdpL5+I57LSZA/
         lX1qZq/scaMT3bdPhQTgmZmAqxY3LLRP7ILTXmFtPdASPJO1vvGKR8YIhB2nGVx991Bh
         1evcrjmGgzzPUR1DmcaDci2+I59nLOoaX9N2gz9kRhQPRp84OxzUFIjuiD/A/7V4bAhb
         XifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JTtt4GacTz6h068c9xzxMOtk3DRlj8c7a1nugXLZciE=;
        b=fDzbaSfMchlImVatBoC2UDMFvWw+ClvZwMz13ivvOlSQIKQb9/Nv9w8khqbpj03vc3
         VvN4NztmZ3Z3bu+eGTjegYCtjIfETjZYqTce0aDhfAJxTeKjZQXAMI1tziZssJTDMG3n
         cbsaIHIb/VaTrzrcu7YzEPV7XhFL829PHZJRIpSLlg+dUf1q1xxT2G6TD21jiqOI0LSP
         3MbQ9WXOPp6zuuv0b+p1D8EBjmFkQgl678NYRGDUHxJrMrwlw0rB3vtOMSSlC9PnWIsh
         qngexE60+IO7aNo4gzZ1uqWOyffMnA7hj5J0E+EddE1IDhnwsqNgyIzSrb6wrnrsiQg7
         riKQ==
X-Gm-Message-State: AOAM530x+crcfkldf+/ZyMVuuOpzJTh+dVAE/DYRIb5b/SVep4bdFF43
	xBgLPyj6OwmtxvK28YWkvuqj/d271Z+HmM1ELPgnaIc4hWxWbQ==
X-Google-Smtp-Source: ABdhPJwlKmceQRRswTfY6isPgxBpA9UR0eQ9HFsH32+dneObvtQZEj8I1e7gu+UfEUllLatzPmxlFwxHb4q1twW7qYU=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr11017796ljo.128.1637180951827;
 Wed, 17 Nov 2021 12:29:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 17 Nov 2021 12:29:00 -0800
Message-ID: <CAKwvOdn8Gyj1cYhJYmC3oQ5dk8JCsJF=xZGWHAEBUhmWW8NOxg@mail.gmail.com>
Subject: meeting notes Nov 17, 2021
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Nov 17, 2021

Note: I forgot to talk about DKMS support https://github.com/dell/dkms/pull/169

(Maz) CFI breakage
(Nathan) Long double literals
Time to upgrade to clang-11?

https://github.com/ClangBuiltLinux/misc-scripts

(Nick) patch for armv6 hard thread pointer
(Nathan) linux-5.15.y CI coverage wired up
(Phoebe) -mno-fp-ret-in-387, -mskip-rax-setup
(Ulrich) commented on open s390 LLVM_IAS=1 bugs, Ilie sent a patch
(Anders) has been sending patches fixing warnings from the kselftests
Interesting thread: RFC: adding support to GCC for detecting trust boundaries
LLVM dev meeting
(Arnd) mentioned build time regression on IRC
Sami's x86_64 mainline CFI branch red

https://git.kernel.org/linus/2105a92748e83e2e3ee6be539da959706bbb3898

(Tom) BUILD_BUG -> _Static_assert and typeof(x) -> __auto_type clang-tidy


-- 
Thanks,
~Nick Desaulniers
