Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D25E187C
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680095691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WPdjBuNFJA01CaowYyCwadzYirboBSCd7QNKpN6vC7Y=;
	b=KQ+nt+/WU9Wj9Ir2o/0swI4Zd09974ps4JvSoqYkzECKwXZuxM3IPiwMNQYkIBrDbsZujX
	ur1Boe4Xwf4MLgp5zFzjHmtW8Nt7hPsdcjmFnkcK1mq8PG3auCS4J1WC1FkFmehpnFTX1E
	1pis3o6d6xjsxbAq69y9ZSm2t1oUFek=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-hwLbXrLfNjiYa9JaT_9ulw-1; Wed, 29 Mar 2023 09:14:49 -0400
X-MC-Unique: hwLbXrLfNjiYa9JaT_9ulw-1
Received: by mail-qt1-f200.google.com with SMTP id b11-20020ac87fcb000000b003e37d72d532so10196028qtk.18
        for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 06:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680095689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPdjBuNFJA01CaowYyCwadzYirboBSCd7QNKpN6vC7Y=;
        b=kgcsd8sFLlR1W9MCU6KqNheUCghaYUOamUzOwir33Tj2s1PfoXoNTEIKnDJDO4/fa2
         A3KUTz9SryrsELSLtNCzU98YHJnUhll1UIKawI1pAbEmgy42BgUsxo6u3bxTUVrnRoHr
         TYmiMZ31cs65TZImpUaQatJBB/vbBBzOzSFsFkelcPqlvyP8m/VsCiQKtOqEnivBtpmj
         tYZ2mEORWAEr0jD7Gvn/HUyQKw9H42DxEogY4++WQE9y+WPOZJlFAsMMCXX2+SdUQEom
         kT0YhCt8PWDi2QTiH3sozGFxVHGgVYFjHCmpoOLYVv7lcidQz3oodOr3YIjeljLFD7DC
         yk4Q==
X-Gm-Message-State: AAQBX9exSNLXUt488KVvboFQpdPTh6Okl4iJuwuoGL/9sC4kQS6iuQmc
	XIbHBo3XcyqVvL7zpYPbLuDcHg6oRZOpjoJRkBEdNoQYLmEvA+4ujmTwUFQgVi3DJW9tYFn5IWz
	kUIlA/GuAblRiiQ==
X-Received: by 2002:a05:622a:1aaa:b0:3e0:b1cc:40e1 with SMTP id s42-20020a05622a1aaa00b003e0b1cc40e1mr3420402qtc.34.1680095689091;
        Wed, 29 Mar 2023 06:14:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aFSwrLO0P2h8zzqcnjlp0S/1t1QpJlUafJta+Wduz8ax0ZCRHmpsFg7r/2A3p9mPdMpRZMcw==
X-Received: by 2002:a05:622a:1aaa:b0:3e0:b1cc:40e1 with SMTP id s42-20020a05622a1aaa00b003e0b1cc40e1mr3420351qtc.34.1680095688803;
        Wed, 29 Mar 2023 06:14:48 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id f66-20020a37d245000000b00745f3200f54sm18486229qkj.112.2023.03.29.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:14:48 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: amitkarwar@gmail.com,
	ganapathi017@gmail.com,
	sharvari.harisangam@nxp.com,
	huxinming820@gmail.com,
	kvalo@kernel.org,
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
Subject: [PATCH] mwifiex: remove unused evt_buf variable
Date: Wed, 29 Mar 2023 09:14:44 -0400
Message-Id: <20230329131444.1809018-1-trix@redhat.com>
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
drivers/net/wireless/marvell/mwifiex/11h.c:198:6: error: variable
  'evt_buf' set but not used [-Werror,-Wunused-but-set-variable]
        u8 *evt_buf;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/marvell/mwifiex/11h.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/11h.c b/drivers/net/wireless/marvell/mwifiex/11h.c
index b0c40a776a2e..2ea03725f188 100644
--- a/drivers/net/wireless/marvell/mwifiex/11h.c
+++ b/drivers/net/wireless/marvell/mwifiex/11h.c
@@ -195,7 +195,6 @@ int mwifiex_11h_handle_chanrpt_ready(struct mwifiex_private *priv,
 {
 	struct host_cmd_ds_chan_rpt_event *rpt_event;
 	struct mwifiex_ie_types_chan_rpt_data *rpt;
-	u8 *evt_buf;
 	u16 event_len, tlv_len;
 
 	rpt_event = (void *)(skb->data + sizeof(u32));
@@ -208,8 +207,6 @@ int mwifiex_11h_handle_chanrpt_ready(struct mwifiex_private *priv,
 		return -1;
 	}
 
-	evt_buf = (void *)&rpt_event->tlvbuf;
-
 	while (event_len >= sizeof(struct mwifiex_ie_types_header)) {
 		rpt = (void *)&rpt_event->tlvbuf;
 		tlv_len = le16_to_cpu(rpt->header.len);
@@ -231,7 +228,6 @@ int mwifiex_11h_handle_chanrpt_ready(struct mwifiex_private *priv,
 			break;
 		}
 
-		evt_buf += (tlv_len + sizeof(rpt->header));
 		event_len -= (tlv_len + sizeof(rpt->header));
 	}
 
-- 
2.27.0

