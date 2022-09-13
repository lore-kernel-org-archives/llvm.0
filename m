Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39B3C0C
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 20:55:55 +0000 (UTC)
Received: by mail-ua1-f74.google.com with SMTP id a26-20020ab0081a000000b003b752547aadso2772945uaf.22
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 13:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
        b=MPz2hm1dNp3wtK0Q6VOZj4HijDeEPDlqtG4P+GnwI1ScUXpTtAiMFQURP2+l0rCUxA
         qmrDRKPBY9MbWm16lKVZvzyIUdJdDUkzzrXDRzHRTJ6GX/yvA5wXbbFrPXBsVfmK5Eo4
         9ogkCukA16YVJLYlQyC6GDCLXZsEW5Jth3oYNbG/63WjVVZ1gvealfQW8jCDjky728Oe
         PBJlPLftoNRA5YfGbbYdkSf/WXE0SzNerEGMYnvyd8sR0THOr0GsvrAeMrBEU6VKtlok
         /9MFSeRwtKp+B3qVEYRyAMqDCg2EYB4UlKeFmcJPYJLNDLU7NZi7lqkjGWIHLveewJpg
         hb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
        b=EKjAWD1hcBC0CesdMGjS9i1ulS/040uiObQ3PSF4obxCSRhZCNcVJsUc5yLoRbNO8B
         /FhDG0l4yo+fJRkT/OBZtUm3vQeUwzmrnbXwRr5ZykKgZTwpKJbY5a3Z2gm9zoptDdjU
         VGhqHxGYjmgqRWXYEx8vJfoHmFA72A0b4963noG529XK0VAYoJQR5RDc9GPKPDtrab96
         2wZgSNxV2Mic9stFle6U7hc24b301KM9rnoUVzM1usfXwTpl7BuBmu2K50C4fLIKLpCY
         9ZkmXrihSADTEurHBpBsu/tSweGZIq8Q6aRJBPA576ZJckrqodiNhmak7PQ9/SSZtLqg
         fmHA==
X-Gm-Message-State: ACgBeo1+q3rpnFV5fVXcSqf5orKqKIcKOSJwqibxaIRgO7iNwxOkRuul
	V9kgg5x/MxLRwu1/atybVUh0Kl15vw==
X-Google-Smtp-Source: AA6agR5NeheBAt2f63oLFPCmdLpznilELhZXE8PxzUyHeV2qLgMAkY7E8Tau4uJxbQ4Q64hU2nMVSO1q4Q==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2548:0:b0:3a2:5fbb:6485 with SMTP id
 l69-20020a1f2548000000b003a25fbb6485mr3366058vkl.18.1663102554926; Tue, 13
 Sep 2022 13:55:54 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:48 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205551.155128-1-nhuck@google.com>
Subject: [PATCH] drm/msm: Fix return type of mdp4_lvds_connector_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mdp4_lvds_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..7444b75c4215 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,8 +56,9 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
+static enum drm_mode_status
+mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
+			       struct drm_display_mode *mode)
 {
 	struct mdp4_lvds_connector *mdp4_lvds_connector =
 			to_mdp4_lvds_connector(connector);
-- 
2.37.2.789.g6183377224-goog

