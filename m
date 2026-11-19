Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108209;
	b=k+D41GpLNeJZbRgpkK4Ae5RE/q7hdzmX2WY45hv/IArjq0tX+Y+XNQeXW8WksYLJrE0Q
	 hAERSID5xtxc4DBr1MCke2GPwRFXsbpmRJw09dSIbD7KaM4v2NlpzvQajvnp3v3hQG1rk
	 JaNoZwo98g4ml6GWa7J7eBcv70dU/7B7HF4ggM92P/5/wl/24lsouo/SVJXrIwy0D4Q45
	 0q9czP9aBcv9yUhwoNK3C8guTqybLiliTfat8JEKvDUjj1DPoASguJxol88drX+UN+Mxw
	 SjrkI1O1qsnl9QbzcmNz4uxWwP4G17hJrmUEQ/PjYksGKYL96p2xZekvs9uXhGmNr+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
	b=YBetwyx6W7NKh8z0KKihAMmpPl9Q4JUMdpWuK5zmKXOi+QoWY9cI4HHQhNSY/SQArmjI
	 0fSQUh1gIPAANJ+mqLXxpxYp51UF6rh6VP7j1eKORn5nxB4rEXf8j2JRmh5nz0gpcbHHy
	 OW7GTSlXQUofFOZLNgnJyfBRTEFABdTuiILQQbNQ5ikxAhOfJ8N3N4h2Iygvz+7jdOucQ
	 GIQBmIHsgIpIXwoa2heknPWhcaRUYsPMpr2t7w+BIK+ec8e3GoKeGosQ0lJMXCcl50nLn
	 EM4lqK3G0uiOary95L8GxuvelI6SNAaK3PgJLx6GRFfLOyyz/n3tsi3PepfBcksqyIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cPK1OoKt;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED28606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED28606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cPK1OoKt
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso1422445eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108207; x=1795713007; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
        b=cPK1OoKt3asKI6XDVZVU1KtcQPsd2kS6rfileqo8K+EgFLRYu2KXSHO20WvzQyWzdx
         M5Wz2frtUqfS6mw2dy66ImDPztkrUGnaBkmXDSxrORqYI+yL6DZzrC9Ar897WPDPwYbf
         v9qkYAmLn5rInk3LDKwla58J+nyA1gXmBWhSQOAfYksEM6PWE2OBSFGe6AoR6Gx6LMS5
         /dO0TpOvATXsCEEf3StGIiNaHy7ZfZQYRlXaMn4vAc5N1+sAgiqyJF0wrYeYI6ArCyRC
         zjOpw3XydmaID1pv+MzojpEXKaELKB2rzwchyj1aVtf+gCSFk2c0ygJTFtqBzil3agb7
         rkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108207; x=1795713007;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
        b=FZKHLayS2zxu15Ckle+q8WydUv6phF1E6XVSq+PJGVLdOLWAFXInMoMZB1Tv8XTktZ
         JKxeExYhcxPg4orpIT60M9GNQT9L9lXeO/Xh/0HgJjwG9KQB18wmz0fmX/0hF4m0Jz+E
         MDflL2NM7NgHG7Nz8PNaSnCE9F6NMWmQYN8+Pf/G8ZwU/fXYKcxffp1OSQFbGEp/+55V
         +9HHAjfv8AzJYuAzF/DS4baaLzmzKkXa7xE57Y4guy2wRvoqWak14kKuHh7I9/NA6snO
         SttflIlXHgylcMdugpAx/TLH5UHylrR0KYMzI6UX0HwHuTE1onPAonDy3nko77m6RKJ7
         qtXQ==
X-Forwarded-Encrypted: i=1; AL+hErFpDpAA1Qwdek4E+YqDvCQtlDuxLdu3pb7bZ3gOsAvRhxoh2x+fOzkAT7GghsgWj/Lpsxp2@lists.linux.dev
X-Gm-Message-State: APuU4Z9G4ZwhKWN/LkRVQBklppSZ4EAugBB3PCNwTLV4uNzaasRkIoGY
	UgVvUUiPpj7FAPIdqEOGesPHd7buG/OFes0ndtJtCkwl0nc27hsSa77hinFqscpzQgfQ323VWAp
	h2a96T+h+mQ==
X-Received: from dycuc2.prod.google.com ([2002:a05:693c:3f02:b0:385:6092:b1e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8288:b0:384:6487:b155
 with SMTP id 5a478bee46e88-3846487bba9mr2183037eec.29.1795108207046; Thu, 19
 Nov 2026 09:10:07 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:27 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170927.1532076-1-irogers@google.com>
Subject: [PATCH] wifi: mt76: mt7925: Initialize err in mt7925_set_key()
From: Ian Rogers <irogers@google.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In mt7925_set_key(), when configuring a key on an MLD interface with
key->link_id == -1 and msta->valid_links == 0 (for example during link
teardown or key removal), for_each_set_bit() executes zero iterations
and mt7925_set_key() returns an uninitialized stack variable err.

Initialize err to 0, matching mt7996_set_key().

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/net/wireless/mediatek/mt76/mt7925/
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on MT7925 hardware.

Fixes: 3e758e9f777c ("wifi: mt76: mt7925: add link handling in mt7925_set_key")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8d591f265260..e39e4674e26d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -735,7 +735,7 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt792x_link_sta *mlink;
-	int err;
+	int err = 0;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
-- 
2.56.1.708.g77570a6a1d-goog

