Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107964;
	b=wfUMV8Q1YWys7W7efL1D/r7V34vHWeLF15R/jsn4DJFztX5EQPlVduwTphbPtUz+vJy8
	 ixUl6+MuJ0b4pSPsZdqmmKmk8l/UAvc4nIIfSCDj/8cWkp3bKN9E7Idq+dzEkZlqH2Bkf
	 3i9cRJSBcqwtD3zmeOTQRCWHoG05xot9ln/iZ0jbmyVJt8lMgucty5SoDYoFoY0Kx2VE0
	 xMMBC1FyC4VAoU+OD8SwwD4TAiAXqYcMFjncDd0T3q6f/pqidQlrUA+c0kjkZaXY+OSrU
	 hyZRdFDC1LO1Wy7ALzbz5+Z9AI/hgFgJWUuv+g/InpadW4HLv992MndqV9ZsNtxVqXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
	b=q6QR0EXodYzrSgXjETafIwYp9J/F20WluE/b877EYEpQxMQ6pTkpe2rgIrO9U7XVdpKR
	 OzFaySmn5Kv6UCFIKWXv8x6bX1wKduNxSD4JJuPSjjM8WA/XCGGzRgYMTYEn+c2sjTCSq
	 2BbUaMLJN3SzgJ68WdYqEAxKUKU7wPjrX+hdpdLcR8jjFDoSk8rPiSuP2iNSxQ+nE7aXZ
	 GzGAxCuoQ9qz5gQfeR9ZGdGOhqzHaivMyi6D1SwOcrVcWnCOrkHHz4OnK5aHoJ+88Epc1
	 3Sd/U8T78anGgcgqI9k9w1foVgLm42fK7OF0dmhC0LQXL6MpP1w2OWeBev49tAFgOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KpEE3Qfz;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC2606A330
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEC2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KpEE3Qfz
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3038471eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107963; x=1795712763; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
        b=KpEE3Qfzui2ogN0GCiqBZyQac0ZLXrzyBEFLxmUq21acZ3JQiuFGwXnx7+0OLhbSpM
         eIxNTp5uyktXIAT7FIrqxxePsiVK2R8+TBUNYUmSCeMeyK8M5dED87QdHawGf1ZfHXz9
         5htTQpQqA7up0UTseDRKTQ4b/CWw8micbezxpmMtIVwg/KvW2NIZI9/Qio/OZbn1NWfb
         Tdcl0E5D6iNTr95NPQAE5RyZUq7gaekrmSz+aCVPbS0zhiOkOIt5rVEm97mwnRvT/9+0
         0+R0ICnkUp2fA7s9EgRizIliSODurJzO+JQmZuMAgxwA6IkXMKcd9D6/cTtIuWvmFqrS
         +O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107963; x=1795712763;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
        b=i3rU7bHfWaq866xf7D/rE+jhUepIXyf6o3NXNfUvogW5DiHBwTcA8/TCqpsYwTEjo+
         ua3TdY+x2O1s/dL76a3rF6PKClXF9aBqOSIVkR0YUxDiG4LufLE0Wx8t994i4vijYXbN
         NizzQPwubi/khGu5A8JpqVqZMneTAYjHQkULmypPL8lcneHUZlsLpWJNGQc4V+GT1oPI
         rGOHFBZ6Or9t8TOObBvyKL4Kr9Hh+PrGyAakPt4eipOsxTdQHxOcTUzoVDBiva8P29eM
         iTWUlpdBhvEBh4VHB/yWKMzDElw0IWcSlqMqCiu1CO8Egd+8WLTOUg4MiFyld9QqRV9a
         k8yA==
X-Forwarded-Encrypted: i=1; AL+hErEw+yH7UThnYg6Xj3B2i227ntHzBqsfBS36OsiC7HTzIyrrfBhEv5TqUDGKIlsUT884XMjh@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZaoP2RtFNlpEpKjFIjLbx/cQF01svm2GRrP5W1UiBoG/guZDC
	zfyxs4BOJs06gmX585U+klOUn7ZySwoZ3grCMol2NPC0pi0mSLVeZY4K0Y2C2i+V1QiyA4fSJrT
	K6PPMvowplA==
X-Received: from dldz5-n1.prod.google.com ([2002:a05:701b:4185:10b0:1b5:1a6c:af8e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4196:b0:1b2:3b5b:b80b
 with SMTP id a92af1059eb24-1b55689ee3amr339019c88.8.1795107962438; Thu, 19
 Nov 2026 09:06:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:56 -0800
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
Message-ID: <20261119170556.1518068-1-irogers@google.com>
Subject: [PATCH net] tipc: validate peer address attributes in tipc_nl_peer_rm()
From: Ian Rogers <irogers@google.com>
To: Jon Maloy <jmaloy@redhat.com>, Tung Quang Nguyen <tung.quang.nguyen@est.tech>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

tipc_nl_peer_rm() documents TIPC_NLA_NET_ADDR and TIPC_NLA_NET_NODEID as
mutually exclusive ways to identify the peer to remove, but implements
them as two independent if-blocks with no fallback check. If a
TIPC_NL_PEER_REMOVE netlink request provides an empty nested TIPC_NLA_NET
attribute (or only unrelated TIPC_NLA_NET_* attributes), 'addr' remains
uninitialized on the stack and is passed into in_own_node() and
tipc_node_find(). Conversely, if both attributes are supplied, the second
silently overwrites the first.

Return -EINVAL when both attributes are present or when neither is
present.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wconditional-uninitialized; not runtime-tested over TIPC netlink.

Fixes: 43fcd906d9c1 ("tipc: support 128bit node identity for peer removing")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/tipc/node.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/tipc/node.c b/net/tipc/node.c
index 53b0993c2c23..d19ed94b8f41 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -2277,18 +2277,21 @@ int tipc_nl_peer_rm(struct sk_buff *skb, struct genl_info *info)
 	/* attrs[TIPC_NLA_NET_NODEID] and attrs[TIPC_NLA_NET_ADDR] are
 	 * mutually exclusive cases
 	 */
+	if (attrs[TIPC_NLA_NET_ADDR] && attrs[TIPC_NLA_NET_NODEID])
+		return -EINVAL;
+
 	if (attrs[TIPC_NLA_NET_ADDR]) {
 		addr = nla_get_u32(attrs[TIPC_NLA_NET_ADDR]);
 		if (!addr)
 			return -EINVAL;
-	}
-
-	if (attrs[TIPC_NLA_NET_NODEID]) {
+	} else if (attrs[TIPC_NLA_NET_NODEID]) {
 		if (!attrs[TIPC_NLA_NET_NODEID_W1])
 			return -EINVAL;
 		*w0 = nla_get_u64(attrs[TIPC_NLA_NET_NODEID]);
 		*w1 = nla_get_u64(attrs[TIPC_NLA_NET_NODEID_W1]);
 		addr = hash128to32(node_id);
+	} else {
+		return -EINVAL;
 	}
 
 	if (in_own_node(net, addr))
-- 
2.56.1.708.g77570a6a1d-goog

