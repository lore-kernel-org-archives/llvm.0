Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17DD63E
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 17:49:18 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2d81518795fso130650847b3.0
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=EfaFOAjTPM5RAgOXYIyeEo3JBWHCWxVtr2STLBqFs7s=;
        b=XezFlHzxJB2Eg24lT23dIi1UOjH1SC9rD0AzLHQc2tEXmBwhaht9zUDBLON/lvPCV5
         1Fil2ITDxsCx+153W6MRIKG+umsGpiiTtrYdo/8ZyKWAo46J2d+bahS1RLgek8hSC5II
         o2ZCDXsnbEykSiI56nnXDAlXYMojAtIhDCFEj2q5sYXVBewtjVbi/en0173Y+6ColLQj
         tofapO3SyQtYiF7Wu9go37pUalfBIrD1sxIv9WFQsjNQflLO6iiwKmpo+YdbkTW5N/su
         vvQ8zjGqb63uA+vmD7NDG0fG5Mq3/PH1q4r+YMCr3FBln0C55ceInba9U9VUyapfDVCh
         xHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EfaFOAjTPM5RAgOXYIyeEo3JBWHCWxVtr2STLBqFs7s=;
        b=PSvIC5fPOdbnE/7tspfijfz6Z3k6sXeNxcgCKLJysTcQXid8w+Q8MWCK6cpalFZDXh
         oraCPIZVZHWnfRORF5yEgG9NWtmqQxjfm3J5PIGHtVemEP1N0puIBc/zUAV88K1sy2fX
         KTydnbCadt/EYSpMGj9WcFXWzmpDwgyhFV44bXG6x090Fbqn35z12Exk3UawCTvzPQV4
         VcAssRpkKs7je39sDmRbL2/V+2CGgi9oHn4hyTstLbSQwiHFKgqZGB+kjNBU6ARHBfax
         tqH+LeeM2a0VKEGwZKO93u7f3HM9z0fcRhps+wRGtquLPUEOHtgbLBOI+F6avqP20ScD
         N5EA==
X-Gm-Message-State: AOAM530zB6hwbMz6T/AdClpzXYZ4tKve1e4s80HNlWSB1DM5hGq3g6eg
	lDc0E13p9dMKZU0YhItYh/Nb7Uv/
X-Google-Smtp-Source: ABdhPJzXwGBbgCHT+vdwAS30l2sFHl+TVGAD3H33rlJfbVU9f5mzjAhSlqZjPldQ38H+fdwgEfRJ+m69AQ==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:27bd:2eea:bd8:2ea5])
 (user=morbo job=sendgmr) by 2002:a25:2043:0:b0:633:6cee:4aee with SMTP id
 g64-20020a252043000000b006336cee4aeemr22966645ybg.628.1647884957542; Mon, 21
 Mar 2022 10:49:17 -0700 (PDT)
Date: Mon, 21 Mar 2022 10:49:12 -0700
In-Reply-To: <20220316213118.2352683-1-morbo@google.com>
Message-Id: <20220321174912.164113-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220316213118.2352683-1-morbo@google.com>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Subject: [PATCH] soc: qcom: smem: use correct format characters
From: Bill Wendling <morbo@google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warnings:

drivers/soc/qcom/smem.c:847:41: warning: format specifies type 'unsigned
short' but the argument has type 'unsigned int' [-Wformat]
                        dev_err(smem->dev, "bad host %hu\n", remote_host);
                                                     ~~~     ^~~~~~~~~~~
                                                     %u
./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
        dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                               ~~~     ^~~~~~~~~~~
./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                _p_func(dev, fmt, ##__VA_ARGS__);                       \
                             ~~~    ^~~~~~~~~~~
drivers/soc/qcom/smem.c:852:47: warning: format specifies type 'unsigned
short' but the argument has type 'unsigned int' [-Wformat]
                        dev_err(smem->dev, "duplicate host %hu\n", remote_host);
                                                           ~~~     ^~~~~~~~~~~
                                                           %u
./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
        dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                               ~~~     ^~~~~~~~~~~
./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                _p_func(dev, fmt, ##__VA_ARGS__);                       \
                             ~~~    ^~~~~~~~~~~

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct one and change type of
remote_host to "u16" to match with other types.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/soc/qcom/smem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index e2057d8f1eff..9dd325df5682 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -819,7 +819,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 	struct smem_partition_header *header;
 	struct smem_ptable_entry *entry;
 	struct smem_ptable *ptable;
-	unsigned int remote_host;
+	u16 remote_host;
 	u16 host0, host1;
 	int i;
 
@@ -844,12 +844,12 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 			continue;
 
 		if (remote_host >= SMEM_HOST_COUNT) {
-			dev_err(smem->dev, "bad host %hu\n", remote_host);
+			dev_err(smem->dev, "bad host %u\n", remote_host);
 			return -EINVAL;
 		}
 
 		if (smem->partitions[remote_host]) {
-			dev_err(smem->dev, "duplicate host %hu\n", remote_host);
+			dev_err(smem->dev, "duplicate host %u\n", remote_host);
 			return -EINVAL;
 		}
 
-- 
2.35.1.894.gb6a874cedc-goog

