Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2A3C0C
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 20:55:48 +0000 (UTC)
Received: by mail-ua1-f73.google.com with SMTP id s6-20020a9f2986000000b003b3e759ed1aso3947080uas.14
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 13:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=B2mqYDiaNl85Fwjyeejod1j2C23kkV3KpQaZ/IDd3G0=;
        b=n5/3ZUe5YW7iVEaFTC1C/QTXggGwKQwtjWMw3jPI0BgMfRYYaenAHMYA7hmpH78woh
         lZrsAverREXV5LS1eNSZiEiLKiM+JXW0zOmxWAdX3LhCwLd9Qf/j9Y5hHtz2sPDqVpOO
         3LE27kbTv/4DXc2cgdQMCkC3yessqW+eRLrKkgNWQ+Ghdk/GB4Xyotg4WWPaHI8nr0ZJ
         DFR3Zt4imBoTKoWRLhRctbaodxm4ndTXJF9eHcqbrD4UR0gehFkZtZ22JU5AJxGutNXu
         2/qLLlTx4A77Jsxp0TXTu22DWntV2xma0eZbyML/CoROivz9n2Cnhwlejron+u+9bLkh
         E7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=B2mqYDiaNl85Fwjyeejod1j2C23kkV3KpQaZ/IDd3G0=;
        b=QIj9alCmnqTkCXfPHSwWOuKgQkGPFm21CP2JRlwCQxjeRj+bBTQAglHNAYXPvLllff
         jSjsHkYvTE/g4lytqFdWBGYAH6FqY7ERzxDw2PowCH3z4dJ48LwZE1NkycvlJjZDWJJF
         S+GkGzw1Dy4STKb4JZbBjCnIBS7UDbtmozYQIDVVSSiPr/49omCejcAiUzq4WfeBCBCJ
         3dYK1EFrZlbyqIxnI3HEyDqA9/Pn7dTt3Kt2B2kNbqf1MrdAXSEYDzIcYHc9saX5Dpap
         Wp4jxY+7w/g8WTDxLHu1v61lhCMlJG/nP+oibhbtUTEoax75Imxl3XuGJrFXcPl0biaL
         bt/A==
X-Gm-Message-State: ACgBeo3UMAPye4EWTXcIQTPuX3hgel5VURveT9B54+sGxokX32CMX0ZK
	iKetY8MlhxUaFsSOYv3nqxZ1hYw4EA==
X-Google-Smtp-Source: AA6agR6tnOJoQpNye/EaN3VzNTXwqOI2huVgh67Hj9kUaRNfdC+l6rBv/TSOXU4i5MQmCNQ7VhuyBZdcNQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a67:f6d5:0:b0:398:3cdb:3f99 with SMTP id
 v21-20020a67f6d5000000b003983cdb3f99mr9320922vso.85.1663102547645; Tue, 13
 Sep 2022 13:55:47 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:44 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205544.155106-1-nhuck@google.com>
Subject: [PATCH] drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of imx_tve_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/imx/imx-tve.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 6b34fac3f73a..ab4d1c878fda 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -218,8 +218,9 @@ static int imx_tve_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int imx_tve_connector_mode_valid(struct drm_connector *connector,
-					struct drm_display_mode *mode)
+static enum drm_mode_status
+imx_tve_connector_mode_valid(struct drm_connector *connector,
+			     struct drm_display_mode *mode)
 {
 	struct imx_tve *tve = con_to_tve(connector);
 	unsigned long rate;
-- 
2.37.2.789.g6183377224-goog

