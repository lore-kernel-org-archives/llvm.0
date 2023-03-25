Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE00258D
	for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679749495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p5AnT4EajAj/sfPOwrH8wVcxH+vP8RQ1S3cIG2Qtejc=;
	b=WvPaD2PtZDsc1cigYqZDWsI8g1hpS+GESqARnSbljQfw1WbUh+S7LTxfViMtrms7VivuuJ
	QSi61el2QkSSvOVAFelZcLXhop323tR5DYb2oRMPWNnyYiQmUr+7rj6Bk9zR9UDiy5ZDiQ
	ZLEakyqnKlyMiqYz8uq2RA18Ztbnh8g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-KZKETkNZPSKk8ZE2n4OUfQ-1; Sat, 25 Mar 2023 09:04:09 -0400
X-MC-Unique: KZKETkNZPSKk8ZE2n4OUfQ-1
Received: by mail-qk1-f199.google.com with SMTP id 187-20020a3707c4000000b007468d9a30faso2112410qkh.23
        for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 06:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679749448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5AnT4EajAj/sfPOwrH8wVcxH+vP8RQ1S3cIG2Qtejc=;
        b=BZj/5qIM8M/XVDpfyiYz76zt9qYNuzM/00/HwQT9CyLjpy45mvYq6z26qGYL3MQpjb
         MMIGAqTCJButweZMBBDy19NrZ4T49+8oKjcyVPlv8sHYWJwpBcPQeYVHXlsAaqGPVJCN
         +AA7qMHerN6MVWpMBLeZ8n+zmiZo49K500V+pjAOqS1bdT/yX9ECsshsUW06sWzX9N3L
         bW3bE6U7QEqSH1jRTkk82K0ztPMk0XdQhUVI/romcDQwvYWVdPM0okw20DHhU67bp5Ju
         TkdCl42oILW4da6KB7Mqm9JNUkizDALiNbVSjOUl8XeG1G9LzkbN+xo3R9WUUAu/vZqN
         TgPw==
X-Gm-Message-State: AO0yUKWve0Y+zb804mecs11OutB7q7U+3/S1Jr6lThN30DSWY9TqAboN
	wgRsHh38lud6OIBJRP6uSucZxZqqHrn+cS/CnaLUAcUD3mq4gUihpJGQeyKfZNu8UmkJCPyhV72
	LSUImO6e8UaRzzg==
X-Received: by 2002:ac8:5905:0:b0:3e3:9958:5fe8 with SMTP id 5-20020ac85905000000b003e399585fe8mr10189605qty.42.1679749448559;
        Sat, 25 Mar 2023 06:04:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+2OrXAM6yLwAO51Ihw4Bnlq4mAxCyDb+OhQvXEXhrgJx/Z2aC+vH71MlObmyR5Qq6wWwaDFA==
X-Received: by 2002:ac8:5905:0:b0:3e3:9958:5fe8 with SMTP id 5-20020ac85905000000b003e399585fe8mr10189565qty.42.1679749448292;
        Sat, 25 Mar 2023 06:04:08 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id u23-20020a37ab17000000b0071f0d0aaef7sm11776469qke.80.2023.03.25.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:04:08 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: aspriel@gmail.com,
	franky.lin@broadcom.com,
	hante.meuleman@broadcom.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	johannes.berg@intel.com,
	quic_srirrama@quicinc.com,
	alexander@wetzel-home.de,
	shaul.triebitz@intel.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] wifi: mac80211: remove unused has_5g variable
Date: Sat, 25 Mar 2023 09:03:43 -0400
Message-Id: <20230325130343.1334209-1-trix@redhat.com>
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
drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c:1051:6: error:
  variable 'has_5g' set but not used [-Werror,-Wunused-but-set-variable]
        int has_5g = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index a8333e6adbda..0bd4e679a359 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -1048,7 +1048,6 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 	struct brcms_info *wl = hw->priv;
 	struct brcms_c_info *wlc = wl->wlc;
 	struct ieee80211_supported_band *band;
-	int has_5g = 0;
 	u16 phy_type;
 
 	hw->wiphy->bands[NL80211_BAND_2GHZ] = NULL;
@@ -1070,7 +1069,6 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 
 	/* Assume all bands use the same phy.  True for 11n devices. */
 	if (wl->pub->_nbands > 1) {
-		has_5g++;
 		if (phy_type == PHY_TYPE_N || phy_type == PHY_TYPE_LCN) {
 			band = &wlc->bandstate[BAND_5G_INDEX]->band;
 			*band = brcms_band_5GHz_nphy_template;
-- 
2.27.0

