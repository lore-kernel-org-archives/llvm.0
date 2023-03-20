Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78901861
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679316729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j7ASg0gkUTJq52inUxEUZw0nsEnRgkwG95p6EniSL+I=;
	b=AmR2DPsQiNwHVJ+95i8agla137nPMdzo9uxf2GfhZbjNaQpTF57Qqvz3GesvIDCQXCuumm
	TNAaDsMCwvJhigGUDDcAMnKZCzdwkf3ZtZIY2lYuCxZPGYAF8XmaYUG6pN7Ac/gIhxc9r4
	P7d35PxCw2X2/n6EOOBHszub/BhAiac=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-PQ465yuvP_i9oeodZIFZpg-1; Mon, 20 Mar 2023 08:52:05 -0400
X-MC-Unique: PQ465yuvP_i9oeodZIFZpg-1
Received: by mail-qt1-f197.google.com with SMTP id w13-20020ac857cd000000b003e37d3e6de2so234611qta.16
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 05:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679316725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7ASg0gkUTJq52inUxEUZw0nsEnRgkwG95p6EniSL+I=;
        b=WVKGSsvarshCYugai9WJYXK5DZmUzeMxJvj9nOFdjQ9S949vfXY69V0uUxQFdfAPve
         T1Jso3ZIKvM7yhGVAoYfJPSFM7g887/A435OJL+8ifQXGdqeFEF9fndQ1NAwiDKLMEZa
         ReGNWjtRupgJsQHj3sRBaghYPEL5uXWqHgjqWXJ/QT/i9snKFxlspy2dm+yWWX5+H34A
         VoyRTxT4YneQAYqB7T1x3Td7Hgp5c0/9kxb7l0gOxC0GsEvYw5K2o7fkbrjTfEDAQzjN
         QdDpbpnEmYayKqQoYloF+U/Vz/zPhhgnSsJDP82+IJaE7Ej62F5qJbnC/NXKZd+8O/wB
         qp1A==
X-Gm-Message-State: AO0yUKWZJb4zGA5syXxznc9NsCU6zHCtK/FRq+XPTmivJ6U4Dqk2vjB6
	jKVnVqJD70IltFjWqjMFmf9CCaUnvcJcdt/yU2TL6L1WnxLqedIiAtbJh4kG30AuIC9Rv4TgWOt
	uefAco07sRad2o5bTYIcRgA==
X-Received: by 2002:a05:6214:29c1:b0:5ac:239a:9200 with SMTP id gh1-20020a05621429c100b005ac239a9200mr36792344qvb.9.1679316725189;
        Mon, 20 Mar 2023 05:52:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set/mIgQ9WLkpN/lX38TAKIMzAXzxhdDQGgmTFJDrdCZybZKyAGo36og/nqUn3oQNrEhjhBPFaw==
X-Received: by 2002:a05:6214:29c1:b0:5ac:239a:9200 with SMTP id gh1-20020a05621429c100b005ac239a9200mr36792313qvb.9.1679316724937;
        Mon, 20 Mar 2023 05:52:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r132-20020a37448a000000b007466432a559sm5038056qka.86.2023.03.20.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 05:52:04 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: qiang.zhao@nxp.com,
	leoyang.li@nxp.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Date: Mon, 20 Mar 2023 08:52:02 -0400
Message-Id: <20230320125202.1721775-1-trix@redhat.com>
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
drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
  'qe_ic_from_irq' [-Werror,-Wunused-function]
static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
                            ^
The use of this function was removed with
commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")

This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: Add to commit log when the use was removed.

---
 drivers/soc/fsl/qe/qe_ic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index bbae3d39c7be..c0b4f865fba9 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -232,11 +232,6 @@ static inline void qe_ic_write(__be32  __iomem *base, unsigned int reg,
 	iowrite32be(value, base + (reg >> 2));
 }
 
-static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
-{
-	return irq_get_chip_data(virq);
-}
-
 static inline struct qe_ic *qe_ic_from_irq_data(struct irq_data *d)
 {
 	return irq_data_get_irq_chip_data(d);
-- 
2.27.0

