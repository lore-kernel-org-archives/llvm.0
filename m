Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3BBEB03
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 16:58:33 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id h4so13552764vkn.3
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 08:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ax967uLsBA3GZ5v4kGKlUq/iPf9fnH+4W/AZZQrvrhY=;
        b=up6JbAUOoVYfp7UKnJzEIyb3T+Dar30KNi/m0G5GObz3TZ/h9VhcRLsGFDexwEFO5X
         YddZlUcBl1cSpl4JR4LTAvCRDiz3npWpjAKHJyyUvzDzwitwR8GKsMzzPQscZ7CVs3ry
         wMxgfm4bdEQcOF6eix1YFCyH+ytjDwPX3id6/v/t+KyKdJkuVKaxEoeeTFdnPlkzzx9D
         YR6cvoq5+AXHG9u5GrocGl5tALbLVZlBnJePE6xaSlSGFs9J/kX6XESpUYs0dlrDCu8+
         FpJlVTAaJmzlkeM7OV0+LNN+DQqFCtPRm0Q9FLMjfcti6fBGKrper/HA/xhIGLY4jm/f
         6ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ax967uLsBA3GZ5v4kGKlUq/iPf9fnH+4W/AZZQrvrhY=;
        b=oneZhBUOzL31FogsIWmHiuNK+nBn6ljuVSZeYj50FBp4wvGFh6kcrpXnzFAQf0xWbK
         VBlNpJnVGdAiQGNBil+Vz7hH9HSFzC7hwMtrGoBeLYfxOg5myCI+w5NJVCOQ79CfUqIM
         ZlDY3CjVwaSNS1bONqc/mhvILV1l8dRm2kLIhyDmE48IAFNiA3qi7msabffe/iqMfHRN
         7/VGmp/G/ZfQkjq9TIrcDHNei7lbefRe5YLqVM3oZB9Q/vlVY6Vnimmf3AZhMbysUEXV
         /PbVOD6/SCStBV05b3ZGc1cWb7Q2f//O99b1K6PJBDdEbIqKsAf9BRzf3bAYtezbuT7B
         An8Q==
X-Gm-Message-State: AFqh2kqtZKHF0te6khth9znoOsGYavzADqJOHj1SevEXffXwKSa1vWb0
	cjRlXTq+PX7LaFajM9+tXIXqm4uG/++RKEZtKDIXUCGfsnmP/Qjz
X-Google-Smtp-Source: AMrXdXuJlnnKSFG7oQLM0fOQ/Xam46a8u/3M3IUgLGmmHu2URT9xp5Jc5tpJCq/Nl063q71lEOjE9jbajufd0iD0OXM=
X-Received: by 2002:a1f:9e12:0:b0:3d5:de78:715f with SMTP id
 h18-20020a1f9e12000000b003d5de78715fmr1212730vke.7.1672937911996; Thu, 05 Jan
 2023 08:58:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 5 Jan 2023 22:28:21 +0530
Message-ID: <CA+G9fYtrJySuME_dtNZSqPT9Ej7FWwwBGWHamDEEcE06=qruhA@mail.gmail.com>
Subject: next: powerpc: clang-15: defconfig failed
To: llvm@lists.linux.dev, Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The powerpc clang-15 defconfig build failures on Linux next-20230105 due to
following errors / warnings.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

`.exit.text' referenced in section `__bug_table' of crypto/algboss.o:
defined in discarded section `.exit.text' of crypto/algboss.o
`.exit.text' referenced in section `__ex_table' of
drivers/nvdimm/core.o: defined in discarded section `.exit.text' of
drivers/nvdimm/core.o
`.exit.text' referenced in section `__ex_table' of
drivers/nvdimm/core.o: defined in discarded section `.exit.text' of
drivers/nvdimm/core.o
`.exit.text' referenced in section `__bug_table' of
drivers/nvdimm/core.o: defined in discarded section `.exit.text' of
drivers/nvdimm/core.o
`.exit.text' referenced in section `__bug_table' of
drivers/macintosh/windfarm_core.o: defined in discarded section
`.exit.text' of drivers/macintosh/windfarm_core.o
`.exit.text' referenced in section `__bug_table' of drivers/scsi/sd.o:
defined in discarded section `.exit.text' of drivers/scsi/sd.o
`.exit.text' referenced in section `__ex_table' of
drivers/i2c/i2c-core-base.o: defined in discarded section `.exit.text'
of drivers/i2c/i2c-core-base.o
`.exit.text' referenced in section `__ex_table' of
drivers/i2c/i2c-core-base.o: defined in discarded section `.exit.text'
of drivers/i2c/i2c-core-base.o
`.exit.text' referenced in section `__bug_table' of
drivers/i2c/i2c-core-base.o: defined in discarded section `.exit.text'
of drivers/i2c/i2c-core-base.o
make[2]: *** [/builds/linux/scripts/Makefile.vmlinux:34: vmlinux] Error 1

build logs:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230105/testrun/13988496/suite/build/test/clang-15-defconfig/log
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230105/testrun/13988496/suite/build/test/clang-15-defconfig/details/

metadata:
build_name: clang-15-defconfig
config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2JtJjO4H316O94lONiPAIir18yV/config
git_describe: next-20230105
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_sha: cc3c08b41a9c9402ead726ec6deb1217081d0d8b


steps to reproduce with tuxmake:
--------------------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch powerpc --toolchain clang-15
--kconfig defconfig LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld

--
Linaro LKFT
https://lkft.linaro.org
