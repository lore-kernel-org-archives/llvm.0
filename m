Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE543FC8
	for <llvm@lists.linux.dev>; Fri, 24 Sep 2021 16:30:07 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id e15so42631306lfr.10
        for <llvm@lists.linux.dev>; Fri, 24 Sep 2021 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=far9XkniL3WSrnUKrjjzbpTGkEolk2rv2xLfBoCtCrk=;
        b=lh8MkcczIk7Ej6MOnE0cyNtK0uJyqetXIMQt0gXndZrHKfZXY8O7pEmWej/Yvy2KYJ
         p0+jIu8mw8qf0/P3Xs2/rUkr3FepNEuZ8kDBvkPmRUdx/D9/giuyUv9CO0Ywpg6kaDgU
         nlN9swftbqE/+pNaqQWZ+jjR52zun+gzHwo5M1WiSmpkZPBMxF6PUuTsQrqrdR3jwOmu
         pHG229LFmsLzCZAFyqu+a5cwVnjOuUOSObSRi465s+37bim0HJklGQpgARnpAzdg1DVf
         Px3AapFnTBJ7KZ6L1EaMRF+tX25kZY+hdMaePeic2i5GvkDov4yASYhK1y6kjC513uT9
         5qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=far9XkniL3WSrnUKrjjzbpTGkEolk2rv2xLfBoCtCrk=;
        b=ZGVLczegWWHb3SO6YsjqHWZbzJ9EBtbl9dVwtz33pxO3woisjXJteDfSqcvLDjxWs+
         486BC4z3PXOKKyWiHuOFlIksfldhJfNeN7V7i8vBfdrpU7mXkLLf0MV0aVjcTDCraMKo
         HvkLw/iwJTudTdgG4bSCttA2tyUDXo+1gpwFdDooAI6GLnxCBRZDNag44Ic9EBqAV1UN
         mlcQQ7u/tAlyaPbsmAbmHko5idglxDqvm9i34ToorpiA5ulki7apvqUrEiZEiua8qbAy
         D9jJiG5FYPZWVB9MhfT1skCHuB3LkYn/5cspuPU/4cvzNIDOew2OZS8CFKnRfFMAgKoc
         QCwA==
X-Gm-Message-State: AOAM533er/PhABL+42Cj3uIXmXYQWqBEUSrRqf9auzYwdiAkEpEQ2Kc0
	aKWTQhSA8AFGPfb8V5qnehhkE5nn2+fnO2GjAGu6Bd+2BTbvHg==
X-Google-Smtp-Source: ABdhPJzohY9BIrr56tOPgj2nqrKxxppUONRG2OTcMPWxePdkYBQnHlRjrLKF5IvMJ8m5WU7KiRv9AGuGtzDtSYTpM/E=
X-Received: by 2002:a05:6512:3ba5:: with SMTP id g37mr9955467lfv.651.1632501005037;
 Fri, 24 Sep 2021 09:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 24 Sep 2021 09:29:52 -0700
Message-ID: <CAKwvOd=YNn19iVACfhJgC6nC+=_zd0JcWDJSRrPaf1ba+gT3dQ@mail.gmail.com>
Subject: plumbers MC youtube live feed
To: llvm@lists.linux.dev
Cc: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

https://lpc2021.org/2021/09/24/toolchains-and-kernel-mc/

-- 
Thanks,
~Nick Desaulniers
