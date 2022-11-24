Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA92F25
	for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 15:38:00 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3b56782b3f6so18160637b3.13
        for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 07:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+9+t5BCEz2/cOATY8b1f1ZAF/h7b08cMGTn/gwCEHcM=;
        b=uqy6I8rFSXZ7T+0oxJPrQrZb1rD5KZFZS0UsiTPqAst7mHOW4CYPTWaktZapM/5+nF
         WTBUVPLyrreyASEYTmcAe18mictzVkmPWGw9uGCNKJVPo7oMu/wI3btQ4DXNFub0DZ7B
         re3zNlPS++ZT/+EccQl5cqTRQCxHrYCgET4P1r87/AVOz/S/ebHKTIhD6AYf+I5vD/aT
         RuSzWeuMmTyz0qFwS5PBCqWp0PVM+2DEIg3XyE5fZ0O4mic7xK2nbglBF57jVa3h0NWm
         CnOLEjuc+D0UkMOyQjNUAHp2Q102jaImw/BWLD3cQ910Ok6oPNW41ZeNzTI267Rl83bx
         TWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9+t5BCEz2/cOATY8b1f1ZAF/h7b08cMGTn/gwCEHcM=;
        b=eaxWpiMwwqoQ0cmqeX1QAesWfZYXHd3e49XW4rkIUo/eUsmSBIrA6CF0D8m7gb1x6G
         qgEU+mmJ39kTBWJ2AVctEHRS36Zje0u0gThUNOIyu19JFRbczXfbWjRVsXWBYjmhIYuX
         nNPuWooZSQGpG/vg+gCH/lkSYoPdl2nVftxfJHY99wf4D6InxZaBSqUKuuyRizrnsxEV
         VnzoUN0bi2D2/PONA6eSJ04ZZYtAFr+AQ4ZvzrpQkVOfox0evjzLoJykVkq/76N/LOWV
         JEbLPTf196ZLkwWvtcItGrUGBQtmI96nTBt7fmJzMiE/hnye2gIK6+koomNorPpRN/Ee
         dmeg==
X-Gm-Message-State: ANoB5pm84Mbo5x6SvFa52ayUmNMCNgpQ3oaQw41cb/8EjJ9q6rHFRoW8
	sfz1SojXIhV03IGIt3SlJ9WUOJiZitC6zE54p+hRPQ==
X-Google-Smtp-Source: AA0mqf4e0pqZj2Su1ieUS51maEc7fAR4/V3WqT4wVlDMaB9yE7UkTBhoD4iH5GzzwqUaZvnrtE+BKyxQkNd54zC9AUM=
X-Received: by 2002:a0d:db8d:0:b0:3b5:ea43:e343 with SMTP id
 d135-20020a0ddb8d000000b003b5ea43e343mr2430329ywe.259.1669304279374; Thu, 24
 Nov 2022 07:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Nov 2022 21:07:48 +0530
Message-ID: <CA+G9fYtMoRLC0-9hnpw6+fb_i-6jqLNQH83Q90JqyXO7aCJwNw@mail.gmail.com>
Subject: next: x86: clang: mm/khugepaged.c:1428:45: error: variable 'pmd' is
 uninitialized when used here
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Andrew Morton <akpm@linux-foundation.org>, vishal.moola@gmail.com, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

LKFT CI system noticed clang-15 build failures on x86_64 and i386.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu-
'HOSTCC=sccache clang' 'CC=sccache clang'
mm/khugepaged.c:1428:45: error: variable 'pmd' is uninitialized when
used here [-Werror,-Wuninitialized]
        page_table_check_pte_clear_range(mm, addr, pmd);
                                                   ^~~
mm/khugepaged.c:1415:2: note: variable 'pmd' is declared here
        pmd_t pmd;
        ^
1 error generated.
make[3]: *** [scripts/Makefile.build:252: mm/khugepaged.o] Error 1

steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch x86_64 --toolchain clang-15
--kconfig defconfig --kconfig-add
https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
--kconfig-add CONFIG_IGB=y --kconfig-add
CONFIG_UNWINDER_FRAME_POINTER=y LLVM=1 LLVM_IAS=1


Build results compare:
https://qa-reports.linaro.org/lkft/linux-next-master-sanity/build/next-20221124/testrun/13170041/suite/build/test/clang-lkftconfig/history/

Build log link,
https://builds.tuxbuild.com/2Hz2wymTKCJRrwkDTV5zeM4SkJ0/

--
Linaro LKFT
https://lkft.linaro.org
