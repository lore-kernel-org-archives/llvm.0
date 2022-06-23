Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6643C1FB2
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 17:41:40 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id ob5-20020a17090b390500b001e2f03294a7so1553081pjb.8
        for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MwZlJyNa6rjkCM+gcELxDSeMEfLmJw7YVcy+reEx1n0=;
        b=EdLfZ6jUytLvn780kYkyG48o3NDtrfsuYuWMaKQ9E6Uan4JG8DqEbXjCvgtIEU6h1N
         /loCDOJreO5b3nbbliMiYTg+xg8/u4ewptC+/gH9dcAcokLWSedgIvffYW83/0dRtEQs
         YEdkaIE3BOq33NM6vkwmy5E+71WN8vZY7Heqpt0lwwxulnyphw15xJkqMbfcyT5N2Udf
         63BC2UwlFCIu1tuhuyfxMIxOUr0quJZ/tuoP1Ph5hbOq/QrKya/COj28K2Kphe8D/alA
         u6bAmlKNXy8zZlms4t4jkmcWOTm9U1U281udaEKqybNE5EyXQf5j3a7MFXOviUm2l3uR
         8QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MwZlJyNa6rjkCM+gcELxDSeMEfLmJw7YVcy+reEx1n0=;
        b=eTzfz9sYrCr3KF7AcAahU/Aze/50d1LAR1bWn2/M/Xs88+64v8fc6RIyNFF8nDaQgS
         TQCEbs09ngYzEQxEVKocxooVK0Mh6vz2xjnK9sVukZY/FwKYxR6aJNgqR+f8bj6vzzw2
         eZwnQtdf28ZqjDzipzU0fxVPWZvSxr5rmQw7FyS3qyO1II3dlUJsPJtIRkhqN1HgW9oL
         3fMSblDgYt828bFOXqh4se9zMHOiq2zHsVobxu8rVm5dFisCLoZM9RbiEqw/RVVaJBwI
         946UDWiUgLAmGg7WNGCthNpbg3YSqo7grRCesgGIEXuiX+7U7Z4rVTbu/XZJxuv0owPW
         RQRw==
X-Gm-Message-State: AJIora+I98h0Nz3XDnevH42qCFnNwzK1pkVT2eKYUrYw4hJk3kZN+6j7
	WsKng5k2JvdAS7iA1gsidSnwQvPUYkRVsDlTcVU=
X-Google-Smtp-Source: AGRyM1sZTCmtpPv1EuXBex5Er60KYEr9ij7kmWIV1EXdyujiXD12sDcsfwETUgUVoEGwpWmGKZQuFGzTRT6P6w9Og30=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2559:aa18:3644:ba0c])
 (user=ndesaulniers job=sendgmr) by 2002:a17:902:bd44:b0:16a:4522:aa16 with
 SMTP id b4-20020a170902bd4400b0016a4522aa16mr10444996plx.64.1656006099800;
 Thu, 23 Jun 2022 10:41:39 -0700 (PDT)
Date: Thu, 23 Jun 2022 10:41:31 -0700
In-Reply-To: <17600de3-b295-ebdf-b9fa-323d2bc3cb93@arm.com>
Message-Id: <20220623174131.3818333-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <17600de3-b295-ebdf-b9fa-323d2bc3cb93@arm.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1656006091; l=14690;
 s=20211004; h=from:subject; bh=+PPKiA/wyd5JoltCZy8N/71GuRzhpQLNogwZdoSmbeE=;
 b=LC8x9C8uTDp7LimQKuJf3+pvgxOF/Im2SaAJSzlZXEBpmo36jZcfXa7bn6iiP2VgzFoxL73Uu3Uc
 yfWV+D46CnzdoTwlahR74bdblUMoKCI+CFa2XLSmThz52K2cFM5N
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH v5] coresight: etm4x: avoid build failure with unrolled loops
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

Replace unsafe uses of calls to etm4x_relaxed_read32 with
csdev_access_relaxed_read32 when the parameter is an expression that
would be invalid inline asm so that it does not depend on the ability of
the compiler to optimize __builtin_constant_p of the expression to true.
Only when the second parameter of etm4x_relaxed_read32 expands to an
expression dependent on a loop induction variable do we need to fix
this.

For such cases where the induction variable is used in an expression,
perform the following function call replacements:
* etm4x_relaxed_write32 -> csdev_access_relaxed_write32
* etm4x_relaxed_write64 -> csdev_access_relaxed_write64
* etm4x_relaxed_read32 -> csdev_access_relaxed_read32
* etm4x_read32 -> csdev_access_read32
* etm4x_read64 -> csdev_access_read64

This is not a bug in clang; it's a potentially unsafe use of the macro
arguments in read_etm4x_sysreg_offset dependent on __builtin_constant_p.

Link: https://github.com/ClangBuiltLinux/linux/issues/1310
Reported-by: Arnd Bergmann <arnd@kernel.org>
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Suggested-by: Tao Zhang <quic_taozha@quicinc.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v4 -> v5:
* Also change etm4x_relaxed_write32, etm4x_relaxed_write64,
  etm4x_read32, and etm4x_read64 as per Suzuki.
* Fix some typos in commit message.
* Add Arnd's reported-by tag.
* Reformat with `git-clang-format HEAD~` since the new fn's have long
  identifiers.
* Wrap the error message in the commit message.

V4 (Nick):
https://lore.kernel.org/llvm/20220614220229.1640085-1-ndesaulniers@google.com/
V3 (Tao):
https://lore.kernel.org/lkml/1632652550-26048-1-git-send-email-quic_taozha@quicinc.com/
V2 (Arnd):
https://lore.kernel.org/lkml/20210429145752.3218324-1-arnd@kernel.org/
V1 (Arnd):
https://lore.kernel.org/lkml/20210225094324.3542511-1-arnd@kernel.org/


 .../coresight/coresight-etm4x-core.c          | 104 +++++++++++-------
 1 file changed, 65 insertions(+), 39 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 87299e99dabb..f5391d33dd4d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -423,14 +423,18 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	if (drvdata->nr_pe_cmp)
 		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
 	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
+		csdev_access_relaxed_write32(csa, config->seq_ctrl[i],
+					     TRCSEQEVRn(i));
 	etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
 	etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
 	etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
 	for (i = 0; i < drvdata->nr_cntr; i++) {
-		etm4x_relaxed_write32(csa, config->cntrldvr[i], TRCCNTRLDVRn(i));
-		etm4x_relaxed_write32(csa, config->cntr_ctrl[i], TRCCNTCTLRn(i));
-		etm4x_relaxed_write32(csa, config->cntr_val[i], TRCCNTVRn(i));
+		csdev_access_relaxed_write32(csa, config->cntrldvr[i],
+					     TRCCNTRLDVRn(i));
+		csdev_access_relaxed_write32(csa, config->cntr_ctrl[i],
+					     TRCCNTCTLRn(i));
+		csdev_access_relaxed_write32(csa, config->cntr_val[i],
+					     TRCCNTVRn(i));
 	}
 
 	/*
@@ -438,29 +442,37 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	 * such start at 2.
 	 */
 	for (i = 2; i < drvdata->nr_resource * 2; i++)
-		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
+		csdev_access_relaxed_write32(csa, config->res_ctrl[i],
+					     TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		/* always clear status bit on restart if using single-shot */
 		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
 			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
-		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
-		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
+		csdev_access_relaxed_write32(csa, config->ss_ctrl[i],
+					     TRCSSCCRn(i));
+		csdev_access_relaxed_write32(csa, config->ss_status[i],
+					     TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
-			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
+			csdev_access_relaxed_write32(csa, config->ss_pe_cmp[i],
+						     TRCSSPCICRn(i));
 	}
 	for (i = 0; i < drvdata->nr_addr_cmp; i++) {
-		etm4x_relaxed_write64(csa, config->addr_val[i], TRCACVRn(i));
-		etm4x_relaxed_write64(csa, config->addr_acc[i], TRCACATRn(i));
+		csdev_access_relaxed_write64(csa, config->addr_val[i],
+					     TRCACVRn(i));
+		csdev_access_relaxed_write64(csa, config->addr_acc[i],
+					     TRCACATRn(i));
 	}
 	for (i = 0; i < drvdata->numcidc; i++)
-		etm4x_relaxed_write64(csa, config->ctxid_pid[i], TRCCIDCVRn(i));
+		csdev_access_relaxed_write64(csa, config->ctxid_pid[i],
+					     TRCCIDCVRn(i));
 	etm4x_relaxed_write32(csa, config->ctxid_mask0, TRCCIDCCTLR0);
 	if (drvdata->numcidc > 4)
 		etm4x_relaxed_write32(csa, config->ctxid_mask1, TRCCIDCCTLR1);
 
 	for (i = 0; i < drvdata->numvmidc; i++)
-		etm4x_relaxed_write64(csa, config->vmid_val[i], TRCVMIDCVRn(i));
+		csdev_access_relaxed_write64(csa, config->vmid_val[i],
+					     TRCVMIDCVRn(i));
 	etm4x_relaxed_write32(csa, config->vmid_mask0, TRCVMIDCCTLR0);
 	if (drvdata->numvmidc > 4)
 		etm4x_relaxed_write32(csa, config->vmid_mask1, TRCVMIDCCTLR1);
@@ -836,13 +848,13 @@ static void etm4_disable_hw(void *info)
 	/* read the status of the single shot comparators */
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		config->ss_status[i] =
-			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
+			csdev_access_relaxed_read32(csa, TRCSSCSRn(i));
 	}
 
 	/* read back the current counter values */
 	for (i = 0; i < drvdata->nr_cntr; i++) {
 		config->cntr_val[i] =
-			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
+			csdev_access_relaxed_read32(csa, TRCCNTVRn(i));
 	}
 
 	coresight_disclaim_device_unlocked(csdev);
@@ -1177,7 +1189,7 @@ static void etm4_init_arch_data(void *info)
 	drvdata->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		drvdata->config.ss_status[i] =
-			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
+			csdev_access_relaxed_read32(csa, TRCSSCSRn(i));
 	}
 	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
 	drvdata->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
@@ -1615,31 +1627,33 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	state->trcvdarcctlr = etm4x_read32(csa, TRCVDARCCTLR);
 
 	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
+		state->trcseqevr[i] = csdev_access_read32(csa, TRCSEQEVRn(i));
 
 	state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
 	state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
 	state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
 
 	for (i = 0; i < drvdata->nr_cntr; i++) {
-		state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
-		state->trccntctlr[i] = etm4x_read32(csa, TRCCNTCTLRn(i));
-		state->trccntvr[i] = etm4x_read32(csa, TRCCNTVRn(i));
+		state->trccntrldvr[i] =
+			csdev_access_read32(csa, TRCCNTRLDVRn(i));
+		state->trccntctlr[i] = csdev_access_read32(csa, TRCCNTCTLRn(i));
+		state->trccntvr[i] = csdev_access_read32(csa, TRCCNTVRn(i));
 	}
 
 	for (i = 0; i < drvdata->nr_resource * 2; i++)
-		state->trcrsctlr[i] = etm4x_read32(csa, TRCRSCTLRn(i));
+		state->trcrsctlr[i] = csdev_access_read32(csa, TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		state->trcssccr[i] = etm4x_read32(csa, TRCSSCCRn(i));
-		state->trcsscsr[i] = etm4x_read32(csa, TRCSSCSRn(i));
+		state->trcssccr[i] = csdev_access_read32(csa, TRCSSCCRn(i));
+		state->trcsscsr[i] = csdev_access_read32(csa, TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
-			state->trcsspcicr[i] = etm4x_read32(csa, TRCSSPCICRn(i));
+			state->trcsspcicr[i] =
+				csdev_access_read32(csa, TRCSSPCICRn(i));
 	}
 
 	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
-		state->trcacvr[i] = etm4x_read64(csa, TRCACVRn(i));
-		state->trcacatr[i] = etm4x_read64(csa, TRCACATRn(i));
+		state->trcacvr[i] = csdev_access_read64(csa, TRCACVRn(i));
+		state->trcacatr[i] = csdev_access_read64(csa, TRCACATRn(i));
 	}
 
 	/*
@@ -1650,10 +1664,10 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	 */
 
 	for (i = 0; i < drvdata->numcidc; i++)
-		state->trccidcvr[i] = etm4x_read64(csa, TRCCIDCVRn(i));
+		state->trccidcvr[i] = csdev_access_read64(csa, TRCCIDCVRn(i));
 
 	for (i = 0; i < drvdata->numvmidc; i++)
-		state->trcvmidcvr[i] = etm4x_read64(csa, TRCVMIDCVRn(i));
+		state->trcvmidcvr[i] = csdev_access_read64(csa, TRCVMIDCVRn(i));
 
 	state->trccidcctlr0 = etm4x_read32(csa, TRCCIDCCTLR0);
 	if (drvdata->numcidc > 4)
@@ -1744,38 +1758,50 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4x_relaxed_write32(csa, state->trcvdarcctlr, TRCVDARCCTLR);
 
 	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
+		csdev_access_relaxed_write32(csa, state->trcseqevr[i],
+					     TRCSEQEVRn(i));
 
 	etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
 	etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
 	etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
 
 	for (i = 0; i < drvdata->nr_cntr; i++) {
-		etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
-		etm4x_relaxed_write32(csa, state->trccntctlr[i], TRCCNTCTLRn(i));
-		etm4x_relaxed_write32(csa, state->trccntvr[i], TRCCNTVRn(i));
+		csdev_access_relaxed_write32(csa, state->trccntrldvr[i],
+					     TRCCNTRLDVRn(i));
+		csdev_access_relaxed_write32(csa, state->trccntctlr[i],
+					     TRCCNTCTLRn(i));
+		csdev_access_relaxed_write32(csa, state->trccntvr[i],
+					     TRCCNTVRn(i));
 	}
 
 	for (i = 0; i < drvdata->nr_resource * 2; i++)
-		etm4x_relaxed_write32(csa, state->trcrsctlr[i], TRCRSCTLRn(i));
+		csdev_access_relaxed_write32(csa, state->trcrsctlr[i],
+					     TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		etm4x_relaxed_write32(csa, state->trcssccr[i], TRCSSCCRn(i));
-		etm4x_relaxed_write32(csa, state->trcsscsr[i], TRCSSCSRn(i));
+		csdev_access_relaxed_write32(csa, state->trcssccr[i],
+					     TRCSSCCRn(i));
+		csdev_access_relaxed_write32(csa, state->trcsscsr[i],
+					     TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
-			etm4x_relaxed_write32(csa, state->trcsspcicr[i], TRCSSPCICRn(i));
+			csdev_access_relaxed_write32(csa, state->trcsspcicr[i],
+						     TRCSSPCICRn(i));
 	}
 
 	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
-		etm4x_relaxed_write64(csa, state->trcacvr[i], TRCACVRn(i));
-		etm4x_relaxed_write64(csa, state->trcacatr[i], TRCACATRn(i));
+		csdev_access_relaxed_write64(csa, state->trcacvr[i],
+					     TRCACVRn(i));
+		csdev_access_relaxed_write64(csa, state->trcacatr[i],
+					     TRCACATRn(i));
 	}
 
 	for (i = 0; i < drvdata->numcidc; i++)
-		etm4x_relaxed_write64(csa, state->trccidcvr[i], TRCCIDCVRn(i));
+		csdev_access_relaxed_write64(csa, state->trccidcvr[i],
+					     TRCCIDCVRn(i));
 
 	for (i = 0; i < drvdata->numvmidc; i++)
-		etm4x_relaxed_write64(csa, state->trcvmidcvr[i], TRCVMIDCVRn(i));
+		csdev_access_relaxed_write64(csa, state->trcvmidcvr[i],
+					     TRCVMIDCVRn(i));
 
 	etm4x_relaxed_write32(csa, state->trccidcctlr0, TRCCIDCCTLR0);
 	if (drvdata->numcidc > 4)

base-commit: 399bd66e219e331976fe6fa6ab81a023c0c97870
-- 
2.37.0.rc0.104.g0611611a94-goog

