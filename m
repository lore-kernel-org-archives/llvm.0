Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6517D3
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 11:43:22 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id l10so11220690lje.7
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=KRr7duS52TODFaYDFxdheo3ZE1Z29DCImBOABo5du1w=;
        b=L5bSi9j5tjzNYxKY/Yjve3HQTu5putRB3hOcGDpbo8kEHFySaD8u2jNqhyhgxw5PSY
         ilAiLUNa/T5OFqIpIF/cwUJPb6RBzELpPa4RGLQmxCLAh+dKYfLiMrnrm5PntvEpG/4o
         rWyJe0i4PARwDTKX25pa6Pl3gXMtgxi4kx4nO0hQHQQVLPDNwu4bMCHROeTUqd+RX9GD
         xE21kcgTC6gSjguLlKzyylBIPTA1YL6t1Ir61sGELzAf8s7aXeCNobk/V6ftThHsHzC8
         m9hUj4f98RIUuIKIw1083ZqM9pO+DXYb2Vcq60xnMYchNP5yM/s0uBpTY+gEiHE9EBnK
         WhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=KRr7duS52TODFaYDFxdheo3ZE1Z29DCImBOABo5du1w=;
        b=Ylwe9UmqWcLDInwBO5MorXRMX4IWIZFZK+cAVXSIslZCB6hemG4//yTciOG3r9lRIm
         YwDKO2gAVpl/hjzxaM2fTf0KLjllagwtVLQd+XxLv8Y5xgQwmny3AvvgXIlx93WgOQpj
         tvceMpOHXcUwtvpCSaVnnn5LM+HKoHg0H3wHP2w67KMUZUQAS5ES8hNnPMYvrY1VGVd+
         hILhi4LJhHVk8O41o8A5k9JXN+0OrrDaBT8ZqNrFNJtNtar4S93s/+Cu6nk3JUgDaGt8
         WEJb4/luZsGinOIvyJtk8AN97OO7DbT0UkifDq9D0I3/snBJZPtPyBtff8qcB7qKoBb1
         ZTRQ==
X-Gm-Message-State: ACgBeo0adFtnHM/0WI1Xb0dAshdBrERMbvqFYUmJtYMmF64vsgFoLnwC
	Z1hcmazO9GcCIENLDnTkOllpnQ==
X-Google-Smtp-Source: AA6agR58RoUom5V9F0K5f8O7nc43sAMKbqRT2vJAmqcRE8MN5wQHYZN/H6+z2EXmE7lIKsqk6gh2zA==
X-Received: by 2002:a2e:391d:0:b0:25e:7237:13ef with SMTP id g29-20020a2e391d000000b0025e723713efmr9176026lja.350.1660131801071;
        Wed, 10 Aug 2022 04:43:21 -0700 (PDT)
Received: from localhost (c-e429e555.07-21-73746f28.bbcust.telenor.se. [85.229.41.228])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512375100b0048b969ac5cdsm319863lfs.5.2022.08.10.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 04:43:20 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	mpe@ellerman.id.au
Cc: llvm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else block
Date: Wed, 10 Aug 2022 13:43:18 +0200
Message-Id: <20220810114318.3220630-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                  ^~~~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
                unsigned long hstart, hend;
                                    ^
                                     = 0
arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                          ^~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
                unsigned long hstart, hend;
                                          ^
                                           = 0
2 errors generated.

Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
always gets initialized, this will silence the warnings. That will also
simplify the 'else' path. Clang is getting confused with these warnings,
but the warnings is a false-positive.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 4e29b619578c..6d7a1ef723e6 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1179,15 +1179,12 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			}
 		}
 	} else {
-		bool hflush = false;
+		bool hflush;
 		unsigned long hstart, hend;
 
-		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
-			hend = end & PMD_MASK;
-			if (hstart < hend)
-				hflush = true;
-		}
+		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
+		hend = end & PMD_MASK;
+		hflush = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend;
 
 		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
-- 
2.35.1

