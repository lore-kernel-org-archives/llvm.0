Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF047A
	for <llvm@lists.linux.dev>; Sat,  5 Mar 2022 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646500495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0l403f5Mr+eL7bpML0lL2OSBYrG2pVDxEyNmYkFEjMU=;
	b=bDg3gyK9C8jXolb5VSttxPGy3LsQ6OiRNXCWcRnONaWlqHY5e8IgUeyOXPIfPinYN//lUT
	9d9uct3BR5faNMN4zexMsNOO88Qh0F9I4QbRE8PbQOG/qjPCQkh9bZ+xsD6tM0dgef87G/
	AKWY7lwXJspBROaWwSRP3jOymKK3nto=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-xshh0PKxO-iBLQJi7QaoNg-1; Sat, 05 Mar 2022 12:14:54 -0500
X-MC-Unique: xshh0PKxO-iBLQJi7QaoNg-1
Received: by mail-qk1-f198.google.com with SMTP id s71-20020a37a94a000000b00648c7f2b289so8043963qke.12
        for <llvm@lists.linux.dev>; Sat, 05 Mar 2022 09:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0l403f5Mr+eL7bpML0lL2OSBYrG2pVDxEyNmYkFEjMU=;
        b=GSZDEpPVsBM9zy80rEdrJ82M3P7VQV0M3j3JZu4lt2QXEBve5tnYTqH5euG9ugf6pV
         fVVQODgycxUJsxP7U+F+Zx+7T+JLAZYubdQtVr/Uz8Xw3Ru4wRX8FXtJcfF5CJ9pdwGf
         pHsqeawAOq1SvEoQAdCA1V1sqeLWnu5l3dob1Dh1YJRIqr6hCUYJQKuMka9aNxTj78bO
         uuvV4eEWgSKDe+I1Mvvc7SMHif37CZVGRaD/YIKycG2jaHKIt1iGA5/KiRRdC6MmBHee
         kNBCI1xCjq6kXjjj0ggrRmJRimG4yHTq2kTKCZj3fXsVkFPGm22G4dwgTV1J5J671J7+
         fsNg==
X-Gm-Message-State: AOAM533Q3Dfym+KoCYiN+7rezJMDpGw7zlMfhkRRdJA8QEN25zwL9P7Y
	IS609FbHznCC6WQKwlDWopybtV8lV4RLb+NoY59n/JtgJaprJtN2fuZIG1LVelEpIiely3hoJeL
	rBErfQQm7rqhg9A==
X-Received: by 2002:a05:620a:4006:b0:67a:f431:dbfb with SMTP id h6-20020a05620a400600b0067af431dbfbmr1687597qko.733.1646500494133;
        Sat, 05 Mar 2022 09:14:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/CSIyOclA3zgRSv8u7wpyWf8o7WbJ+0Kc40wi5YWUyKIdoknnxnBkCjzOU1XHq7D0/kOm0Q==
X-Received: by 2002:a05:620a:4006:b0:67a:f431:dbfb with SMTP id h6-20020a05620a400600b0067af431dbfbmr1687578qko.733.1646500493882;
        Sat, 05 Mar 2022 09:14:53 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g7-20020a376b07000000b006492f19ae76sm3908647qkc.27.2022.03.05.09.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 09:14:53 -0800 (PST)
From: trix@redhat.com
To: andrew@lunn.ch,
	vivien.didelot@gmail.com,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: dsa: return success if there was nothing to do
Date: Sat,  5 Mar 2022 09:14:48 -0800
Message-Id: <20220305171448.692839-1-trix@redhat.com>
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
dsa.c:486:2: warning: Undefined or garbage value
  returned to caller
  return err;
  ^~~~~~~~~~

err is only set in the loop.  If the loop is empty,
garbage will be returned.  So initialize err to 0
to handle this noop case.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 net/dsa/dsa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 06d5de28a43ea..fe971a2c15cd1 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -471,7 +471,7 @@ int dsa_port_walk_fdbs(struct dsa_switch *ds, int port, dsa_fdb_walk_cb_t cb)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port);
 	struct dsa_mac_addr *a;
-	int err;
+	int err = 0;
 
 	mutex_lock(&dp->addr_lists_lock);
 
@@ -491,7 +491,7 @@ int dsa_port_walk_mdbs(struct dsa_switch *ds, int port, dsa_fdb_walk_cb_t cb)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port);
 	struct dsa_mac_addr *a;
-	int err;
+	int err = 0;
 
 	mutex_lock(&dp->addr_lists_lock);
 
-- 
2.26.3

