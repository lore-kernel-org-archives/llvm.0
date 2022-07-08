Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844C812
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:15:29 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id u15-20020a25ab0f000000b0066e49f6c461so69894ybi.2
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KH9mJv0ZR2SU3DtFmyDpUkXKfdlQZNCvgcG+OHeVrdo=;
        b=W/TSmyxBgmti9FoirOZMYegvHytBo9QLpIGhOsiyi+uEpRKokLGzcxCC6Duk5A9p/z
         YC5JHhETfvHNfNe8G6gju732HG/EdpUMgkgPlWhgktsk/wdYjaOlvuMmmNhJdej1HhXb
         Jbud8fWMQX25jnbqxLEWlhFhvfdwh+qXYd+fA8y6bYV/A3uTXo0dphePcewxjPnVysTI
         eEGP3wJPTHvy6nNN92fXdoUa/WkfcgSYLQInl5DdGGj1DArkx5f0fO47WIAMfbIVRd+n
         Lrt7DGDsC/4WpDR34FyWzGFlLgm1HGaTeikrLhqn4ye1hTv83CUKFdBW2GcRYN4la0As
         7oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KH9mJv0ZR2SU3DtFmyDpUkXKfdlQZNCvgcG+OHeVrdo=;
        b=nGAfUJCOLeB0qTBvhNHD6gKUZaCeCiGIL1Vc0qiAp9FqFFWjsVw3N+OiGAC1r5TEkB
         aK/N72wQ0PRQ4OSVixnX237YFnooQGFGEQjQ0OdyVbz/9qvx0AYDzlVHKrQwrqaR7Jr6
         q1015pGecluLGBSRRzm2jo1FNQWW4PmgmvpXbQkuqVr6Jkif3JYXcT6HQRBeaCpWJtu0
         MSLUqabi20eOK19MAYq22iDOReqrS5j/DFxiJEsqEfRAr7brhU+eARDVPWEQnVX8ss8m
         DbDmgi1XNz/nHoTCl0aBgs69kzaza/8u9Bu0aiRaVjR2SA6wPRgJBoR9VkTK3/Y98RH9
         7J6Q==
X-Gm-Message-State: AJIora8IGk3zX5849BBsYdGkB7Urvz0dwiFdFYGFyHJNzRwHJ8igIzHO
	swzsZu1IlmIdAHI9qNOJ82k7kSIJu9/H8XP7KEs=
X-Google-Smtp-Source: AGRyM1v7HcWlAUUp2rbkrPhHWg9uP0oL5xlTYPMpOjl1u9YY7GAIlTdLGTCzQiHKS0scijjZi5QV1cgwOMw7K35sBg8=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:d00c:5934:2a57:8a6e])
 (user=ndesaulniers job=sendgmr) by 2002:a25:3206:0:b0:66e:1dac:b1c8 with SMTP
 id y6-20020a253206000000b0066e1dacb1c8mr5871083yby.609.1657322128415; Fri, 08
 Jul 2022 16:15:28 -0700 (PDT)
Date: Fri,  8 Jul 2022 16:15:20 -0700
In-Reply-To: <https://lore.kernel.org/llvm/6b330119-fbf2-1c34-7ad3-0ae789658d22@arm.com/>
Message-Id: <20220708231520.3958391-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <https://lore.kernel.org/llvm/6b330119-fbf2-1c34-7ad3-0ae789658d22@arm.com/>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657322119; l=5131;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=Y4az1r2se6u+3RbjkapgXQQ3GpGFMe8yfK+67cNeZME=;
 b=Sishl6BCwJR0395PFgjHA3OTgt8GP/QRxYZrdVV7Isa0eYpkLpkkMC5UQOROpPu3C/fnD0vS3dIQ
 XJKN9ImHDDUaw5JHFkI7jzuSWbjTNoL8AX3Nwnhpjm8MDNEWJUnD
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v6] coresight: etm4x: avoid build failure with unrolled loops
From: Nick Desaulniers <ndesaulniers@google.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: David Laight <David.Laight@aculab.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@kernel.org>, Tao Zhang <quic_taozha@quicinc.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When the following configs are enabled:
* CORESIGHT
* CORESIGHT_SOURCE_ETM4X
* UBSAN
* UBSAN_TRAP

Clang fails assemble the kernel with the error:
<instantiation>:1:7: error: expected constant expression in '.inst' directive
.inst (0xd5200000|((((2) << 19) | ((1) << 16) | (((((((((((0x160 + (i * 4))))) >> 2))) >> 7) & 0x7)) << 12) | ((((((((((0x160 + (i * 4))))) >> 2))) & 0xf)) << 8) | (((((((((((0x160 + (i * 4))))) >> 2))) >> 4) & 0x7)) << 5)))|(.L__reg_num_x8))
      ^
drivers/hwtracing/coresight/coresight-etm4x-core.c:702:4: note: while in
macro instantiation
etm4x_relaxed_read32(csa, TRCCNTVRn(i));
^
drivers/hwtracing/coresight/coresight-etm4x.h:403:4: note: expanded from
macro 'etm4x_relaxed_read32'
read_etm4x_sysreg_offset((offset), false)))
^
drivers/hwtracing/coresight/coresight-etm4x.h:383:12: note: expanded
from macro 'read_etm4x_sysreg_offset'
__val = read_etm4x_sysreg_const_offset((offset));       \
        ^
drivers/hwtracing/coresight/coresight-etm4x.h:149:2: note: expanded from
macro 'read_etm4x_sysreg_const_offset'
READ_ETM4x_REG(ETM4x_OFFSET_TO_REG(offset))
^
drivers/hwtracing/coresight/coresight-etm4x.h:144:2: note: expanded from
macro 'READ_ETM4x_REG'
read_sysreg_s(ETM4x_REG_NUM_TO_SYSREG((reg)))
^
arch/arm64/include/asm/sysreg.h:1108:15: note: expanded from macro
'read_sysreg_s'
asm volatile(__mrs_s("%0", r) : "=r" (__val));                  \
             ^
arch/arm64/include/asm/sysreg.h:1074:2: note: expanded from macro '__mrs_s'
"       mrs_s " v ", " __stringify(r) "\n"                      \
 ^

Consider the definitions of TRCSSCSRn and TRCCNTVRn:
drivers/hwtracing/coresight/coresight-etm4x.h:56
 #define TRCCNTVRn(n)      (0x160 + (n * 4))
drivers/hwtracing/coresight/coresight-etm4x.h:81
 #define TRCSSCSRn(n)      (0x2A0 + (n * 4))

Where the macro parameter is expanded to i; a loop induction variable
from etm4_disable_hw.

When any compiler can determine that loops may be unrolled, then the
__builtin_constant_p check in read_etm4x_sysreg_offset() defined in
drivers/hwtracing/coresight/coresight-etm4x.h may evaluate to true. This
can lead to the expression `(0x160 + (i * 4))` being passed to
read_etm4x_sysreg_const_offset. Via the trace above, this is passed
through READ_ETM4x_REG, read_sysreg_s, and finally to __mrs_s where it
is string-ified and used directly in inline asm.

Regardless of which compiler or compiler options determine whether a
loop can or can't be unrolled, which determines whether
__builtin_constant_p evaluates to true when passed an expression using a
loop induction variable, it is NEVER safe to allow the preprocessor to
construct inline asm like:
  asm volatile (".inst (0x160 + (i * 4))" : "=r"(__val));
                                 ^ expected constant expression

Instead of read_etm4x_sysreg_offset() using __builtin_constant_p(), use
__is_constexpr from include/linux/const.h instead to ensure only
expressions that are valid integer constant expressions get passed
through to read_sysreg_s().

This is not a bug in clang; it's a potentially unsafe use of the macro
arguments in read_etm4x_sysreg_offset dependent on __builtin_constant_p.

Link: https://github.com/ClangBuiltLinux/linux/issues/1310
Reported-by: Arnd Bergmann <arnd@kernel.org>
Reported-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v5 -> v6:
* Rework patch to replace use of __builtin_constant_p with __is_constexpr in
  read_etm4x_sysreg_offset().
* Drop Suzuki's suggested by tag, since this is a different approach.
* Convert Tao's suggested by tag to a reported by tag.
* Reword bottom part of commit message.

V5 (Nick):
https://lore.kernel.org/llvm/20220623174131.3818333-1-ndesaulniers@google.com/
V4 (Nick):
https://lore.kernel.org/llvm/20220614220229.1640085-1-ndesaulniers@google.com/
V3 (Tao):
https://lore.kernel.org/lkml/1632652550-26048-1-git-send-email-quic_taozha@quicinc.com/
V2 (Arnd):
https://lore.kernel.org/lkml/20210429145752.3218324-1-arnd@kernel.org/
V1 (Arnd):
https://lore.kernel.org/lkml/20210225094324.3542511-1-arnd@kernel.org/

 drivers/hwtracing/coresight/coresight-etm4x.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 33869c1d20c3..a7bfea31f7d8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -7,6 +7,7 @@
 #define _CORESIGHT_CORESIGHT_ETM_H
 
 #include <asm/local.h>
+#include <linux/const.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include "coresight-priv.h"
@@ -515,7 +516,7 @@
 	({									\
 		u64 __val;							\
 										\
-		if (__builtin_constant_p((offset)))				\
+		if (__is_constexpr((offset)))					\
 			__val = read_etm4x_sysreg_const_offset((offset));	\
 		else								\
 			__val = etm4x_sysreg_read((offset), true, (_64bit));	\

base-commit: 525496a030de4ae64bb9e1d6bfc88eec6f5fe6e2
-- 
2.37.0.rc0.161.g10f37bed90-goog

