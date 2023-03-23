Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD28D2E2
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679606141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6KV3+ggucumc5QD34On/pnyUwkWX5K53u9B57Btq2Dg=;
	b=YToUfXkS27wnAkPSS0qH1qJhOXy+0uagF+aij0AL2P+wOlwHoB6PomeNa9svtVcNg+byF1
	JIQD8xF7YTCEdwiNQd1goYNttxqAGxR9OTakUduFHQAwUVmVAYEpg5b+u+kPJsUYg/WYZP
	k5WlcqqxI1MrBHzFtYWPfrRlykQPKpE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-q4IvzexQOA6_MHSNlA6LKQ-1; Thu, 23 Mar 2023 17:15:40 -0400
X-MC-Unique: q4IvzexQOA6_MHSNlA6LKQ-1
Received: by mail-qv1-f70.google.com with SMTP id r4-20020ad44044000000b005ad0ce58902so69689qvp.5
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 14:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679606140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KV3+ggucumc5QD34On/pnyUwkWX5K53u9B57Btq2Dg=;
        b=xU/pbRgcVw5YBqpxg4/4B9AsyWqKSX6ppR1KGlhMc/kRxqfvzQbIuwJ9nUGHXq+byK
         qEvEOfU3IreUbUJvvto8JtL0vdfUuVhvfn1xWWUyltsYMe6yxz0aJMbpuQIsBsjOwhNn
         TKuain2ci+Yjdz+wzZ/jz1iZ4bqrVpGSR3tcv7pLhODxbwwK86/8AQqGddrb38ei8XZq
         bduyvkYLXpTC+JcX9YVQbUoH/kUWWT9NR0vWqYxTYNRTdqvDkLFszMV4rv/IrhAMYfOC
         fD1JFGNxP2EYkb7xeR64ZrlegQq9ExSPkOqsZb2BXaXY/Clmwkh5N3dxQaSnPw2rKn5o
         T8Tw==
X-Gm-Message-State: AO0yUKVb1ak15AHvPWjurE6KHdWoLcwFW1PV1BbGWDiK947zAdPxLgvn
	UE57sxVCg3Cyt+g2CaqAztI7TggZQGGgTrT5WX6mjpYkFfsMy7rJDGDH3MYt6Qr7RW6UtPOtZdS
	TNBucbnOL990Z5w==
X-Received: by 2002:ad4:5ca7:0:b0:557:a5c5:7e01 with SMTP id q7-20020ad45ca7000000b00557a5c57e01mr11200937qvh.25.1679606139887;
        Thu, 23 Mar 2023 14:15:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+tvzAycBc1q7Z1SybzVhbz3gSyQZZjVzp64y0qPk4l+LZH6qxGccQxM9QKATFbt8WTwlMI0g==
X-Received: by 2002:ad4:5ca7:0:b0:557:a5c5:7e01 with SMTP id q7-20020ad45ca7000000b00557a5c57e01mr11200902qvh.25.1679606139628;
        Thu, 23 Mar 2023 14:15:39 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c23-20020a379a17000000b007436d0e9408sm8694926qke.127.2023.03.23.14.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:15:39 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: juergh@proton.me,
	jdelvare@suse.com,
	linux@roeck-us.net,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] hwmon: remove unused superio_outb function
Date: Thu, 23 Mar 2023 17:15:35 -0400
Message-Id: <20230323211535.2637939-1-trix@redhat.com>
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
drivers/hwmon/vt1211.c:198:20: error: unused function
  'superio_outb' [-Werror,-Wunused-function]
static inline void superio_outb(int sio_cip, int reg, int val)
                   ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/hwmon/vt1211.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/hwmon/vt1211.c b/drivers/hwmon/vt1211.c
index 4a5e911d26eb..fcd4be7a5a85 100644
--- a/drivers/hwmon/vt1211.c
+++ b/drivers/hwmon/vt1211.c
@@ -195,12 +195,6 @@ struct vt1211_data {
 /* VT1211 logical device numbers */
 #define SIO_VT1211_LDN_HWMON	0x0b	/* HW monitor */
 
-static inline void superio_outb(int sio_cip, int reg, int val)
-{
-	outb(reg, sio_cip);
-	outb(val, sio_cip + 1);
-}
-
 static inline int superio_inb(int sio_cip, int reg)
 {
 	outb(reg, sio_cip);
-- 
2.27.0

