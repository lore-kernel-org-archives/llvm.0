Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24662566
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681819804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pK6/Jsd6qCRDUY6MLyVVq/KSoYjj907IkYNaHbXLumg=;
	b=OOn7R8Z6a5m6juFbiXyfnzkDh7BwjPXeuxs3uEJLExhBArLnEna/XMLnzqrejDApQHl6vm
	iwEkobo0xsUoMpX+w96yNj+leyME2zfLy2yRDJUbqsW12CBkD+pJopvHaNTR0edJSj8vbi
	YeUYbNkk+x7nB8y2NFA1ZgvDSGefZXE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-Yn0a23xiO_-BJdvubZxElg-1; Tue, 18 Apr 2023 08:10:03 -0400
X-MC-Unique: Yn0a23xiO_-BJdvubZxElg-1
Received: by mail-qt1-f200.google.com with SMTP id h20-20020a05622a171400b003dfd61e8594so20227205qtk.15
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 05:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819801; x=1684411801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pK6/Jsd6qCRDUY6MLyVVq/KSoYjj907IkYNaHbXLumg=;
        b=AlaTPRPhKXISlMW3seYVVstXHt8ggp+kxr9H0Xjo85uUmnZkvz0+aLu4HMgnFYfp2M
         /c5cvXDm7gLoX5rFpGEaun7CjXH6ZSote7bHxjplYnNqL+q+UdF6AMfcR+Cm7GOwJB6F
         d3gCIdw4UlDTONtdogXQSnWGRaMjUhWXMzGLrFBECbdTvYJ43rZbren68/ReK124l630
         MdZSReeVRjerqS5U2eJd8uhvdQh7VPB4XHP+nKyOKTdpQJMoRzDU+gexLYDU12vhf4Nf
         PXJ9K2h+rvy4LLN35CP0oMA/WXjhcVU1HZoaZkP0iTJnSEqkuUf7S8sleyysEM+k6Knq
         PQvA==
X-Gm-Message-State: AAQBX9dMR6RYY8MCFCU7gnwQqyKSkicvMEizqs4QrJxI4ZuVbE7pVypt
	TvgMMDDRk70Gscj1SFDaW2xpE/PvdnqpKiF69KjmGYFQWrCyBqmeAYZanuztRfkfHn16McZw58a
	tYMlM29FBxAsy7Q==
X-Received: by 2002:a05:622a:100d:b0:3ef:3824:b8b0 with SMTP id d13-20020a05622a100d00b003ef3824b8b0mr4901518qte.5.1681819801597;
        Tue, 18 Apr 2023 05:10:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350bOLcjSKxSHpofNzJcaPxLEh2nUi7FC1BrTGAF/mAedpATg6zJUv4zkRCxYqhwooGe4UgjcQw==
X-Received: by 2002:a05:622a:100d:b0:3ef:3824:b8b0 with SMTP id d13-20020a05622a100d00b003ef3824b8b0mr4901483qte.5.1681819801322;
        Tue, 18 Apr 2023 05:10:01 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id p129-20020a374287000000b007339c5114a9sm3875322qka.103.2023.04.18.05.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:10:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	CTLIN0@nuvoton.com,
	luca.ceresoli@bootlin.com,
	peda@axentia.se,
	javierm@redhat.com,
	u.kleine-koenig@pengutronix.de,
	ckeepax@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ASoC: nau8825: fix bounds check for adc_delay
Date: Tue, 18 Apr 2023 08:09:55 -0400
Message-Id: <20230418120955.3230705-1-trix@redhat.com>
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

clang build reports
sound/soc/codecs/nau8825.c:2826:31: error: overlapping comparisons
  always evaluate to false [-Werror,-Wtautological-overlap-compare]
        if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

This is a bug, a logical-or should have been used.

Fixes: fc0b096c9291 ("ASoC: nau8825: Add delay control for input path")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index c4389f5fe603..f4eb999761a4 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2823,7 +2823,7 @@ static int nau8825_read_device_properties(struct device *dev,
 	ret = device_property_read_u32(dev, "nuvoton,adc-delay-ms", &nau8825->adc_delay);
 	if (ret)
 		nau8825->adc_delay = 125;
-	if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
+	if (nau8825->adc_delay < 125 || nau8825->adc_delay > 500)
 		dev_warn(dev, "Please set the suitable delay time!\n");
 
 	nau8825->mclk = devm_clk_get(dev, "mclk");
-- 
2.27.0

