Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAA16AA3
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 23:24:19 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id a17-20020a170902ecd100b0016c012c4cf3so4615493plh.15
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 16:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=F0fFIAEea6XvRD5n1PAysRjm9A6hwPjkRJP2PMLf7zQ=;
        b=sCVKm48mz9thFPGiNjebj0f8Ux4GHLmdUiWrS5kfCfL7Skr7uUpfr7BCOZeTmn5G/q
         l4q/M5QlFd9IjG111yuY+KY+3tkSuhKAMd++FE4a6dm8KwA+Xu+cDNQIqm2v7Ktc1H7X
         cgaHSVeIKa/TrMlyRILF+DLaQhCQFDTPfjTwHGQTrD31hw5XI56K6ANsyMRI17TISxPu
         lKy3I3qWsmop7UvoliD1b2lAxEItNWmXCgUY5mTyI2hoBVvOtBmM6WASGpGxuDcgihZB
         OEbIY9duvztNj5VbFLdgpBm3DelWHxpS+MbfmeswjLA1Atu0KvuIiqe9jNUhtf1zfnpw
         SV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=F0fFIAEea6XvRD5n1PAysRjm9A6hwPjkRJP2PMLf7zQ=;
        b=RFW7H34bCGMKJlPJnjunEeB3kLjvwhWFLRFqI922C9MQ2NxpQ7EYrGdkE1cjaGQx6H
         9BX1sn/TaK1INkcyY4Ca2j58dc+DcPl/8O15xw9gR5ea5FGGO0+y9DjuAXualLWZICiX
         I1Q9+8HV5n7BLWuIKdGjWG97Bm2cSvVmdWtnyW57rEUx9X41AxJEwOBjwIOIWqV7EMcz
         46svgCMvm+ZrpC1jpXfBD8zdgd3gH7i+EImiFiC5np0oFcVMCf4e8852irfUMwzfaXWc
         Z8+kznoHeqcM71pcKC4BKnSxB0EikDUOiJyp320TJOcpKOEl1kX1IA48IHX/4+MJBJ+G
         FN2w==
X-Gm-Message-State: AJIora/FGSWJjJDLADX+awuO76o94meMsX+hvtUQHAuI4od75dIZ78md
	zdQsvjmdVMtz6zdTOVWzOv7ID92Z4naD9EQJYw==
X-Google-Smtp-Source: AGRyM1urqIouEsnUe5KdWsxfF/hyxCnwf9BX7/8Ikk+sg+vUOJng3563UFtUsVQar7sVaOqBBGg/XKztAe8jRDsNPA==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4bd0:f760:5332:9f1c])
 (user=justinstitt job=sendgmr) by 2002:a05:6a00:1946:b0:52a:e551:2241 with
 SMTP id s6-20020a056a00194600b0052ae5512241mr1307184pfk.29.1657581859475;
 Mon, 11 Jul 2022 16:24:19 -0700 (PDT)
Date: Mon, 11 Jul 2022 16:24:04 -0700
Message-Id: <20220711232404.2189257-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] qlogic: qed: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Ariel Elior <aelior@marvell.com>, Manish Chopra <manishc@marvell.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter these warnings:
| drivers/net/ethernet/qlogic/qed/qed_dev.c:416:30: error: format
| specifies type 'char' but the argument has type 'u32' (aka 'unsigned
| int') [-Werror,-Wformat] i);
-
| drivers/net/ethernet/qlogic/qed/qed_dev.c:630:13: error: format
| specifies type 'char' but the argument has type 'int' [-Werror,-Wformat]
| p_llh_info->num_ppfid - 1);

For the first warning, `i` is a u32 which is much wider than the format
specifier `%hhd` describes. This results in a loss of bits after 2^7.

The second warning involves implicit integer promotion as the resulting
type of addition cannot be smaller than an int.

example:
``
uint8_t a = 4, b = 7;
int size = sizeof(a + b - 1);
printf("%d\n", size);
// output: 4
```

See more:
(https://wiki.sei.cmu.edu/confluence/display/c/INT02-C.+Understand+integer+conversion+rules)
"Integer types smaller than int are promoted when an operation is
performed on them. If all values of the original type can be represented
as an int, the value of the smaller type is converted to an int;
otherwise, it is converted to an unsigned int."

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index 672480c9d195..d61cd32ec3b6 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -412,7 +412,7 @@ static int qed_llh_alloc(struct qed_dev *cdev)
 			continue;
 
 		p_llh_info->ppfid_array[p_llh_info->num_ppfid] = i;
-		DP_VERBOSE(cdev, QED_MSG_SP, "ppfid_array[%d] = %hhd\n",
+		DP_VERBOSE(cdev, QED_MSG_SP, "ppfid_array[%d] = %u\n",
 			   p_llh_info->num_ppfid, i);
 		p_llh_info->num_ppfid++;
 	}
@@ -626,7 +626,7 @@ static int qed_llh_abs_ppfid(struct qed_dev *cdev, u8 ppfid, u8 *p_abs_ppfid)
 
 	if (ppfid >= p_llh_info->num_ppfid) {
 		DP_NOTICE(cdev,
-			  "ppfid %d is not valid, available indices are 0..%hhd\n",
+			  "ppfid %d is not valid, available indices are 0..%d\n",
 			  ppfid, p_llh_info->num_ppfid - 1);
 		*p_abs_ppfid = 0;
 		return -EINVAL;
-- 
2.37.0.144.g8ac04bfd2-goog

