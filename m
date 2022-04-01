Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146A7C
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 20:19:19 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id h8-20020a25e208000000b00628c0565607so3101375ybe.0
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MzDAtS181K28awKeVRl3qYn1BJqlBjys5Tr9TP3rlP4=;
        b=QOgDbsi0Jkp536F8U3evqUrA5teUQPwd1J3oZVmL+ceW77Te9PiOo30oFh5I+Cfnhk
         JRSBlrE2TEWRY9lp5O1ExdJ3rZ9tfHfrX12HIXnDBsywa2HTxTYfrUExdO5O8Mc+CXYr
         +VcSZEAIn2TgQuCpwRPrZzCk6qPTjQeOMd0ydmwzGr9JKJ2gcUkb9xCkMMam9FGwIlcX
         I33j6enXrKAymZJ+EdW0R1h5SNan1gb07PokkU/kScowj+gVxDmYYzu/QgCPhjm0q8EV
         IKcE5cJMHuqqlrQzg5mj8ST5/OrbGo/QFKGmOIxcvChc3wGvv2gW5KJlZfG0TNiGur72
         8KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MzDAtS181K28awKeVRl3qYn1BJqlBjys5Tr9TP3rlP4=;
        b=K/83azO0g9wea85Q50kALv1LL8eSWAUZR3Y3l/GWcHemv/cY9XAFZhKhBNKUDTlX7y
         VmM9ZQOJ6UuYCrJj9VCl0DBIIcVR0teAvMGU0J0JKqYc5MECjmVYwSWTLA1FN3DvPGps
         CX6EVvjmJL8ust+Ujdo1bHy6kkcVmn3V3gmlXxZY6OKVVzVnuZepY1gRe6G6N7F4MfDo
         ANtGAT+3hOKgJ8xlTV46DNLznfkYVt+3J+POwhHoMRDv4sQTzIxp5xN7ZXbiIydEdxEy
         DfWAEyIouhj5bAOHDghCMujXg8aKm9Ee+e0AgW4nXN6E/feGw8JhfpI1MhpSqRBR8tVq
         i2sg==
X-Gm-Message-State: AOAM5324r5xFnYSJrzxdec41EhfqAnk8gtHxCe+8yS9S2B68LwEPI34v
	pJAojWaLpi4k3cUMWYKGksAVI4N2eiYGlc+6PvM=
X-Google-Smtp-Source: ABdhPJzVa2+iD5w2wZiAll+bNYAh4Woiw4BvSeE/HM1A5wWyO8tbc7KvmBfTDvYoGqyu9lJ2HX/YyH0IRTBMNj5XBOQ=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ebe8:1acf:913c:f19e])
 (user=samitolvanen job=sendgmr) by 2002:a81:4754:0:b0:2e5:9447:b1a0 with SMTP
 id u81-20020a814754000000b002e59447b1a0mr12543646ywa.66.1648844358691; Fri,
 01 Apr 2022 13:19:18 -0700 (PDT)
Date: Fri,  1 Apr 2022 13:19:13 -0700
Message-Id: <20220401201916.1487500-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; h=from:subject;
 bh=WH/8OyJEi9p/hM5wZbbTiaLpH/4ppY4IMtyv+KlnWGQ=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBiR15CtFhTIHqRjcowQZaTOrS5xpFZwIuWGKgZH9QY
 9U9tLmuJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYkdeQgAKCRBMtfaEi7xW7nC8C/
 9PyrDAAwDUSsKHBXM2cS1o2I7dEFr0YXswqSVooDhekKHMqQvLQ36MLEJKCXvGOq4Hp4BEeyFauzi2
 gVFFOC8aM0YY+vuiYObacWitVa/ZXz91yRIIRdFKsrvSdMalN+Nei37wUcBtyaoleFlwe/kP4jwCxr
 ap9Mwf152DR57HwdQAwfJNXDPk2l+xkGh43Bsw4Bvkc5JZHl7q68+SvHZuYnTySOhdfE1x2NJo2o9a
 g+BYwOVTkyQv3ktPgnCIPmwmj1JNKQXrYcoDOTfvRd5RmFKIzA/zYXypH/FEb3D3EY76bkdIuNg44S
 30bclKxDr7N/BgTQFumcNdOVgnvgm9ZcDNkT7xT/NpdvfM1HyHHW72wwtWmT5e1aZARYcVTsCdY0Wh
 GqEJoMP3nQuyozhUqhU3WKFtKjvO5PYkGimKFod4mrEl4hJ/mUu5YFzJC4UVJ1xYqXrWa/K+oScIl9
 dq8P2Qvs08jBmPDSxm8nEE8HlUHh+7VC6SIgRPcXP2F/8=
X-Mailer: git-send-email 2.35.0
Subject: [PATCH 0/3] cfi: Use __builtin_function_start
From: Sami Tolvanen <samitolvanen@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Clang 14 introduced the __builtin_function_start intrinsic, which
makes it possible to cleanly implement the function_nocfi() macro in a
way that also works with static initializers. Add a default
function_nocfi() implementation and drop the arm64 inline assembly
version.

Sami Tolvanen (3):
  kbuild: Change CFI_CLANG to depend on __builtin_function_start
  linux/compiler-clang.h: define function_nocfi
  arm64: Drop the inline assembly implementation of function_nocfi

 arch/Kconfig                      |  5 +----
 arch/arm64/include/asm/compiler.h | 16 ----------------
 include/linux/compiler-clang.h    | 10 ++++++++++
 init/Kconfig                      |  3 +++
 4 files changed, 14 insertions(+), 20 deletions(-)

-- 
2.35.0

