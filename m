Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644996;
	b=GeWsj6a3pNJbfUBIfUO+R6U6UjnQuS658HeY3Qn4oVgFASpwfNUi3I3YjrtyPpl7IT5D
	 MV/2i8+/iMtNUWWD6a5BY/nxOHqu0wl/O4NHpi8LGq74UOoCFgRZ1tb3wX2Mp1qlJGZ9e
	 sycIoaDqVetOc+yQvht7ryAmaa7mpwpGp4AHv/FETl2G8D4pvwia42UoRS+ho3hd5zPqg
	 iLwpPdBwomDWaXGslLQzYgTP30TTMBxnMCHnvDgH+34Pcxa44wgz+JelyHpWqkYXNkPgm
	 Y0oJTSoXcxfT9PqNWH58wxNc1K/JhZrXKeBu3ZlrPnmgtB6WFg1VmWPewdeHLgWxFhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
	b=VcHMxFf3C9bjUjXSgTsynHs27v0Mb3Moi3jBnpb9AvHTZ1cl1YTlQzG2aiWs6IjUVoC0
	 iAWVhjerbTO6faIpeGWPBbGmeLMZ8AcnzK3aavof0jC9UTUHYT0jEaIjvpqXgTe3BCNeX
	 04JB2XpPrJSpfhq61sWPC5J59c2fxzI/vinPVG/EEcyZ4vmzrs2upqreOFS0poJCjWrkx
	 LFVFD+aWdsirdWkQd5I7eQVLJJkjtP7w4l+Z43Nb81FqtpRYlB4nN93OU6Py0a+rvRAXH
	 VtPLNLlLRqwJWnJpQf4B28SRz4uSpbbxzPBi2/nGECbIOz5kQR+HyApoKttxx4Z+Q0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="AL/sKAtQ";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2EA606A327
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2EA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AL/sKAtQ
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so6800696c88.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644995; x=1796249795; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
        b=AL/sKAtQsi003M46qtbimr5ce4r9tYWq/ylxE6J0uXuOqqwJkT+ilqXE9NRtp9lI0D
         tUbLsJJiIxG/6hwT3Af9VwrnkSSBYk1tjHBJEXQTx9DI4+ByJREQ1RwQQY7a4ZkCiSBr
         xUZN7kg0E0rgelNFGgIpYw9rbCIOcaAK0dLakmDE5DZEkMnxGwEio9Xdh6h/s/z5ypOS
         IBQL9Jq7HhmAupJkdAILcbWwkhtuPW87Fh4DeUtarEbkyVhPhOzZOUlESfzd7z6rFIsI
         Y0ftOBc72OsrGWEjxW0eoyS0GQxWyPNTFiidsxojbo1LP+v1X/OTUWHc3tIwGF35UREn
         WpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644995; x=1796249795;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
        b=eLcANClJSzo5iq7a9HmweEarkPIExe/wmUwVREaJZnRC0ZoN1Xb+TTmOM4IGeoz8a/
         17FZ/fGFfevtSS/0K0xP4pShto+K/bdTbSFCFuJFlTp/PqMfkPLoE+CuXpDWAe59UhSC
         szigoAy1mLglLo0WZz/O+Whmg6yse0iXP2UExNPM71KK4TDLWnTCFKPsJeNpE6J8gWpr
         2MIIROw9/IG/N7SCvquuSx89sxOjN8PsQomjZdYnOXT/db8KXNegduV/Oep6GB8aXOZt
         OTJ/ol8PYrvmMBuDsPtrVa/rno8rKQreRG4uXt4QazgR35Kb7ncqrbXy7BxlaPy4n10i
         Lbng==
X-Forwarded-Encrypted: i=1; AL+hErHgeZ5+6Tdbtbg1Xv4L35e1usOYSJHxwfq2GY6wbLyyAjdiPK5MX/Q5x8+53FhI1E3kgLq5@lists.linux.dev
X-Gm-Message-State: APuU4Z+uV2DrFH4U5eqV3JdYn76rm+7fJUhluUZlZkoTKxCx4w0sKo56
	yYYTVzo/teYka8V5qucVx+ms9YWoXu9LLoUGWadWFXUnXDGbNX56V4wuhabikuk7qsqswv5aFxd
	7og==
X-Received: from dlbrl2.prod.google.com ([2002:a05:7022:f502:b0:19a:1425:bb9c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3f07:b0:138:30b1:4c00
 with SMTP id a92af1059eb24-1b5567b5685mr21927000c88.3.1795644994359; Wed, 25
 Nov 2026 14:16:34 -0800 (PST)
Date: Wed, 25 Nov 2026 22:16:27 +0000
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
Message-ID: <20261125221627.1419412-1-elkin@google.com>
Subject: [PATCH net] phonet: fix use-after-free in can_respond()
From: Elkin Cruz <elkin@google.com>
To: Remi Denis-Courmont <courmisch@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, 
	"=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?=" <remi@remlab.net>, linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In can_respond(), ph is cached before pskb_may_pull(skb, 5). When
ph->pn_res == PN_PREFIX and pskb_may_pull() reallocates skb->head,
the check `if (ph->pn_res == PN_COMMGR)` dereferences the dangling ph
pointer before the code re-acquires ph = pn_hdr(skb).

Check for PN_COMMGR before calling pskb_may_pull() to avoid accessing
the potentially invalidated header pointer.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: c3a90c788b74 ("Phonet: do not reply to indication reset packets")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 net/phonet/af_phonet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/phonet/af_phonet.c b/net/phonet/af_phonet.c
index d89225d6bfd3..e70ade97bf17 100644
--- a/net/phonet/af_phonet.c
+++ b/net/phonet/af_phonet.c
@@ -294,10 +294,10 @@ static inline int can_respond(struct sk_buff *skb)
 		return 0;
 
 	ph = pn_hdr(skb);
-	if (ph->pn_res == PN_PREFIX && !pskb_may_pull(skb, 5))
-		return 0;
 	if (ph->pn_res == PN_COMMGR) /* indications */
 		return 0;
+	if (ph->pn_res == PN_PREFIX && !pskb_may_pull(skb, 5))
+		return 0;
 
 	ph = pn_hdr(skb); /* re-acquires the pointer */
 	pm = pn_msg(skb);
-- 
2.56.1.839.g22a8290db9-goog

