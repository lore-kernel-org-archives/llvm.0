Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D5331EE7
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684326797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8z2vZD/Mt9cHAxNPllMtq5Gn202/y1MZsQVh5pJbJGM=;
	b=iXG7m7k/Voehcq0na8mVCNSY3GPRKwHzaN/AzwKy0LmgIOJSpGcr/gTSDGDPBRnT2CzbVm
	cPHvNQU4X/SQAbSvHb+JdrPsm7k9qCxzqKj/C0qJnCFujM/mJ/YTTQnRX7eYkc5YsaEA3X
	tEpdWEW/WFAqaMwGyn16yvDMonTqY1k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-_li2vCocOHiLvYVVBA54jw-1; Wed, 17 May 2023 08:33:16 -0400
X-MC-Unique: _li2vCocOHiLvYVVBA54jw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6213569ba95so10570686d6.1
        for <llvm@lists.linux.dev>; Wed, 17 May 2023 05:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684326795; x=1686918795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8z2vZD/Mt9cHAxNPllMtq5Gn202/y1MZsQVh5pJbJGM=;
        b=GJN5zH+SyRHTUkrzGu1N2E7YwTQOKxKS/O47Fw5V5r61zJ8HIwxlyabeOdH4bztXVe
         xHYe/RToZykoMU13B2kILitrmuJIhmRnkXlr+JzCZaK/cYZjKA8ULMFedZyWwU0Fru3h
         alG3MMIFQSTBstQXHih7DtCTFh3ehtcp5qhAovQxgi27lF2arJiQuRv3WW7GU28PoYXp
         CSTQS/kVWMs0XlkjboT8ohUiFeFJnkQ9yvEhaYLJEfEc1OOBpFgXpvHbrDd+Pgr+LIh3
         cxJV2IYHH026CW+fwXyGvdxQ2ZmEX2yZ+kuzpZOBVpcPQhizBtYq5n1NXL99ARBk/Ju1
         KA4w==
X-Gm-Message-State: AC+VfDydQNrAeEQJoLzdo3ebxWLsnr8W0zp/L/JgMld/zq4FEaU/VCOr
	c5+6y9fF2C5OkHOM2HXXNCbBsKj165hUKDaSV3T+0/m4z/U7sSh3Df5QiYajzN6KJQ211ZXyALE
	J1tk67KKvDF7jFg==
X-Received: by 2002:a05:6214:501b:b0:5ef:45a7:a3c0 with SMTP id jo27-20020a056214501b00b005ef45a7a3c0mr64278017qvb.27.1684326795656;
        Wed, 17 May 2023 05:33:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lcwZCrP5ym6tgc0dTs+Pyybh7A+czybYSDpfRXvVjBpMBMbt7jNR80EZ4gMhVuD96wNBLdQ==
X-Received: by 2002:a05:6214:501b:b0:5ef:45a7:a3c0 with SMTP id jo27-20020a056214501b00b005ef45a7a3c0mr64277993qvb.27.1684326795438;
        Wed, 17 May 2023 05:33:15 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j5-20020a37c245000000b007595df328dcsm564251qkm.115.2023.05.17.05.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 05:33:15 -0700 (PDT)
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
Subject: [PATCH] lib80211: remove unused variables iv32 and iv16
Date: Wed, 17 May 2023 08:33:10 -0400
Message-Id: <20230517123310.873023-1-trix@redhat.com>
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
net/wireless/lib80211_crypt_tkip.c:667:7: error: variable 'iv32'
  set but not used [-Werror,-Wunused-but-set-variable]
                u32 iv32 = tkey->tx_iv32;
                    ^
This variable not used so remove it.
Then remove a similar iv16 variable.
Remove the comment because the length is returned.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 net/wireless/lib80211_crypt_tkip.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/net/wireless/lib80211_crypt_tkip.c b/net/wireless/lib80211_crypt_tkip.c
index 1b4d6c87a5c5..9b411b6a7b5d 100644
--- a/net/wireless/lib80211_crypt_tkip.c
+++ b/net/wireless/lib80211_crypt_tkip.c
@@ -662,12 +662,6 @@ static int lib80211_tkip_get_key(void *key, int len, u8 * seq, void *priv)
 	memcpy(key, tkey->key, TKIP_KEY_LEN);
 
 	if (seq) {
-		/* Return the sequence number of the last transmitted frame. */
-		u16 iv16 = tkey->tx_iv16;
-		u32 iv32 = tkey->tx_iv32;
-		if (iv16 == 0)
-			iv32--;
-		iv16--;
 		seq[0] = tkey->tx_iv16;
 		seq[1] = tkey->tx_iv16 >> 8;
 		seq[2] = tkey->tx_iv32;
-- 
2.27.0

