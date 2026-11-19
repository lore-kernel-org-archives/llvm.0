Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108166;
	b=wehDVBTOVSkIwpKey40EPxw5TNQGhKRGQvIAoYzFH0PPRPZTOd5z1GhoMNLVHVsG66rb
	 mR1uyilx594xvRzRslrjq2y8IWQyM9tlQ2kZR/C6uQFzxGpXokPyf8B4nXf7Cil+fuQkd
	 ISBFLhz5KFcxP38io0XbNMWqUa1w6ZeuTKLmuM9Oat3BIKF+86cJ/vU0tT0c8UVh8RbPI
	 8Vw31Yz6haoK7YJamFJmk9VIn1Er/Ih4xTEOY2ZP09726fLIZfr7nk3HHSW0da3wIlFNl
	 QRJKzgBgPgCBA9jRBiJXGw5xm9arfHoYwLMpVQ7VeqSkAafvdkJctiwa7ucx75Tc8VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
	b=pZaSQOooY0uEBxJ7Kjw7Sq3VlC42bsb8J88pk9qMycxKVqxiDhTd7zVJzK2xM1SInwkq
	 4gKZ5p031iktzXBhKl43hvwDTiaMIfspqB2FmsbQgDOvNqYCYE1vPY2YgsW7S1eNbT4B+
	 kT00Exhj/X3sBlpJHrupig5v9HxGjVZs9c5GV5wwJnsQidu0qR3iPY7lS1cgrMKKJh31+
	 RzhzkwZUD6wLssqL58pIxVfs3CgDnIq3QVqZlnUotxql0DGhq83sUjqHaAf89kWnIsBSW
	 Ip6our8/s6ZgKhSS2Exlt3T2Uf+LrIK4RX2fsagiaLvtA6MOAsxFtko1PXQdXllLyaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UDsLz9um;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F2C60A262A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F2C60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UDsLz9um
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so2527120c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108165; x=1795712965; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
        b=UDsLz9umPemFalMNjHjzjMC0qyB2weAKB9aidTmStpKbuVVqP+L7TZB9TdJCqRdOya
         WrELOtvxglOXrskZr5poXMlswsq9mGqYdw922Pd6u6q5x4nsiLmbO4bU+lIxcsKbyV9Y
         yzx+zimC0BfAhzdAj3lrmA/9+TV5ESbeTeBt1ITBHbXbbZevnRpf8uzlm6F5uWCgt6iq
         UAopPO0Yb0kQmkTEkvb51CSvb/sByOkzCPUb7TfFvyqdt1AjWSwLcSBpvIbzO2JghoH4
         IeFDMuDiale84XmOjdLzNlKJjRPFuBhbd5JHpZwu74X9Hc3NMHa2y/OZI1sboNrchCyz
         yLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108165; x=1795712965;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
        b=WxuXAW35W4D7j22BuLVs4JeBUpPjOVBAnVWnqSNySvQhITtBItLuYkRWG5WT1YY+Vc
         4KYJYBbmilDn0SyloMYocaeXrU72PcIepXIYfQTSoKsVipGdyOg20ZtdyaGSGfxX/iLX
         cDOb9sHZ/8JW5m96UE1m2xvNvJoz9SFPoVPqJqlaWWSh85FlrtemBSe+Fbx697XR3Naa
         Y6+uGISxheLE/WBzEcZ3Sjfy2Nf9o3EwVGP9FNsptLDVPE+QsdMH/OAhM2T50QwYl8bE
         ZUAoxY0ghTWnPPiomjgqAMWDHof85945soxm58Mu6K+K7M7WlkhkpZAvgRSX1IWYR+E7
         MUPw==
X-Forwarded-Encrypted: i=1; AL+hErFELtSSL7gWo5a/Menv97ukNXcoCUVMILJLSyZUQTEIdY1qilif15wMLhWZcX9hxf048xpb@lists.linux.dev
X-Gm-Message-State: APuU4Z+EejnF4HQ5DauMY/3XF5ShCLPW1/aapQCuBDOdMfmqMIY6x/cP
	1bjMF4cqlw4llgP3HtJfRcEH4U+yMRf3YvY2C4hY4rD0Jwj+8MnkMQFQKjAeEdf0+feL9ixD3Mf
	tqQ/45QPEFQ==
X-Received: from dli28-n2.prod.google.com ([2002:a05:7022:29c:20b0:1b5:3561:2fe9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e80a:b0:1b5:4b48:b9fb
 with SMTP id a92af1059eb24-1b5567c0ea6mr264480c88.5.1795108164835; Thu, 19
 Nov 2026 09:09:24 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:11 -0800
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
Message-ID: <ae02ab481b5ce8259a22135255de5864777e37d9.1795106967.git.irogers@google.com>
Subject: [PATCH 2/2] wifi: mac80211: Return NEG_TTLM_RES_REJECT when sdata is
 not in driver
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

drv_can_neg_ttlm() returns enum ieee80211_neg_ttlm_res and initializes
res to NEG_TTLM_RES_REJECT, but returns -EIO if
!check_sdata_in_driver(sdata).

In ieee80211_process_neg_ttlm_req(), any return value other than
NEG_TTLM_RES_ACCEPT is passed to ieee80211_send_neg_ttlm_res(), where
an out-of-range -EIO value hits 'default: WARN_ON(1); return;'.

Return NEG_TTLM_RES_REJECT instead of -EIO when sdata is not in the
driver.

Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
build. Verified by building net/mac80211/mlme.o with LLVM=1 W=1
(-Werror) and -Wimplicit-int-enum-cast; not runtime-tested on MLO
hardware.

Fixes: 8f500fbc6c65 ("wifi: mac80211: process and save negotiated TID to Link mapping request")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/mac80211/driver-ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 9aefa55cbdfd..0558ba58f3fc 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1740,7 +1740,7 @@ drv_can_neg_ttlm(struct ieee80211_local *local,
 
 	might_sleep();
 	if (!check_sdata_in_driver(sdata))
-		return -EIO;
+		return NEG_TTLM_RES_REJECT;
 
 	trace_drv_can_neg_ttlm(local, sdata, neg_ttlm);
 	if (local->ops->can_neg_ttlm)
-- 
2.56.1.708.g77570a6a1d-goog

