Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE50100D7
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 18:33:57 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d27ac992539so1362415276.3
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691087636; x=1691692436;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U3VOaPJ6MKTIiohfINI/eYuhi42VF/TpE5lJuXmVnZU=;
        b=jGBcVWGiKzPAHOVeNjq1y7oxUP/yrgTePN9mw3TokA4mYnl3VDEc0K63yNHbMmWj19
         GPHyuz9aZECjuN6QGh09dWL6iBwA6n10Smp7y1Jh/MHuEpWEZyq1SMWIQ9fXZi3u+Rnn
         Q4PzbmbAQj5lD2qkXPusJo1mDha8dVvAwg47zexPP6FviSk+KBD3yHKAmHO3VC+yY1jY
         pIa3y0jz91NRfZrBiYtMV37D3Tg6Y2KyfAkgsxVxYrCjAHfDA6CMiziLZASdpEGmvDO8
         Jf1Gu2ZDuwlIMpjZIAz0IEkIcqLSpqtewaRO8/SkHfSAiTWvVpbvS7ereml0dLLBf3fV
         suEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691087636; x=1691692436;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3VOaPJ6MKTIiohfINI/eYuhi42VF/TpE5lJuXmVnZU=;
        b=cAvL3WgqExO3cRFoV8gXrWs65gDDopz/INvGZFM4cy3B88g59t1W3t8tKA4CpC45X6
         yiAbjyW7w6SVOUYFgfw4inSc4+SXkA2f2YKDJos1Zj4P/nGC0UgTwco9JeSS4syAl4Nt
         yZgXwX5WUfPZRXIjpj2zMHSfrOTS8Wwf00VbQwmxWpBNVMR5s2k5P5tqjvdXNRrZ4H4B
         lszHoZzAXxkruP/Reo2G2mwvJgcExEQS3PAplRSqJ6BWOYFLUHQ9EMFK1/zDpLarrszZ
         EgkxsxPhIMq96bD5LAKooyK7FhUTFvACcW9dlaBrT/nVWKvbxrcqYbw0wmIVKR6EwSw6
         k76w==
X-Gm-Message-State: ABy/qLbbYYfD+tSzrnUgt0DWbiFb3mwcGFhlskyudS4F5OJ8cLNC4Ef8
	guLVHNmz74ajCBamvl+FlGKNcbHn/mxh2iacnJY=
X-Google-Smtp-Source: APBJJlGgnFQzPOitZAU98RMK0X9+hq6s9tJJjr7a1RlQJuN/fchCzoXnESBcHJ3kPK5j1medkwomkVGXWLCOWggpRxM=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cd2a:c126:8d90:d5ab])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:569:b0:d11:3c58:2068 with
 SMTP id a9-20020a056902056900b00d113c582068mr133475ybt.2.1691087636427; Thu,
 03 Aug 2023 11:33:56 -0700 (PDT)
Date: Thu, 03 Aug 2023 11:33:52 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA/zy2QC/32NywrCMBBFf6VkbaR5qNWV/yEieU0bSJuQlFAp/
 XeT7lzo8sxw7llRMtGahG7NiqLJNlk/FWCHBqlBTL3BVhdGtKWs7VqGQ1Cv2UnrFhesxgq0BA6
 awwVQkaRIBssoJjVUbRRpNrE+QjRgl730eBYebJp9fO/hTOr1ZyMTTHDHBZHqpOB6Zvfe+96Zo /IjqluZ/vdp8SkhAIJoIFf+5W/b9gEPHU1kBgEAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691087634; l=3590;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=DXS75M6ip4LIo9QVOPrHgK0haQj5/x/umg+wlNPWCPQ=; b=AfeE+hGjVv3usaoDClqYLXcfcyNoLusX6a90nkmY2QDifz22bZ5hqW8UPQE+UW4b6yR7D6XX6
 kx3WwCXMXWtBwssf5qp7Ju6NNxmRCCQDloYP+6XypBgQ9bapq9Ou/AQ
X-Mailer: b4 0.12.3
Message-ID: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com>
Subject: [PATCH v3] powerpc/inst: add PPC_TLBILX_LPID
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

Clang didn't recognize the instruction tlbilxlpid. This was fixed in
clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
older, rather than using that instruction bare in inline asm, add it to
ppc-opcode.h and use that macro as is done elsewhere for other
instructions.

Link: https://github.com/ClangBuiltLinux/linux/issues/1891
Link: https://github.com/llvm/llvm-project/issues/64080
Link: https://github.com/llvm/llvm-project/commit/53648ac1d0c953ae6d008864dd2eddb437a92468 [0]
Link: https://github.com/llvm/llvm-project-release-prs/commit/0af7e5e54a8c7ac665773ac1ada328713e8338f5 [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202307211945.TSPcyOhh-lkp@intel.com/
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes in v3:
- left comment @ https://github.com/linuxppc/issues/issues/350#issuecomment-1664417212
- restore PPC_RAW_TLBILX previous definition
- fix comment style
- Link to v2: https://lore.kernel.org/r/20230803-ppc_tlbilxlpid-v2-1-211ffa1df194@google.com

Changes in v2:
- add 2 missing tabs to PPC_RAW_TLBILX_LPID
- Link to v1: https://lore.kernel.org/r/20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@google.com
---
 arch/powerpc/include/asm/ppc-opcode.h |  2 ++
 arch/powerpc/kvm/e500mc.c             | 11 ++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ef6972aa33b9..005601243dda 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -397,6 +397,7 @@
 #define PPC_RAW_RFCI			(0x4c000066)
 #define PPC_RAW_RFDI			(0x4c00004e)
 #define PPC_RAW_RFMCI			(0x4c00004c)
+#define PPC_RAW_TLBILX_LPID		(0x7c000024)
 #define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | __PPC_T_TLB(t) | 	__PPC_RA0(a) | __PPC_RB(b))
 #define PPC_RAW_WAIT_v203		(0x7c00007c)
 #define PPC_RAW_WAIT(w, p)		(0x7c00003c | __PPC_WC(w) | __PPC_PL(p))
@@ -616,6 +617,7 @@
 #define PPC_TLBILX(t, a, b)	stringify_in_c(.long PPC_RAW_TLBILX(t, a, b))
 #define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
 #define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
+#define PPC_TLBILX_LPID		stringify_in_c(.long PPC_RAW_TLBILX_LPID)
 #define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
 #define PPC_WAIT_v203		stringify_in_c(.long PPC_RAW_WAIT_v203)
 #define PPC_WAIT(w, p)		stringify_in_c(.long PPC_RAW_WAIT(w, p))
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index d58df71ace58..7c09c000c330 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -16,10 +16,11 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 
-#include <asm/reg.h>
 #include <asm/cputable.h>
-#include <asm/kvm_ppc.h>
 #include <asm/dbell.h>
+#include <asm/kvm_ppc.h>
+#include <asm/ppc-opcode.h>
+#include <asm/reg.h>
 
 #include "booke.h"
 #include "e500.h"
@@ -92,7 +93,11 @@ void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *vcpu_e500)
 
 	local_irq_save(flags);
 	mtspr(SPRN_MAS5, MAS5_SGS | get_lpid(&vcpu_e500->vcpu));
-	asm volatile("tlbilxlpid");
+	/*
+	 * clang-17 and older could not assemble tlbilxlpid.
+	 * https://github.com/ClangBuiltLinux/linux/issues/1891
+	 */
+	asm volatile (PPC_TLBILX_LPID);
 	mtspr(SPRN_MAS5, 0);
 	local_irq_restore(flags);
 }

---
base-commit: 7bafbd4027ae86572f308c4ddf93120c90126332
change-id: 20230803-ppc_tlbilxlpid-cfdbf4fd4f7f

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

