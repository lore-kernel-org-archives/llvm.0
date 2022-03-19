Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D74163
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647700508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GAQCYGXnCBLWEzIGkshbYT42tHmWJ6Z4cQSEVkWfLQ8=;
	b=UkVOXNUc5GfW7ivRIFMhGsikyEuHYrtxN7jQd0MI205V7wWorca7lCm5aSP8IIuD/SdRNf
	gYZjYjYv1CuXAQHc9PJ1thpctD74dBm/Q6KfrHdzWaQy5xx+56n3TRdny9/FeIvH9vpkw9
	UTBAzFky57nFQwwDg0sF8ytdsrdy41s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-AFzj-9nJMAy2BetJolhaPA-1; Sat, 19 Mar 2022 10:35:07 -0400
X-MC-Unique: AFzj-9nJMAy2BetJolhaPA-1
Received: by mail-qk1-f198.google.com with SMTP id 207-20020a3703d8000000b0067b14f0844dso6945186qkd.22
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 07:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GAQCYGXnCBLWEzIGkshbYT42tHmWJ6Z4cQSEVkWfLQ8=;
        b=Bk/VbsmWAWnwEo2X4YVzxt98A9g65EIDmK8EU6ciB1wcmKp9h9394S2GDbaDdkUJxV
         Y1rmeT+h/b8coaf2Ka7fwdUHwHsOFsjc4nUsq/cWxQO+5a1w4t/K/UdYl1ikuF1zLZug
         rblxhJ+EWalTBp5spzLhegwGS4LpPH/Nuqot+wLN8yON5XRvQYAu+6Sqag11rRRa5YO5
         sNY3ENEFLyfXLxLj2cHics+dvQtsTyWx6snAeT6EtiiYs/luEihsqi0VnDCzmn5M2mYA
         7JGK4YlEQQtcMFMWkBSB+vF56IgxQtZfBKFO+ovB7skHSUBAULeWypSXuGMPpFyAP0TJ
         ft5Q==
X-Gm-Message-State: AOAM5306KzQ9S18sedLteAY11QfcfOsEWpptrDggVnuuVbC4ZnIfl/Bi
	4ohhQOZNFcLVOgCK0T3Mq1+qegMj64WQAL/E4keK0Ht3/Tbl/qvCMoQVM6xKZURwtBI2XqJoWGX
	hkJM1rqP0fX3BoA==
X-Received: by 2002:ad4:5be5:0:b0:441:97c:a97a with SMTP id k5-20020ad45be5000000b00441097ca97amr3246786qvc.16.1647700506531;
        Sat, 19 Mar 2022 07:35:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfq4jDK0s9fZuB9ykHKFmiu2hbf/+DxEjamwDJENi7TA1z4CyHuQ0jJDFVJV4prFMQKdzZdA==
X-Received: by 2002:ad4:5be5:0:b0:441:97c:a97a with SMTP id k5-20020ad45be5000000b00441097ca97amr3246765qvc.16.1647700506284;
        Sat, 19 Mar 2022 07:35:06 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id d13-20020a05622a15cd00b002e1df990d01sm7891564qty.71.2022.03.19.07.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 07:35:05 -0700 (PDT)
From: trix@redhat.com
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] media: platform: return early if the iface is not handled
Date: Sat, 19 Mar 2022 07:34:56 -0700
Message-Id: <20220319143456.2159540-1-trix@redhat.com>
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

Clang static analysis reports this issue
ispcsiphy.c:63:14: warning: The left operand of '<<'
  is a garbage value
        reg |= mode << shift;
               ~~~~ ^
The iface switch-statement default case falls through
to ISP_INTERFACE_CCP2B_PHY1.  Which is later checked
to set the mode.  Since the default case is left out
of this check mode is never set.  Instead of falling
through and assuming a ISP_INTERFACE_CCP2B_PHY1
iface, return.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/platform/ti/omap3isp/ispcsiphy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispcsiphy.c b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
index 6dc7359c5131d..1bde76c0adbee 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsiphy.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
@@ -31,7 +31,8 @@ static void csiphy_routing_cfg_3630(struct isp_csiphy *phy,
 
 	switch (iface) {
 	default:
-	/* Should not happen in practice, but let's keep the compiler happy. */
+		/* Should not happen in practice, but let's keep the compiler happy. */
+		return;
 	case ISP_INTERFACE_CCP2B_PHY1:
 		reg &= ~OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2;
 		shift = OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_PHY1_SHIFT;
-- 
2.26.3

