Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7E2C85
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 22:36:52 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id p8-20020a056902114800b005bad2571fbeso27070612ybu.23
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=HQ19xvqiA4G2WyV84la3hZZlIas5Up6lbNaE2iEUudw=;
        b=B/CSM0YSuktD6EYoqfLCaVy8RYSOxFuP0LUVkyQMmgw68PXHXLo3DxrzbQ5mRLL2nr
         /qdzIlkxXN2FIcONlsTLfjkmD7PkbzalFbdWvwacSv6jJZIKPhjf05L+wJlFjE7gjQ7t
         T49ezs0mvDidFxLIyN3kNkMGRATB2/m+oBZ0+TRTxNM7gelmXXIxUIR9KZF0czlSX15K
         Mym4TtsKy0wJ1Wtb3WhE+vnxt3SnbL4MMGJhvW35gfslpq06AmhY5wgsJH0EnU08IoJx
         EVob8kREfk7WHcP2BX2giwKq65TeYWhDrdKlmBivU0WwCOGBijbRdLPjTKVi8XCIHcqB
         YNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=HQ19xvqiA4G2WyV84la3hZZlIas5Up6lbNaE2iEUudw=;
        b=zy52QEH/hLkXRXwLBJLH1dje8QAnf98AYZ8n4Z9rCW5sx8RMi0tbZ1gX67xQDLbTh0
         ytIo6lGSXuO6JpCKNZEkI4DIKBJCe9TIldgMdIh66tvxqBiSxQWpoCqmMhkYmqV3A7pl
         JI7PTtyNpPjWtbKftAI7qtcAakf5eIJ9G3y2QkR/JSK1SvcnBGp4ZMfdtYv3Sbx5DVLS
         lckI0x+hOeVVne7M/LaSHSEikhypTxkXEyXayHh52S6plBcIxJnobRq78zk2MtsJjWvL
         BjgLf6CUIHDgmTbrZ0pkvGN1/QKEUBxlIY64ABx5UMQrKNebA8TMt18InI+L+ZkYHyKS
         SrRQ==
X-Gm-Message-State: AOAM531OH86s1gQQ//9R8lyUfkqjl4RcV+scs9+DE++I4/HvT6EzVjW6
	TiiLacvwlEuLqAXdKgZIQc+XQRht2aaqWfqvoOI=
X-Google-Smtp-Source: ABdhPJw8gj8UnUkHmA+a6grhu4fCJl80HHw5UUgNvqwL2I3SJpua2zrBe5qXBZBDsTvh4Vd4slK1H5z4bs8Rth4+iS0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:de0:247b:5157:7c15])
 (user=ndesaulniers job=sendgmr) by 2002:a25:5ed6:: with SMTP id
 s205mr41737765ybb.31.1634683011550; Tue, 19 Oct 2021 15:36:51 -0700 (PDT)
Date: Tue, 19 Oct 2021 15:36:42 -0700
Message-Id: <20211019223646.1146945-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634683006; l=1185;
 s=20211004; h=from:subject; bh=pCnBLq31wEGMpWFMLpVJEj7B9XvdubS5B2YjxrY7RcY=;
 b=NK/adL7rbrI5E749ksLXBr/RwWrOfasC07zBEQzqpMQxkI6l7xk++wgsUS+UenoWWhiacuq+cUtr
 dmVh9lhYDFQkO6VwtrRX3kCcdumJNdCVVW6tWdWz6z9XRqkkZUzo
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 0/4] compat vdso cleanups
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Four fixes for compat vdso, the first three are related, the fourth is
standalone.

The first three fix a warning observed for `mrproper` targets when
$(CROSS_COMPILE_COMPAT)gcc is not in the $PATH.

The fourth makes is so that CROSS_COMPILE_COMPAT is not necessary to
select COMPAT_VDSO when using clang+lld.

Based on arm64/linux.git/for-next/misc.

Changes v1 -> v2:
* Fix binutils version numbers in 1/4 as per Christian.
* Add new patch 2/4 as per Arnd.
* Rewrite 3/4 to use redirection of stderr to /dev/null, as per
  Masahiro.
* Add parens and update commit message of 4/4 as per Nathan.

Nick Desaulniers (4):
  arm64: vdso32: drop the test for dmb ishld
  arm64: vdso32: drop test for -march=armv8-a
  arm64: vdso32: suppress error message for 'make mrproper'
  arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd

 arch/arm64/Kconfig                           |  3 +-
 arch/arm64/include/asm/vdso/compat_barrier.h |  7 ----
 arch/arm64/kernel/vdso32/Makefile            | 36 +++++---------------
 3 files changed, 10 insertions(+), 36 deletions(-)


base-commit: de56379f21c70196ff18c48790e8e43865893869
-- 
2.33.0.1079.g6e70778dc9-goog

