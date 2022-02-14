Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E27A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644853305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o2n4igdt+OdiIrBK6xR+fpoYm2D50EglcumtCm9hZt8=;
	b=U1lWCTaZ3A80m6xa0IUil7pnVgzqs+RqC+kTrhyzDzH9F1hVZaO6p+nfg2i1rg+WY8Swwb
	1Sw1+LmftpUJDqKlnuMm/pMCvatgPfCOGQnPtJk/hxKFALj+3suC1OiWo8lgbH7euoqfXz
	5jtSmRqsyCS71aDxKRk3wGaAWHehras=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-aUeBnotxN4ey5kyv8IekOg-1; Mon, 14 Feb 2022 10:41:44 -0500
X-MC-Unique: aUeBnotxN4ey5kyv8IekOg-1
Received: by mail-oi1-f198.google.com with SMTP id be36-20020a05680821a400b002cf968c0889so3700557oib.14
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 07:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2n4igdt+OdiIrBK6xR+fpoYm2D50EglcumtCm9hZt8=;
        b=ppjEtARhZ8pOYeUP4m282Oct6P1nC/dnBLWDb4WD55Rm/KWirfKm8w8/5UQYeDvLik
         bs6UnjAFMgWzmk+TrWP6y/8xUNJmMNc9lyqCS/Mgm6ubMeiLAcA5bI31q54KSRBJ0N8j
         w8ciqPf99imJB4RslfeThyZnyhpSaSpMFy3ryiKmp+oY5/vL2cUHN+NbXcCEc8FemCsK
         D//jZQeL4+kX3HJkLvhXm4dAGcf06zhdBI5P7a1M3LkU3i5Qyk7AyNaIBqi9yjrBklm/
         PYXVU95JhpVcvJ4ilbo/lTPYz/Zou25zSewVjsKqPrdPbr9c6QkC/6CDuFpbFIWCxOEY
         b5jA==
X-Gm-Message-State: AOAM53088wtnDIrdoghOA0gHr58Msj3zoae6ftgWdnwsde9wpmz5P0Qi
	JpGJ5D2d0A2BysDIGJbuxbOBfhQcX3s6J6NvgWIcaEhhMCdH+OTSQIC6m86o51pgOXnUTXENhVS
	v4dKPj61SBLkvgQ==
X-Received: by 2002:a05:6870:c20e:: with SMTP id z14mr29932oae.226.1644853303824;
        Mon, 14 Feb 2022 07:41:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykwDMfLBLRPN5iUh2wRhsPvJO6ozI0RxsCmCpzqo4Z8Tbxt3PVn2hkDq2VMttNpeqfULuCBA==
X-Received: by 2002:a05:6870:c20e:: with SMTP id z14mr29920oae.226.1644853303609;
        Mon, 14 Feb 2022 07:41:43 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g17sm12497046ots.73.2022.02.14.07.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:41:43 -0800 (PST)
From: trix@redhat.com
To: ioana.ciornei@nxp.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] dpaa2-switch: fix default return of dpaa2_switch_flower_parse_mirror_key
Date: Mon, 14 Feb 2022 07:41:39 -0800
Message-Id: <20220214154139.2891275-1-trix@redhat.com>
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

Clang static analysis reports this representative problem
dpaa2-switch-flower.c:616:24: warning: The right operand of '=='
  is a garbage value
  tmp->cfg.vlan_id == vlan) {
                   ^  ~~~~
vlan is set in dpaa2_switch_flower_parse_mirror_key(). However
this function can return success without setting vlan.  So
change the default return to -EOPNOTSUPP.

Fixes: 0f3faece5808 ("dpaa2-switch: add VLAN based mirroring")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-flower.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-flower.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-flower.c
index d6eefbbf163f..cacd454ac696 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-flower.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-flower.c
@@ -532,6 +532,7 @@ static int dpaa2_switch_flower_parse_mirror_key(struct flow_cls_offload *cls,
 	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
 	struct flow_dissector *dissector = rule->match.dissector;
 	struct netlink_ext_ack *extack = cls->common.extack;
+	int ret = -EOPNOTSUPP;
 
 	if (dissector->used_keys &
 	    ~(BIT(FLOW_DISSECTOR_KEY_BASIC) |
@@ -561,9 +562,10 @@ static int dpaa2_switch_flower_parse_mirror_key(struct flow_cls_offload *cls,
 		}
 
 		*vlan = (u16)match.key->vlan_id;
+		ret = 0;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int
-- 
2.26.3

