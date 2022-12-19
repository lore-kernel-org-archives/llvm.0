Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD1EA8
	for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 16:41:34 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id b189so9232466vsc.10
        for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 08:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJFqCYck12q41gp2BCtFkTuz3GQTAghzhiKGOBGpjEc=;
        b=CiKFu0HDhnyIYksvm9ZXoIv575lx5Zj2V2PFNZnzuwF+whYQ/V0H3Ow+Zfwf9sVJv7
         sV/HZUTeocWkHJObZaE47V6eyGKImp1yAPC7HWqgxdKGlk9f9aoNMVTqtWwUXl6eukYi
         TuL1Cl1ct8YTpofNmCu5UEvcDrt/Q0fwLUBYvkBZby39lb0dvfHHoVgHaSeasCnVjajz
         pCzefLpTPVdb/o/aT2lS/xVPVMXJQIXqKbrl/04B8iKHrljcAyEcn1cEqWoUyHvyJj/V
         hU/pa7h+8Qy/MlKBEbxM+CTV/Y1rtiYo81iRw4yPCa+rMD/ZBYWzT+jpRAXw3lD4Ujvl
         YWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJFqCYck12q41gp2BCtFkTuz3GQTAghzhiKGOBGpjEc=;
        b=jLST4rYNro3mfsABcFFCmJrHAWB7IBImWOUlNjE+SG+zIKWUimH5M6dtHhjYvpmMZW
         rrWU7atdoLA/gpAjrlGO5Otyob4gUtsgqNTOZYeqHBJh9h8o3LX+VJFSsyn/JFQ5fQSj
         f/S6GS8SmWWs+tRPgr9N1wvJPYfgcmaRdds/kFFDbVkxY0DVesJZpE94D90t8dtwA7es
         FoYI7Ap4WYv/6LS27/0hX+X1EHxqhAzViukam2byMmKlDrePzBgKSHJqTLr+GZ0iSfqM
         IhUu9mGS9tAuRaTwekiUzr9YdFOyHwAA6y+TwXq3NG6WUv/eK49xx7YKtgHJE2zrqWIC
         exaA==
X-Gm-Message-State: ANoB5pmXB5b0qxWf6w0abzOsCNl6BdwA8Th/YQ7o8jSRfZGtLQPHxT9c
	fPyIs/f3RNZTlGE1zh0XMDBuX8J0oFUMiAtefoG1Ew==
X-Google-Smtp-Source: AA0mqf7DPjRJseGW3vgtA2tpBokH8F8ideOFReeajbG/uP2TVf6wN+RkQVt3+nnQgKjSyH+6AWKdUj/H7Y2hPjPcADs=
X-Received: by 2002:a05:6102:3ca1:b0:3b5:d38:9d4 with SMTP id
 c33-20020a0561023ca100b003b50d3809d4mr3615664vsv.9.1671468092990; Mon, 19 Dec
 2022 08:41:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 19 Dec 2022 22:11:21 +0530
Message-ID: <CA+G9fYua0HB+KCjXh-5J6ZJUMS-aaXjHxSsK=ux-sY_ye+tupw@mail.gmail.com>
Subject: linux-stable-rc: queue_4.19: 4.14: arm: clang-nightly-tinyconfig failed
To: linux-stable <stable@vger.kernel.org>, llvm@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Linux stable-rc queue-4.19 arm: clang nightly tinyconfig build failed.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=0
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- HOSTCC=clang CC=clang
arch/arm/mm/nommu.c:163:12: error: incompatible integer to pointer
conversion assigning to 'void *' from 'phys_addr_t' (aka 'unsigned
int') [-Wint-conversion]
        zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.
make[2]: *** [scripts/Makefile.build:303: arch/arm/mm/nommu.o] Error 1


--
Linaro LKFT
https://lkft.linaro.org
