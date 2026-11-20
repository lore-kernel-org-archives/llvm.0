Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202678;
	b=bwZqIeoYxQO1daX5Fi0Df1bovhHvEZVpcdrmnicnM2B2iKPxIaPZQU+cc3jX8iGr3NZB
	 vqjreFha4XsddxdJFxxEDkIapJloDGWdXdym4+8PrmIyuc+GCK54UwU47dNbBQCdG4+Ce
	 VH35taXwlSRVbazrfAl7nVsCUnr50KMHxrv6ERutaL8nqN0cW/ejGiqTkoG4a48ErR0hx
	 QyWRwWOc4cNnr1T6K3no86GW5Rbe5spN181LPMSDe+4eZ+70ZtVlaVr0yvFKLISGDpLZC
	 JR8xybHO4AKxesTaCMnqV2dpdcn2Euwt+yXBGZj57TY6BOLRjazsSvqnb+9CwM9VY6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
	b=wAivgFAYf23LbLdIpzM0iZ+6VqnT1s3oLl26TbQpuaLj0yuaGZM/CpIpjsvftrfQK36A
	 d/DEVGI2GtWdu9rdHR23dlDc6l1LL6hf1u5Qr7PUrhtlmE3p8bsdn7bJsuVV7g+9U2SLv
	 BqzoNSSa5CzR8/dEZcadD0yQ4HMZCDxYBUj62IjZHgLxqjTWUiZMStXERnnDr1lsBDVdG
	 xMLCEnXNtOqO7kByCEzZloyRQu0oMG+wlnALCKKkSGHjG8eLaUd4zYtF8rjwd3sZRp/VJ
	 GRdkHZqeGIKUnKulyvc0RCq+5//2l0MQuHQEyO6GXwiJkzaHwXuYk2MI2wSvf7vLdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UGL87z2p;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5A6606A6C4
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B5A6606A6C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UGL87z2p
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so856971c88.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202672; x=1795807472; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
        b=UGL87z2ppAcPI2HMI9a+A5XtHnB5fahOhUW/ViasAl3fP/XgAPc+UJtqGrZ8W7rSFZ
         rw/q55RygnYcP7pGGfBprKQID6lJyBV/K5kPH9ytd0kXwkCgh7Y7kv/BImmoJvYCGHaI
         XGz9+VpMpgQlcnpEFXuLP58pQupjHSTyOlnVDkzuMotn2uhRJtVD1jELe0LTUzNmgbzd
         Xm0OMOUGWMkYS/tddfnPvHrUpMGkGwk+BxqBRyIf12k/VUDRcfv0Yrj8TSjfpCeurUCO
         LxbF4mNlOLuU5NcJ9NnPjMTcOdoJEjrKE66rECVwCqeJFyo9tscivCxMLgiV9C9nPBUf
         mbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202672; x=1795807472;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
        b=f0rRS/wlCpyDxNc6BTpP0RNNCyI7e2HA8uxn/6hktYG8u+sMUcTUIsFXezNrs+WpuQ
         N2Y85y4HkcV8c0E/kZEYWm8J+TsCFApRqSJtw/6repSkbDZrMPVbrrIMQ+pAwgQP4S6V
         +vWNGEhb/a18p7ceeDUUwC+dScTk4Tp8fwah+DGIK/QJBiEVyKnnt+zxrqc9pIqAMybx
         ViLrNstYtVljlpfqnTKZAnvyQsLk7fhhpzELYoQu6CbQK60OoLZrIqgxjbOGJdDSNCbW
         dA8mtaj8bSU93d8eFUWIQlIyppQ+521a7hGaf2qjzvVdJLq3pLMa29w0ztUB8KvD4LDP
         4RIg==
X-Forwarded-Encrypted: i=1; AL+hErGH6xkV5QmDqdhy8jNnmFoWAn7ZGeGzN3j2tXsFsxqSJA/zsIAA1DIDtZDoumu2xCseuItR@lists.linux.dev
X-Gm-Message-State: APuU4Z85MAMXHWXU9gpxYzFrjyLz/rjQDEk9sHDPJfUdtWxHZm58VKJB
	lffcitJkP4vzOeBa/3fQLJdqfTPWaZXRzPXEJ15Gsu2Ec/fIn+H6FfRxeP6xhRJii6VRUfr/+6L
	F8w==
X-Received: from dlep16-n2.prod.google.com ([2002:a05:701b:4590:20b0:163:a42e:b837])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0f:b0:1b5:1a7a:2ebc
 with SMTP id a92af1059eb24-1b556880d97mr3649433c88.16.1795202672080; Fri, 20
 Nov 2026 11:24:32 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:08 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192408.2872793-1-elkin@google.com>
Subject: [PATCH net] octeontx2-pf: handle cn20k_pfvf_mbox_alloc() failure in otx2_pfvf_mbox_init()
From: Elkin Cruz <elkin@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Ratheesh Kannoth <rkannoth@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

On CN20K, cn20k_pfvf_mbox_alloc() returns ERR_PTR(-ENOMEM) when
qmem_alloc() fails, but otx2_pfvf_mbox_init() assigns hwbase without
checking IS_ERR(hwbase). On allocation failure, the error pointer is
passed directly into otx2_mbox_init(), which writes reset headers to
hwbase + devid * MBOX_SIZE and crashes the kernel.

In addition, if otx2_mbox_init() fails on CN20K after
cn20k_pfvf_mbox_alloc() succeeded, free_iomem: skips
qmem_free(&pf->pdev->dev, pf->pfvf_mbox_addr), leaking the DMA mailbox
allocation, and if the second otx2_mbox_init(&mbox->mbox_up, ...) call
fails, &mbox->mbox is not destroyed.

Check IS_ERR(hwbase) and update error unwind in otx2_pfvf_mbox_init()
to properly clean up &mbox->mbox, free mailbox memory on CN20K, and
clear pf->mbox_pfvf_wq.

Fixes: 70f8986ecef1 ("octeontx2-pf: CN20K mbox implementation between PF-VF")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c  | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index cb602a4adcfb..e6722751de7b 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -618,6 +618,10 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 	 */
 	if (is_cn20k(pf->pdev)) {
 		hwbase = (void __iomem *)cn20k_pfvf_mbox_alloc(pf, numvfs);
+		if (IS_ERR(hwbase)) {
+			err = PTR_ERR(hwbase);
+			goto free_wq;
+		}
 	} else {
 		/* On CN10K platform, PF <-> VF mailbox region follows after
 		 * PF <-> AF mailbox region.
@@ -644,7 +648,7 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 	err = otx2_mbox_init(&mbox->mbox_up, hwbase, pf->pdev, pf->reg_base,
 			     MBOX_DIR_PFVF_UP, numvfs);
 	if (err)
-		goto free_iomem;
+		goto destroy_mbox;
 
 	for (vf = 0; vf < numvfs; vf++) {
 		mbox->pfvf = pf;
@@ -655,11 +659,18 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 
 	return 0;
 
+destroy_mbox:
+	otx2_mbox_destroy(&mbox->mbox);
 free_iomem:
-	if (hwbase && !(is_cn20k(pf->pdev)))
+	if (is_cn20k(pf->pdev)) {
+		qmem_free(&pf->pdev->dev, pf->pfvf_mbox_addr);
+		pf->pfvf_mbox_addr = NULL;
+	} else if (hwbase) {
 		iounmap(hwbase);
+	}
 free_wq:
 	destroy_workqueue(pf->mbox_pfvf_wq);
+	pf->mbox_pfvf_wq = NULL;
 	return err;
 }
 
-- 
2.56.1.750.gf70dc682cf-goog

