Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645186;
	b=TjyJLio5k/l1y26lYhONQn1zzO4rbN8jrOmjzl8k+5fgEcbMO50nFsjYgjRkfHe7qQT/
	 Of2Q1aD9I8L2ZnrwQn36J0VXfdI4bIpXTSnKua8WOqY0QUPaZvCSKyU+XsprTuaVhTI6B
	 QndbhyZhYFNsVjHrKZ05PC4vNKKDRUfw962MWjwfvX4LSLmNs51E4cP5dKzfu2XJedmqV
	 up4ul/07QwPF7CVgyulswmcm4UoUIwsZqm/AGzHVMcN5R9VDp88+kIXlDt4Bx5y6t2rZ4
	 WCfx0MAKONP9ngKVsWDG0HHKjEOLWe/OMti6zMD41QAHOFEb9XMNZwR7wOuLbWsloyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8qhBQZeyr54Cjg+V6vaROasttcE0+Xu/EBT3l5pruz8=;
	b=cvYAI4oIykyO5WpP5WpkuCBczl2YCG9yj24vWFyOMPQSwV4koMlcQ5acG0HlKysHJIvl
	 TTW1Q+xUbzZzwEjDS7o5ePd/pAKmK23G67seFWT9q65I/FFYju80a82JjTGcozBfVzKbC
	 C5Ub+vaoU3fmRNxjEFvo5iSnXSfCazhUB7UhkrvVQMn04oCEiStRr1h2Odxiwj5DO3Ob6
	 FmGLohG2+6/rPrSHkmI0ThwAqkEOngXCUz/u+bYlJ1XkFHU3GD96PtbLWl9vOg2ZZzTnf
	 fTUFzkFAX9WiVqy1FO2n9YrRv1xNHkq3UIhCLXeQfF5GdUy/7FZnLOfOSfG7jbmfwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VoBdf0w7;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F90B606A327
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F90B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VoBdf0w7
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6648701eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645185; x=1796249985; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qhBQZeyr54Cjg+V6vaROasttcE0+Xu/EBT3l5pruz8=;
        b=VoBdf0w7y+4VJkFiDkXGsi4pmdbFG33+e883bZ5mPHQK+ZX515cHqgnic5EAVHCLnp
         Bxp2FXwfnI1Yh09qhecdLCOFfsOIehkOFjN/pFpB3pwDM+x+jUXFdnHGZwN+m1FASYpG
         ccFl+VfaXnxbpq0y0qHsr2qFnRBs2P9qZFA20+lZi0upX17Cp281tMbCNCOdw9VlQxxe
         BpXprzSGYfvE14NPpdb0TywxLz7+pMh/bkJYQXMy02gxHsHyzcW3DXLkCJ4q3N80DGJ3
         DDanW42pwISEhqPOosc/ZGKKOcesZ4ih4miH1iYrpeQF67dJ+sOTOqNF/emKk6yVIcqC
         qIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645185; x=1796249985;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qhBQZeyr54Cjg+V6vaROasttcE0+Xu/EBT3l5pruz8=;
        b=krBvC0QK3eLEIN4NMRYkfQPPf1XhwQM+HiLJFcHNqrek1hB81H3AT4pR6mwJEERVdW
         gtUmVXfDlxxfT1T+c7k1GMRj7HthuqpmZfklYnT84SoWONDN5xUBhk81I1iNjo5M8mPv
         OajgIcWpZz7JXn6dw6P9N2qG34D7qXX8hQm4jBnMsNUglKqWN04K8ewq7hYS8kqcLyMA
         v6cRLmzWLdU8li2VnC3aERfQZMCQ01f8ihj8EVVcmv1wvtUHr+l3eB1RP9CG61UNpIiN
         y0Pm6aGmxckfHee3XD13YoSCF6+oke9ZIwgnqJYXx1KYZnYeaowJDrXMn7JFWKkhlzlK
         Tfpg==
X-Forwarded-Encrypted: i=1; AL+hErH8jdpLAcR6JPZZMQrkKtrlODvnGq9SVS+TiFrMhnABkenwu47ugqbVlTQKYPsLaHFSket3@lists.linux.dev
X-Gm-Message-State: APuU4Z+QNIDlCM5WPnJhY2Fh5oJzFXJu/JbyPo8ri47wInFpCe4+YwMS
	atjG6kp/6Ngp6ksAzdT6TRx7/Ydj7abeQgWNb/77oC0CupsBHBnESUbV/juQfd7ZaKvlPgPR1WQ
	Ncg==
X-Received: from dycnr11-n1.prod.google.com ([2002:a05:7300:e9cb:10b0:383:7f56:69a1])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8956:20b0:36f:551:2bd5
 with SMTP id 5a478bee46e88-38570846826mr18757502eec.32.1795645184533; Wed, 25
 Nov 2026 14:19:44 -0800 (PST)
Date: Wed, 25 Nov 2026 22:19:21 +0000
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
Message-ID: <20261125221921.1425747-1-elkin@google.com>
Subject: [PATCH] scsi: fcoe: Fix use-after-free after pskb_may_pull() in fcoe_rcv()
From: Elkin Cruz <elkin@google.com>
To: Hannes Reinecke <hare@suse.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In fcoe_rcv(), eh = eth_hdr(skb) is cached before pskb_may_pull(). If
pskb_may_pull() reallocates skb->head, eh is left pointing to freed
memory when validating eh->h_dest against the FC frame header.

Re-evaluate eh = eth_hdr(skb) after pskb_may_pull() succeeds.

Fixes: 0ee31cb5df4b ("[SCSI] fcoe: Fix broken NPIV with correction to MAC validation")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/scsi/fcoe/fcoe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index a2cf65fac297..23d6b9893793 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -1365,6 +1365,8 @@ static int fcoe_rcv(struct sk_buff *skb, struct net_device *netdev,
 		     !pskb_may_pull(skb, FCOE_HEADER_LEN)))
 		goto err;
 
+	eh = eth_hdr(skb);
+
 	skb_set_transport_header(skb, sizeof(struct fcoe_hdr));
 	fh = (struct fc_frame_header *) skb_transport_header(skb);
 
-- 
2.56.1.839.g22a8290db9-goog

