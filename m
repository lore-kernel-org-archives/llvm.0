Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644988;
	b=U2t6P3Wm+Jjj6HwqFHDyuRl3TdI0wFsTp0ON9WJqXs2uaCITgqYKE2utBXXvyzacgvj+
	 uakG1PR63a/yXU0ndsgDAm6VwUcMxGKcc9yKalx2G5uPmvqcHQxyVg0O832nc6onkXWEl
	 vy27LueUcHV5C7YIzpH0WHl+qO5o8+7B1VrtVEnEwXhIkL6d7mENUU+e4A5CdVPoGv9lP
	 IOSB4X/ZtbNdgqonZX+f2rUvr+rHc8OqyL2gkuP6voPNJJcv2LfoPc2dAft8K4nQArAW3
	 cr/trKa/KWdDd5KFF8uf3dBP/0bLhLJP2zw4fWodNuzukenTHIyPNsj+oNyRbQmr8Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=JWm3F65cTvbkSUDXl1Y/GIGqkgZqbiVzOvBBoT7EL0A=;
	b=Xy8qGj24UCxaFOO74YIpys4tLaWYhzarJol5jzmWrHD3n3WI8Sva+SczsP16NqjMWmBG
	 hJdM61gTz6V0PQ89yb3wCJDFoWRTzlDSLADIW2jcYeUzepAKwStplQhuvxrjTDESmX7sz
	 LNyYYIuh9bKN192LF6IS8g51WsnkoF4Wf3MljtejaXqMlJvOlDP0OZKu/GIIaPMcq5But
	 8PKtK+0ZK+pIc/m6G0CAtbXH2ztXnqoQ5vR6yN1ovdUHQFodyVCRGxashJMFB4EaylUBV
	 OaeECOONMO+i3M4FK+IEmwZu0cUN/nSRUdb52kaui+xdbVWacPeN+Tf/nt4OqCwJTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Bm/LniVg";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D67606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D67606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bm/LniVg
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so9491453eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644987; x=1796249787; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWm3F65cTvbkSUDXl1Y/GIGqkgZqbiVzOvBBoT7EL0A=;
        b=Bm/LniVgb4+jhwlj7X7naQVzbaykMWug9mMsWyCAe2gvpPoo+143yPnQ9HfVZbE1Qn
         0yMbrnNVZxe3E7IuMMb7+BYWCdFNKybtOcA8UjhuuewRrx80iYkFw0EdsA8fjjTB0PlJ
         1Xup35zLorQ0D3bjp/ydMM84G+BnkAoC9bwJQsbMuvT8ileVbI7M7GfM+P8KxRh3V1NY
         TJ05LXUlSkrEgRwrRO4HlQ60hzToEl1DfkMCq5EtprdHBAKUSSu/FMnNfVDWoV3CwQBC
         aVkGFwA+oKtXqcuPYuvaO3nJaF2oSCBVn01r4v/rjAXYXaoH0d0WCEwd/eEunTTqA07j
         NMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644987; x=1796249787;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWm3F65cTvbkSUDXl1Y/GIGqkgZqbiVzOvBBoT7EL0A=;
        b=1FmP84SCWo4ImDDMNT5gR5IkWuJBkRlx9vDoEUDIMa8kZ2yeAHXz+iRlahtYDIDre2
         GgPsRZkzVGX/7kFAgyalPeC2fGbIkfJ0Iv/Q7PxklMnnow2se3jf4rvufGAJ3OkqlYko
         ExItuQ9u75pE0jXeNSzZhj3JE7vEtBOujTLB4xWy2Php0YjHTaruFZT7J9DpxUIktli4
         0/QsDZb5ajfDMkugMMOuC422P029Taji9Opn/s2n+m2q3I3aNLkYyjZ7Kesh2wyMp4aX
         tevb57FJRFsXFG68laOeRZLxU35H3pvpaudT0Ji+imEJJDW3UmiGE4ehr8rv0FSET0Bh
         mfHQ==
X-Forwarded-Encrypted: i=1; AL+hErHy4E418/AsYRr2USdBA8aTTuJb/sToZV0D6M3ioMyEwuF0gBCFX9FUaxPXrSYMGJMrXNgK@lists.linux.dev
X-Gm-Message-State: APuU4Z9BB6p9oJUlkva8R7ybBlrOfV/kacxR80v9a3bY6ZpdiFJHmYbO
	NV3uKSpsFvRBJRubLzfYNatu0gGCnnQAVhcLXYvLLoLF1gQn1SACdJ14UcT4tX71dLKjUjjp2Cf
	a/Q==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a41:b0:1b5:4b48:b9ee
 with SMTP id a92af1059eb24-1b5568c0ec9mr18863247c88.26.1795644986769; Wed, 25
 Nov 2026 14:16:26 -0800 (PST)
Date: Wed, 25 Nov 2026 22:15:36 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221536.1417085-1-elkin@google.com>
Subject: [PATCH wireless] wifi: mac80211: fix use-after-free in ieee80211_rx_h_data()
From: Elkin Cruz <elkin@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In ieee80211_rx_h_data(), tf caches rx->skb->data before calling
pskb_may_pull(). When pskb_may_pull() reallocates rx->skb->head to pull
nonlinear fragments, tf->payload_type, tf->category, and
tf->action_code dereference freed memory.

Ensure pskb_may_pull() succeeds before reading through tf, and derive
tf from rx->skb->data only after pulling.

Fixes: 8a4d32f30d11 ("mac80211: add TDLS channel-switch Rx flow")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 net/mac80211/rx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index a2356cd17691..f97d7f4daa79 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3292,12 +3292,11 @@ ieee80211_rx_h_data(struct ieee80211_rx_data *rx)
 
 	/* directly handle TDLS channel switch requests/responses */
 	if (unlikely(((struct ethhdr *)rx->skb->data)->h_proto ==
-						cpu_to_be16(ETH_P_TDLS))) {
+						cpu_to_be16(ETH_P_TDLS)) &&
+	    pskb_may_pull(rx->skb, offsetof(struct ieee80211_tdls_data, u))) {
 		struct ieee80211_tdls_data *tf = (void *)rx->skb->data;
 
-		if (pskb_may_pull(rx->skb,
-				  offsetof(struct ieee80211_tdls_data, u)) &&
-		    tf->payload_type == WLAN_TDLS_SNAP_RFTYPE &&
+		if (tf->payload_type == WLAN_TDLS_SNAP_RFTYPE &&
 		    tf->category == WLAN_CATEGORY_TDLS &&
 		    (tf->action_code == WLAN_TDLS_CHANNEL_SWITCH_REQUEST ||
 		     tf->action_code == WLAN_TDLS_CHANNEL_SWITCH_RESPONSE)) {
-- 
2.56.1.839.g22a8290db9-goog

