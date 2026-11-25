Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645153;
	b=brBJWY+HdPh+uzYHzJncy4onyIUuGXBEq3wJoWQEpwcv5Wu9HiXhMSaytkOt62IlPNz2
	 unlNwj2npaDMfNRlqAP0bc/0ACFDEbi2aLORZ3fln/S7tRvAdEcJunnt+eePXc0i4Cin7
	 tAw7VZD7AVFrhC95bjAagc92EP0oDz0c4XtbihiKOmNqGkUOvqr2aeCoKY/47uueQyNvd
	 FRE3RxhxqAQGRv1Wdio7QZtdobLn3OyAToEX7iArv7s/Xn8W1m1y1ZawSMwuy2GY6QhXH
	 Y9o6uPY0ddTCsGuy6jq7XUXJbIzoHojLmZYpae68QOjY+8oT+gQKWU4++6Cj1PuQcXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HRwAz9BoxRqxj0ai++/VXeXT7drQEfcQGrxsvupjxW0=;
	b=bgjEt3XGOqo25RPEpoSZa4ol0ovpBqe1rNpB1Yu5TgP+J6dTV+349biRtXpMmiv8RcyT
	 RekemhRjySRBhCP/2FJN4811cy5iiuWu8uDMJ7BPPwqcvdAyQQeXDiVyveYLVuDQY+0Nq
	 a2HELUONYazuzohVpBBCYBsEepOXUZuyT10++FRE1IMLaY5w3QsDROOa8D6+/glB/sb37
	 p+cCi+2L4AatSIEjo8s1gKaW0dXorZybDNy5EnPS3V0JuXYBqDNsWz1SFhE9i+yBIwEC8
	 1sDp3W/K+upCt/by4kRmeNo4uGl2r6GN1dsCkfRyoRRUQfeJBnqvILmsT/aWzlg/0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gab8rlTg;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433D606A31E
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6433D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gab8rlTg
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so1791257eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645152; x=1796249952; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRwAz9BoxRqxj0ai++/VXeXT7drQEfcQGrxsvupjxW0=;
        b=gab8rlTgFdZCka06VgHvGZfWk6MRWh17h2OFpPqouPjuC6dKJF22sTXmMSGkpbe4Pt
         wpZLjgvP0jetR2JUY6fvNvfhFHa3SoYPUX9KLeWqGOc5XsR/S1GeEk0XsxKOJ5lVjxp4
         BtIlZ0zAHFJFG4jQ1gikM6Z3BxfD7aXxOa89xCQPOB8fFhcmyykV+JMMr7gZyT5iHMZ2
         vm7BE1n5nXJaAovzajTmFiwWMWv2kprpPdKXMQu052+b0Ga8QEYNdiLEspbtK9BDRUvj
         BOXX3na3BMimEiPdfLU9CFd32GdhG/pV1d+jv6Gjdj4nfIThXkhTWHklCf3SLfkJj0Hd
         LnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645152; x=1796249952;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRwAz9BoxRqxj0ai++/VXeXT7drQEfcQGrxsvupjxW0=;
        b=HWHWSTDs7PezvCeoe5XXhr5G6c3yFIM7i+ExSzhnkXaN1xQK3TTbmCtkV15o1wptG+
         G8DsW7dSUqvCgdvE2kD6KW8qhvGismxwLuMKJbSxQiz51nJjRfIm03aIgifZUxSj1wkJ
         S9cjEZfyUz4lpU/NWwPk2VWu2a4gijvMqRHpatjuxOqoQwWzK7RMYzz3yRpv7PICyrer
         lFUKTBRh9hZ2cNi5gjvLgYP1Zo3a8TgSWiS9xzqoT8pg2n4K567qPZpemL6Tcwn9LreG
         77MtvIM3yu/uvkOGz0nPADYopO86HLx4oLWGJnjahNQW9PnlpSzOFP6yKmUN6dX52Nsu
         VSyw==
X-Forwarded-Encrypted: i=1; AL+hErEPC3Lq67VB6k6YIdjOh/MTfxyi+w5tajM/qKHOKEv7Xmxg4JI1yE8cF9SGxNx4Tbe5kndu@lists.linux.dev
X-Gm-Message-State: APuU4Z9QOVlRPSUJT0EVUIUxQuLpFd5+tvNxHqUiG/Xh/uCv+beBDfzI
	iZ2heLTR4yF83I2kvalxwLKYpG7Jrp0eveWNC5IkhsI2J7bsVL0ljrSPSKBDgibWJBDT9zrvX1p
	N2g==
X-Received: from dybeb10.prod.google.com ([2002:a05:7300:a2ca:b0:385:2e0b:4776])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:dd94:b0:36c:9afe:fcd8
 with SMTP id 5a478bee46e88-3856f559cfemr18733738eec.30.1795645151282; Wed, 25
 Nov 2026 14:19:11 -0800 (PST)
Date: Wed, 25 Nov 2026 22:18:49 +0000
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
Message-ID: <20261125221849.1424464-1-elkin@google.com>
Subject: [PATCH] btrfs: tree-checker: verify tree_block_info bounds in check_extent_item()
From: Elkin Cruz <elkin@google.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

check_extent_item() only verifies item_size >= sizeof(*ei) before
reading struct btrfs_tree_block_info on non-skinny tree block extent
items (BTRFS_EXTENT_ITEM_KEY with BTRFS_EXTENT_FLAG_TREE_BLOCK). A
crafted filesystem image with 24 <= item_size < 42 causes
btrfs_tree_block_level() to read past the item and potentially past the
extent buffer's populated folios.

Verify item_size >= sizeof(*ei) + sizeof(*info) before accessing
btrfs_tree_block_info.

Fixes: f82d1c7ca8ae ("btrfs: tree-checker: Add EXTENT_ITEM and METADATA_ITEM check")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 fs/btrfs/tree-checker.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index d2bf21c7b848..a38eeef7b859 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1665,6 +1665,13 @@ static int check_extent_item(struct extent_buffer *leaf,
 	if (is_tree_block && key->type != BTRFS_METADATA_ITEM_KEY) {
 		struct btrfs_tree_block_info *info;
 
+		if (unlikely(item_size < sizeof(*ei) + sizeof(*info))) {
+			extent_err(leaf, slot,
+				   "invalid item size, have %u expect [%zu, %u)",
+				   item_size, sizeof(*ei) + sizeof(*info),
+				   BTRFS_LEAF_DATA_SIZE(fs_info));
+			return -EUCLEAN;
+		}
 		info = (struct btrfs_tree_block_info *)ptr;
 		if (unlikely(btrfs_tree_block_level(leaf, info) >= BTRFS_MAX_LEVEL)) {
 			extent_err(leaf, slot,
-- 
2.56.1.839.g22a8290db9-goog

