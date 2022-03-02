Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4292D3FF4
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 17:53:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 19so1373003wmy.3
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 09:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=taNgSNhxg9N3wuTnv3IGzP0mdXY6UY0XfdCeGrzzq/Y=;
        b=MgdlIRTOp3YlTZro6MDHiqoujLSrj5MfJzYocJ8habuXr4dd7A+9HWsTXgmUqkUDKj
         B+KlGC7CX4dNJEmCGUW6RsuGT8E4BnyUpel1kJSl++W7adCyJVb5p+aeR7AX4C1ZmRM4
         3fcnbrJCwK8e+W/JbX03L1TJgDn2p58e7QNwYw1sXgL3BcOmLKAIIMGbInu/i8G7LuT5
         OS3+Py294/wKRO+5C/kjCtdQuVI8q1hsAakQVOIMWsefbncBSBvFyAmp5i0Mx/z/tqsE
         7N2Jaxf7/thUWkB6H3rf8Nj+7v1ARGUa4V8YCGkRYFPZZnI/TnrCKqsZL2Bu01dJ6UIL
         QF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=taNgSNhxg9N3wuTnv3IGzP0mdXY6UY0XfdCeGrzzq/Y=;
        b=KfJufPwR9xVI6KjzMMv0itshbBX6ruZGZ8h7y49545S8TFlL5UXx5CYgUNrfVnYm3A
         51Tsq1YaVlcPUEt2gA5uMYj8XgF07FMzs45zgLca64c2fuuz83cLFmjrZmjZWLVsZsm0
         esi31hF1ddrAx7upBQyghi84plX9iWpjiB1hd83mmmKb9jPTbO4v4MbIsQOKeoAEDdgJ
         HU6Qji4xX2LuHCPdVdt7vbcyVK6SyupwAGp77B8CeCdQkLcLH+0nHuVcH9ga58cmBBuv
         fKyS35MJCHBN36Iknmj/U2DBA2VataACtP5dy2rogCFkMFGnqLyKAlj9Y2Wf3TDTfxOr
         +23w==
X-Gm-Message-State: AOAM531gxD3guy9R3R9D/hbtakMAnAyOQlmb8t9ESDIHENzX1Zmxaem6
	EB1CsNN4jc5z/fQSxqkxlJQ=
X-Google-Smtp-Source: ABdhPJwJ1bg/pYRWnDLXycY6T/eklZz3ePlRz0PnU/mgJ05UV7us4cJ8RzjeoXgqSrrMoxBQk4H6rg==
X-Received: by 2002:a05:600c:2e54:b0:380:d3c8:ef33 with SMTP id q20-20020a05600c2e5400b00380d3c8ef33mr737901wmf.69.1646243590547;
        Wed, 02 Mar 2022 09:53:10 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d590f000000b001f04b96f9a9sm19510wrd.42.2022.03.02.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 09:53:09 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH][next] drm: ssd130x: remove redundant initialization of pointer mode
Date: Wed,  2 Mar 2022 17:53:09 +0000
Message-Id: <20220302175309.1098827-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Pointer mode is being assigned a value that is never read, it is
being re-assigned later with a new value. The initialization is
redundant and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/solomon/ssd130x.c:582:27: warning: Value stored
to 'mode' during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 92c1902f53e4..ce4dc20412e0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -579,7 +579,7 @@ static const struct drm_simple_display_pipe_funcs ssd130x_pipe_funcs = {
 static int ssd130x_connector_get_modes(struct drm_connector *connector)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
-	struct drm_display_mode *mode = &ssd130x->mode;
+	struct drm_display_mode *mode;
 	struct device *dev = ssd130x->dev;
 
 	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
-- 
2.34.1

