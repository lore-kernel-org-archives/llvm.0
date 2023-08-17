Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C810942
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 10:03:31 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-48b829cbf8dso367849e0c.1
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692266610; x=1692871410;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t7L7oor9hguIJsZ7+KIFg8XeyxoxXJrD2hQ498S73ew=;
        b=vvo1oFDdZVLJAK601uPA0V/ZZtKkHmNyd3aL5YDqjJT+d2or3PHF9bN0c/9qdUB9Hs
         +xudL0/J09I/kida9xeOwalJnKJkNHubq6i0KGVv9lhnliio34la2nMnCiox3e6yL7gm
         9og/kZAwqhixfYyyKEGbRKttVzw8hjGmhYjnBJGS5sDxk8T/nmAz0mymk1Bi/RlGxA5k
         koCghU1xWXRCg8Bt8Q/GHSe6Iwc+yYiPc2HFzRW6IX2uVkTjn+9k+c10hDnzPFwJi2HQ
         4kNXaGRDS5p2Xw5M5bc33kKr7s7FWjpym6eZJUAWOp0kPl/JuYJ/ChS8B2KXxLnW1c04
         chRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692266610; x=1692871410;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7L7oor9hguIJsZ7+KIFg8XeyxoxXJrD2hQ498S73ew=;
        b=Q0VqFB+Jzequ5z+O3jEexVp0NY6Y5BO8RtIDRvA6IyGVkLboZe+XfI2IZFA5olcjIX
         CljmGTU/OEaRg+aqVVDmgfhgJd6MjkJzj8NWDhff1Ne8/KybiE5z5GVebS1C9z2d5ayK
         mSJt0VkIEUGgMLUs6m9WRjG4Baxjs2Rdk5aVVxwoMVqu7RjgxVr2iIl4LVAf+SdEaofP
         rghpt+ZwhtxKhg6/G5EsuLSNa5GNtKfHd1W0YpR9lo5PsqL3SM25/J7FCMrylItT8UGs
         zWdP+/o1uGpqmsCGaKf5eQclc8jQp0Z2i+8OFaXIOwFiUJlL7rhkoObYp1vee++tAyXq
         JwkA==
X-Gm-Message-State: AOJu0YzlZkTPUaHUW5Jix52Ler7nKskVvVbfFe3AfPCYhE3MEpFFasqg
	YkWv7PETQpN9F8MTu4sInTfr5avOWmtxAEPuDil6z+8W8lnZ4YpCP+g=
X-Google-Smtp-Source: AGHT+IEtSFu+V1HQS5CtIwMAfU0t+xp9kwVpngqBujbOD7GxgE8fH/zRCeMsU/kV9nlZ3xlX6otyeGckyUcjfPom9LE=
X-Received: by 2002:a1f:41c3:0:b0:489:aaa4:ca26 with SMTP id
 o186-20020a1f41c3000000b00489aaa4ca26mr4754235vka.13.1692266609977; Thu, 17
 Aug 2023 03:03:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 17 Aug 2023 15:33:18 +0530
Message-ID: <CA+G9fYvVZmOJvf=+JM8LRGxV6ynCPuPreipCP3+fmti=M+dxwA@mail.gmail.com>
Subject: selftests: arm64: hwcap.c:51:15: error: instruction requires: crc
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Kristina Martsenko <kristina.martsenko@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

While building selftests arm64 following warnings / errors noticed on the
Linux next-20230817 tag ( from next-20230815 )

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
------------
selftests/arm64/abi/hwcap
hwcap.c:51:15: error: instruction requires: crc
   51 |         asm volatile("crc32w w0, w0, w1");
      |                      ^
<inline asm>:1:2: note: instantiated into assembly here
    1 |         crc32w w0, w0, w1
      |         ^
1 error generated.
make[5]: *** [../../lib.mk:181: selftests/arm64/abi/hwcap] Error 1

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7AaypfY7eRU4UUygecrDx/

Steps to reproduce:
tuxmake --runtime podman --target-arch arm64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7AaypfY7eRU4UUygecrDx/config
LLVM=1 LLVM_IAS=1 dtbs dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
