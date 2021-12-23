Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D6029CA
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640276939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uJOgwGjirTFzn7tlsminzBCCoKOlNNhzzWyCm3307/w=;
	b=Cwd6XVFRfyOtfQg+iPJcFvDtfj+fCn8AZA3Gtn9zcUWoru+JjgMmt0B+Gpno00cRNvR/X0
	eXxRMo6xKsatixs7xLkYANF9vcXSKJXMaaCmJ86Zp9W4UdaAuQDAoup1qmK7XrcSbFvxpV
	idX59ax/f7I44Xgzv6v7+LqhaIDrdzY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-sUZKh-y5P2KlMo7bW0Jjqw-1; Thu, 23 Dec 2021 11:28:58 -0500
X-MC-Unique: sUZKh-y5P2KlMo7bW0Jjqw-1
Received: by mail-qk1-f200.google.com with SMTP id bk35-20020a05620a1a2300b0046d2a9b93dfso4654163qkb.16
        for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 08:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJOgwGjirTFzn7tlsminzBCCoKOlNNhzzWyCm3307/w=;
        b=kl7012vazeT+8V2Qa/ot2SizGsD9NWuMkNq/JwDflTA4eB1lRrI/HxVuRQWUWun1i+
         6URd6/VGBMXVEuexr+/382+sHbA4d+aA7r7xxCN697iCxv+UB+Cgs4J3orf7M9O6LJvi
         RLYLJAgqXtXh7+CsfGzvO9k0sigUnBhq+mdziqJtmyKX2Ma2taoDuJqmrdxLTCrpC2NO
         ewe2lONbtA7Lr+AS5gxz0xa30203WyxmUyGI9yAQxDEuebKu3QpdtmxO3QNZrsL0Rama
         3fMRlirDGU//+lZh3+sYBpReqLM/dYx70VC044LY4LhfVMpuYbsymroowRqq2I0I3k/u
         RUnQ==
X-Gm-Message-State: AOAM5319jgDfldL70ciqsnqPwWb3ZwFt6pB9gL0uao/DTDyhA9y+zrkc
	a4w1iwT8/V1K51i67ZNR9Oar3LJp36hG9fAwkf58CFpnisCW77BFpm7S96I/bkOqHsDx2cKNQhf
	bL4b9GdB4vHZpcw==
X-Received: by 2002:a37:a8cc:: with SMTP id r195mr1907016qke.480.1640276938440;
        Thu, 23 Dec 2021 08:28:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzpz9zm2A3nxoNm6dr+ZZ7zHfR2tVjNN8kjrl0r7RnwHfLx6ohxoG8UtvwJHnYzNd5uok2bw==
X-Received: by 2002:a37:a8cc:: with SMTP id r195mr1906996qke.480.1640276938135;
        Thu, 23 Dec 2021 08:28:58 -0800 (PST)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id u11sm4743795qtw.29.2021.12.23.08.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 08:28:57 -0800 (PST)
From: trix@redhat.com
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	linville@tuxdriver.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mac80211: initialize variable have_higher_than_11mbit
Date: Thu, 23 Dec 2021 08:28:48 -0800
Message-Id: <20211223162848.3243702-1-trix@redhat.com>
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

Clang static analysis reports this warnings

mlme.c:5332:7: warning: Branch condition evaluates to a
  garbage value
    have_higher_than_11mbit)
    ^~~~~~~~~~~~~~~~~~~~~~~

have_higher_than_11mbit is only set to true some of the time in
ieee80211_get_rates() but is checked all of the time.  So
have_higher_than_11mbit needs to be initialized to false.

Fixes: 5d6a1b069b7f ("mac80211: set basic rates earlier")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 net/mac80211/mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 51f55c4ee3c6e..766cbbc9c3a72 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -5279,7 +5279,7 @@ static int ieee80211_prep_connection(struct ieee80211_sub_if_data *sdata,
 	 */
 	if (new_sta) {
 		u32 rates = 0, basic_rates = 0;
-		bool have_higher_than_11mbit;
+		bool have_higher_than_11mbit = false;
 		int min_rate = INT_MAX, min_rate_index = -1;
 		const struct cfg80211_bss_ies *ies;
 		int shift = ieee80211_vif_get_shift(&sdata->vif);
-- 
2.26.3

