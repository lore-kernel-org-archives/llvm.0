Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA52612E
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:31:55 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-340ae84fb7dso158354297b3.17
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=9LSUCUqEmRpIK5FTeLqrINe//PWWlcjxscTw9SglyBU=;
        b=Su8/MiPy6GrNyCZfLWSzM0QU1dzSiDI0SliUWOKUODrw/Zg/7o59CaOtL6G5L0jYgM
         X/nIqegMyA+Kh3i5o6gz/yFE72IRB/oYvcAo8B4Ou65zdTIZjxFkikPuDGdBb1bm5xv/
         MkQSCWKHffAiHPaPg2AGsKSnliAJQUm2xtplYZb0b6I/YUiwy4GlqRa2GenrNFTV1dfC
         ORdhrBnHz00KdnQtOJmuoxpAMGLAy6YF4CuwKBafGYerSmoW9wEz5roZcGDBWthhjt0r
         Wut1FEVu2171ad+NOt4gzsl/aDqaQaEmAQ4TMKeMKbdDJYkJo1/+ghW7G8iMx/Murjyy
         wsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=9LSUCUqEmRpIK5FTeLqrINe//PWWlcjxscTw9SglyBU=;
        b=qEF/5D2Gh8fLjLKLxsqm0QidwU0W8rS897hZlqJKCsnDvkQJw+L9aTAMF1+5r0kx5n
         bgdiGmZ70dnwObvyPBOyxpsCmVS6CP7vHShSO76WeXnVaQynFsoRH7kVhffmLIZPnIdi
         wVGqDCGwqALA0zT7WzGHWu1U4uuSJV/S+NvaJkCYOdpxpQgWPON+4uktUjf7MUYFhY6u
         zsr14BeSF7z0OldPQcsLxK3wHif+AkGw6KYfRyabiyYiW71LhkjRTtHecFodgV5L5/nB
         WIW8/DqQHxdsTnzLrN7rPkCSKe2mjNIew/38vQFYGcuSFFKqmukEKjxC2OkQoFtmhyhZ
         Owjg==
X-Gm-Message-State: ACgBeo05cwSQx9D/5mAxpUZOs2zTyPpQ2zqKZ7vnaDRhYdTkW6F1yr9N
	VWJE+gSFos5IkGd5fJK5+qM5MPrwyT1ObZT2SK4=
X-Google-Smtp-Source: AA6agR68BGQFfoXet7uT17W5HOi349FKHJvCytSwwlUunuycgf/3w6VheODjwTRdH054IFoEZZevvqkxZQsPtf/8osU=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:54d9:7143:6a7d:91d])
 (user=samitolvanen job=sendgmr) by 2002:a81:1c4b:0:b0:340:972f:abb0 with SMTP
 id c72-20020a811c4b000000b00340972fabb0mr16059486ywc.489.1661902314803; Tue,
 30 Aug 2022 16:31:54 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:31:16 -0700
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>
Message-Id: <20220830233129.30610-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=samitolvanen@google.com;
 h=from:subject; bh=dCgTAVpHmh6ue+qIjFQmdwGO+wJHDxTFzsMUhw9fLMU=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjDp3NvhTqxF6HKWPsUGSSA+N2dkmpL8jOb0ZK7Jx1
 pV8vgQyJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYw6dzQAKCRBMtfaEi7xW7kFoC/
 9rUzKXMDXQKoSguu/A2Rv2ATA5t4yfg6zrdjYpiicpnCS+TbGGK2lUdzlcslHdS1IDP2ecHOWcdDcl
 Fe0QHSu2ujICLA210WhZwuUleMLIwtCzQDdoDj1VPjBfrJ3m8Bvw8UoVtabPRz2Up91t3EszVWpke7
 cOKRhf1TZUreP9c5HzmehuN6xPi6PfCsXekOiqqKS5bveLFNH1izxbSyDg4MB/Nf67NMlQonGdnxzl
 vhT5ncb1Xb0rn50pB1LcJRz/YZ8D3+Y3Vc5j3XBWHUj6N3RIJOxyEXC5ypoF774b2i+O7fvWy20CPQ
 hFIEux/rXEdv28MYbGssuPw+fLT/IhlbUoI1f+MxSCobNzG5kQcxThpkupoA9NFbFWxmBatG+FcPc8
 WTSgP0bNGyxHqO6BkyENMKnpUsvQbWes5XHGgvDop67nvldrkisGMHpuaEXqz3dQ99BgFp035sdyOc
 zEqaAajdW2W/J6ScBKCLnWsAcMP9axCky8DTM7nWY/lBE=
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 08/21] psci: Fix the function type for psci_initcall_t
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Functions called through a psci_initcall_t pointer all have
non-const arguments. Fix the type definition to avoid tripping
indirect call checks with CFI_CLANG.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/firmware/psci/psci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index cfb448eabdaa..75ef784a3789 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -274,7 +274,7 @@ static void set_conduit(enum arm_smccc_conduit conduit)
 	psci_conduit = conduit;
 }
 
-static int get_set_conduit_method(struct device_node *np)
+static int get_set_conduit_method(const struct device_node *np)
 {
 	const char *method;
 
@@ -528,7 +528,7 @@ typedef int (*psci_initcall_t)(const struct device_node *);
  *
  * Probe based on PSCI PSCI_VERSION function
  */
-static int __init psci_0_2_init(struct device_node *np)
+static int __init psci_0_2_init(const struct device_node *np)
 {
 	int err;
 
@@ -549,7 +549,7 @@ static int __init psci_0_2_init(struct device_node *np)
 /*
  * PSCI < v0.2 get PSCI Function IDs via DT.
  */
-static int __init psci_0_1_init(struct device_node *np)
+static int __init psci_0_1_init(const struct device_node *np)
 {
 	u32 id;
 	int err;
@@ -585,7 +585,7 @@ static int __init psci_0_1_init(struct device_node *np)
 	return 0;
 }
 
-static int __init psci_1_0_init(struct device_node *np)
+static int __init psci_1_0_init(const struct device_node *np)
 {
 	int err;
 
-- 
2.37.2.672.g94769d06f0-goog

