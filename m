Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF926FBE
	for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 13:52:04 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-791b8525b59so1039187241.1
        for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692625923; x=1693230723;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7DMvDXB2k6+AbrdhdkHJ/XB86AMGB7xb0Ezbn7WAlNw=;
        b=SeArUD9jqncDCi5AobrC4EKlTl4unjyBWOuzgGjuNG1EdNFY/4x47bGTtYx6Q8xaZb
         t8tWtoC3mu8/oe6/+k4+qkTocYzwH3h14SWXxr+w1OhvB7MR7etgzmDAr8pg7hQex1hj
         SF2SaGm7MwoRIONvu5CcC2e4tE2cwFHms1ISnaWvSVOTwW+qtWXjT3ceVk/ecTNpUGdw
         xfzM3KPyTQAeC3soCVxLJcQPqEKQCLieQ1OqrApxzHZSxZZ9sDtAhuo7Wq3M5kg+faCb
         Mc+Wo4rKWndmbModFMk/xAyY0UGM/KGcyHR/C6mo30l+B4ASd4OOj/Z8cVRXdqH0FkJT
         jVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692625923; x=1693230723;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7DMvDXB2k6+AbrdhdkHJ/XB86AMGB7xb0Ezbn7WAlNw=;
        b=ejVqtf+CnINnW96ojPVj9ann9V0hVAzSWqvuiCOeTV+Dv6YEHzd3Ip4re01dhK5Apd
         V0SJ/NBAhmx6pmtdVMzdzZbPYUyUlL7nCmUAPSHdYmk72CPlTdz2upDJ3TWpTX1U/xbW
         yK7I9pF8ujjMs5O/Co9xcir5RAiqX6BPC0NOLkhJ6EdIJyz31+C7XrF3Xt+IKyCSRJmL
         SMg0RbF0l2xiImRzeBGqAExSIPtDXWb//nDkmoQLn//w12r2hsBfolqUwL6Alfiuv2rO
         tpwPm8ZsGiqERtk0g4HObJUXgketA+i0bsoIgCLiXibQjyZAiBZF7ohPJ1DBWS0HgpC7
         vu7w==
X-Gm-Message-State: AOJu0Yzvy9W9x9FbzI/YoI0uUaP79jhgOD8ew9OYsfAn7dEubqsJ2cFp
	FYZNLhZconkNc/SOCMByhO29BIaJlrh8NB0NRVGVdl4WHPTeFAHkBb4=
X-Google-Smtp-Source: AGHT+IHJYha+6wVZ4QRVAf0iayKUmBS8wsPnI5ar076fcn0KaGGb/MngAUY0k7zm+LVQSeRE8E9HnAsK0eBQu0c6UUM=
X-Received: by 2002:a05:6102:282b:b0:447:5ed3:cb21 with SMTP id
 ba11-20020a056102282b00b004475ed3cb21mr4746191vsb.28.1692625923288; Mon, 21
 Aug 2023 06:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Aug 2023 19:21:52 +0530
Message-ID: <CA+G9fYtdRe5x=mS4Xonb+ZZsArO2o7vuNL+qJsv5DkNvcirQbA@mail.gmail.com>
Subject: clang-17: selftests: sgx: clang: error: -z noexecstack: 'linker'
 input unused [-Werror,-Wunused-command-line-argument]
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Recently we have updated the toolchain clang-17 version.

While building selftests sgx following warnings / errors noticed on the
Linux next with clang-17.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

sgx/main.o
clang: error: -z noexecstack: 'linker' input unused
[-Werror,-Wunused-command-line-argument]

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/

Steps to reproduce:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/tuxmake_reproducer.sh

tuxmake --runtime podman --target-arch x86_64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/config
LLVM=1 LLVM_IAS=1 debugkernel cpupower headers kernel kselftest
modules


--
Linaro LKFT
https://lkft.linaro.org
