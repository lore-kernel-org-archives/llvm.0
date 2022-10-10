Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD8033CC
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 17:51:43 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id p5-20020a25bd45000000b006beafa0d110so11337315ybm.1
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBlnd4XOswp/sg9aQW3gv5szg86tXu6TkQ8l/Mwzfog=;
        b=nk/3rxvqJoK9SyUHQWL4FrcBRa1u5cO4vRwonLiomf+mwgVgWWJI1zDI2WrsG4X70S
         nmYcNaaINMTJvz4X+rhldlAAsnDEIdQ1m/0le3N3a4jcmuJBnx7ADpYTD37EtiIQ8Ek4
         UdZRVtpQ9jRuCSlVU0a7FPDzhLIVxEVRtxg1As+928YvNnSFB/ebJx9BGRXZ+TqF7Yvx
         1RE2jxe2d5hBME089OeAg4k07EJx1sEL1FXum8kBR1LYise8GCM5CrRWtjtenaTYKGO8
         7ToFnDGrUdgCeG5TNXYr09gkPBJU4y/mo/PCaw7hg1fsyCBRDaiMRFl5EKrZexrFlMpB
         5aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBlnd4XOswp/sg9aQW3gv5szg86tXu6TkQ8l/Mwzfog=;
        b=Z9arLRnSpXfTWi6wDojMGp7KA//GW/C045s1Yll7sCbLxWJggNDz6owwfC6OsTb2mR
         pgobsVfIwVmSO7csxdVwgTG2nU0SbvrYIGc8B+IcOZP41eidO/Xg1av/fGOtAekFLcTy
         TXSBAGlwWgJd40s7TyxD+bpS74uQlmxBUyGpaAod2ba8Zz9NI3IY3UeJa0nR0bTKlxUC
         eL2WXfHFzftSPKc5WIN4OdPOw5VYD8kXJMpyG1Yf6x917ckMWwjZ1NgBdRftWtg6cChW
         vSAa0F+UYQcv97CiCSmnc86O/L6etYVw01VR9tZFAVo4gzZcHFiO4MpPm4nitYSDz4ab
         XI9g==
X-Gm-Message-State: ACrzQf0CeF2ZBDxeka0qyXlGUfUaXSFn121n+q991YBMPXZu/aLUIvk1
	gdA0FWS23S9UpcsSGMplpR/dfyzOqvTuuTIcnuI=
X-Google-Smtp-Source: AMsMyM5jkqv1zz43050m6pWEovXCAiaua+rKQiGXBtEfN0TkeuKfcUR3yW7cLziDOqKL4IlVFs/66K0FaURGRe5s6Ow=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:883d:1c60:2d47:598d])
 (user=ndesaulniers job=sendgmr) by 2002:a81:d45:0:b0:356:d50d:d010 with SMTP
 id 66-20020a810d45000000b00356d50dd010mr18174102ywn.437.1665424302401; Mon,
 10 Oct 2022 10:51:42 -0700 (PDT)
Date: Mon, 10 Oct 2022 10:51:34 -0700
In-Reply-To: <202210072120.V1O2SuKY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202210072120.V1O2SuKY-lkp@intel.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665424294; l=2791;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=79P/bvbEb7lOxoUitL3cE1zzO5WZPlSo0wty3dVeQAY=;
 b=B5zs5846RZppHTs/CE8/c+09IEq445Jvsd3Vdr73h8bHw68EC4yYmabbF1udsPYDDSop/Y6KuyI3
 Q9t55mKQDsfxtPXBKw7hoZQJMbxVuxixwsIYFa/HaIIjtnJ9joA3
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221010175134.2671410-1-ndesaulniers@google.com>
Subject: [PATCH] lib/xor: use r10 rather than r7 in xor_arm4regs_{2|3}
From: Nick Desaulniers <ndesaulniers@google.com>
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

kbuild test robot reports:
In file included from crypto/xor.c:17:
./arch/arm/include/asm/xor.h:61:3: error: write to reserved register 'R7'
                GET_BLOCK_4(p1);
                ^
./arch/arm/include/asm/xor.h:20:10: note: expanded from macro 'GET_BLOCK_4'
        __asm__("ldmia  %0, {%1, %2, %3, %4}" \
                ^
./arch/arm/include/asm/xor.h:63:3: error: write to reserved register 'R7'
                PUT_BLOCK_4(p1);
                ^
./arch/arm/include/asm/xor.h:42:23: note: expanded from macro 'PUT_BLOCK_4'
        __asm__ __volatile__("stmia     %0!, {%2, %3, %4, %5}" \
                             ^
./arch/arm/include/asm/xor.h:83:3: error: write to reserved register 'R7'
                GET_BLOCK_4(p1);
                ^
./arch/arm/include/asm/xor.h:20:10: note: expanded from macro 'GET_BLOCK_4'
        __asm__("ldmia  %0, {%1, %2, %3, %4}" \
                ^
./arch/arm/include/asm/xor.h:86:3: error: write to reserved register 'R7'
                PUT_BLOCK_4(p1);
                ^
./arch/arm/include/asm/xor.h:42:23: note: expanded from macro 'PUT_BLOCK_4'
        __asm__ __volatile__("stmia     %0!, {%2, %3, %4, %5}" \
                             ^
Thumb2 uses r7 rather than r11 as the frame pointer. Let's use r10
rather than r7 for these temporaries.

Link: https://github.com/ClangBuiltLinux/linux/issues/1732
Link: https://lore.kernel.org/llvm/202210072120.V1O2SuKY-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/include/asm/xor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/xor.h b/arch/arm/include/asm/xor.h
index 669cad5194d3..934b549905f5 100644
--- a/arch/arm/include/asm/xor.h
+++ b/arch/arm/include/asm/xor.h
@@ -51,7 +51,7 @@ xor_arm4regs_2(unsigned long bytes, unsigned long * __restrict p1,
 	register unsigned int a1 __asm__("r4");
 	register unsigned int a2 __asm__("r5");
 	register unsigned int a3 __asm__("r6");
-	register unsigned int a4 __asm__("r7");
+	register unsigned int a4 __asm__("r10");
 	register unsigned int b1 __asm__("r8");
 	register unsigned int b2 __asm__("r9");
 	register unsigned int b3 __asm__("ip");
@@ -73,7 +73,7 @@ xor_arm4regs_3(unsigned long bytes, unsigned long * __restrict p1,
 	register unsigned int a1 __asm__("r4");
 	register unsigned int a2 __asm__("r5");
 	register unsigned int a3 __asm__("r6");
-	register unsigned int a4 __asm__("r7");
+	register unsigned int a4 __asm__("r10");
 	register unsigned int b1 __asm__("r8");
 	register unsigned int b2 __asm__("r9");
 	register unsigned int b3 __asm__("ip");
-- 
2.38.0.rc2.412.g84df46c1b4-goog

