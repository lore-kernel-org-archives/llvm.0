Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B36B3C1E
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656691186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ViBZTo7+P6CuULplF5aZdglMlpqIG92IWrr6hqoZuI=;
	b=I/n09aH79VrSg2NJeUgnEscLkthitS4V/jqPZ9kw6JEHJtsV5dcxXwEU9q2T/TXqeesH3e
	/fRz8QYkNv/9jjVaoyY8keV3km6IZeisJBduHFd/SKWLfIJUKhSKqA6oPy6uO3LKRgEr+T
	y+p957CRUsPkr5PB7bkN76l7b2Vr2NM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-xOsLJQ-SPVuSqX4aR2eW-Q-1; Fri, 01 Jul 2022 11:59:35 -0400
X-MC-Unique: xOsLJQ-SPVuSqX4aR2eW-Q-1
Received: by mail-qv1-f69.google.com with SMTP id ld6-20020a056214418600b004708c5a26edso2816238qvb.23
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 08:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ViBZTo7+P6CuULplF5aZdglMlpqIG92IWrr6hqoZuI=;
        b=TSMlCxvVTIR1cYbIvjqZRJKoUiXc9KNlavP4BlRqju3Cg/ezyCB42/rPZSChKN4Z2/
         v3Gx5I5kRuyiT2XFPUar4HffSXKfkWPLaNGJyYmrrYnTbVKlcnm7A5LMKCcI53HdvlLk
         5Dg2CL7p+xV9FuAq/RjomgFrodoeUx6lDnDq1DO4Ii3+DHYhcpYev8BKAOrk/qzCSBga
         6A1QIJavUBGOEIhmNy/Zvj3/NSFpdjK8oHcDyKIevqlQ1koPyyj4xtEm1YlFWHBLqA5T
         nCAkmibiR3ZD3UBFB0/Mc6XwD7AOPKZBuMLJVeHenwkz8n11+IfqIHvwrF8ZARLYCxU0
         XDfA==
X-Gm-Message-State: AJIora9P4IZbQok/cEmitfUMvV37fh+vrTcsjH+ZDqF1EFYw+oiwoGAN
	Tk6hIvs+2Q8qiyAdJzLzH9XyohffSbEaYWK/wilaR92SinAs5/vOaPOyVcyQgJGVugo2MUpzoyM
	v98Hma2JVNvGQAQ==
X-Received: by 2002:a37:887:0:b0:6af:147c:fed8 with SMTP id 129-20020a370887000000b006af147cfed8mr11398398qki.70.1656691175343;
        Fri, 01 Jul 2022 08:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDN5DQ7LAZQpRQ7ZnFyAXmPCSLgKuUxkxMsCn5VlYgkvegKTTuDpjUoPZ9Z4CpwnlALkDIAA==
X-Received: by 2002:a37:887:0:b0:6af:147c:fed8 with SMTP id 129-20020a370887000000b006af147cfed8mr11398381qki.70.1656691175122;
        Fri, 01 Jul 2022 08:59:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y18-20020a05622a121200b002f90a33c78csm16127153qtx.67.2022.07.01.08.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 08:59:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ASoC: codecs: wsa883x: fix fallthrough error
Date: Fri,  1 Jul 2022 11:59:30 -0400
Message-Id: <20220701155930.262278-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang build fails with
sound/soc/codecs/wsa883x.c:1207:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                default:

Add the missing break.

Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets and map")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/wsa883x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 40c7d64a9c41..dcd88175b9cd 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1204,6 +1204,7 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 						      WSA883X_SPKR_PWM_FREQ_F300KHZ);
 			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
 						       WSA883X_DRE_PROG_DELAY_MASK, 0x9);
+			break;
 		default:
 			break;
 		}
-- 
2.27.0

