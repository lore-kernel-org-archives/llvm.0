Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60061E4E5
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679246680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WYm22h0FZEjzDnur0SvUWRtWO3WPGs/nZ3mlQqCc8gk=;
	b=WMCDQ3Yi4PBP+qLJY69i0IKEubYojCsPNWlarCyFfmPqsRX46vAOiE4QBEAKUg2tvmTG3n
	KNNoYAgmbCJEf3UQPjuDRIZXyILRpOgMMpMAkkf0B5pEFeLvTfFuG/OEOyevG99OO/txtV
	J7fjAzocjwFalB3hnrdrR734Qd4+LRE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-jcG3FVsOOiS4Xa89svyD6Q-1; Sun, 19 Mar 2023 13:24:38 -0400
X-MC-Unique: jcG3FVsOOiS4Xa89svyD6Q-1
Received: by mail-qv1-f71.google.com with SMTP id h10-20020a0cd80a000000b005cc75c78efcso195074qvj.21
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 10:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679246678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYm22h0FZEjzDnur0SvUWRtWO3WPGs/nZ3mlQqCc8gk=;
        b=Q2+Ke5ndQ/XEHv1HBZlbR+NTPcIKkoexxdFhcH1N44/mjN2Dx9ktMp1YlGwImTLccG
         cEDonwUeRCdahaV+iuG2fxPEOYU9UPJJNU8AqVu0I6bX5sJ3WbiT1Gyvu+5niUPS3GqH
         PZcushyVLBpECC4CAIkdXEK//FV8FgVOzxiwjRZHmd6hC1km4UNtDwAj7OmwZXnbyP+n
         yTqTEcK6aIUqZQwvYb6GUVmsv3WODoquL+Gz30I2uNmfSxQZKexXd8jl2iBq+e9Ecicd
         258WRhprE5s1nVfohDc0fFuCIM7tVe9vVtGovETMJkfFAYB/hhpqfh3uYWLwTzAi91oc
         1Qpg==
X-Gm-Message-State: AO0yUKWoB6lIQ/CeK0vzNZVI9iyfxveiUFTD3cI4gYaCXc8Vq1tfn+bw
	Jw0mKUHqm7XkZxuhPutkvS7ky6uDrTd0gVhOEWaa2j+ZIC5bz9kQSs2LWzYg741XEJlp2KXCYi2
	OgIqhb5cqJlBb7w==
X-Received: by 2002:ac8:7f8c:0:b0:3bf:dc2e:ce5d with SMTP id z12-20020ac87f8c000000b003bfdc2ece5dmr22196965qtj.4.1679246678269;
        Sun, 19 Mar 2023 10:24:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Yug+NOU+/B0nf5Ys4tKHcVGq8qmgqxjRscDDR3teSxftfURGyZtdjxvhppM9zckFSgDcZLQ==
X-Received: by 2002:ac8:7f8c:0:b0:3bf:dc2e:ce5d with SMTP id z12-20020ac87f8c000000b003bfdc2ece5dmr22196945qtj.4.1679246678019;
        Sun, 19 Mar 2023 10:24:38 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id l5-20020ac87245000000b003d3b9f79b4asm4926103qtp.68.2023.03.19.10.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 10:24:37 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: rajur@chelsio.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: cxgb3: remove unused fl_to_qset function
Date: Sun, 19 Mar 2023 13:24:33 -0400
Message-Id: <20230319172433.1708161-1-trix@redhat.com>
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
drivers/net/ethernet/chelsio/cxgb3/sge.c:169:32: error: unused function
  'fl_to_qset' [-Werror,-Wunused-function]
static inline struct sge_qset *fl_to_qset(const struct sge_fl *q, int qidx)
                               ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/chelsio/cxgb3/sge.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
index 62dfbdd33365..efa7f401529e 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -166,11 +166,6 @@ static u8 flit_desc_map[] = {
 #endif
 };
 
-static inline struct sge_qset *fl_to_qset(const struct sge_fl *q, int qidx)
-{
-	return container_of(q, struct sge_qset, fl[qidx]);
-}
-
 static inline struct sge_qset *rspq_to_qset(const struct sge_rspq *q)
 {
 	return container_of(q, struct sge_qset, rspq);
-- 
2.27.0

