Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9348D2F3F
	for <llvm@lists.linux.dev>; Wed, 22 Feb 2023 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677081418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GScpUkVmR1trk5NKo/KgCoCbwLxTQg040xij2n32R0k=;
	b=TiweaSac5/24jQJUErKk+qsZBOndFFtL+AAKuFsc0FUP5WUdNFjo74BMmKEuIA1vBzow0H
	4vlVChHd9e3UdBV/qM/VrY3WqQbgWx+G7W566qbknwSgfbtN6EdTbyveb44Lap/GRPVaDg
	kt84dDglp5KGbMt/vNBXZMqWR+e6Vu8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-PpKGANkyOFmMko8vYKzNWA-1; Wed, 22 Feb 2023 10:56:57 -0500
X-MC-Unique: PpKGANkyOFmMko8vYKzNWA-1
Received: by mail-qk1-f199.google.com with SMTP id bk15-20020a05620a1a0f00b00741d6880f38so3023215qkb.18
        for <llvm@lists.linux.dev>; Wed, 22 Feb 2023 07:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GScpUkVmR1trk5NKo/KgCoCbwLxTQg040xij2n32R0k=;
        b=yLrnQjzsYCrk32NfSW/i9QfgaVHlgTL/b7nhtw6n7D6G97cD8NhNYjS9oeMMRlbKeO
         vu4qRD4qso9ovm+fFcl1NPgGl4ai8+24gJBEgNMkjN+ItrWX6rhL/3AnhRQico/aKlKG
         L1zbInr+B/jHihod8GMlz3aZdXothBLMysbEPUO6wVs5tUC57aZiKrwvVmRQXg2k9F7N
         TmD+3TRtykk3702oUSOB+I1D9og5AAs4qHS1uUmF3nPa65+SzfkeCJFRloRXOaH4NvN4
         +AetFRD6okgzdN0EtyhjwhV+ysgxEsx4CRaUOyqGug375jfcr7xmHcrWJXDw7aBuCYM3
         iJFw==
X-Gm-Message-State: AO0yUKVBQf7T4hjG4mJiJtBy3iAaVgK/OMzRy231OfpGCLi5Vh80p840
	WZuznc85vg2Ad+quVeQAb3F91NcOgHZ0cFF1B0vHuCBnHtn/4R1/m/54dI0Q50t3sTWQig4gPko
	X4t4dYwF02w3xYQ==
X-Received: by 2002:ad4:5aa7:0:b0:53c:9354:9721 with SMTP id u7-20020ad45aa7000000b0053c93549721mr17269891qvg.21.1677081416442;
        Wed, 22 Feb 2023 07:56:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+9amRNsc788f8Ah1EHOFjNZAoWEKdId2TpDxnPM1JRKz/kP2UH4h79UWQqmJg4CwTyIG4HZA==
X-Received: by 2002:ad4:5aa7:0:b0:53c:9354:9721 with SMTP id u7-20020ad45aa7000000b0053c93549721mr17269856qvg.21.1677081416191;
        Wed, 22 Feb 2023 07:56:56 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t78-20020a37aa51000000b006f9f3c0c63csm589967qke.32.2023.02.22.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 07:56:55 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	tzimmermann@suse.de,
	javierm@redhat.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/msm: return early when allocating fbdev fails
Date: Wed, 22 Feb 2023 10:56:49 -0500
Message-Id: <20230222155649.2001467-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

building with clang and W=1 reports
drivers/gpu/drm/msm/msm_fbdev.c:144:6: error: variable 'helper' is used
  uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  if (!fbdev)
      ^~~~~~

helper is only initialized after fbdev succeeds, so is in a garbage state at
the fail: label.  There is nothing to unwinded if fbdev alloaction fails,
return NULL.

Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index c804e5ba682a..c1356aff87da 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -142,7 +142,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
 	if (!fbdev)
-		goto fail;
+		return NULL;
 
 	helper = &fbdev->base;
 
-- 
2.27.0

