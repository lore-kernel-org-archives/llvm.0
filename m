Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E758D18C1F
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145945; cv=none; b=BKMgX71+6ZdIILrLeW2ypaqU0fkLrFEF9w2k7bu/QNPEXPpNmP8yJsK/NNPlssvlgbNkM9lU0HPT9qkYGrLedbRNDvC/GzsLv8rUcGo/1elzRRwo6Ey95l4IkbPLG51bM7M91fzwODIi1AFpsHpwPBJovG4Vxd13jZBl3KwMQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145945; c=relaxed/simple;
	bh=oOicBQb26P2us2WSgoCUD13BKZ0dUYvLTrgu60wl+bk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HcZjzAluM4hw/miJHtjPG5P3oGX/MRKJ/SthlGNJlmr4YJwiGAaKc3HmOGxJy+WDoTdGXZdy8lS9IVWlHF1abSEAliPKnAkloikjwBfLVAcsGzvIq1ag4lfqoBRIQtP1ABmdMClc+n3B4AKvLw3GN5Ys22KE0bFGOa78csRrXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpgf0zhW; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpgf0zhW"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4dac5a3fbeaso756467e0c.3
        for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714145943; x=1714750743; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0fHzKICB2TUzI9lFroSAOrJgYaGtzTHDOl9oxitpToo=;
        b=mpgf0zhWrl8G7Ruw8skI2OK5UGu131fwFe8ATEwOaI5ZYObj5i+rNZpa78ZjNExoMp
         vvvCoLvPHgcChtWF5bwayMGfHP6b7O0sN7lvSrCAsxJCWHSuZ0tJt3i2c3wc2seGjzMA
         O2pwCFCT3xC9OrKucuOFXTSRFc9H+ecY76L6FcRJjh2yxRLLPFAXV2AhyvUXakIABusS
         lY6FI3gnIcw2aOgBmL1prGd/JqLoeaZto27il+vEDGrLzffLJmIS//WDhoCafPjJaKFI
         dkBPLi5LTRAFJxqcH7XmN8ZH1+cG33TWf6EYsAFoE4EQtha3kSbQIlFOGDw+p/LJSK6S
         8F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145943; x=1714750743;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fHzKICB2TUzI9lFroSAOrJgYaGtzTHDOl9oxitpToo=;
        b=UGMNFHikLfpbQPDK0pgnLOUbafTGYIdUf9me0XkZqVG4Elz+eikvn3sFZ8J3fTVGM2
         dz/rKgZhNXNZtzF7kT+2hv2VA8EUbxoS8n9ogrimmt/BBJu7UKGbMvKyrw1BLSiOf+RX
         pRk7wwrKHpFVUCOoWAmvnrWuSybbgJse9woKUuS6E+luMpOjFt3c4MfndqhLqum48mW2
         MurP5SJx8MphfxkDfDF44oWUdxQ5Y+Z9VbwjoRX4s6qVXopeinxz4KDF85F0975G3LHo
         04UVj2bSMUDxlthLnfjtA/QudkFjXiSlxLIbm8sRN90Nd5OOPwCTwNKr63Od6xtApsEQ
         RH9g==
X-Forwarded-Encrypted: i=1; AJvYcCUSgHWCzYVWonF5Cth9UoDt0mA0h1LRFF9Sor6DaGCacqys8xIevf92RaD0naOv+o1D/u76ZaDFVexnB6kCXeOjRVHUUg==
X-Gm-Message-State: AOJu0YzI3TSiPR1qn16XhjmAWFYpP5NWSGYqQe6iSAPIFOs0bhE1Fp3l
	VM33+gL1XLeIYi+1i5BCrfvwrZ9EXlZGpxKQOss6Aih0CVcb2dfppl8tGHSSmLyHCHPaQ3KTTTs
	CHhh7gxHFRY23rtfG8zkAxnxrDC3tbdoV2+AIgQ==
X-Google-Smtp-Source: AGHT+IE+NCvzne4CcGECeY3GkA4OfEGj5ghhDPxk17Ojz7pXDSDSW3HmPLxFYaVkAQVlixFuEx8/Y06XrCSoUji5M7g=
X-Received: by 2002:a05:6122:4697:b0:4d3:45a2:ae53 with SMTP id
 di23-20020a056122469700b004d345a2ae53mr3142735vkb.16.1714145942808; Fri, 26
 Apr 2024 08:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 26 Apr 2024 21:08:51 +0530
Message-ID: <CA+G9fYvy+3XKDu+U-V3dXLsUPm1ybR_vn5djNvxXnXr85U9UhQ@mail.gmail.com>
Subject: riscv32: mm/init.c:1495:11: error: use of undeclared identifier 'MODULES_VADDR'
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org, linux-riscv <linux-riscv@lists.infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The Linux next today's tag next-20240426 riscv32 builds failed due to following
build warnings / errors.

riscv32:
 - rv32-clang-18-defconfig
 - rv32-clang-18-allnoconfig
 - rv32-clang-18-tinyconfig

Build log:
----
arch/riscv/mm/init.c:1495:11: error: use of undeclared identifier
'MODULES_VADDR'
 1495 |                 start = MODULES_VADDR;
      |                         ^
arch/riscv/mm/init.c:1496:9: error: use of undeclared identifier 'MODULES_END'
 1496 |                 end = MODULES_END;
      |                       ^
2 errors generated.

metadata:
 git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
 git_sha: bb7a2467e6beef44a80a17d45ebf2931e7631083
 git_short_log: bb7a2467e6be ("Add linux-next specific files for 20240426")
 git_describe: next-20240426

steps to reproduce:
 # tuxmake --runtime podman --target-arch riscv --toolchain clang-18
--kconfig defconfig --kconfig-add rv32_defconfig LLVM=1

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fdCURo2mABucb6hDzrLnPoTWMx/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240426/testrun/23674184/suite/build/test/rv32-clang-18-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
