Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640517;
	b=g0kwKdnR/TMjLqqxbbSxT5BXMeEdJYyXwLsXnzyWdm2at+If367WADaywkHBPcrDJC5K
	 7GuZ66EwlRQwBnlRGBYzGiu9MC9YRU0uUT2nMymWEMKNSjb6g9tATxcQ+xFdzAWS5qDzX
	 ul9zZc+yPkBYMc/Wzv9x66ZU+LWDNo1KG453BEyTPen07m6WR7hnN0q01TMc4wOjz86Hp
	 M7ldwzPYSbFWRCZYdFTqZrSU5lXULZWXAFY+jG4z/IEKH3fDo8jquUJEW5lmhV5EgIx7V
	 dgrKJEfWmdc9PTH1N8NhnZTnwSdyM4VWDqA2uVpDKjnY6JA13pju4upyJS7X3qN/pkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
	b=Pd1wlVsUAOb0iXJ61u7vcFix9TFWslXsN0zomNJzCY3rvjuZZeo2Me+ZT5gWa1rjKElP
	 rIV45EDWT9DpbtydipP0F5bPJ8QD/QTblgPEHlBhTNODEww9xNp8w/Gt3RuOXsDedrgR5
	 59am8TkU0O0hLCm8LBrpPTwciD0O05i0kkypOeEv1azmRXrb/tNvjimcac5Mo5TMAUtvv
	 2t1VzgH7XWH/Q1H9VXgjYfn0jGt26qBEsLt1Rfb7FP/v1prgsXzu1WnW3fK1rsTP4T2MB
	 2Z+uFVGpAjDOfrLiGoK2liF1vwNwbL6kxwPhHN+9czvpgHwKM+DDftwHvB+LQuYdgCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IEb0yQI3;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57859606A33B
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 21:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57859606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IEb0yQI3
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3a348a6dbso377099c88.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 13:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640516; x=1796245316; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
        b=IEb0yQI31apH0SpJXvEqgr6LtXfSNX1PzmzDwR5pilHwM+pK0ntPYn2TacUWvXqxEH
         02bhI6yzXJIw4PuHiPpXZomkR3dRdZlbjTdpm43YvepeLGRLKgGTX3Le5RuSZHP7SN4o
         G2hi6jcboxGWMaZQBAPLxdok8FdLnig2Epj0+tGFinCwhjoofRAbeuFymgIeCFHkoawB
         lb80ihxKGc4jhy3C+YW1FFqXsnoXWSWEcSKGcgjDuPDYEIG4W+ooPYBAsYGlkk3fTTn7
         +CcAz2wXUMjI2TrxlWdwtFF0rxenqnY4s5sVwEoDX0+EudlJ2+hskG3ha/+/hlgruV0i
         HQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640516; x=1796245316;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
        b=mKrgEz1nl0yp1zYjJkn68R/T31blX6T4MOkszRebC3ok1QJ163h6RtpAqo6oLH0duC
         JXrgz4+UxgUkkGAAyEIyoeEZguOtCYrxSg5nKrjYJSF01mfNEt3yZApqz5jzG1RHTqdk
         eqTneHDktcqAxcHpqQ92wm/lZN6C41HHiVNgFwdHTAyU48GQt5a8RBZOvdxbuNyVTao3
         N9GIrrbkMgwlZwxFVHcMdq6BmkYX8UHxmux/KLFptJlifHepcFBgNjNPFWNIjvCiAMaH
         cP6FE4YxOvoSlahxojxWbNSJm23gmJI0h+rDy5W3kV/aG6ssNMReFn2nGl0fp4kRiTin
         Z1fg==
X-Forwarded-Encrypted: i=1; AL+hErHvFkx5VBlbr4prI7AF0OyaUp24DHurJrY63o4cYKmIVaS79yybtUPm4B1yzRcIZnMa7nMC@lists.linux.dev
X-Gm-Message-State: APuU4Z/p3y4S1BboyMYzsDfe2lCvcVP9eO15jCh3kudJTDxqhxWZ18xu
	Shjpvu7qDSxfwCr0HAFTFTNZnXMCheI3aqzxxnJPbBBABm9vQXOMkVzO8snPkC41W0302JSzWRQ
	YWw==
X-Received: from dled8-n1.prod.google.com ([2002:a05:701b:42c8:10b0:1b5:3444:f158])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73
 with SMTP id a92af1059eb24-1b5568f3283mr23214323c88.30.1795640515933; Wed, 25
 Nov 2026 13:01:55 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:37 +0000
In-Reply-To: <20261125210038.1277960-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125210038.1277960-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-3-elkin@google.com>
Subject: [PATCH wireless 2/3] wifi: mwifiex: check TLV header size in ext scan report
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mwifiex_handle_event_ext_scan_report() loops while bytes_left is
non-zero and immediately dereferences tlv->header.type and
tlv->header.len (4 bytes) before checking whether bytes_left can hold a
complete struct mwifiex_ie_types_header. When 1 <= bytes_left < 4, this
reads past the end of the firmware event buffer.

Require bytes_left >= sizeof(struct mwifiex_ie_types_header) in the
outer loop condition, matching the inner TLV loop directly below.

Fixes: 21f58d200388 ("mwifiex: implement extended scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863..53aa16c1df33 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2649,7 +2649,8 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 
 	tlv = (struct mwifiex_ie_types_data *)scan_resp;
 
-	for (idx = 0; idx < num_of_set && bytes_left; idx++) {
+	for (idx = 0; idx < num_of_set &&
+	     bytes_left >= sizeof(struct mwifiex_ie_types_header); idx++) {
 		type = le16_to_cpu(tlv->header.type);
 		len = le16_to_cpu(tlv->header.len);
 		if (bytes_left < sizeof(struct mwifiex_ie_types_header) + len) {
-- 
2.56.1.839.g22a8290db9-goog

