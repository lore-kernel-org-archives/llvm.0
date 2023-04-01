Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5EA7C
	for <llvm@lists.linux.dev>; Sat,  1 Apr 2023 01:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680311102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZezcjhdJnPBqT5fIkJeXVlzuTEM0bkI2yB633mRrHn4=;
	b=WWYsUX5Du3q1fMuMhJw63LuscufeHWV5WysdAKoBAh1D5SZHSSD6rhDUbWTiqzUl18EhWz
	1TLaIPqp4xsOyuSRGZ/gBhsCEQwYFa1dmkde/wv85DWFyvlAFITkvX3MCUvzBG4obEILgw
	bOxIPwbgsIt6+RMVUB34qisIFGq0IF8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-zEe23DmSPWS8660x9JiNUQ-1; Fri, 31 Mar 2023 21:05:00 -0400
X-MC-Unique: zEe23DmSPWS8660x9JiNUQ-1
Received: by mail-qt1-f197.google.com with SMTP id v7-20020a05622a188700b003e0e27bbc2eso15685579qtc.8
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 18:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680311100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZezcjhdJnPBqT5fIkJeXVlzuTEM0bkI2yB633mRrHn4=;
        b=P0ze8O3Sf94dbqkFnDuF+cmrtoMaMevInfirvr+m25jQhGcmhEdGrrai9T/F5i97IV
         1GUF0Ke3qvohQGKOWLUwM0xA7gqOsI9eLk4BFCR5JHKcS6mY6EBVPJJxXnoz9fD1s7+l
         5WT7driJ3/SrsHUoQBwVfdmKrzDRItBgaCH7vbEYwmxo6IFuBVCSbwAsjUVpQj4mPhqg
         96/FCS/MCL7pXvR0MLoc8UJ+5yNC1MnFVuUzjxfzVlHGdiTJSgPz1yAGVUDC9UJTWlYp
         VkinUmzmGTMnpW3JchxP5aOXtVfnNDyGLmuKKc+R+Wsk8WU7Las/xdnDNvPLawPspdW3
         Eq+A==
X-Gm-Message-State: AO0yUKWX6RpRyI0ncSvfHhANy2U5YAfpfym0fYiCDgttubyCq9o3aJEA
	vN3bwESXTpt1M8DCu7L74O1PB91vufnRW45aBtwNxq2HzKQBrlMU1cZ2OzldUYhZMo5cxlJ2qmb
	3pYbwornYGylkMg==
X-Received: by 2002:a05:622a:594:b0:3bf:db0a:c105 with SMTP id c20-20020a05622a059400b003bfdb0ac105mr47836555qtb.6.1680311100444;
        Fri, 31 Mar 2023 18:05:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set9G4/WUx6L3PsHLq2UxivRskDVehlN2TbR8kJzcUk6OcCVFU7GWx4dbSv+XR5SXUmN8++dfFA==
X-Received: by 2002:a05:622a:594:b0:3bf:db0a:c105 with SMTP id c20-20020a05622a059400b003bfdb0ac105mr47836535qtb.6.1680311100209;
        Fri, 31 Mar 2023 18:05:00 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i187-20020a3786c4000000b006f9f3c0c63csm1061634qkd.32.2023.03.31.18.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 18:04:59 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: mchehab@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] [media] mb86a20s: remove unused active_layers variable
Date: Fri, 31 Mar 2023 21:04:56 -0400
Message-Id: <20230401010456.1866555-1-trix@redhat.com>
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

clang with W=1 reports
drivers/media/dvb-frontends/mb86a20s.c:1572:6: error: variable
  'active_layers' set but not used [-Werror,-Wunused-but-set-variable]
        int active_layers = 0, pre_ber_layers = 0, post_ber_layers = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/dvb-frontends/mb86a20s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
index b74b9afed9a2..125fed4891ba 100644
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -1569,7 +1569,7 @@ static int mb86a20s_get_stats(struct dvb_frontend *fe, int status_nr)
 	u32 t_post_bit_error = 0, t_post_bit_count = 0;
 	u32 block_error = 0, block_count = 0;
 	u32 t_block_error = 0, t_block_count = 0;
-	int active_layers = 0, pre_ber_layers = 0, post_ber_layers = 0;
+	int pre_ber_layers = 0, post_ber_layers = 0;
 	int per_layers = 0;
 
 	dev_dbg(&state->i2c->dev, "%s called.\n", __func__);
@@ -1589,9 +1589,6 @@ static int mb86a20s_get_stats(struct dvb_frontend *fe, int status_nr)
 
 	for (layer = 0; layer < NUM_LAYERS; layer++) {
 		if (c->isdbt_layer_enabled & (1 << layer)) {
-			/* Layer is active and has rc segments */
-			active_layers++;
-
 			/* Handle BER before vterbi */
 			rc = mb86a20s_get_pre_ber(fe, layer,
 						  &bit_error, &bit_count);
-- 
2.27.0

