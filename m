Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8FE3C0C
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 20:55:59 +0000 (UTC)
Received: by mail-ua1-f74.google.com with SMTP id x36-20020ab048a7000000b003b6287beda5so3676237uac.13
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=uR2BlBWxNwDXVN8KePRFZ054d83TeFIdqVCYAABhYhE=;
        b=KNxgHGMC5WX5o28iqf/s0dskwm5mmsxJ0wZRSSxynx4xdtWEgEz4Flo8Cw99zS5s5s
         KAgUjuccBs2bLOd+3qcCyeG9WsVLDIBdnmLU4P4jHYoMtXT6Phl4Z4EUd4Dvui5ye1K7
         XDHlIbQoqA3IcdUsiiZKKxznchTLyYiYmaH5m2Vpp0C5T47szsZiVlY0XKyreM127+RP
         vUY8sBQZx279lJcP8CQYOAXLV3rSP1srdtBWVGET+LZpJPkv0Mg+V7WNt997ptz2QJLh
         9kDaguBL6H0iTkRLN4T0gz+ptaMbOH5YcxaupcZmV+Vox7o6ANx6jw7gZsCWJSBZ4lMQ
         ZFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=uR2BlBWxNwDXVN8KePRFZ054d83TeFIdqVCYAABhYhE=;
        b=YdAsASrbd7wElQtwj435ROgQBcBKlRBxHrSywtKuhzcjNWL7vSTVDJLXaKf2Ec5lWE
         y2pEYVtjmWETYSzGQl7XdYJC2o48+wntMuulLvQG+Jqw9s7uwFA4wVupEu6atLGl0n36
         bwc0oQPFefFWYMnndCBDLAQtTsP7KlmD8XqRowcOq3zjy5QrZUI0ycE+iXTxySousgT4
         H1JT5NbGqdGp902LflyzYr1YoE/k+EsA4VXx7Ws4yw2p6UCZxSRsFmBLUpmsen64RMoL
         WactQ4JsX3nDme0dxQTeEevMzJk0bPzLlAoppo0RHqMcjnOqk/W6nCUj0CuMxkPVtEpy
         IB6A==
X-Gm-Message-State: ACgBeo2UxyB0tEekYVnAg/buGEdpIVjAKvvNNVquXyuygxQU5B0VfrTm
	VOUjRZzGofZr39oH0nTbMQx7pRA2vA==
X-Google-Smtp-Source: AA6agR6BKp9O4/iCA7qsoXlt+ctid4gFcnrvB+lLTtzXiws1cBAzJPZ8bBFJc6NV4pZunK7Q1bkvTIRxbQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:b40a:0:b0:3a2:5af2:4750 with SMTP id
 d10-20020a1fb40a000000b003a25af24750mr3582947vkf.0.1663102558921; Tue, 13 Sep
 2022 13:55:58 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:55 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205555.155149-1-nhuck@google.com>
Subject: [PATCH] drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Sandy Huang <hjc@rock-chips.com>, "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
				     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cdn_dp_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index c204e9b95c1f..518ee13b1d6f 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -283,8 +283,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
-				       struct drm_display_mode *mode)
+static enum drm_mode_status
+cdn_dp_connector_mode_valid(struct drm_connector *connector,
+			    struct drm_display_mode *mode)
 {
 	struct cdn_dp_device *dp = connector_to_dp(connector);
 	struct drm_display_info *display_info = &dp->connector.display_info;
-- 
2.37.2.789.g6183377224-goog

