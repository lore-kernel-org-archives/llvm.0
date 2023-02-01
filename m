Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D8A20E0
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 11:32:03 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 7so12276937pga.1
        for <llvm@lists.linux.dev>; Wed, 01 Feb 2023 03:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BBlFMphcYAKGu8ilzPr5Z81/fHgzzMqhp9aruKhD+k=;
        b=au5gJa1iq220Ld8ZF6MxmOrYAyHIOGCXtNmqgX/IMCnFlogzvvEwcW12Gdoi/Zax4k
         EZK1jbpR1vUuym1nFbHScy157/n2kdUnRl423j+ble5oXFtDeRU3QkG1MwWo9CmnEG1E
         e09TS3oWTWI+4YBxwdLunnsLQF0ecBi7y0LDKvlMpb+lQNgeDvrxPKJHDa7q93HkvERT
         QkcCo0so/Z8j7pBg0qAGliK7lAcyuTom7o5J/wre9d3SjwKYoKSDUIrtas5+bNKvETqz
         2sv86qfkJ0bmdj+bs7SO9TjUz739qXefSwj1W0jzG2Bo8I8xmjJzmk/9A54n4QzNpZya
         oTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BBlFMphcYAKGu8ilzPr5Z81/fHgzzMqhp9aruKhD+k=;
        b=DPZj+nd5mbVYMVk55KQMk2wjA+FlWWfMWKM26YRR4W7yQY4hv5MkdSwBfdTzSk4XWo
         TjVkCiMdgMQysc1c9VGGCRcC3/Sw3W+SnXbOd/dvg/oh1TVUpxbMQMOOe8cw5XLOQhYc
         v8Y/zoOxfRNJVCFLmm22L5oelXriO5LpjKNqkZpXGFwpZqgxLRgrZN7rHCu9nuVvRDH/
         OiGgPFiEDlWS5YCKE72rg/pv1PKNk/mAwi2N+R+Z2tPjbaGO/5gbpVvUPjaSgziQmOWc
         QKdn3s1DWjwjRHX2a6vAxZhT/L1KHKKZKhDEllsmkGdPXSq7co5C9/9/MW2x9YJ6bGQ1
         xMOA==
X-Gm-Message-State: AO0yUKWitbhzic0PzIIVwJM5bQX3nSzCti3bEeGTzLW0K9TcSPEoBYQz
	4TFVMhvvyxPFdnVcV4et/88+fA==
X-Google-Smtp-Source: AK7set+C0uPsa2mdXLmzGnjX/RqEqmB7QuIr0iNYXeo+TID3anmh3rbkC6bKeQcgcvGxz8S+AWYnxg==
X-Received: by 2002:aa7:8dd2:0:b0:593:3ab1:a144 with SMTP id j18-20020aa78dd2000000b005933ab1a144mr2006259pfr.12.1675251122558;
        Wed, 01 Feb 2023 03:32:02 -0800 (PST)
Received: from localhost.localdomain ([124.123.179.186])
        by smtp.gmail.com with ESMTPSA id y15-20020a056a001c8f00b0059260f01115sm10024336pfw.76.2023.02.01.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 03:32:02 -0800 (PST)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	pali@kernel.org,
	arnd@arndb.de,
	anders.roxell@linaro.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Date: Wed,  1 Feb 2023 17:01:55 +0530
Message-Id: <20230201113155.18113-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
References: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following build regression started from next-20230131.

Regressions found on powerpc:

  build/clang-nightly-tqm8xx_defconfig
  build/clang-nightly-ppc64e_defconfig


make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 tqm8xx_defconfig
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0

error: unknown target CPU '860'
note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
make[2]: *** [/builds/linux/scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
error: unknown target CPU '860'
note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
make[2]: *** [/builds/linux/scripts/Makefile.build:252: scripts/mod/empty.o] Error 1

    
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230201/testrun/14479384/suite/build/test/clang-nightly-tqm8xx_defconfig/history/

The bisection pointed to this commit,
  45f7091aac35 ("powerpc/64: Set default CPU in Kconfig")

--
Linaro LKFT
https://lkft.linaro.org
