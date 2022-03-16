Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A263B56
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:31:22 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2d726bd83a2so29161167b3.20
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=DuIs8YDVZ+FUMK/eJrsH1Ol6kQ1ErHXTTPKm8dwtCDY=;
        b=qFM55vPPyVaTFZa6kKJVrPMllDMUjRNpqwlMmOmDcPlqGqlZnRgFm90OQ/CO08cIMI
         ozQ/bQaFkgY6tBLchUOHwG5cpuV7XQUp3DlFqSxMoJeo9HYsXFotdyInje2ISR96cYQN
         LM45pBenpgqvAz7wiBXGrQYNTwXSy3N/8foxmJA9QcViS2Q9E6oQbYNGbEyzrl3kPKe5
         Vdth5nPe7IUQq+DLP6KJoLdgGYAdZGyuoOQivb0qDhbjrTGKvlrUlVSe4MOpDj6YjYSZ
         sglDm0vtSzTiuyLqNmx0vUupCP0818ajsmD+wSomc8LH3tydX+mZ9Y7CoJJyg/Og5Y/P
         i6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=DuIs8YDVZ+FUMK/eJrsH1Ol6kQ1ErHXTTPKm8dwtCDY=;
        b=2AyVjZhfQ5bdF1Rse6pS6+w7ZBvKyZznm6y5U+Heg8i64V2WnJIvnXeyUt7E1rrKO/
         lpvKNj8o6ll3sf7UkRKP54zq3NL6X7JWnetRhdPXRXjA7YDze7Vcs83buV7+vS5B7vpL
         gsLa/s/g3gCQKCmD1XKipmseuq5f651qfx/OlcoWVn392zkayPrhyHaOl9GgSc3bZV5S
         NGl1USXT48Vv8cldJX4bvGdUP5ENU58MQJMMfPMfBRcapbqpVmEA4tyhhO2lUeMs26Qf
         0kkQDM51JxIYKePoeOz7CKBKjZU/45IDuB7j8Ybzvuj6bLDxZYZpUzJkXwNemo8Js6NG
         z3fw==
X-Gm-Message-State: AOAM532OXySYd706NpIn9zneu1QXrCWfNjTRBj2Ji3zOFhJTJDUVDpwq
	ZNp7YgBaPjYZwxFwIavEIA6WVs1p
X-Google-Smtp-Source: ABdhPJxlpI62VPESYGOV1YEH34zeiz353mKPg634ySFjExFhciP8pMKE9Jokvx3Dw4zKp9xShXZvESy+gQ==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a0d:d50f:0:b0:2e5:bada:3948 with SMTP id
 x15-20020a0dd50f000000b002e5bada3948mr939764ywd.314.1647466281406; Wed, 16
 Mar 2022 14:31:21 -0700 (PDT)
Date: Wed, 16 Mar 2022 14:31:18 -0700
Message-Id: <20220316213118.2352683-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
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
updates the format character to the correct ones for ints and unsigned
ints.

Link: ClangBuiltLinux/linux#378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/soc/qcom/smem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index e2057d8f1eff..a98b5f395d15 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
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
2.35.1.723.g4982287a31-goog

