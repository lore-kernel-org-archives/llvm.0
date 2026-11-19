Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108066;
	b=yj4Pua7yojHRC4OzNDAHhg2KZSyBBcRTzsnEjUnS8PypG1gNlWUaudynnWTQWMksHDf1
	 THo9Pg+XLfw07lvbwkzW7f11E0V8Dioigw0PAAN3NN4eDNwFmrRCSlZlGh+xR84Xec8dz
	 OuN7cGmS5wFeWTq/+kltQOUI8VdTx8KK7l6nYFFyyV8ZVyOXePn2YjDK4G5+jCkN8tgVt
	 ncZKXrux0w6IsasTKIhbkOJ3+rxio7Q9zWZ3tTOWkeFfGZG0HTfvxiRBqWug0hqpigTXg
	 gGRj050QgH0DzeuUPYXFGAx2ZlDfYPO23EzN+eiVYJ+aztBWVqBvuDa/VgE6JI/Q+PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2o0ILC3keCwMhrgGZ6aMyUvzYh9D8kgarIcL8NMwQRU=;
	b=1drUeKlOH/qrMSF+ofvnOsXkDG2jyPR+ak7OqoZWp65CnPfROsrYjaNW7Ijr10Zlml06
	 nR8rNrapBUoG37++E1dCcRunacvZt37h5R4LZX2scC1J1DNv4VsaU5JKDrcoXzGtWQ7DK
	 6hUnzdAs/E/RxaNMs2iNcdhs73ZCxemUZle0QtsMvhXX6Mj5MnhzKjhS10l0DUiIdzFvO
	 O8N0C87VdE+e6Rj2nRMEpA0V8h3AsEl1gQlXU98eGhimSjzKPvFsKM/rF/L2JY2aXfPtr
	 vT0SwuvThwT1Axkp1mfLLlHJQ6SuCSWjldbHu7bV7qpzcDvuhE7JKCox85QKqoYUBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aKEXxAkm;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F2606A320
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07F2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aKEXxAkm
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so872451eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108065; x=1795712865; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2o0ILC3keCwMhrgGZ6aMyUvzYh9D8kgarIcL8NMwQRU=;
        b=aKEXxAkmF3ynPBI/CJWqKlJF0ZrpSR5cQiUEIOpKRWMsqK9ss+CaHaDmEfddtRj2eO
         +mT8zExnaBUpS2XvvmNqdTEVID00Qi4gYcJc0JRzlnWeTSZd/SlgVvQkswZL5uAIrjHi
         ztLQyx6mSBZgcngbXgTYr/IFWLEfrWRAWKaPk4rLAdSCff0M7IFUGoTjEmBQc+2CjDGe
         Dd+bZaasCaPB3tClHfPuJIwhydX4H3NF9ylRVEQQ2nuCiw5ltJDWxsHYIzsN4UA8R5Gw
         6zuKVCe9KgAmSPs12RNmNkxEV3p/9iMSN+qmzqdfxGui20xYUPCIveIqn2aCEaKQQ9lG
         yTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108065; x=1795712865;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2o0ILC3keCwMhrgGZ6aMyUvzYh9D8kgarIcL8NMwQRU=;
        b=HF16eK7S2Zmf3Rco3ziy+KbScBhtHn9lKdRbPXge/nlsCLx4oqoIJDnquSNlBgfn+P
         aJnPuV/HuPe9ffpodK48Demrvv39kcSO3R4z18W0g7tdPji5RepZLyXY4js10GASIelM
         AHf7nLydi3B2jNG8hLb9rdOQhcUe0wW3A/RT7f4xhwmFBIfvODGQyuTotQwxeE31/CZS
         NMpVn2eYI4EFA6eUr+pvW0gsVJg6k95oiVYmxuFhxImHeiVQORWUvjYYqCpSPc40yEzP
         q9MKwdxR50UCT50ka1S7ccqz3RlBS+70QMpo/sMfqOZAt9pneGvQKdnoPi75k+2uNxzH
         NObg==
X-Forwarded-Encrypted: i=1; AL+hErGV5X3iqVwWvq5usee18JR2fp/1c+L1iTdXAdXW0yEcTzY8DFlaLp7EQe/1hHrKKbUVkO/P@lists.linux.dev
X-Gm-Message-State: APuU4Z8cte04W3iPi/XNdzkN3XQYeZkOm+CXqI6atnyWcTCaGYJ3yn0U
	NnLq9JrnXD8mQjBaiIBkBCps3kXUZKImUlhbUIYu1D/SL8qLvWrjL7F7eEEjczZ6xZzgPwlKval
	7iyKcvpBarw==
X-Received: from dyr9.prod.google.com ([2002:a05:693c:4009:b0:385:23b2:bccf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:51d4:b0:384:fef7:5876
 with SMTP id 5a478bee46e88-384fef75c78mr1005650eec.24.1795108064646; Thu, 19
 Nov 2026 09:07:44 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:41 -0800
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
Message-ID: <20261119170741.1525395-1-irogers@google.com>
Subject: [PATCH iwl-net] i40e: ensure owner VSI is found before dereferencing
 in i40e_veb_release()
From: Ian Rogers <irogers@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

i40e_veb_release() counts all VSIs attached to veb->seid in 'n', but only
assigns 'vsi' when I40E_VSI_FLAG_VEB_OWNER is set. If a non-floating VEB
has a single remaining VSI without I40E_VSI_FLAG_VEB_OWNER (for example
if the owner VSI was moved or cleared via debugfs switch operations),
n == 1 passes the 'n != 1' check while 'vsi' remains uninitialized on the
stack and is immediately dereferenced.

Initialize 'vsi' to NULL and refuse to release a non-floating VEB unless
both n == 1 and vsi != NULL.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Intel XL710/X722 hardware.

Fixes: 08cdde310e22 ("i40e: Fix broken support for floating VEBs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/intel/i40e/i40e_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index abbc71e815ae..8d4213b7dd92 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -14718,7 +14718,7 @@ static void i40e_veb_clear(struct i40e_veb *veb)
  **/
 void i40e_veb_release(struct i40e_veb *veb)
 {
-	struct i40e_vsi *vsi, *vsi_it;
+	struct i40e_vsi *vsi = NULL, *vsi_it;
 	struct i40e_pf *pf;
 	int i, n = 0;
 
@@ -14735,7 +14735,8 @@ void i40e_veb_release(struct i40e_veb *veb)
 	/* Floating VEB has to be empty and regular one must have
 	 * single owner VSI.
 	 */
-	if ((veb->uplink_seid && n != 1) || (!veb->uplink_seid && n != 0)) {
+	if ((veb->uplink_seid && (n != 1 || !vsi)) ||
+	    (!veb->uplink_seid && n != 0)) {
 		dev_info(&pf->pdev->dev,
 			 "can't remove VEB %d with %d VSIs left\n",
 			 veb->seid, n);
-- 
2.56.1.708.g77570a6a1d-goog

