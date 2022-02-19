Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163253B5
	for <llvm@lists.linux.dev>; Sat, 19 Feb 2022 15:29:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id i10so9457668plr.2
        for <llvm@lists.linux.dev>; Sat, 19 Feb 2022 07:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47NPgrzp8pEwO3JsAuNGK/2TmTtZE2oK4TLe+eXt24k=;
        b=KeYxSrOe987fsRSERSCLS2pCJEfmxfA1hjiLW6F6vJjT5JHKBDfucKgOdoVB4d4tu1
         uyooDnUVCGKRNM8r1PNl8vv1Xp2yFXdu+/1dfsenW/IJbtsQGxGsNWVrKUTHywQgBPjG
         /je/SzpLqbszUEFF5tNH7COeD/ukvk/MSGbEv6mM5Ata6iG87syC9RDp9S65O7iWLl6/
         sSjzYZqc/Hzc1jdrzc1QS3Ip1nRZsp7nJv2ef52qHqp24/U1UDKQJtHuULXcExAcb2Qw
         wcme+Ws+OsvBL040g86218zfnOtpRw5l716pZ4U0lIwkyP0aS8k3Q9q5lTJUUWtZ2Wiw
         pGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47NPgrzp8pEwO3JsAuNGK/2TmTtZE2oK4TLe+eXt24k=;
        b=ljgS6wuBD9cjL209c71xA9+iBtlfqyWsUQQz3mBRx5Tdeh29jyT0A2skg6D6xaZwzI
         zT+hia8mArJQQI+e+0rHDG7Taekm+yjxhsxyzTbx+FRFHUUDLs4PcPA3iA3RIwYZm/Qu
         +ligdyHfMWY7Q9R5iPkWIDtwjmrD35dkbMEQUY8hjqMjHXFCnsxi7QQICfzgKlzjxkdu
         cS64vB1zBRud9L5QzBpUIaogeiCliPB6OPuqPI8WmLySnotEYcE1/H/jQ2rdxIcyV8bT
         gtNA7CnZmI1q6D0Q9yLYU8vZn43Z8v+Uv7DUdx4NdudJaF4fQ26+Y4qP6us19Z4LMzto
         ww8w==
X-Gm-Message-State: AOAM531sGDwIpR7bCFQlnssxXRp3yMjKwrP72Mp3YUKQkv8n9/e4d4d7
	bA9MnXgCUTpAcGf+bVuFqm4=
X-Google-Smtp-Source: ABdhPJzYu0ULlV89DL3+dcsS6J6zetu2gCBCzFnC5q8suSdnE3Nuud/LQanfZECxtBxjaAtYC+qhNw==
X-Received: by 2002:a17:902:ce83:b0:14f:2c78:3810 with SMTP id f3-20020a170902ce8300b0014f2c783810mr11668929plg.7.1645284563079;
        Sat, 19 Feb 2022 07:29:23 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9005:88cd:46e0:823b:7e8c:4cf1])
        by smtp.gmail.com with ESMTPSA id g5sm6800354pfv.22.2022.02.19.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 07:29:22 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: loic.poulain@linaro.org,
	kvalo@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ryan.odonoghue@linaro.org
Cc: wcn36xx@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	"Souptick Joarder (HPE)" <jrdr.linux@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] wcn36xx: Initialize channel to NULL inside wcn36xx_change_opchannel()
Date: Sat, 19 Feb 2022 20:59:12 +0530
Message-Id: <20220219152912.93580-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot reported below warning ->
drivers/net/wireless/ath/wcn36xx/main.c:409:7: warning: Branch
condition evaluates to a garbage value
[clang-analyzer-core.uninitialized.Branch]

Also code walk indicates, if channel is not found in first band,
it will break the loop and instead of exit it will go ahead and
assign a garbage value in wcn->channel which looks like a bug.

Initialize channel with NULL should avoid this issue.

Fixes: 	d6f2746691cb ("wcn36xx: Track the band and channel we are tuned to")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/net/wireless/ath/wcn36xx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 75661d449712..1a06eff07107 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -394,7 +394,7 @@ static void wcn36xx_change_opchannel(struct wcn36xx *wcn, int ch)
 	struct ieee80211_vif *vif = NULL;
 	struct wcn36xx_vif *tmp;
 	struct ieee80211_supported_band *band;
-	struct ieee80211_channel *channel;
+	struct ieee80211_channel *channel = NULL;
 	unsigned long flags;
 	int i, j;
 
-- 
2.25.1

