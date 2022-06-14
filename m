Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDC623C7
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 22:02:44 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 37-20020a630a25000000b003fdcbe1ffc8so5572392pgk.11
        for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 15:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=lrVW1I5SIqxygGfdn7dE995IrEtCJUN/f9GmeMKUvnc=;
        b=NKDq6eNl+qXNZHPcakcd4kpblY2meICIUdTI0MJLOZncy/rxmdReGAyUBbpxcEBUTG
         dxg7nBIv9qlOyrRR1oMtBteaj3Y/JzmRk3V0GJLnRR0E8+B0wXsT6XJG6tWg96u/lhmB
         etNuH64FsBtyPVgNCTjlZQMgqnSZ7DdXWkzpeO+5Qbnc0z6w2OyaYJAwoxpjMndAXv8b
         19adCp3BJ90tbexnMFn2o2fBYR3A5kELHROTiIGqGQgJE2VrtwEM05AFvCb44qpg0UWT
         N2S5ht1TnFZ899se2qxFspcOTQPW70Ej6810+POhqd1O1zLCghA0Jlj1RvW5ARpxJECR
         BdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=lrVW1I5SIqxygGfdn7dE995IrEtCJUN/f9GmeMKUvnc=;
        b=BHj0l23eJ3KWYd/7K0rySXe7gf41KQ90vXS3gSTMPmg8tV4d1T2KRfkGqhqrAeBI2U
         JqhEfq6GMkSipBvZVj/Fw1nzuBT6FgqnCcSUSwUvgZs4ecwy/kLVZg0iiGSl2WW82li0
         Eiu3Gq7lb08qFghiS16QDgN7Kr5Lg9qJYYEypkuqvJW57R9LVSYvtVciJSkp32Kh72Nc
         jioKLbju0YxEpgzUtRMUiWnZKgyxK86qLd12kF3j+ftxqLLFUIehT3xA4AXYemLyffsb
         nmUMTUvaevRcQnd3FXKKNKrwbEcE/THraIOWazv4+h9okRcDu3MgjPDgTn+sKhSmR4WF
         vVEw==
X-Gm-Message-State: AOAM533QVfXCkITd2SMiWNUVzehMaJEglhx7Jn15Yk4y0UShmMBYelCn
	6sxRi6sOwBIKH/dJ7Rj/rrHB54Bf8jtkYTRE/2w=
X-Google-Smtp-Source: ABdhPJzZDqjgOXqNXzNoMxUfjk248v8FEODamZOOBL1QF2Uxm5LjN7pq2lAB0cwZFHuXEYikbeeNHqc8FUldkXGBmuY=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478c:4e88:59e6:a1c2])
 (user=ndesaulniers job=sendgmr) by 2002:a63:c5:0:b0:3fe:26a0:7abe with SMTP
 id 188-20020a6300c5000000b003fe26a07abemr6428939pga.152.1655244164322; Tue,
 14 Jun 2022 15:02:44 -0700 (PDT)
Date: Tue, 14 Jun 2022 15:02:29 -0700
Message-Id: <20220614220229.1640085-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1655244149; l=5539;
 s=20211004; h=from:subject; bh=f3ZK8/kP38ZW74vacM54ZIsXbSpGEvA5AJcusva2pVE=;
 b=vaVg/LweBouwrspD+ylGz+5uWCM44wcdFddmcU1TQii3fKuc1B5pjqR3k9rPRf0aXvXIaSV/Cecj
 J7wiFRtLC1tc5VEkQTu460J1J5lw7ehMFGL75R0shTPRrrGxwl2f
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH v4] coresight: etm4x: avoid build failure with unrolled loops
From: Nick Desaulniers <ndesaulniers@google.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@kernel.org>, 
	Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linaro.org>, 
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
drivers/hwtracing/coresight/coresight-etm4x-core.c:702:4: note: while in macro instantiation
                        etm4x_relaxed_read32(csa, TRCCNTVRn(i));
                        ^
drivers/hwtracing/coresight/coresight-etm4x.h:403:4: note: expanded from macro 'etm4x_relaxed_read32'
                 read_etm4x_sysreg_offset((offset), false)))
                 ^
drivers/hwtracing/coresight/coresight-etm4x.h:383:12: note: expanded from macro 'read_etm4x_sysreg_offset'
                        __val = read_etm4x_sysreg_const_offset((offset));       \
                                ^
drivers/hwtracing/coresight/coresight-etm4x.h:149:2: note: expanded from macro 'read_etm4x_sysreg_const_offset'
        READ_ETM4x_REG(ETM4x_OFFSET_TO_REG(offset))
        ^
drivers/hwtracing/coresight/coresight-etm4x.h:144:2: note: expanded from macro 'READ_ETM4x_REG'
        read_sysreg_s(ETM4x_REG_NUM_TO_SYSREG((reg)))
        ^
arch/arm64/include/asm/sysreg.h:1108:15: note: expanded from macro 'read_sysreg_s'
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

Regardless of compiler or compiler options determine whether a loop can
or can't be unrolled, which determines whether __builtin_constant_p
evaluates to true when passed an expression using a loop induction
variable, it is NEVER safe to allow the preprocessor to construction
inline asm like:
  asm volatile (".inst (0x160 + (i * 4))" : "=r"(__val));
                                 ^ expected constant expression

Replace unsafe uses of calls to etm4x_relaxed_read32 with
csdev_access_read32 when the parameter is an expression that would be
invalid inline asm so that it does not depend on the ability of the
compiler to optimize __builtin_constant_p of the expression to true.
Only when the second parameter of etm4x_relaxed_read32 expands to an
expression dependent on a loop induction variable do we need to fix
this.

This is not a bug in clang; it's a potentially unsafe use of the macro
arguments in read_etm4x_sysreg_offset dependent on __builtin_constant_p.

Link: https://github.com/ClangBuiltLinux/linux/issues/1310
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Suggested-by: Tao Zhang <quic_taozha@quicinc.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
V1 (Arnd):
https://lore.kernel.org/lkml/20210225094324.3542511-1-arnd@kernel.org/

V2 (Arnd):
https://lore.kernel.org/lkml/20210429145752.3218324-1-arnd@kernel.org/

V3 (Tao):
https://lore.kernel.org/lkml/1632652550-26048-1-git-send-email-quic_taozha@quicinc.com/

 drivers/hwtracing/coresight/coresight-etm4x-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 87299e99dabb..7c6bd85e36d4 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -836,13 +836,13 @@ static void etm4_disable_hw(void *info)
 	/* read the status of the single shot comparators */
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		config->ss_status[i] =
-			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
+			csdev_access_read32(csa, TRCSSCSRn(i));
 	}
 
 	/* read back the current counter values */
 	for (i = 0; i < drvdata->nr_cntr; i++) {
 		config->cntr_val[i] =
-			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
+			csdev_access_read32(csa, TRCCNTVRn(i));
 	}
 
 	coresight_disclaim_device_unlocked(csdev);
@@ -1177,7 +1177,7 @@ static void etm4_init_arch_data(void *info)
 	drvdata->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		drvdata->config.ss_status[i] =
-			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
+			csdev_access_read32(csa, TRCSSCSRn(i));
 	}
 	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
 	drvdata->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
-- 
2.36.1.476.g0c4daa206d-goog

