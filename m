Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9E25223
	for <llvm@lists.linux.dev>; Wed, 24 May 2023 07:02:36 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-43951f7004cso194624137.2
        for <llvm@lists.linux.dev>; Wed, 24 May 2023 00:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684911755; x=1687503755;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zathy20xS7vJeZuKOGggo3NoBWnp0DVNbyEjeiM6xS4=;
        b=GS0T+2ZiZtIWhMLKI1BCOYeVgv/IGtV84JHpGDoKwUETz4c5FtzkwVnkLZRCAUXr1w
         UOjLF0XImHP0TCxXerBTDu66jzWaLqIR9nA8v6V3EWkXUKhwccAiz/r4JNsXzNNbfyFu
         nkw+g0Ehx1u0wgcDZr5f8Pz/jHmmPlEZAglyd6lx2LTlJhSwj5U9kaoBXf/dQ3pujEmR
         r20QDnFLKHPJ373hZiYFZ+HMh3Tp2Fd/nANKSufzOjFVaDzoXf/4zxNzYDQeWcR6iT+g
         kcmTH8SLmxfacnyj+71eWYp0Vr8Xvd9/4o5fysO5cedJS1mDIsMXl9PfLh5zO+vTPfGp
         xvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684911755; x=1687503755;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zathy20xS7vJeZuKOGggo3NoBWnp0DVNbyEjeiM6xS4=;
        b=iSbx1/jO5zRufGBZ5xXzVeMh/XlKDsgzryZBgxcUwg3DIUYUu57eVJz1+HFY0fodRB
         l+6lHMTrauQKnk/Am/D/5eZtjuDIYCmgyy1frjxRcGD6Zx4/V44FYbI3qkG17mQS1fGv
         CXho2nDBLOvcTSwfqFlVvDseOxWzacsXzn/XQGcix9MbqCB78z/z+kq8CPDq/bHXNrB/
         pQVrGBXNTYbV8iyN/ukzm+/9JQ/F+jtYq4cE+T1XBcZlqlk4KWj0iqc2T3O9vcXl3mDA
         5uYyKbcnORi68Qef/Le3pr8VlzoQmZgNf9eq8UeetZHKO/kh1O0dapWSu5vSh9lnyEEg
         NJNQ==
X-Gm-Message-State: AC+VfDwIdh0O7YQEfjaW4+qbVgRDJ/vKWfV3qUnDKUbxC58y+GcyVwis
	dUk3he192YMYHAmzh7PnhZjNsAdSrz3y/mYQE86EPA==
X-Google-Smtp-Source: ACHHUZ5YvfK9jIfenGUN1SYu3dWbneLgbIzcETIs71ai8XaJGabWjDHqNLVp3vKy8J/gVDKADHkGbupXtaLmckg4avo=
X-Received: by 2002:a05:6102:2f4:b0:437:db1d:7edf with SMTP id
 j20-20020a05610202f400b00437db1d7edfmr5330791vsj.26.1684911755092; Wed, 24
 May 2023 00:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 24 May 2023 12:32:24 +0530
Message-ID: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
Subject: next: clang: x86_64: /intel_display.c:6012:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, arun.r.murthy@intel.com, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Linux next-20230523 and next-20230524 the x86_64 and i386 builds failed
with clang.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going \
  --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 \
  SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- \
  'HOSTCC=sccache clang' 'CC=sccache clang' \
   LLVM=1 LLVM_IAS=1

drivers/gpu/drm/i915/display/intel_display.c:6012:3: error:
unannotated fall-through between switch labels
[-Werror,-Wimplicit-fallthrough]
                case I915_FORMAT_MOD_X_TILED:
                ^
drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert
'break;' to avoid fall-through
                case I915_FORMAT_MOD_X_TILED:
                ^
                break;
1 error generated.

log:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230524/testrun/17171777/suite/build/test/clang-lkftconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230524/testrun/17171777/suite/build/test/clang-lkftconfig/history/



--
Linaro LKFT
https://lkft.linaro.org
