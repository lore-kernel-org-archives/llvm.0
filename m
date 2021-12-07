Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41C2C80
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 11:02:34 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y12so55115325eda.12
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 03:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BpwEc/+4c0u+dBlL5ZFFwL9CwrBCeiM6+gZOjhEbJk=;
        b=X2q8xFOSFuGMPFUQxUXUgPkHBzt2OouImoAFq6Je3YBuRztbHBDKnJNe6Ca4Il8ohw
         azgAUAwqPtkx+OTJD7Bzod08TBq3XntnWwRuXzzreewj78QtscE++T4/YahXvp0UMXsd
         CaVPXNxaGLyQgEVMhMrdSaixL2IzUHlkP8wwp3UlZ09xlj+rqW1gtJDtZqalB1Th7vtZ
         g5bgskHOpcOMdOSXXz1lgRFuxOJlG2utxJQGUR2CYXpM6tEDwbfze5OOvki0vkIkX43z
         auyV7mNNeno848UX4Dr72DGk/ilLzS4sLfWHMjGCNTI8IEAfW1f3nnHmh00YPMOdTg2n
         XCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BpwEc/+4c0u+dBlL5ZFFwL9CwrBCeiM6+gZOjhEbJk=;
        b=MhceqDMH9hZoqtwVTMrGntn52sljeV8taBdOMmCMiraa5UcEfexQUBafP46xRmznYd
         ya9Qe/D3qMTojDElYhpucnN0WyROf++zTUOR3LhT/y+omYqOz4BRAI4j1/AXNxTXZJaC
         qm2GmovZL1NBAU1TEHU8Cgpywzf5Rbieoo8UvBCN53vLEYYlRC7clyYne2hC1RHrq3rB
         +U1zXYy9BYRrvvieNHGgEEFTs+XOdRJsRyK67+juIjVJefhukPXubAhp1uGfXw7ARKfX
         XIb4Yudh+CVH17b2Ke/yWEMK7X6JdCEpTz9q4kh8pbNAorIBL30nmbPfzoGZvxPIzg44
         fDCg==
X-Gm-Message-State: AOAM530mMGYv0MPa6r/TyPtbAlifvxgukUUsZx0sVEOgy0Xte57tp72K
	WQou5lgH6j9yPpw7XxwUrhswHg==
X-Google-Smtp-Source: ABdhPJydLP4TJ7VYKV5qrQOW1I+z9lY4ca219oUHggFrH/j5HD1/tUZmh1lTuoSHZ+chEvmeJZFbtw==
X-Received: by 2002:a17:906:cb82:: with SMTP id mf2mr52738140ejb.266.1638874952179;
        Tue, 07 Dec 2021 03:02:32 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id cq19sm2630328edb.33.2021.12.07.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 03:02:31 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: arnd@arndb.de
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] powerpc: platforms: cell: pervasive: fix clang -Wimplicit-fallthrough
Date: Tue,  7 Dec 2021 12:02:28 +0100
Message-Id: <20211207110228.698956-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
        case SRR1_WAKEEE:
        ^
arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
        case SRR1_WAKEEE:
        ^
        break;
1 error generated.

Clang is more pedantic than GCC, which does not warn when failing
through to a case that is just break or return. Clang's version
is more in line with the kernel's own stance in deprecated.rst.
Add athe missing break to silence the warning.

Fixes: 6e83985b0f6e ("powerpc/cbe: Do not process external or decremeter interrupts from sreset")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/platforms/cell/pervasive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
index 5b9a7e9f144b..dff8d5e7ab82 100644
--- a/arch/powerpc/platforms/cell/pervasive.c
+++ b/arch/powerpc/platforms/cell/pervasive.c
@@ -78,6 +78,7 @@ static int cbe_system_reset_exception(struct pt_regs *regs)
 	switch (regs->msr & SRR1_WAKEMASK) {
 	case SRR1_WAKEDEC:
 		set_dec(1);
+		break;
 	case SRR1_WAKEEE:
 		/*
 		 * Handle these when interrupts get re-enabled and we take
-- 
2.33.0

