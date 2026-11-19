Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108214;
	b=jQjztqVr6axGZPpKTjg7g1IsIRm/u7+ZqvjwOZ1VvMRnjLI6jJsORYUS8Anb2YBKjThB
	 Wth7haydMq2J3Dbfqyyvmw6PldUVZu612cW49k03QNPw7jPeSsKYo+h6joSLlH9pItCdW
	 9SDXt2kaLwD13g3K+hMd17Ob3jw4+cRhNE/Ca+mqqmf3CScLDPp9HRqxIl8qinXql1FLN
	 Wa2a5NpQg1KhcPwqRRDOrvDZKElGytQcC/LQ0zescW0Rhg3uEjNOch99qKPMP44Foyta0
	 +dol1W4fpa93K+88Y2ENXyn1uLYsi1GFz7E7shOFxicKtwJ/FmxflSUer6k7x4rArpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
	b=KdvyseB9xdFthIH5+dsyy2KPAoK3omReuxf+WTZazDCdd8FYRaukvHFXORu0quLCCIpo
	 naBjNYI0tv1tySAV93pjTmdpqEWISU2rY3eIUK4KkIwi4m8M3LfqaXGjWc7Ae2x1lCBTG
	 1ygq0Bm5ilhFIutBflQoG6iUZNHvV9mD/6NOpeB6lB6WZRJWgGuuCO55tkdGIDLTF2q7j
	 uNx+M5tzeNh+3XPrnCOB/aKa4FyQcbPMIflH1IEMEyAVRsXosNZpfz+1ANKduHzxs2XJz
	 hBBmbY3JoYaifyX1yzCKKf3ifNqdECyjEFpZqfewdsofRgsYMyS0Yd+TTrKRB4OW/RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zim68+a1;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A460A3804
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245A460A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zim68+a1
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso1422633eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108212; x=1795713012; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
        b=Zim68+a12erVu03qU8oCnhGhgDblGiJ5I+Hjm3kTv7OIekjeDBGn5gPGEUDmqGwUDX
         HpbJ1h3zc80oTc2sBrv0TiOTxuJfyen7A4e0Lt+12CXV5tpxr1/Dn4Du+yFrqSc5drnd
         /e4THJZ4CBW4NC/vm5yYum5OkYGCckeUai4cffLgtH9hsT/ztV0xsnG80P/nM+5+a9Js
         o8XQKIjCV9Q2I96pdUAlMVSWdrJ8bIz2copVaZfIHdhWQS7Hq0+/LBMQGaTJgAAuZJe+
         X/ZuJ4aqb901e3dz8KPKeqfciABWUReIAJBnt1Gfj76bNO99z8v3OPPLo22rg/iZUlbg
         jJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108212; x=1795713012;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
        b=i3xIpdbSHkEmdqFvjGdSJtmpTzlXwtA+ofj/0uIghE3PsZfsb/Tf0Dju9s1JPwWjIu
         jWHAQZGDCnizcPNK1T0OWOV27IcPcpE3jGBoMNjv2T4FTtllMIWCR6aHRwvx9AYAuisA
         pIpSGW+TdgLCCQJaYGxTzlzMylm3jB5N9o7SyuMxzakeOhFEWENdgGqsuMwq7a+QSN7O
         XjfB8SKoFPwQJcDbucRgi173IwsuShr3zJZbVALUns4VJcLw/bxzrn+IpRJF1mbDWjDr
         0Td5JG4SvPW2GAa9vxlNFUUnxyW2VjwN4wEmaRZdiiYYJIRTvOSiSoeM4PXTGyQR0KrK
         C39A==
X-Forwarded-Encrypted: i=1; AL+hErEud6D1Z34gEYIvXLuZwk6UHjaXBbbXeWCllmDhYc1EgzYyflIDAtOP20dmsEfnS9zV3mOe@lists.linux.dev
X-Gm-Message-State: APuU4Z+6hFpiNMMDTrWExz1+ZOTLn4frxYRALByi3k8qBlq955nhmzfH
	urrv6VUhIOyaUPhS1/k+hkatTXiHV6v0TWzmgZ+U+fg/imwSNh0b0S0Oq77RQGA54kXuYZIhLxW
	xvLEyZaj/Iw==
X-Received: from dyckq13.prod.google.com ([2002:a05:7301:7dcd:b0:383:aab7:cc58])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8943:10b0:381:cb1d:466b
 with SMTP id 5a478bee46e88-38280d3068emr5688589eec.26.1795108211935; Thu, 19
 Nov 2026 09:10:11 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:09 -0800
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
Message-ID: <20261119171009.1534335-1-irogers@google.com>
Subject: [PATCH net] ncsi: Initialize vid in set_one_vid() to handle
 concurrent VLAN removal
From: Ian Rogers <irogers@google.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

set_one_vid() checks list_empty(&ndp->vlan_vids) before acquiring
nc->lock and rcu_read_lock(). If ncsi_vlan_rx_kill_vid() removes the
last VLAN entry in that window, list_for_each_entry_rcu() executes
zero iterations and leaves vid uninitialized on the stack. The
subsequent 'if (!vid)' check can then proceed and program stack
garbage into ncf->vids[index] and an NCSI_PKT_CMD_SVF command packet.

Initialize vid to 0 so that an empty RCU list cleanly hits 'if (!vid)'
and returns -1.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building net/ncsi/ncsi-manage.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on NCSI
hardware.

Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/ncsi/ncsi-manage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958c4429..f7eca228c281 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -640,7 +640,7 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	unsigned long flags;
 	int i, index;
 	void *bitmap;
-	u16 vid;
+	u16 vid = 0;
 
 	if (list_empty(&ndp->vlan_vids))
 		return -1;
-- 
2.56.1.708.g77570a6a1d-goog

