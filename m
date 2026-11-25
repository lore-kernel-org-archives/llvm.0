Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645092;
	b=CN3q6kn/CBYR62ryBgW5H9cjx96aCMlU/YspgYxM6EpNSp0nnIZiEFkXAztqaQzWGB0Z
	 1KAEfvSnvrSeA1RLsHb/OkYjTw5aAa2195CUcEXT3HXIUkiZJj9VFLnhauug8nKRsFn1M
	 z0hw3Hqqeqkok6CyATYD33+ipwIeHdM3VnWqC2x/CD0T4+3ezWcMqSQFPCyyCmsUYROyX
	 km0Y3ik9wxpVpW7+Ob9Gek4IxGGHkoJyyrsHDMSnUmEtBUI6/hFNmQamti6x7FE0lvSEZ
	 jBqUBdkBr6k1fB7U1CjR2eX4VPGjWtwHrp1zACUdTyloiOnfaLxiNNZzRmTghlzOIbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tpmpzrLhm7pX+D8pjkEqrRIYRLx4SQ9n+QD2Zw1yZYQ=;
	b=POjhAri4o9DphPwtiNkzX7wjCElN+L4UhF4V3rd62dYHOH42ftpwlL926lpJQKUMk9TK
	 7yfI8IcSL2P+vrlzaRLKoo1TZgQzZkvWhBN5eaSCYhwTDEK5VaNDzX8YP0AQ9UYnsSXR4
	 WHzFTqxfMxlq+ZS30967iO98ymLLUUw3jBMzOFtA1lZ8+7E77Vnrytdy4muJwoVADjIo8
	 Th+AvRbCMKifCOFd0M0WKYEBJv9SP1SfENJ0+nlelcTmv89iUJGxf9bsRb8qMHX0YY2hB
	 /f2aa3YFypQSlkwKN6As0ob96TuApAikJmMqiEqafFOWo8VWLRI3pmbzAgGKoxq4+Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DnAPVhAm;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7143606A69A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7143606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DnAPVhAm
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so6801376c88.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645091; x=1796249891; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpmpzrLhm7pX+D8pjkEqrRIYRLx4SQ9n+QD2Zw1yZYQ=;
        b=DnAPVhAmEADzSF8g52jUKoIpUXh5CACgQx5gACCJ8019J96QoalINet7QEfEP8leoE
         sPM/pCXc2QzTp3iwGPx+OvNIPajBeMAj31g7+0Qxv03jupm06liRZelZiyMsf/AJcLxz
         vdvLSS28nbLWbQUbLTp5GKOXSeuPBkC39NVPYjfWmljcF1bv1QRHjuASWXPwgcWLJ2Rk
         S+evu4QzO+uwqzKQ/ic4DCzOsxay8c2oDn9NFtn+6PE+8TvRqYeBWLysrN0mPN07opcL
         I8uY4bAT1JztjBEL/v+xIk/kmn9eTfjEdqsxgHWZ1mhCdcmDDmK/AKNd3bAwuEQuur/+
         poHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645091; x=1796249891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpmpzrLhm7pX+D8pjkEqrRIYRLx4SQ9n+QD2Zw1yZYQ=;
        b=sJtH+BRrqlhJquJkcF0KCWLH32vn5FTgLJDbqDR6zQVXLEa9zh85osc0Mix2/+FzdK
         iaQJrXYi0ih9BnbuxNZW+1kbIOG4inSprq3xnjwfn8fO8RNU2ID76J8Y4Z6CFBjhghpG
         FZIMnpAuTAZtrkSiQd7kTePJsWzyTKAbRE3d3hnFsDFlTko1AeJnRxhmZahONoZ0SwVd
         uby0mtkUHQk93RTPmfKSxY1OANNaxZYHRgv66Vr4CjI3atmxrr6Wub6g9ewgoTQtPugc
         NvWTZczaAA2mpWJveTV0fC6Dp3pdAoMCGIZY8zN4ZVR98+v3nuSEcFaEIyJCHoJjjlb0
         sQsQ==
X-Forwarded-Encrypted: i=1; AL+hErEiZuVzKa2iXZaVBLJsHdqLWx8kBeBuhjTBGoBgvzvrfK5PNxQg82VAG6XQjOOfgIP6+OCW@lists.linux.dev
X-Gm-Message-State: APuU4Z+zz/8ICJ3JFWMNMs25+ykK3CMJYvWcRgqfBupc3ooSNAX+rxEF
	VwupjGiLev8QPb5Sp5H+AxghBy835nopc6fSoO41cm1WRiVpVZ+6INjnCw9fb3/2SwmYFt56gCE
	aFw==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6988:b0:156:6676:d0e2
 with SMTP id a92af1059eb24-1b55689f5dbmr25363930c88.10.1795645090492; Wed, 25
 Nov 2026 14:18:10 -0800 (PST)
Date: Wed, 25 Nov 2026 22:17:29 +0000
In-Reply-To: <20261125221730.1421806-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125221730.1421806-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221730.1421806-2-elkin@google.com>
Subject: [PATCH 1/2] afs: Guard NULL alist on restart in afs_select_vlserver()
From: Elkin Cruz <elkin@google.com>
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In afs_select_vlserver(), restart_from_beginning: is reached from
no_more_servers: after pick_server:, where alist and vc->alist have
already been cleared to NULL at next_server:. If an earlier VL call
received a response (vc->call_responded == true) before failing with
-ECONNRESET (setting AFS_VL_CURSOR_RETRY), vc->call_responded remains
true until another server address is selected, causing
restart_from_beginning: to dereference a NULL vc->alist.

Guard the preferred-address update and afs_put_addrlist() at
restart_from_beginning: with if (alist), matching the failed: path.

Fixes: 98f9fda2057b ("afs: Fold the afs_addr_cursor struct in")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 fs/afs/vl_rotate.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/afs/vl_rotate.c b/fs/afs/vl_rotate.c
index 6ad9688d8f4b..8381d6a35d3e 100644
--- a/fs/afs/vl_rotate.c
+++ b/fs/afs/vl_rotate.c
@@ -171,12 +171,15 @@ bool afs_select_vlserver(struct afs_vl_cursor *vc)
 
 restart_from_beginning:
 	_debug("restart");
-	if (vc->call_responded &&
-	    vc->addr_index != vc->alist->preferred &&
-	    test_bit(alist->preferred, &vc->addr_tried))
-		WRITE_ONCE(alist->preferred, vc->addr_index);
-	afs_put_addrlist(alist, afs_alist_trace_put_vlrotate_restart);
-	alist = vc->alist = NULL;
+	if (alist) {
+		if (vc->call_responded &&
+		    vc->addr_index != alist->preferred &&
+		    test_bit(alist->preferred, &vc->addr_tried))
+			WRITE_ONCE(alist->preferred, vc->addr_index);
+		afs_put_addrlist(alist, afs_alist_trace_put_vlrotate_restart);
+		vc->alist = NULL;
+		alist = NULL;
+	}
 
 	afs_put_vlserverlist(vc->cell->net, vc->server_list);
 	vc->server_list = NULL;
-- 
2.56.1.839.g22a8290db9-goog

