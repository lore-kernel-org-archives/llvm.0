Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB46AB1
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 21:03:49 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31e6ca3d1efso23936507b3.9
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MypyzVZSccI/RyC46qp75Pb6XbMOH7vgHkqe/QUNPpo=;
        b=KGtiU3I1Yc2pPQ93b0InIC/VuuUUJbgRueIy0lePqllWiicPtHn7WKGz0btmVyk0nL
         aiESAnSPgMdxVpNrNxbm8kN8yCAVFNVcjTpucSpHAYSE/4g3cr+7PvvOcDS1S/WmdJX8
         1bAqIFb2pMUyuw6gH0P1UUR/bm+CYAqThTW+X12OC8EDQmew8lKXHz7R0gD25EtoIkQ4
         VUvy5J9eTKnl+OkrVTcPVKnTp4mJQs4yS7PHVCUCOqpffTDGby2D0gsUmTEr2m/Xa5Po
         7vSYyhpqZm4I52h3zF/v83BM8hHyPkWdvLqXeTCg1iWszKpT9akPaMxriel8j+qa6vNa
         3/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MypyzVZSccI/RyC46qp75Pb6XbMOH7vgHkqe/QUNPpo=;
        b=4qtU7I5yFCGZgywianwmgOKsEXOBmBsKLa/qIEMIhiwCo5BypqA9nOoMI9pDYRJkAj
         v9BAqTqLWByDnP40OqT9poXZ+gdWOddjYk0nCjKvEtdPrKyFWGPQYB8qkNZ18ypAmfgv
         ADM6vtfhrulheE3Km9lUZAfDy/NRg84GV3ycizupOx+iTNNHH4t9ofo8pnILvG8DZBI6
         enGONNikFY+m+u5bfLIll8xgxOBF8xrenY7Z897NHqwNtgjfabCfnm/JDyyZSH9GLXjs
         eq9raOh4Wt9VXTiVi8AfHr7ffUMGk5O+pJKe+c/xL6WhxnFQxdw5BadIHpCSMWR5nlVS
         5dYw==
X-Gm-Message-State: AJIora9VfUwhtCVjP7m9vTAWe94vZQ+4sUCC+i9kdV9SZP/k5/W5m6R/
	ryQdgZW7qxVuzAPSPh/S6vMynO20D/9L/N9D+A==
X-Google-Smtp-Source: AGRyM1sxwUS7zWxfuhFmDg/oyvsoaf1Wwexumse7I9VvtS1d218Qh2nHKoK4HZcdCT8xWr/B9mnpWLyMLY0auVLITw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:21e:d672:5a6a:420e])
 (user=justinstitt job=sendgmr) by 2002:a25:bd42:0:b0:670:be21:78a5 with SMTP
 id p2-20020a25bd42000000b00670be2178a5mr460245ybm.478.1658437428335; Thu, 21
 Jul 2022 14:03:48 -0700 (PDT)
Date: Thu, 21 Jul 2022 14:03:31 -0700
Message-Id: <20220721210331.4012015-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH] drivers: iommu: fix clang -wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>, Robin Murphy <robin.murphy@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter the following warning:
| drivers/iommu/msm_iommu.c:603:6: error: format specifies type 'unsigned
| short' but the argument has type 'int' [-Werror,-Wformat] sid);

`sid` is an int, use the proper format specifier `%x`.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Reported by Nathan here:
https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

 drivers/iommu/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 428919a474c1..6a24aa804ea3 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -599,7 +599,7 @@ static int insert_iommu_master(struct device *dev,
 
 	for (sid = 0; sid < master->num_mids; sid++)
 		if (master->mids[sid] == spec->args[0]) {
-			dev_warn(dev, "Stream ID 0x%hx repeated; ignoring\n",
+			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
 				 sid);
 			return 0;
 		}
-- 
2.37.1.359.gd136c6c3e2-goog

