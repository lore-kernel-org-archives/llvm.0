Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1687B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:48:26 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id o16so10215198ljp.3
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pxlOZRBuJWC6Ej+jZ14mKMuVx9qkJWEg3X0ZwZTkhPc=;
        b=AGjh7x15wO41Vm7WZk3zze/8MHMZTgYGS5S5m/PUK7NM0u25WdnmOMU5S7AYGh+Yhu
         qDAG4TaukWed4uzSQH6i5BnUIT5PQHU/O/6gsCCN77seEqq/adMEjId2KSQq2ozkwymU
         bY5pqHKLvU4229uoaKMBL0Cg3oAEGl/tazNw2kNNB4d/V54Vr0FLf7533qnm/JP7jHVX
         tghwr3seWFTq32gAp/B7rx9QmN+5xMLaezd0VHafXZpHs//2CSIYl7S1/POTMDNz8j+M
         A6kxHYpmSV8JsNmpZ3CJDOVaoEKdIRmv2RWV2Uudy6pCbBmemj+X/5ZAZx5fyR3FaAvs
         hejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pxlOZRBuJWC6Ej+jZ14mKMuVx9qkJWEg3X0ZwZTkhPc=;
        b=oZkL65B/q3VXoUgQX7YZKtSlNjMfsJc0w5efqrzV8xRY2rhSsPuXFlHJIju4RD+g4b
         x+tCw4lzyGN6u1AWQItfI1S6xktYCLi0KDORz8VVR4tqCSsPzGt0FIvmPsxcd3n1HJNV
         kC+4Fi2W00QHY0ZPcLyqNZ/JedT7nZ792PsMpUtNV2I2MIwqQ9ahHlC+HSCeNGiusvfc
         /u41CRj67WzJAWtDnpMYlgVl6xK5kD4dvnXxaXbxcDioteg2/C+jG4yYpn0a9hNmZbXe
         q9Q52xJoJU3TqkvEKwskPSS9yGCyUCuDi9cHkKM86AirveldQgUwghB333og7cYh5BYG
         p0ww==
X-Gm-Message-State: AOAM5331v9+Mox6kdUggqP+TX6IwNCiotoEClYgOzmg2UioL3weRVylw
	k2frksuW6gfmWieRnrd+t2G2wvE6s78CF0YZmxD2Dg==
X-Google-Smtp-Source: ABdhPJw/s+OvUlN+j11st5pHaviz8KqPPDcqLqJIqRUZcwXRtBQNT3E9aXGVOY5+ri72dswWY94BRsMwknx3r3fvgS4=
X-Received: by 2002:a2e:8650:0:b0:24b:5309:352f with SMTP id
 i16-20020a2e8650000000b0024b5309352fmr137955ljj.472.1650044904482; Fri, 15
 Apr 2022 10:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Apr 2022 10:48:13 -0700
Message-ID: <CAKwvOdmwyFDYKMpq0dcvbq06drtZonpNJ3PqLx2RMBE00beHZA@mail.gmail.com>
Subject: plumbers session on syscall wrapping and kernel header libc circular depdence?
To: Florian Weimer <fweimer@redhat.com>, Arnd Bergmann <arnd@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, linux-toolchains@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Florian, Arnd, and Masahiro,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

Would you all be interested in a session (if you're planning on
attending) discussing syscall wrapping for libc's and UAPI circular
dependency on the libc?

Masahiro and I were recently discussing the feasibility of building
the kernel UAPI header tests with -nostdinc, but there are some
interesting complications perhaps worth sharing with others?
-- 
Thanks,
~Nick Desaulniers
