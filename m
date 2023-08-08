Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B310F3
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 06:22:25 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4871b63e001so1358721e0c.0
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 23:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691475743; x=1692080543;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WtP3QmQ06KLYCn3fAjdrUm58sT7iL6sP3yIXJVoycmo=;
        b=LemQPuxXO1F1IIucHyy5MO2W44vAf3kHADapC9mtA1kIwVHrwKIqVX+5Ftme1fyO53
         jw7K9Xqm6T7pMwroqAac1BLb2cHFITyDxwPLqCCzKYo73ykCJfMjXx2slfrEJWSA82Dr
         7fiaStKe5kpvS4ByBP2eZAga48w/E3KB+GmyfE6k1nmaB0Ka0pw4QPXJZKYduDInkXFc
         h0TioSJkwyXl/j+AKjaZWOZfxpnWIq9/+5h/P8BMpZ1MibFZiDIt1KRk8woEgMvDXL8O
         RAeDnI1veyqqClJ9/o+hrSXeaQl4A6/uUVVHtblAo9TfJ5tI5u1vS0qfn6oL+3M9/bJV
         AzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691475743; x=1692080543;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtP3QmQ06KLYCn3fAjdrUm58sT7iL6sP3yIXJVoycmo=;
        b=aU2Vdxj2j4FcT7gWF2f9eNVLt3nRLw1aKNRgt3bT9yMeIv5DVOw3W72CyIVU+nP3Um
         V6Cj4XcCm0KY6FkghP/IzW8WhzmevpSA8IJzM5KbluKxfVpYSbElNlBLq84YPPOzEPBU
         x6npv6jpttgzfxIo0ITaN4XjidrHWaSOybksfK7rylK81JH4bauxn/tBMRvX1pVTZjfN
         T1UdQFq2QjJvV7FmrZLDdCGNTlMJFnZv2urT2oih0lPpO685Ad8T7JVhxdYwVhpacShI
         hzV3KkFKM8xPVCkWe7om99UkfrAxGPgpwInHWSQGSi2nS7VWbRUNhPo0xAOSQ7hEKGQz
         q/Hg==
X-Gm-Message-State: AOJu0YwS8yUzS90o1Gm7KOFXL1GNlAatU3sMDiIAoExAfOsPK+FzCIM6
	QEMyhXjX1EY5ON0TJ/L+51n7bTSTizHcdx/Dg+6dWAqshD/l+pebe4w=
X-Google-Smtp-Source: AGHT+IH/ORLoGie8DSR0aDG7zISc2zQiLB0y2ZgDzy1zX6u9DHOqSzd5mzl7lV+J6rvARjvfxypUn+SUccjUySihP8U=
X-Received: by 2002:a1f:c405:0:b0:471:2aa6:41f6 with SMTP id
 u5-20020a1fc405000000b004712aa641f6mr5042329vkf.2.1691475743677; Mon, 07 Aug
 2023 23:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 8 Aug 2023 11:52:12 +0530
Message-ID: <CA+G9fYv-fRa2n+8WC3tE5a9Kdu7M0i8jpzU0=BEGV_krDuyctA@mail.gmail.com>
Subject: stable-rc 5.15: clang-17: davinci_all_defconfig failed -
 arch/arm/include/asm/tlbflush.h:420:85: error: use of logical '&&' with
 constant operand [-Werror,-Wconstant-logical-operand]
To: clang-built-linux <llvm@lists.linux.dev>, linux-stable <stable@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

LKFT build plans upgraded to clang-17 and found this failure,

While building stable-rc 5.15 arm davinci_all_defconfig with clang-17 failed
with below warnings and errors.

Build log:
----------

arch/arm/include/asm/tlbflush.h:420:85: error: use of logical '&&'
with constant operand [-Werror,-Wconstant-logical-operand]
  420 |         if (possible_tlb_flags &
(TLB_V4_U_PAGE|TLB_V4_D_PAGE|TLB_V4_I_PAGE|TLB_V4_I_FULL) &&
      |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
^
arch/arm/include/asm/tlbflush.h:420:85: note: use '&' for a bitwise operation
  420 |         if (possible_tlb_flags &
(TLB_V4_U_PAGE|TLB_V4_D_PAGE|TLB_V4_I_PAGE|TLB_V4_I_FULL) &&
      |
                            ^~
      |
                            &


  Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.124-80-g6a5dd0772845/testrun/18863110/suite/build/test/clang-17-davinci_all_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.124-80-g6a5dd0772845/testrun/18863110/suite/build/test/clang-17-davinci_all_defconfig/details/


Steps to reproduce:
 tuxmake --runtime podman --target-arch arm --toolchain clang-17
--kconfig davinci_all_defconfig LLVM=1 LLVM_IAS=1

  Links:
    - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TeUCTfH6lMKlORLREGhmvLic52/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
