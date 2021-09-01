Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314F72
	for <llvm@lists.linux.dev>; Wed,  1 Sep 2021 17:38:25 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id i28so349454ljm.7
        for <llvm@lists.linux.dev>; Wed, 01 Sep 2021 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=D4d8ppCtN+7YALcIZDMdO8b2L7Sp3BVnE/WySq31x78=;
        b=mqhwU+BwJzBlmgNvSRdD3jXWATvvtOReH4AcBoKGqcJ4sMkOmo89os6FWEzmL/7zWK
         eULZ/YETLkc9xMZtuhl93U4NbFwhLRKq7rr7WjJ+umpQpQbxwuVjc78RXOZMGf3Tt5AF
         xDRMX+QbyUSNRfl4l26JeU2FpU/CCTlQZS/cu7udTr4q1xxewWTLfV83eNnTDcX3OW+f
         38NZwHB6GT8chKyDG1evMDcFT0oDDEAXZtt71I9uhwEXjDYnYs9tky66bQ6RCU4gdXl4
         gUskUHikGmw80f/IGLg5A2sIoUbwlybON5HAq/LVovEpjGr8VVGryzXT9ZVkTfk3rPjm
         LKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=D4d8ppCtN+7YALcIZDMdO8b2L7Sp3BVnE/WySq31x78=;
        b=K9ZZR1M+vawptoDii0CzKoqJQP4l0HXa+8LVBIUxGtnGvqzQ2zKN45BNm/S8j3KGD9
         aut1+j1lFLKAdKkAxp3LQPdNwZ7kUHiGNkCt/i5pdXG/VBF3HtRtEsYK0HWiCgSjXJIA
         15KZC05n6ck4UrkwEIxabAtqvVsQZtqn1+bNa1DpqtItfBvveFyux8OIMf4ryd43NZip
         7ROqrizbVLuDDj2LNF70TDzNr6tNhEngMnjBsGFucbDEB/jW/bjRG1+41wf5IbKagHu0
         N9A3/5TEolaU9Tp+dsE9TJsTk7XTj52LMh4aPtTqtZWzC2BsjcKVfCzx9yOy06pxQrKH
         x16g==
X-Gm-Message-State: AOAM530B4sKCCGcAYOQCnaHnz1vvei7KV6z8mMpyWjw7lgKK8+ZgRYmV
	AzGpsGeE5XW/9c8e/+Rd2tGSx3t86VZ8pFj4tqhsJQ==
X-Google-Smtp-Source: ABdhPJzwU0IumKRqkDXPPMa7a5tjDUKH6kx+BlneX52ntkdIolY7EOowX2pO/ttYCoNoRGlkQFbV1w7p7j3E8zXBE+o=
X-Received: by 2002:a05:651c:12ca:: with SMTP id 10mr712233lje.0.1630517903889;
 Wed, 01 Sep 2021 10:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 1 Sep 2021 10:38:13 -0700
Message-ID: <CAKwvOd=uwvMm+v8aAEdPhFr1P1B6cJBS8iU_mJv-DY2vY=s6PQ@mail.gmail.com>
Subject: tuxsuite: error fetching kernel build logs
To: Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, 
	Remi Duraffort <remi.duraffort@linaro.org>
Cc: llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi folks,
I was going through our CI failures this morning and saw a failure
from our HTTP client to fetch the logs:

http.client.RemoteDisconnected: Remote end closed connection without response

https://github.com/ClangBuiltLinux/continuous-integration2/runs/3485988484?check_suite_focus=true

Not sure if this was expected or observed or not, just giving a heads up
-- 
Thanks,
~Nick Desaulniers
