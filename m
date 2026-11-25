Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640520;
	b=l7qBkpcNBc46Gi/JZqZVbG+zfw2QQPCaZbfebXXdOP7OraJ4lTg+uIYPx3rum4HcUZW+
	 w8w11nyfC/yuKjcCs2sHDDVC1W3LJ3qjO75gwTZavGuEekZzKp0t+P7oCDiPzRBTIl7xj
	 vZ0yadYX35wdvbQHJrDnUmoNsVCQUOLvex6lBhi392/EkinW36DPV+bdWkOxi5zOj1VAQ
	 9fiio0nrIsUQLxDiOA567ojqhazgx+4HtKJIsNMOzzoDmiCd2mQnIqTto9jYym4zvFLLv
	 vs25J8cduJb4tBROhnRyypzDuI6UmQ6V3YZyBbjLdEumIZ1B55hwnW9yPscTsaDqBLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=smmSgaVZzApJQV+Cv6DawJEFCZsBgrWDBhUsefeJK8w=;
	b=N54boz/pHQn6rVUwZgul2GKmvTEeBXqzDqMYXgEYxmjwS2tBX116BRGRzty4Vm8/U8ga
	 kJEwN0HYCW6IZihLRMGdjplqL7DAHwZfchs7aNMxzwGjDksLA3yPtrldh5mYqyyvfaFia
	 kq80OnJSDn7yEUr8I5/zqpKvzjbFndBfYZkM+cScxD0LUp6KOMNuydiraA/f8JQ/OqJYR
	 Gx7DlKcaXogiiGzPeMhZiM5zC4lthBrextPzLGdyuAIeTzNC77dEX02ZL2FhXQFiXtfpA
	 WribMBAo0TTjn7o3qNBC7eSN21TJmiHN9BXTpqzlnqI6YJ/Vx2JEtiJcJDITvQtTjJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="KW/UvDlW";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA5606A68D
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 21:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EA5606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KW/UvDlW
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c3309469so2269881eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 13:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640518; x=1796245318; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smmSgaVZzApJQV+Cv6DawJEFCZsBgrWDBhUsefeJK8w=;
        b=KW/UvDlWeLINXmJFdKFROrYLKeGexdn3Um7dkq3GqvOlLJRNAWvt0n6GHXqXug86ub
         4avM5SF5UfkNbKjGhM0wxTIydE/wafdhunZ0ferdgMxShxWErnmgswPiVrjHhBgvqSsL
         dkJ7QqPwxf3sEf7mtqFteS2s0WaeLgs1+Cd8K/eL7FKbjJCL53x5cTtlOrhWQ/gsAwoa
         3qqA56gYcHKEBOxjuVpWCPTrcGnqLz/moLEYSEUCDPCthNTUZXSLFb1Pz0j4m2dhLSqg
         E1ijz41dYfJhtN3qX52HTphRcwcMb0LiaWoTMzrJOZs/U80ENW3wc8AY2RmLlmQIWT3G
         IivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640518; x=1796245318;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smmSgaVZzApJQV+Cv6DawJEFCZsBgrWDBhUsefeJK8w=;
        b=oXuULTaOYAyB/TjVvNYt5eIa+aCVw8F6d6KheO4vDzzd4xKU4DjmWZT4+7ZPzfUkzo
         jS7IXXU+LaW+ZjN6oxj7dwdE9zEJ5nNuT3pT8hRdq4ai0gbLgeWF1/nRlnsJmAJS5VNz
         wUIVsTU5upHxUJCfmzTHbssBVwuirmzOdwEmMzkSBWGVWnEMEeaVmI285PgumWIiphhm
         w/06iws/qRPTXKEiScZ05csTBzZ0/79Xbwr4fLOE/J3QRF9EmfsChqdkBi9hiV4FVpFG
         /V1OtJkzAXOQgz47WmfkjeHIlf5jTkPj05C6bRHHl7vZvQg/8HJz2LUt73AdoFLQGgsc
         3GlQ==
X-Forwarded-Encrypted: i=1; AL+hErFw6fDBBMJv8lViggsspcqvO7M0F1Mb1gcz9y2ZRscE6cjhiyA76azqqG5iPUP6gkXItUJw@lists.linux.dev
X-Gm-Message-State: APuU4Z8b4ta6bQcPpqgS6GZSvDb/eln9mrIA5awwsrwI0SpP2cds7B6q
	TkQXh4xst5wP2e3WOb/sCV6t89cmHqs3yU3KsXOgT/aoCiapCpsuDWpe5N5eKPK7fZkeKSiRu0y
	d5Q==
X-Received: from dybto8.prod.google.com ([2002:a05:7300:f148:b0:386:c442:456c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:60d4:b0:369:fe81:a575
 with SMTP id 5a478bee46e88-3857111f203mr23506949eec.35.1795640517818; Wed, 25
 Nov 2026 13:01:57 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:38 +0000
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
Message-ID: <20261125210038.1277960-4-elkin@google.com>
Subject: [PATCH wireless 3/3] wifi: mwifiex: validate ext scan event envelope
 and TLV lengths
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In mwifiex_handle_event_ext_scan_report(), event_scan is cast from buf
without first verifying that adapter->event_skb contains at least
sizeof(*event_scan) bytes, and scan_resp_size is not validated against
the remaining event buffer length before dumping memory.

Additionally, under TLV_TYPE_BSS_SCAN_INFO, scan_info_tlv was assigned
before checking whether the TLV length matches the expected structure
size, causing invalid pointers to be retained on short TLVs.

Validate the event_skb length and scan_resp_size upfront, and verify the
TLV size before assigning scan_info_tlv. Break out of the switch on a
malformed TLV_TYPE_BSS_SCAN_INFO so the loop skips that TLV while
keeping bytes_left accounting consistent.

Fixes: 21f58d200388 ("mwifiex: implement extended scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index 53aa16c1df33..52543532367b 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2627,9 +2627,21 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 	u64 fw_tsf = 0;
 	s32 rssi = 0;
 	struct mwifiex_event_scan_result *event_scan = buf;
-	u8 num_of_set = event_scan->num_of_set;
-	u8 *scan_resp = buf + sizeof(struct mwifiex_event_scan_result);
-	u16 scan_resp_size = le16_to_cpu(event_scan->buf_size);
+	u8 num_of_set;
+	u8 *scan_resp;
+	u16 scan_resp_size;
+
+	if (adapter->event_skb->len < sizeof(*event_scan))
+		return -EINVAL;
+
+	num_of_set = event_scan->num_of_set;
+	scan_resp = buf + sizeof(struct mwifiex_event_scan_result);
+	scan_resp_size = le16_to_cpu(event_scan->buf_size);
+
+	if (scan_resp_size > adapter->event_skb->len - sizeof(*event_scan)) {
+		ret = -EINVAL;
+		goto check_next_scan;
+	}
 
 	if (num_of_set > MWIFIEX_MAX_AP) {
 		mwifiex_dbg(adapter, ERROR,
@@ -2690,14 +2702,11 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 			}
 			switch (type) {
 			case TLV_TYPE_BSS_SCAN_INFO:
+				if (len != sizeof(struct mwifiex_ie_types_bss_scan_info) -
+					   sizeof(struct mwifiex_ie_types_header))
+					break;
 				scan_info_tlv =
 				  (struct mwifiex_ie_types_bss_scan_info *)tlv;
-				if (len !=
-				 sizeof(struct mwifiex_ie_types_bss_scan_info) -
-				 sizeof(struct mwifiex_ie_types_header)) {
-					bytes_left_for_tlv = 0;
-					continue;
-				}
 				break;
 			default:
 				break;
-- 
2.56.1.839.g22a8290db9-goog

