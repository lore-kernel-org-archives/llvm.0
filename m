Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108158;
	b=w9uUPnM/coT04MelukumnVONN2URMACpPmwbPe6mTG8YPA1DUQGtskZ794Uj3cs1vZfh
	 IAepK+zp6kxfLQIQMOR6/HvsWySdBtjegVSMjm6eccAudu67Oron2QO0LzE9y81P2PFlm
	 iCVrH3XOdoBE+qjyFSPXYlpeLyZtWdsabv/3vhPgUtcNyQ1Cp6qWsX6UAI/2lx1JPf8FN
	 qSmOSTj2N1zPFFnJ6q3un1Qcy2j9Ab/a5sPdeaArrtaFG643VhpX1JVmpwwDSaMKgwCGx
	 V7JX6rGq7XD3ihFBCwryng8ig0DMbhgc+GsginEJKJmukY0EUTTXp0x4e1X/SskaKvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
	b=BrkHgKmWOwgpCdU/6LscIanbmQ62T6yic5OrTtP4M+CFb2rrMiKEsvIYUu21s3wLjFSM
	 ydrvFdTrVPeux4pobDaJuFOPH4QKeFEXf6HdhtUQp9y6TExjMkS4TJIOgBkYstZBbPD4y
	 GbE9j7UPsS/fXEAx561r50HJlpg+xPrnkJEE6V6EAQtcyaTNHgntuGv3UnzShvshuQ9g5
	 dJmRigHToAtDFsQGS8rYbKEJX0ePALA7qfZSZqjuDIUYkxermnUrRGdQ9VhiQiKrJQoot
	 0OGtpeeXeRgDO98n6HZ5Q17yyR5OMF0TPeoF8xWyn6uaELR259aiVV5YyzyQF7DkGJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UEEnzUqC;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2060A2603
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D2060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UEEnzUqC
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e778acdbc6so27674b6e.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108157; x=1795712957; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
        b=UEEnzUqCWjiQwBHohcmIDjDGG88TcWtDfRMF5sLDyxIe9+wvNP1zf4MkCjb/5xa4iD
         vbv4iq2Osxq+tdz+eMPkS35LGD0LFWjLC6w80i4tA+n3dLnTH9GWl6bnUA2JsiKDhQxz
         bd87oUiosIN3i3iUfeJLPIgh0FsF7daDJIadGiTizh/RCR9Ez3d0CIGYwpiP3yZCTx6O
         qZM4ZQ+zCUeH/2uF3DDjh5qZLz9kJVA4dpaX7h7IvoafaVXNhsilsGir2K+pI9BwbJUX
         nYPUAppWJXMkGrjmokJXafwR/AJUQXfyUdHR49d6niGufqIrfkCS1UK8MHtqX8yZOkAo
         Pc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108157; x=1795712957;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
        b=Olooqr8KJh7xZV/tfUPZuMUrV1BrPbBNb+1JLcg/9VqZHpftGd99UNUapBmkYB2cw3
         RI9RF+EsaC9CTTlDEVWFRnl9ykx+wgJA4BgHMIMzk/WKjfFkU0hEVjbAZXL2TP4sTnjn
         +86ZjhLQIJWr5dN6cEU8sCh7ulYhcYL1F3bfvRWcY1/jlX8puAYL8LgrgUpxtertVnTz
         4+Uuh0p4xofsWZm5P86xg6E4+58UJuzncGjoBRtOoJWrifEsharb5Lmk7mM6xwMbKWyL
         wHCXYe7TiqHKjCBgv8q6KBGC9fHJ2nfsXLimJn22wluuMgaCDoBe5eWk93gTKf7TX7CU
         +XQA==
X-Forwarded-Encrypted: i=1; AL+hErEGdnv3jxTfncR+m1ee4JnkfwWG/H/TVVkHNL9yINl3clIHCct01M3l2aRvIPHnVyaIohHx@lists.linux.dev
X-Gm-Message-State: APuU4Z9HoOHzjDUYS+HkW+FcLhIl8wXQwu9hRM0OncsIlfCjrxwzEvpv
	tKInPBDFdF8koH18PngZCb5LscPWsOH9MvxvNGkU5UVOOBbDpWxEaotxOicW4vO6MGKDUflu6D/
	wB3lYDXyydw==
X-Received: from ioi25-n2.prod.google.com ([2002:a05:6602:c659:20b0:9e0:f209:1acb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:14c3:b0:4fa:8d48:3a5a
 with SMTP id 5614622812f47-57a0b44ccfemr598788b6e.38.1795108157215; Thu, 19
 Nov 2026 09:09:17 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:09 -0800
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
Message-ID: <cover.1795106967.git.irogers@google.com>
Subject: [PATCH 0/2] wifi: mac80211: Two return-value fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two return-value fixes in mac80211 found while auditing Clang
warnings (-Wconditional-uninitialized and -Wimplicit-int-enum-cast)
on an x86_64 allyesconfig build:

1. Return 0 instead of uninitialized res at the end of
   ieee80211_reconfig_nan_offload_de().
2. Return NEG_TTLM_RES_REJECT instead of -EIO in
   drv_can_activate_links() when sdata is not in driver.

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
wireless hardware.

Ian Rogers (2):
  wifi: mac80211: Return 0 from ieee80211_reconfig_nan_offload_de()
  wifi: mac80211: Return NEG_TTLM_RES_REJECT when sdata is not in driver

 net/mac80211/driver-ops.h | 2 +-
 net/mac80211/util.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

