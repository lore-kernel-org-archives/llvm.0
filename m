Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9F928EB
	for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679750775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Iii/UTDXaMnO4Wo0x/DUKmtgVb8N0aI08+TcTOIFrv0=;
	b=VNLcl38d5bcw/PjyQVXrVdnOeCfG3gCBkJf78FckX3j3gSEfwm3dNxZeoDHDOM+7TkcZYK
	ApC/JzVpM9dM12jg38oGg+TZ5ynKQc5U2jxtOujDk2RS9Q/0mnCzGeUFMpOiZQaGupY39X
	OMhi0o0jwXZk16lGQSPGqMml7Nl2I9A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-vuiQAYkANJarfEW3tcBKjQ-1; Sat, 25 Mar 2023 09:26:14 -0400
X-MC-Unique: vuiQAYkANJarfEW3tcBKjQ-1
Received: by mail-qt1-f200.google.com with SMTP id n10-20020a05622a11ca00b003e4e30c6c98so50027qtk.19
        for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 06:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iii/UTDXaMnO4Wo0x/DUKmtgVb8N0aI08+TcTOIFrv0=;
        b=Kz+XBOsH+uwHLSokCSBkWRJsiqLwR+78RRxyFF53tD+zGA1CjTko1a9FzzaBEM5K6z
         KyPgp4somXWx6RzlMhXc87R6hiIsKOkGVXhpvx/FJHvs+D+jw8qkSbNxG8CZDxaP+z19
         Ob3MX2YXDJfSkAyiI8GnOn5ApE2k9B2ncaJFEkbHOOOlJO0XEpTh0Zuq5G+ORksKvWjM
         rEZFAdr9q2k9WepjzbtWUEsxPG3OPIrdAV66iInO8cZUHFLIsv1unskdQF+BYMvSWMmG
         Xz7r9uG3IxnKPIyBjlUlcQZWR5K7nemBdaBPrLOu84zaBF83a+BgCkr+T0ytDwHdu6JN
         OwCA==
X-Gm-Message-State: AAQBX9f9ZPKM0uZv84FgI3WUnJfdtx5VLOHxY2ziCSnJxr7y2i6PEO3l
	NpQQYm6ETjyeSb9wAG68Hk7RAas6op1Vp1F/57i7Yi4DXxZ7xIAICgn90MatDrs4NJ3gOHz43XX
	mXrNXJ9O4eWp99Q==
X-Received: by 2002:ad4:5bca:0:b0:5db:4d15:524d with SMTP id t10-20020ad45bca000000b005db4d15524dmr9054493qvt.52.1679750773653;
        Sat, 25 Mar 2023 06:26:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZlSGE95XTMsRO2eDXbclLRJ4kBq2KCSDNceqlNvQKjXpkqvXFlqtmH3evRGVGbNTwKl3s28w==
X-Received: by 2002:ad4:5bca:0:b0:5db:4d15:524d with SMTP id t10-20020ad45bca000000b005db4d15524dmr9054475qvt.52.1679750773419;
        Sat, 25 Mar 2023 06:26:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 11-20020a05620a040b00b007468733cd1fsm4212329qkp.58.2023.03.25.06.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:26:13 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mac80211: minstrel_ht: remove unused n_supported variable
Date: Sat, 25 Mar 2023 09:26:10 -0400
Message-Id: <20230325132610.1334820-1-trix@redhat.com>
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
net/mac80211/rc80211_minstrel_ht.c:1711:6: error: variable
  'n_supported' set but not used [-Werror,-Wunused-but-set-variable]
        int n_supported = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 net/mac80211/rc80211_minstrel_ht.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index 762346598338..b34c80522047 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -1708,7 +1708,6 @@ minstrel_ht_update_caps(void *priv, struct ieee80211_supported_band *sband,
 	struct sta_info *sta_info;
 	bool ldpc, erp;
 	int use_vht;
-	int n_supported = 0;
 	int ack_dur;
 	int stbc;
 	int i;
@@ -1791,8 +1790,6 @@ minstrel_ht_update_caps(void *priv, struct ieee80211_supported_band *sband,
 				continue;
 
 			mi->supported[i] = mcs->rx_mask[nss - 1];
-			if (mi->supported[i])
-				n_supported++;
 			continue;
 		}
 
@@ -1819,9 +1816,6 @@ minstrel_ht_update_caps(void *priv, struct ieee80211_supported_band *sband,
 
 		mi->supported[i] = minstrel_get_valid_vht_rates(bw, nss,
 				vht_cap->vht_mcs.tx_mcs_map);
-
-		if (mi->supported[i])
-			n_supported++;
 	}
 
 	sta_info = container_of(sta, struct sta_info, sta);
-- 
2.27.0

