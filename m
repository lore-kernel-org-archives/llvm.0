Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F285662
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679664417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rqu3TJ9Us4tjFNY0o3zPlo/dxstIWcHIOGlWftNzUnQ=;
	b=eh62+0trEr7F8Xo2fRLbctUumberdj0TmYkvEnAbOsM79hU/h4QrIDmEaWM9U86jUrntFl
	FqborovT+Xkp8+0CP1CW+0HYZsSKbv74OQozKe8zxtkAc7tQDCCTkmyFl+FhTHDECSVKoT
	sTE7qoPwCL2GfUatxBlFrawHpqRp9m0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-3AFWlN1bO8Cn1z6UjbxhfQ-1; Fri, 24 Mar 2023 09:26:56 -0400
X-MC-Unique: 3AFWlN1bO8Cn1z6UjbxhfQ-1
Received: by mail-qk1-f197.google.com with SMTP id s12-20020a37a90c000000b007468eaf866aso751275qke.17
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 06:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679664416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqu3TJ9Us4tjFNY0o3zPlo/dxstIWcHIOGlWftNzUnQ=;
        b=XhjdlBPSqKgn9yQFvsQoMlgPmYnvUD8xerY7U4Lf4wYpF7uPe/zX7huXIR+KuClPmg
         cLpOJ8h0/pJhx8e24b9Gw75Y++x3x0ptbqN16JmVjuxnuB1hF3KzsJOxM5fYRSjSV3sg
         CdrUzWWcC32PXmu4dwfEjKcCyac3iqEAzmSi+ppjQgfLkpUEqFWq7avpimL1X3G8cstF
         Vl2oF61A3i46gKl3RCJTqe8aNBUFE5CqisFO7EA9cWQZsQAnORxb8+CGpyeISmkphk/v
         dnNIZXJIUfMpdO8amCvCcLjBq6e2/OZPemcciWo8ndHpWGaxEHLC2VqPgW+W5JP1CkDj
         UKRw==
X-Gm-Message-State: AAQBX9dg8kp1ByjKkn1Mel6ijopxOq6aOlAtVcNWkr7eidJ6WugCCMjw
	ZlhOGVpPtz+h4Z2rrKlc0FNzqPnmo27wZi0DQ5A32V2d05+XF4WcQpdFi1gU4rG6Iw/JcKuvOkF
	e+jkWuWrrnpgDBA==
X-Received: by 2002:a05:6214:d07:b0:5ad:1a83:8021 with SMTP id 7-20020a0562140d0700b005ad1a838021mr3926028qvh.49.1679664415749;
        Fri, 24 Mar 2023 06:26:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bWyV7OYeyD9u0w6iNh0EYkkwfo17tJz1C8lhIiQ8oaWqvEFwUsQXfvyFHVNhZAkqBx+PZ4Og==
X-Received: by 2002:a05:6214:d07:b0:5ad:1a83:8021 with SMTP id 7-20020a0562140d0700b005ad1a838021mr3926002qvh.49.1679664415511;
        Fri, 24 Mar 2023 06:26:55 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 123-20020a370381000000b00746a7945d87sm5095680qkd.52.2023.03.24.06.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 06:26:55 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] phy: rockchip: remove unused hw_to_inno function
Date: Fri, 24 Mar 2023 09:26:49 -0400
Message-Id: <20230324132649.2649166-1-trix@redhat.com>
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
drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:284:36: error:
  unused function 'hw_to_inno' [-Werror,-Wunused-function]
static inline struct inno_dsidphy *hw_to_inno(struct clk_hw *hw)
                                   ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 726928ff1273..401b0aabb159 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -281,11 +281,6 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_2_5ghz[] = {
 	{2500000000, 0x15, 0x54, 0x7f, 0x15, 0x6a},
 };
 
-static inline struct inno_dsidphy *hw_to_inno(struct clk_hw *hw)
-{
-	return container_of(hw, struct inno_dsidphy, pll.hw);
-}
-
 static void phy_update_bits(struct inno_dsidphy *inno,
 			    u8 first, u8 second, u8 mask, u8 val)
 {
-- 
2.27.0

