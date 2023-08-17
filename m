Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B334BDDA5
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 11:00:40 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-447823dd96fso2241217137.1
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692270039; x=1692874839;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZfMepvXg3qvtrbHn0BjG22kHp9b7uQ/uXEZyK1q+hE=;
        b=G2/DX7qptVpsyagL0UIvZrbSuYLIkaH0lNb5G03nLnUs19Nt1GAMlDFR1DPUHQYwf8
         D7jYv63MYLnoL8z22BgkKDjH/Bz+y73zWTTMWpo7X6fkV6R+iGXkR7uUx1U0J7rLRksV
         yxyA5BZU6HVfnN3FEW8ZrawF6mI8A/4tTHpXUBvvV3qoxFZW4CFTJwcKJFNN8OyQw1uh
         UtbN0xSpd6gepWwlhgqMJRZ2IVnaKVtVzchbp9dugTT1ZAX6cYM7sDy9oJBZx6LsNoAx
         BEjeVC7xWWo+9AN58o/g9oR+yWM0NseAUTAALWV9f9i/0x0sWclCVOK3hV9YZ4rpNvnu
         8zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692270039; x=1692874839;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZfMepvXg3qvtrbHn0BjG22kHp9b7uQ/uXEZyK1q+hE=;
        b=JoQ1XIZ/mJE03TvzzfMpJTvYFUR/5oOylIGEikoeKaswVmzb8L4fzXNLB+cSwFLCWp
         V38dB0bA26pgRxc5T1fmemdHFPxFljEnm8yrdevKkxc749z/SFXgj7s063UQsEvSKfFZ
         tfSwmA4MK0IcyUce1Iscn+1sBUZ0iBje54vrzKHJX2kMRLq7mn/7XADJtOTfH+K0whNl
         uANmCWwsk+eWN2QmKLKuiaQYt96JnVUNIVcyCLYuwOexd8LlLGLibAovpDBl81cuMDii
         QegTck6SJ08eiEkjPAb8bxm3slc++Prarqekd+P9xPnb2LwuDVYMUrjD1CcShq0eUrC1
         AQIA==
X-Gm-Message-State: AOJu0Yyfcm6Rut/3ZapbRhjyg6T09c7iD9+zRCx0zwba7qAk896fiIX5
	3+KmxP+wfWNoD+/iN+SUfcOGuofPasRnLg/sAtXLALIlqYdKsU7dAPI=
X-Google-Smtp-Source: AGHT+IFqL6u8k9ycO0ncWBs+dW20/DPk/E5uRvud3mCrHpEvhoOVAaag9XvvewRBCOlJAMngLcBac5965k8GukIKOlw=
X-Received: by 2002:a67:bb08:0:b0:446:9cc3:ccf with SMTP id
 m8-20020a67bb08000000b004469cc30ccfmr3337886vsn.28.1692270038874; Thu, 17 Aug
 2023 04:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 17 Aug 2023 16:30:28 +0530
Message-ID: <CA+G9fYuW2tu3Tu_8rMoXK_anMJO8t9qw2vhxfQrLXY04rCRPqA@mail.gmail.com>
Subject: selftests: timerfd.c:64:7: error: absolute value function 'abs' given
 an argument of type 'long long' but has parameter of type 'int' which may
 cause truncation of value
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

While building selftests landlock following warnings / errors noticed on the
Linux next with clang-17 toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
------------
timens/timerfd
timerfd.c:64:7: error: absolute value function 'abs' given an argument
of type 'long long' but has parameter of type 'int' which may cause
truncation of value [-Werror,-Wabsolute-value]
   64 |                 if (abs(elapsed - 3600) > 60) {
      |                     ^
timerfd.c:64:7: note: use function 'llabs' instead
   64 |                 if (abs(elapsed - 3600) > 60) {
      |                     ^~~
      |                     llabs
1 error generated.
make[4]: Leaving directory 'selftests/timens'


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7AaypfY7eRU4UUygecrDx/

Steps to reproduce:
tuxmake --runtime podman --target-arch arm64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7AaypfY7eRU4UUygecrDx/config
LLVM=1 LLVM_IAS=1 dtbs dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
