Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692681846
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679240274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+XIPLHs3kS1RfXeK+ON9SElHE9AkUNrNvAKZY1Ht/Lw=;
	b=YAEYjlGmaX1ydMFpMZF/v+OH61d/0jHj5kdERjCLgHk7fN/4LdbBh3Pwq6IV7whakIpcLI
	N4wM38yY+SfTrOYDGR9ljYzAbe4G+wTpbsdBUHEz1WnL3N5tRM6U6uh3Y8rIIRcfdNN4Q/
	5/vPxjofa0/yrWrN3AFHZW3g6R9kK14=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-s8QB3Nc-PISkOZCGb3PJOQ-1; Sun, 19 Mar 2023 11:37:53 -0400
X-MC-Unique: s8QB3Nc-PISkOZCGb3PJOQ-1
Received: by mail-qt1-f198.google.com with SMTP id p19-20020ac87413000000b003d2753047cbso5413521qtq.19
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 08:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679240273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XIPLHs3kS1RfXeK+ON9SElHE9AkUNrNvAKZY1Ht/Lw=;
        b=3ktNAe4L1oQpGVAhyJ3GkDDQakN22xkeMTGDQPLAcTQQuTobFY52i4lCdz7nJdDO5r
         oa9RgbPiftYp7/4n/kdS5+6Of99OTUPp0kAAg4EKIbEM4yqXLvObUjF6vAdpWrV9UqbR
         fy6649VJc3Rr88CMFCXe/yPoh2lM76vmHcchYPeVGkIAZqvjQo2Y/4SY9fd+1EJeQPpT
         qePNASVd/xhCQfCstm99kx5JThP+JFysu85ptxaku+FISTREEZUV6wsO/dPio/21IQk4
         yQIiIDhpPZLemsB5qAS2pl5b6Z2hTDsp/N99J+EnAFvGOLEOGf2sm2KmDlc0lhEyGYDi
         C2Qw==
X-Gm-Message-State: AO0yUKXi0uuKuK7mwKGRSJsRYI4NxjZnsVhjGowv7Ffv5hDdcoQR/bV8
	TQwI8cTU1mzAM12xKlhW6NXFTL7kWvGYnbM3fLcoTQ8yo5Y82D9oGMHHSbN7K337zNpASztADyd
	YptqRfGCSSAG+zg==
X-Received: by 2002:a05:622a:34d:b0:3d0:7bdf:42c4 with SMTP id r13-20020a05622a034d00b003d07bdf42c4mr21989114qtw.59.1679240273167;
        Sun, 19 Mar 2023 08:37:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set/BlpAZdEhiIGBHLKI8KfO5y+gSjhpmxCIlxlV78XjP/E7ZdJLDSyE0FY32cU8FWAt7rGqAbQ==
X-Received: by 2002:a05:622a:34d:b0:3d0:7bdf:42c4 with SMTP id r13-20020a05622a034d00b003d07bdf42c4mr21989096qtw.59.1679240272931;
        Sun, 19 Mar 2023 08:37:52 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o188-20020a375ac5000000b007460093cccdsm5625801qkb.25.2023.03.19.08.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:37:52 -0700 (PDT)
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
Subject: [PATCH] soc: fsl: qe: remove unused qe_ic_from_irq function
Date: Sun, 19 Mar 2023 11:37:49 -0400
Message-Id: <20230319153749.1705822-1-trix@redhat.com>
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
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
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

