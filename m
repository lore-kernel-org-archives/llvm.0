Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2367E
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648315215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0gPCasSItm4Ex2ZMUQbF4T4OAP0GG+ryCRQM09Api5o=;
	b=IqgY8ksP/meJbMBD2vByupbDtpRqfuBtu2uo3mk6X8LCXoGbwiaaHFCgZbOMBGZGeCJEht
	5XpljQfu0v2pQZpzZIXGe7p9vfFrXlwy+zYB5GCCXk5q1gkG4t+HTJyoNnn1kRrvO0gKVE
	IRkWqVFECuSmSDW7rcM0y/oIfuIl2bw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-fivGHIgsOEmAhApFUGrBaA-1; Sat, 26 Mar 2022 13:20:14 -0400
X-MC-Unique: fivGHIgsOEmAhApFUGrBaA-1
Received: by mail-qt1-f199.google.com with SMTP id h11-20020ac87d4b000000b002e1c9a3ae51so8408813qtb.0
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 10:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0gPCasSItm4Ex2ZMUQbF4T4OAP0GG+ryCRQM09Api5o=;
        b=Tvt2gro0vFvBGy8JYNwa0rlJTItCbRiCpoErmDFxew5ksOfyHijIsPxhqvZAI7sthZ
         czbTDGQKTZOOLQ2XdCcvTY5hkfE0jGL5olm5we4yWHeFTRVVanyJOmMRU1VsPEOXlilc
         vPt4xtTutulyR3qVop883x3mQhlohoFspqhUnDjMsn3U6P0gbspOJNFeRyyuLau+zvvf
         zJZesLxwPFA9XM+2mZ0vS+quAHxQP+JcgexOHuQnisHt911WsK+5UNUk+LlTT2SNiOwd
         RhepnbUK1W7f6qJsAWxJ7V8X1SGtfFRn18enr6k9S2+hNtujB23OR++2+InT/6QmvHkE
         f40g==
X-Gm-Message-State: AOAM530E5byIC0ZOybgosWtolpOS19pk9ue9k7ieaMISvtL0Hq2EChW6
	hH2K8KIZpUi3ql0wYOnqVmqygVSWlCPRVgIRAIQKB5ySZ7Jgr9ypoi4/zC5SrTigHBWvnwjS2JZ
	aygMSP4D4quFRgQ==
X-Received: by 2002:a05:620a:4047:b0:67d:6729:b241 with SMTP id i7-20020a05620a404700b0067d6729b241mr10750095qko.151.1648315213275;
        Sat, 26 Mar 2022 10:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7zW54pmYavrU4oBp5rsLnr4D2xBrbgGeijtC31l8eEaKfEuQDANgOphYIqyt4r41K+AKekA==
X-Received: by 2002:a05:620a:4047:b0:67d:6729:b241 with SMTP id i7-20020a05620a404700b0067d6729b241mr10750077qko.151.1648315213068;
        Sat, 26 Mar 2022 10:20:13 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id t13-20020a05622a148d00b002e22f105099sm8462282qtx.21.2022.03.26.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 10:20:12 -0700 (PDT)
From: trix@redhat.com
To: shshaikh@marvell.com,
	manishc@marvell.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	sucheta.chakraborty@qlogic.com
Cc: GR-Linux-NIC-Dev@marvell.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] qlcnic: dcb: default to returning -EOPNOTSUPP
Date: Sat, 26 Mar 2022 10:20:03 -0700
Message-Id: <20220326172003.2906474-1-trix@redhat.com>
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
qlcnic_dcb.c:382:10: warning: Assigned value is
  garbage or undefined
  mbx_out = *val;
          ^ ~~~~

val is set in the qlcnic_dcb_query_hw_capability() wrapper.
If there is no query_hw_capability op in dcp, success is
returned without setting the val.

For this and similar wrappers, return -EOPNOTSUPP.

Fixes: 14d385b99059 ("qlcnic: dcb: Query adapter DCB capabilities.")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.h
index 5d79ee4370bcd..7519773eaca6e 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.h
@@ -51,7 +51,7 @@ static inline int qlcnic_dcb_get_hw_capability(struct qlcnic_dcb *dcb)
 	if (dcb && dcb->ops->get_hw_capability)
 		return dcb->ops->get_hw_capability(dcb);
 
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static inline void qlcnic_dcb_free(struct qlcnic_dcb *dcb)
@@ -65,7 +65,7 @@ static inline int qlcnic_dcb_attach(struct qlcnic_dcb *dcb)
 	if (dcb && dcb->ops->attach)
 		return dcb->ops->attach(dcb);
 
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static inline int
@@ -74,7 +74,7 @@ qlcnic_dcb_query_hw_capability(struct qlcnic_dcb *dcb, char *buf)
 	if (dcb && dcb->ops->query_hw_capability)
 		return dcb->ops->query_hw_capability(dcb, buf);
 
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static inline void qlcnic_dcb_get_info(struct qlcnic_dcb *dcb)
@@ -89,7 +89,7 @@ qlcnic_dcb_query_cee_param(struct qlcnic_dcb *dcb, char *buf, u8 type)
 	if (dcb && dcb->ops->query_cee_param)
 		return dcb->ops->query_cee_param(dcb, buf, type);
 
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static inline int qlcnic_dcb_get_cee_cfg(struct qlcnic_dcb *dcb)
@@ -97,7 +97,7 @@ static inline int qlcnic_dcb_get_cee_cfg(struct qlcnic_dcb *dcb)
 	if (dcb && dcb->ops->get_cee_cfg)
 		return dcb->ops->get_cee_cfg(dcb);
 
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static inline void qlcnic_dcb_aen_handler(struct qlcnic_dcb *dcb, void *msg)
-- 
2.26.3

