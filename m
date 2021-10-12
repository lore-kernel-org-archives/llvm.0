Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D22C80
	for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 23:46:24 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id j17-20020a05620a0a5100b0045f8ed4f72fso575393qka.1
        for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=U1CBuwTvctaYUlQJhZIppI9ILyM5IxB5cbt7UE9WsqY=;
        b=OSXAr37CFli6hdER8dhZKrAe0g0va7VrU/6C3pfS6bZYyesWzvxQw545v2Yz9Pgc+r
         6HQkzMenAvbRIbO+IIrHmDOeN1b8XIJaeKHiulsk6zDy1u8SQTp23lqzy9Ezbx/l0zdZ
         x1a5dT+3iCs2WIsnXsqEMSBXRI56rjZ9YiH+H0t2eD0anXIicY4dn7DsXbKTdL5atUYp
         99VHdz3+OH/drwGUdFuQppxPIrtk0FbLHR+sjBMRQy3fQchBRiL/E+qSIpa+Q+Gzj0fm
         63c2whJ59wPRHe2ModiqsDZYyFzE/rovMwrsBF6E/NOLAxAmOz2AoNgHsHGMH2sj0nAE
         hrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=U1CBuwTvctaYUlQJhZIppI9ILyM5IxB5cbt7UE9WsqY=;
        b=gyUnDdqbyCBR0IZJHnjKOZga+FPceJFAhWuXBqLDnWD1Fwom6y56Ppb8/pLJinlcnq
         sa6aIFEHsOqJiA+jF+r63dqj6AiX4iOfQ9ifQ6200S2uVHLDRSwPpdHOh3jbgYmKclcI
         3mlhkg7RbVu+HE8so6OENJUww3i6QZUY8kRvnxFyBUubunB7sHHfvEQInZE2CTQS+kQl
         ICU3NWTWTgVeJdpEQxlFO2VZLR5rSH0vVHH9av57mMmixSeV53mEe6jriG06IJwVFeoc
         ocQQ9SSq06I16/iML0a1bSZTWM9YnakxSRtvOcStbaAgQ5mc/hbuLLpYB9/dGC6rZr99
         ZV+g==
X-Gm-Message-State: AOAM532gs+cV0NtGLzug/TA+Upi4a2srTeJTgljqZde7EGx6+pEVtR90
	W0jcXwOA80j+hisSyMqqJFmK4frwPThFRpshKjw=
X-Google-Smtp-Source: ABdhPJwFJFZTxamtNTe57wwrUCI8q0lOwHN9rjl8tqB//Wb8EHJ7CsLVhYYvxb32TE+NYnY5KAdX5Ts4ad+rdVgDB2E=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9b44:962:5897:17c0])
 (user=ndesaulniers job=sendgmr) by 2002:ac8:7c96:: with SMTP id
 y22mr25820433qtv.338.1634082383291; Tue, 12 Oct 2021 16:46:23 -0700 (PDT)
Date: Tue, 12 Oct 2021 16:46:03 -0700
Message-Id: <20211012234606.91717-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634082365; l=859; s=20211004;
 h=from:subject; bh=g3CBsvmGQbuOYnCD8e3MLFwlDDGe9HbIj3f8iC/Hh/s=;
 b=PgfEWmno8ql8mPhYJpHZoIzk7yY9SH3UKBR5mlpy2uh4OOOeVfmJR0VHB4XCATUsta9Us6DdJRUy
 UD+2nr3mBYXbBuAEIc0tINg6Wq6or+VSndHCgZ4nSboOdFC3wfVu
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH 0/3] compat vdso cleanups
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Three fixes for compat vdso, the first two are related, the third is
standalone.

The first two fix a warning observed for `mrproper` targets when
$(CROSS_COMPILE_COMPAT)gcc is not in the $PATH.

The third makes is so that CROSS_COMPILE_COMPAT is not necessary to
select COMPAT_VDSO when using clang+lld.

Based on arm64/linux.git/for-next/misc.

Nick Desaulniers (3):
  arm64: vdso32: drop the test for dmb ishld
  arm64: vdso32: lazily invoke COMPAT_CC
  arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd

 arch/arm64/Kconfig                           |  3 +-
 arch/arm64/include/asm/vdso/compat_barrier.h |  2 +-
 arch/arm64/kernel/vdso32/Makefile            | 33 ++++++--------------
 3 files changed, 12 insertions(+), 26 deletions(-)


base-commit: de56379f21c70196ff18c48790e8e43865893869
-- 
2.33.0.882.g93a45727a2-goog

