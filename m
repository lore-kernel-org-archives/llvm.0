Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B144BD53B
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 16:49:35 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id i10so17006364vsr.12
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NP2Dg9YGoVI0aRQKZRKmk+2NtfJSRs4wKdvzmTJdN30=;
        b=RJeT9XepF5TTt/k0dUZV/SE5YL3hVU4D6mmbfEyA4pmwBB7u9Hos32VINgv35XTGab
         e1EXuv+4aVSIQ061+9zrQAbgzlhfggRsZKmpsPRyPT6cQRgiRsSJSnvXBa+4PG40zTNO
         00JGmopVss5r+0M6adjab+hKHQkwB2SUXfUXg9MzG2Or16N3U/ApampP8ko3k//fpf6s
         6OcTtIuf+RbrJsoHRYlVSFodrr9JJIv7aAGBgldqjq8vIrh6mD3/nhlVkwMkzMPkD/vb
         rR8Ff8MUNMLEtlbJhoALbRGIKZD6O0O/ULVVb6Khz/GuqpJZxjILWSz2pgplusYWSOXL
         GFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NP2Dg9YGoVI0aRQKZRKmk+2NtfJSRs4wKdvzmTJdN30=;
        b=fNeKztz9RBgjH3aKGkUkm9GwgZkQynPPdqmYLmZWX0w5pDJgRW/b74uKjk9RQi5FjZ
         5Tj4Oxaeuyye2osFh29jsvxSPPrdSlHDhSIJDcXDhS44522nOFjnaHGKvmx79A1T/ipE
         mBkcCrq+mFmgCK0T2R/yK5UiWbBygYkY7CyS/UQbDVL6ZB/Elpl0IGrNXpI/fLMRCd0r
         tbc4TZ8SO/fOMoTeQX9EvBeSHrlm/KKiaBLD4qhFqjQkQ0kQH2KpcLNn33X9tGUBHme5
         /sp7i55xkj7ZSp43DauQzyIFdeHDuWLYLZNW5CZWLn+KXXd9F0C/oLyHhCp+V7It50c3
         /vGA==
X-Gm-Message-State: AFqh2kq2qXknmYcfBREVhYZl2xJEcSJmMC7usv1QMMo1IgvZupuM3QRe
	jWkUGP8JEfRn6qjhu2/EK8a8FOp/HwfnHhAlMUF3Pw==
X-Google-Smtp-Source: AMrXdXt4N8lhwv0Ijg2+gCVWyvzAM1F/iq8VgL5hQCW+zidR9kVMzq0d/GtKCdfAgZeULmnXAfCUBpSPOnUqtk9txS0=
X-Received: by 2002:a05:6102:3003:b0:3ce:c6d7:a4e3 with SMTP id
 s3-20020a056102300300b003cec6d7a4e3mr68204vsa.3.1672937374400; Thu, 05 Jan
 2023 08:49:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 5 Jan 2023 22:19:23 +0530
Message-ID: <CA+G9fYu6=N4OU11CcHqh5auVJ4WdrR4QmovHjni-z88N41y8zw@mail.gmail.com>
Subject: next: clang-15: s390x-linux-gnu-ld: BFD (GNU Binutils for Debian)
 2.35.2 assertion fail ../../bfd/elf64-s390.c:3349
To: linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

The s390 clang-15 build failures on Linux next-20230105 due to following
errors / warnings.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

`.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
defined in discarded section `.exit.text' of fs/fuse/inode.o
`.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
defined in discarded section `.exit.text' of fs/fuse/inode.o
`.exit.text' referenced in section `__bug_table' of crypto/algboss.o:
defined in discarded section `.exit.text' of crypto/algboss.o
`.exit.text' referenced in section `__bug_table' of drivers/scsi/sd.o:
defined in discarded section `.exit.text' of drivers/scsi/sd.o
`.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
defined in discarded section `.exit.text' of drivers/md/md.o
`.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
defined in discarded section `.exit.text' of drivers/md/md.o
`.exit.text' referenced in section `.altinstructions' of
drivers/md/md.o: defined in discarded section `.exit.text' of
drivers/md/md.o
`.exit.text' referenced in section `.altinstructions' of
drivers/md/md.o: defined in discarded section `.exit.text' of
drivers/md/md.o
`.exit.text' referenced in section `.altinstructions' of
net/iucv/iucv.o: defined in discarded section `.exit.text' of
net/iucv/iucv.o
`.exit.text' referenced in section `__bug_table' of
drivers/s390/cio/qdio_thinint.o: defined in discarded section
`.exit.text' of drivers/s390/cio/qdio_thinint.o
`.exit.text' referenced in section `__bug_table' of
drivers/s390/net/qeth_l3_main.o: defined in discarded section
`.exit.text' of drivers/s390/net/qeth_l3_main.o
`.exit.text' referenced in section `__bug_table' of
drivers/s390/net/qeth_l3_main.o: defined in discarded section
`.exit.text' of drivers/s390/net/qeth_l3_main.o
s390x-linux-gnu-ld: BFD (GNU Binutils for Debian) 2.35.2 assertion
fail ../../bfd/elf64-s390.c:3349
make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make[2]: Target '__default' not remade because of errors.
make[1]: *** [Makefile:1252: vmlinux] Error 2

metadata:
--------
build_name: clang-15-defconfig
config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2JtJjVEWoJkAJtKsrWamxsxAQb2/config
git_describe: next-20230105
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_sha: cc3c08b41a9c9402ead726ec6deb1217081d0d8b

build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2JtJjVEWoJkAJtKsrWamxsxAQb2/

Steps to reproduce with tuxmake:
--------------------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

 tuxmake --runtime podman --target-arch s390 --toolchain clang-15
--kconfig defconfig LLVM_IAS=0

--
Linaro LKFT
https://lkft.linaro.org
