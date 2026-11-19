Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108163;
	b=ij0nMlPjHOyN5dbFmDHL5NhbAUVkrnrRbbCsC45RBmgyNKz3/LZZkxkPiacNGJPAKFfn
	 Yd/Qd5wCqCb9I0ExsB2FlKV6w2vUWlbgxgUZt8bFRm4quMKSVXROfRefA12fbRuUWY7Om
	 i5T5E/S8FG/CqW3xmgDtA+WKWJAyPM6KOPnCdxSjaK+fnkxJrNn1HtbZzTgOYR7feVkAN
	 cMjQffyh1ksMaqlKwYQDoWpiD3OGHPWrC+M7YvKYcmb1n1I1vUuvIw7wZp0RTUNe1z+Zp
	 fz6ZGWLGDblSpgOe1zzNA1dulBqjAX39Bh9TxU4ntcLObG1BkoiqxUzrWXfAeOBi7fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zp/eWIvAWdcJU6LCqEw8Tba2FtGF8iLEdj4AaHHxWjc=;
	b=JfB0M3obDrHAaECyUKAkGNPnue++J0HNSu3eqvu1Q52oAHh/NzByc+0Cb7iePMIPXi/r
	 D12O4b231sdoJy3TaVQLk8B+MwS+4lZrxRIm2TBIiv4pF1V4nCSu0AaZfrI7//Bad/Y1Q
	 LzPEsvlNozTw74d8IbOc0Bg7CDrlPBj1XScGLhfO/Dy7sjIJs9N3qilCLrEc33R3f5xdS
	 fuqYlGgoiUHA7oe/tnkQK2f3JH8JkbvvLu3DrSKFGgivh0Z4vRJE2poSVU0cLSp6ODXtQ
	 PqIB8fy18tN0bmUUUMiw+GzOgwkmYGcozqCsmXfDQ1htqPNTyKGBD4taTCCouAPf8Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=al3l4iIY;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B289606A637
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B289606A637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=al3l4iIY
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so1161568eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108163; x=1795712963; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zp/eWIvAWdcJU6LCqEw8Tba2FtGF8iLEdj4AaHHxWjc=;
        b=al3l4iIYgXAqMcrMUtEfbNqBL9RTt/xRwXimziwScDuXpEICw1R9Rs7g7mTliaM8U+
         QKQ/WgVt+ZjlWkOYHRVYFKlkvZBpPqtoPQVUW9ipLFpUf0bhWs+HjVsDDU2546P4aH5a
         Q2O6cGwVSb62HjkxbBYhX5dlC+cvdyBRUIcMth6Zq3m6bRZ4Ke12YM3LbP1sZZ11J5qc
         U+Tflpa7N2/XKsGSumGK1piroSxgD8KLBbn1AIwnqxQlt6B6O9ifVkuGPOFfzyJ4ZaFA
         YdqvAGw0HfgZeIdi3qxkBHbj2bgMNGb3zks6wWexGkxZQYoCiS7bQddLHb0G7EfRmHtp
         22pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108163; x=1795712963;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zp/eWIvAWdcJU6LCqEw8Tba2FtGF8iLEdj4AaHHxWjc=;
        b=rK4x0sqPiWKIOTNr2VIbpn611lSPwl96i3E8DBTd3y7llD8q3ejsPj42Qy1uopc4JE
         ylCrpO64VsE+2hAbFaNe5RSw/hVmXPkluXcbsQeZWQTcLcxFHOCfkmNm2KoHN263I0hC
         pmnD32yF7CVBGHK2+tiDg/pgVgBjRzuQQDxw6wMgyD4oDHs59Yr8S/gikdMQBPtrMRo4
         iRzE6A0NJq2JD3Gf0gS6BJRP5MiQiDNRftSOM4RJ+CbBt0MoW43T92S/qa3QpWQtFyO5
         cXESlJsxqeZB650E549KSZdqh/XzpqEMOi2AllSccjKAPJIDsYfj62aM2rc3E6IHZoHO
         Vpgg==
X-Forwarded-Encrypted: i=1; AL+hErEjiE4q6dM8mSBZeGd9o6WkH8BI5sG0f6+L6+WJIishHJrwvV7poKHfpLCIArYcbtSbFLNJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+G0vKANfjuaaW+YssPdmRyLeyjvQhjO9ug3OUkGVvKu3E6Bojm
	pUKF028thMH75f0+CD7y+wzUc3RTF0X5EM5ZEKvFry7OmHAc/YWmqTvNghEuydlZZ7w2/u7Cq1V
	HQP4ah11fsg==
X-Received: from dya17.prod.google.com ([2002:a05:693c:6211:b0:36a:1f25:64f4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1403:b0:385:5297:573
 with SMTP id 5a478bee46e88-3856f25fae8mr252eec.4.1795108162235; Thu, 19 Nov
 2026 09:09:22 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:10 -0800
In-Reply-To: <cover.1795106967.git.irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106967.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <97716b88b986cdfd77a6d90cd4c159a79f96b9bd.1795106967.git.irogers@google.com>
Subject: [PATCH 1/2] wifi: mac80211: Return 0 from ieee80211_reconfig_nan_offload_de()
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 589c06e8fdee ("wifi: mac80211: add NAN local schedule support")
factored ieee80211_reconfig_nan_offload_de() out of
ieee80211_reconfig_nan() and added 'return res;' at the end without
initializing res.

When an active NAN interface with offloaded Discovery Engine has no
registered NAN functions in function_inst_ids, the drv_add_nan_func()
loop executes zero iterations and returns uninitialized stack memory
to ieee80211_reconfig_nan(), triggering spurious WARN_ON()s and
reconfig failures during hardware restart or resume. Moreover,
per-function drv_add_nan_func() errors are already handled inside the
loop via ieee80211_nan_func_terminated().

Return 0 after processing the NAN function array, restoring the
pre-589c06e8fdee behavior.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building net/mac80211/util.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on NAN
hardware.

Fixes: 589c06e8fdee ("wifi: mac80211: add NAN local schedule support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/mac80211/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 44feb80274c6..9fda135dc112 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1800,7 +1800,7 @@ ieee80211_reconfig_nan_offload_de(struct ieee80211_sub_if_data *sdata)
 	}
 
 	kfree(funcs);
-	return res;
+	return 0;
 }
 
 static int ieee80211_reconfig_nan(struct ieee80211_sub_if_data *sdata)
-- 
2.56.1.708.g77570a6a1d-goog

