Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A7D7A
	for <llvm@lists.linux.dev>; Sun, 13 Mar 2022 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647183744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OZkkggqsQIoWieW/oVrOCwUkJK6lKvyxEtn8wx8/DH4=;
	b=ITlXUbAseMe9EwMvroC0JZLKidlAvrvoGoAMGL1vZYOI1gXzEzrVqR9Jwumst3VR7K30TO
	TIpR0zizhQ6vhvczt0KbRtkGfSp22xAmMVLEmdEVZmbvyDmvdX1fpvK8jmsarhpGkBvkKE
	/jjDeU4uvKn8VxTsGOX6pDJm0MfbCmY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-qBx57_reMBa_GqpscE-Vaw-1; Sun, 13 Mar 2022 11:02:23 -0400
X-MC-Unique: qBx57_reMBa_GqpscE-Vaw-1
Received: by mail-ot1-f71.google.com with SMTP id o6-20020a9d4106000000b005b23737b666so10018800ote.16
        for <llvm@lists.linux.dev>; Sun, 13 Mar 2022 08:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OZkkggqsQIoWieW/oVrOCwUkJK6lKvyxEtn8wx8/DH4=;
        b=UJNqpCfSv8hLEqpPxs8cflF8hR/bcLRs0m9rATxcb36iMFXtgEP+PITsuibpwcLkO9
         9g8SC/xkFH0aVVbrkJfMR1+r2aNUplU4xqp6paGSY9lGDMSuhq4EcsQ/juqqP6gIsAlH
         28HQgEPK/09GA/b4Qxt7w9MTKAw0X33fNFlUhmlMj9dLjIDW1es6IUFDIFChNOYcovOO
         4O1CvJLM6CFaMpxbNjd7eKaMpqEMeLjfRDfwURPBBUzbdDGyhyJenabAnqdxNKTGSow8
         Op7sweaXiJWPou5cZD6pih2ft4VERkWliiLcsylwCiYWlR2HiZaSG6ONvXSmBhajF06Y
         Aq6g==
X-Gm-Message-State: AOAM530aLEZZT+9uWa0yevfCgVfVxxu/GlNR0TUENZJjaICF0Ht43U8S
	n+gTcuyVisRfIv51IU0PwNc3mz7QodN+WV4UC5pu5Xc0XdQ4vTKSnDHUpG0sQ0pKKicoDMt//RD
	imGi1wHwP8xwyCQ==
X-Received: by 2002:a9d:4e99:0:b0:5b2:54f4:75e7 with SMTP id v25-20020a9d4e99000000b005b254f475e7mr9119069otk.94.1647183741501;
        Sun, 13 Mar 2022 08:02:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjb1ejVgoHBYltkBU7cyugOD8fhaxKGdkCT++7rWLl8GnDe8scorY7NgLJqvOmNm3oOxRWWQ==
X-Received: by 2002:a9d:4e99:0:b0:5b2:54f4:75e7 with SMTP id v25-20020a9d4e99000000b005b254f475e7mr9119012otk.94.1647183739823;
        Sun, 13 Mar 2022 08:02:19 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id o17-20020a9d5c11000000b005b2611a13edsm6324116otk.61.2022.03.13.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 08:02:19 -0700 (PDT)
From: trix@redhat.com
To: jesse.brandeburg@intel.com,
	anthony.l.nguyen@intel.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] igb: zero hwtstamp by default
Date: Sun, 13 Mar 2022 08:02:10 -0700
Message-Id: <20220313150210.1508203-1-trix@redhat.com>
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

Clang static analysis reports this representative issue
igb_ptp.c:997:3: warning: The left operand of '+' is a
  garbage value
  ktime_add_ns(shhwtstamps.hwtstamp, adjust);
  ^            ~~~~~~~~~~~~~~~~~~~~

shhwtstamps.hwtstamp is set by a call to
igb_ptp_systim_to_hwtstamp().  In the switch-statement
for the hw type, the hwtstamp is zeroed for matches
but not the default case.  Move the memset out of
switch-statement.  This degarbages the default case
and reduces the size.

Some whitespace cleanup of empty lines

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/intel/igb/igb_ptp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_ptp.c b/drivers/net/ethernet/intel/igb/igb_ptp.c
index 6580fcddb4be5..02fec948ce642 100644
--- a/drivers/net/ethernet/intel/igb/igb_ptp.c
+++ b/drivers/net/ethernet/intel/igb/igb_ptp.c
@@ -165,23 +165,21 @@ static void igb_ptp_systim_to_hwtstamp(struct igb_adapter *adapter,
 	unsigned long flags;
 	u64 ns;
 
+	memset(hwtstamps, 0, sizeof(*hwtstamps));
+
 	switch (adapter->hw.mac.type) {
 	case e1000_82576:
 	case e1000_82580:
 	case e1000_i354:
 	case e1000_i350:
 		spin_lock_irqsave(&adapter->tmreg_lock, flags);
-
 		ns = timecounter_cyc2time(&adapter->tc, systim);
-
 		spin_unlock_irqrestore(&adapter->tmreg_lock, flags);
 
-		memset(hwtstamps, 0, sizeof(*hwtstamps));
 		hwtstamps->hwtstamp = ns_to_ktime(ns);
 		break;
 	case e1000_i210:
 	case e1000_i211:
-		memset(hwtstamps, 0, sizeof(*hwtstamps));
 		/* Upper 32 bits contain s, lower 32 bits contain ns. */
 		hwtstamps->hwtstamp = ktime_set(systim >> 32,
 						systim & 0xFFFFFFFF);
-- 
2.26.3

