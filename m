Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8FFDDB7
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 22:21:53 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-583d1d0de65so64334827b3.0
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 15:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692051712; x=1692656512;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RTWgDCbnFUgO1HWtlSj6vfjNh6uEFztFcnKIx6cL6BQ=;
        b=aW5BiVb0BJerVlOUuQqirDiDzgsZOv/UGtud9s1nPzNjzQMSVCZIWC96olVT8c4dzb
         LkNm1Un2nV5Eah5qtCvSQVtmzHVOjS51wtSCIMrXGor5zQ1o9c/H3Ldi2GRceNBh1hik
         /pffbkFEpqrhPoGr/TaKHqfeMWiBn18IrUyykEXvELpcY68P3h6/xa89ub5eRoXX9TpA
         KRX1oqhdxs3AAMAlBDwuwJlLp6Dy0qQi9PU9YFwrhAtUypZpLSYkl+UrwbWV8tdxbK6E
         fY4aALzUB3BTpApo6XaeosKZjR8+dahf5ULD575DA7OnVPMJlf/WRyCYYENFCFrjNL1d
         2G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692051712; x=1692656512;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTWgDCbnFUgO1HWtlSj6vfjNh6uEFztFcnKIx6cL6BQ=;
        b=XInLI/ntb/Q5uMMs3UgiEtYF5HD6sgUEv+K8Vj9clCjjDu2DlbXgGkRbksOL2HPfq6
         2nRaeZ8PvrpEaM8kX3p2B9WDKKcn6vkNrC6P3u/GWVW6uFl3iDcpaQBfkRE4FZRhXYCC
         d3J3wmdgCgJpEoa3uOb6NoEZPBhpsRQptJnSswJZ/cwIK62R119nxN+HgaNlwY1bsEFi
         rnGk78EP68ubhgGxwWs0/IsYl1eM23u8EFhUyTyO56+45JSXIvkTAU946PBFQBtvwUWF
         hS8mPZe1qu2yCzKW59nZP92OoyH71FO3xRBbz7PIwS2YPp/tsG9M4A/xLpvrUDIPOCwq
         VR5Q==
X-Gm-Message-State: AOJu0Yw0YneDOSF8ZaoJCh25RDlFpj+SM4AUF2KC+6Jy+WF0PrKlr8y3
	YMHYpU8+MR2rQd0ErT8chOgKGuh0NHoD9YiZNw==
X-Google-Smtp-Source: AGHT+IGUgCbq7vkRnFlWVMmgA0rhj2KZXb4OGaK48ZEofd8nevbwEQv6l0sLR8RgIqA4jQWqYXPdgCPYAfJ7Gpvt3g==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:ae65:0:b0:56f:f62b:7a11 with SMTP
 id g37-20020a81ae65000000b0056ff62b7a11mr149484ywk.8.1692051712685; Mon, 14
 Aug 2023 15:21:52 -0700 (PDT)
Date: Mon, 14 Aug 2023 22:21:51 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP6o2mQC/y2NwQqDQAxEf0VybsDdSl38ldKD7CY1F1cS2Qriv
 zeU3ubNg5kTjFTIYOpOUGpiUleHcOsgL/P6JpTiDLGP9z6FAVuVgkWlkRpu9UOKSkY7Njo2T/+ yMmOex0ccUsocGHzQNcvxO3u+rusLXOcftHwAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692051711; l=1670;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=mDCmp0Hqg8EtlQGDIRB0W9nWt/W1QOLsyus7HkWaU74=; b=tywnHn/ERnLM9VIFtrhcr3oDmTExX8AP4yrHSMg6fIibovmNBnUJxcxLIW2tk1NeK0mKTMw23
 5cQft0dFY2NCIrWine0ndcJlpEkG6vXZKKtD0o/ILix3ztfjyGjRaON
X-Mailer: b4 0.12.3
Message-ID: <20230814-void-drivers-power-reset-vexpress-poweroff-v1-1-c3d9b0107e5d@google.com>
Subject: [PATCH] power: vexpress: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Sebastian Reichel <sre@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|       drivers/power/reset/vexpress-poweroff.c:124:10: warning: cast to smaller integer type 'enum vexpress_reset_func' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         124 |         switch ((enum vexpress_reset_func)match->data) {

This is due to the fact that `match->data` is a void* while `enum vexpress_reset_func`
has the size of an int. This leads to truncation and possible data loss.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: In this case, it seems unlikely that any data loss is occurring
since `enum vexpress_reset_func` only has a few fields enumerated from 0.
---
 drivers/power/reset/vexpress-poweroff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/reset/vexpress-poweroff.c b/drivers/power/reset/vexpress-poweroff.c
index 447ffdacddf9..17064d7b19f6 100644
--- a/drivers/power/reset/vexpress-poweroff.c
+++ b/drivers/power/reset/vexpress-poweroff.c
@@ -121,7 +121,7 @@ static int vexpress_reset_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	dev_set_drvdata(&pdev->dev, regmap);
 
-	switch ((enum vexpress_reset_func)match->data) {
+	switch ((uintptr_t)match->data) {
 	case FUNC_SHUTDOWN:
 		vexpress_power_off_device = &pdev->dev;
 		pm_power_off = vexpress_power_off;

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230814-void-drivers-power-reset-vexpress-poweroff-ca762488cf1f

Best regards,
--
Justin Stitt <justinstitt@google.com>

