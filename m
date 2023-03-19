Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741811846
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679244470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkDP5nwJg3NiX0wmWxZjf2UT2F8zhLNQEpn1rGiXRWY=;
	b=BskYaZZCQSNCEGuCExAxuOZOWaRjAnT3U9W1Y7CVO41UJOE1+vzm/z/KwepGCNHdHuO0xC
	sjodv0YLzHCvyih2otsmV5Cy/13v20hxqUiEbrHjb+TKGKBJfX60ekpYvTf7o+Ys4m1b6F
	yL/Bmwfx+kygbLcUHzfwxvLW2lRN9RE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-hmfw1MsINzmDYpRS15SfXw-1; Sun, 19 Mar 2023 12:47:48 -0400
X-MC-Unique: hmfw1MsINzmDYpRS15SfXw-1
Received: by mail-qt1-f199.google.com with SMTP id v7-20020a05622a188700b003e0e27bbc2eso565879qtc.8
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 09:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679244468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkDP5nwJg3NiX0wmWxZjf2UT2F8zhLNQEpn1rGiXRWY=;
        b=6PyHqreSIA+baTeFnO5kSJT19Lv+qrjFRHgsn1sMeViPUJ+eqdfFGjoyxEKpHaA60t
         KNUxEAi6GUy0nboIxaskfgKbVGTomyLkbiQIPTvCmKwoF6QTL46EHusYPWk8ZM0MdRWY
         tBy2iuTGI6co+/OPaYRvbbawxzETziO/lBGkgOAXeUjnMvNBh7x42BOootJmIiwRNeuD
         0LK0Hmfj/Dcs8yD3Nln5I2nojN3LC2YLBkB3gaX+gOoWQH36ELs6bDT3LVYLDy5+biIC
         Ev4a6cDXDPLm2C3+FWv5MGsyYcAwA/ZZgLgOnbWE0njGZBHw0A/Whcm2/68zOf4+Ovmw
         GqGw==
X-Gm-Message-State: AO0yUKXjgf6Ae19oe0Z7zkm9hmMzOWFrWOLM12e6rEfulVhzuYbGV/vL
	QxqN6AFmoo/rN08/IPGAiuCQotsW+M5xlQ3xte7pertvUvPmn2Co68sZXEwq/Lbo+wbQ1vvDy9K
	3WUsv4FA/QjZzTQ==
X-Received: by 2002:ac8:5f83:0:b0:3bf:d71e:5af4 with SMTP id j3-20020ac85f83000000b003bfd71e5af4mr22398122qta.26.1679244468427;
        Sun, 19 Mar 2023 09:47:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set81mKcQVWIpj0FlTITDASkQiikMe5/r0glEegQKpqPmrpVC5hxR63neRzk9SnibKH7bRsoSwg==
X-Received: by 2002:ac8:5f83:0:b0:3bf:d71e:5af4 with SMTP id j3-20020ac85f83000000b003bfd71e5af4mr22398109qta.26.1679244468205;
        Sun, 19 Mar 2023 09:47:48 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 124-20020a370482000000b0073b929d0371sm5734012qke.4.2023.03.19.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 09:47:47 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: saschasommer@freenet.de,
	ulf.hansson@linaro.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mmc: sdricoh_cs: remove unused sdricoh_readw function
Date: Sun, 19 Mar 2023 12:47:44 -0400
Message-Id: <20230319164744.1707169-1-trix@redhat.com>
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
drivers/mmc/host/sdricoh_cs.c:104:28: error: unused function
  'sdricoh_readw' [-Werror,-Wunused-function]
static inline unsigned int sdricoh_readw(struct sdricoh_host *host,
                           ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mmc/host/sdricoh_cs.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mmc/host/sdricoh_cs.c b/drivers/mmc/host/sdricoh_cs.c
index 76a8cd3a186f..57b8c1a96756 100644
--- a/drivers/mmc/host/sdricoh_cs.c
+++ b/drivers/mmc/host/sdricoh_cs.c
@@ -101,14 +101,6 @@ static inline void sdricoh_writel(struct sdricoh_host *host, unsigned int reg,
 
 }
 
-static inline unsigned int sdricoh_readw(struct sdricoh_host *host,
-					 unsigned int reg)
-{
-	unsigned int value = readw(host->iobase + reg);
-	dev_vdbg(host->dev, "rb %x 0x%x\n", reg, value);
-	return value;
-}
-
 static inline void sdricoh_writew(struct sdricoh_host *host, unsigned int reg,
 					 unsigned short value)
 {
-- 
2.27.0

