Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05DB2F21
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643901803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FyaICBNYXFogXQpGuOXvlvkFpwrbiEbZFhG8GrBvphk=;
	b=IXf23GRhnf1Q0dIMTGx7m3brSMqYpw6Qa4e+LZNmzKnWaldcG/mKN1KfEGxO9dJLYMZVOO
	Cd4BKIer66Fjr63TkOMCt/lSw3SBHdYxnOuuCs+iDeGEvPRM9nkdUUxfkyifvrF77OikA7
	yRG14/QPqV87N/V0QDt6Rs2PWMl1u+8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-C1R4BmqcPCSRvBDxeIoWvw-1; Thu, 03 Feb 2022 10:23:17 -0500
X-MC-Unique: C1R4BmqcPCSRvBDxeIoWvw-1
Received: by mail-qt1-f200.google.com with SMTP id s1-20020ac85ec1000000b002cf7c93d56dso2165158qtx.21
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 07:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FyaICBNYXFogXQpGuOXvlvkFpwrbiEbZFhG8GrBvphk=;
        b=1NfwhnUfhwBGQIqn0L1QnzbwtS7AibvSZLwsUmcXUEKe3a4DpTNe4YfGFuMG/EzGko
         k9R/dejDheyBgJpynJbbKyvNhE4rYNawcR8KwFIEzGIC79LKBYUnFVxYMp5vkN2Y1Aty
         tPFQ106UdyUX1Koinl/Eyonog+cDkOLpACql7M4dYOCW2M/Jz0I2ctX7c2T12lJEkt+f
         st0Pl37KnNIpWLITINHzr9e0BKpFKmNFqN19G9KLOGLwnTX+DFHnduTwU5hqhjKQfrA1
         DivKXrtwKf8fU/+ys7vH3gJRfXaaX49C43wyxrPwCsScaaw1IuM7BkA7Y/twysAoN1En
         bxgQ==
X-Gm-Message-State: AOAM5330W2017ulhvTRugNvlfoRtFaWUsuOU5H5N+KEUAlrD+PGslH/H
	hDHVfFhPUMhY2MR6L2a0+/5lYFU0GP1zLbPZW4lKuy/dbuzjwiEfxO0AgWXkGMFVdXV8JX9+I0R
	u2Msub7WdP5skHQ==
X-Received: by 2002:a05:6214:767:: with SMTP id f7mr31309314qvz.32.1643901797237;
        Thu, 03 Feb 2022 07:23:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKoZK62v8/DrZws5sOsM70Uxo6BwdmPV1YiNBPk723GMaQhV5IIhjTr/Mj5MVVcyOlC4yv6g==
X-Received: by 2002:a05:6214:767:: with SMTP id f7mr31309297qvz.32.1643901797012;
        Thu, 03 Feb 2022 07:23:17 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w22sm9746568qtk.7.2022.02.03.07.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 07:23:16 -0800 (PST)
From: trix@redhat.com
To: airlied@redhat.com,
	tzimmermann@suse.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	maxime@cerno.tech
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/ast: fix using freed memory
Date: Thu,  3 Feb 2022 07:23:05 -0800
Message-Id: <20220203152305.1846862-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem
ast_mode.c:1235:3: warning: Use of memory after it is freed
  drm_connector_update_edid_property(&ast_connector->base, edid);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The second condition on

  if (!flags && ast_connector->i2c)

Means that the edid is not always set.  If the previous block
fails the freed edid value will be used.  So set edid to NULL
after freeing.

Fixes: 55dc449a7c60 ("drm/ast: Handle failed I2C initialization gracefully")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ab52efb15670e..9131dc8a1a2fc 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1224,10 +1224,12 @@ static int ast_get_modes(struct drm_connector *connector)
 			return -ENOMEM;
 
 		flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
-		if (flags)
+		if (flags) {
 			ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
-		else
+		} else {
 			kfree(edid);
+			edid = NULL;
+		}
 	}
 	if (!flags && ast_connector->i2c)
 		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
-- 
2.26.3

