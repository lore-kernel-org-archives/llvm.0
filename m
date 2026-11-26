Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653845;
	b=WXGc7mTT5AvRGsN1dIxixrJIaAd1yTNZI0OkapRGUpDA0qSlQp2Fa6/vLDPrQGZamco9
	 o3AFnWznMModwhmQwCfbAuUYLok9hyab5vCG5xFMornwXy9EnQ/ggbjmXZp8tcBuLSSP0
	 Rq+KrHAR8GybHOU8qoSYzAbxg+Jq/JX7cGCwkFvfmOBYt1y6h29DXk1/Flrq26DKrn9tn
	 mQn3rMe9CqncOEbqxY0I591uh8u58ojvm+mkzHBvD3iGPQ4pBlEw3o7DlLIBE2hCeRfMX
	 /G2zjN6TS3H99mnl+2unwWoGdL+2xLMcCuw3hol05NNk8bmikrSCgxm2gG1eUO+IRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kntvEAl8c9UlNNjGZIvxtVFbdMIQt57S01N2AkNPnUM=;
	b=TKkGQ/hDG/EP62nAD0ZvCpY2oqZeB9zEKcvf+gposQM+PW0dRlKrvFpXkNvO8obWMGxW
	 9W/7rwp9SPtM1o3NfJxtmQqHJ4iAath/Ecc3BER6AF7CCbzi7zhAlfMkF8Ymv/g17JU+0
	 4pABSvPtwezqGNzyQSHtPHx3oa0yOtzoxf4r7yeTFlNVSEkVHDZAE7JaoPUxFHdHFwD3p
	 SX3LmuKDQY0jqi/KeTe5YTBORzE5Io0yi1oxTWseeUrc0nUvhr+MqkKSFgk3zWCk74YWN
	 Dm5QrnNrt99Krlz6L5gOt2uCq3O82A4qUpAoP8MjZQY4PEtDUrowaRruuIO0xyzbIsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hHxgyDWB;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ADC606A326
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 00:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44ADC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hHxgyDWB
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7431817eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653843; x=1796258643; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kntvEAl8c9UlNNjGZIvxtVFbdMIQt57S01N2AkNPnUM=;
        b=hHxgyDWBylwiyBf3mpHwGr6iXP0iC2YXYMrq+84zWwIwhv75otX8VJaJOUofuZb2y8
         WRvDywiOUxAWOU5Y+aqIt1Mv6mPiENK8FbDNbCwpSNDIDB/bopVXYDpUzNQbJkiIpjXS
         6kVoN1VGb8ne4Qsk86h6xN9n+nO4muibHTGoOCKyagfV9FUkscEwYqmnatGI9IgpDKK1
         bNOz1d0KgF2zH+jCZ5vEA4hguZfuZRe4ywBcS2kF+X/A1BSWwsQyHKicUptsTQdzTFG1
         XDjz6mT0e8bbqmKsuC1SP6pj+YQ9okHBMvVORDW3/HAqcTmiT1P+useE5wEDLwQohqBS
         k6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653843; x=1796258643;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kntvEAl8c9UlNNjGZIvxtVFbdMIQt57S01N2AkNPnUM=;
        b=E6IlmHvOaNpclle8NvdndejZQNVt4F43+tQvioEt38gARkBimOko8VxbrhdSQPpMCU
         zEiXFG8nJQAhYCODCFCtyXBWGir1ZvMeNr+oWtTeDyWf6a3sBtsb3cUTGQ7Y3gRaz1lt
         GC4M+pHw2vBNCS+Bqxrez21sbpKnqvJeZzns7y1rmndjxNutGNyth1JR+ToGkBt7WLlX
         rAv8GgqW3uQqL0NttgJ7LAdHp070Z+368jSpOQrAJJtlDNCfJ7/ZI3W37ZMKqOV/KD3w
         pinYe40RgeM177fsH+Jb3DWhd9T9cruO1OPfWMEp6qp27bA8XAOWQRHQvyVIDsgVClq+
         8VSQ==
X-Forwarded-Encrypted: i=1; AL+hErGKUz7KkCi4oJ7DYkMJP7+fweYYIt4aZxk3T/BD05lFSfQap6lLJ22yZKz+ordke/hMy1hW@lists.linux.dev
X-Gm-Message-State: APuU4Z+L+FhrAQ30UbGYLQuAKzGqaIHF99TCpq573H61+JoHi99etSzt
	ax2UMB46RpS8ufOM8dItZiy0cg4oJAgfVs1MIgTfd37Y+S6dhwRhOvOqPd+9/h16wZss316c2lM
	kbA==
X-Received: from dybgk2.prod.google.com ([2002:a05:7301:182:b0:385:e49a:dd09])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8084:b0:36f:4981:da16
 with SMTP id 5a478bee46e88-3857073f5ebmr18632806eec.25.1795653842992; Wed, 25
 Nov 2026 16:44:02 -0800 (PST)
Date: Thu, 26 Nov 2026 00:43:32 +0000
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
Message-ID: <20261126004332.1712403-1-elkin@google.com>
Subject: [PATCH v2] btrfs: tree-checker: verify tree_block_info bounds in check_extent_item()
From: Elkin Cruz <elkin@google.com>
To: David Sterba <dsterba@suse.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>
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

Verify ptr + sizeof(*info) <= end before accessing
btrfs_tree_block_info, matching the inline ref bounds checks below.

Fixes: f82d1c7ca8ae ("btrfs: tree-checker: Add EXTENT_ITEM and METADATA_ITEM check")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

Changes in v2:
- Use (ptr + sizeof(*info) > end) with matching extent_err() format to
  follow the existing pattern in check_extent_item(), thanks to Qu
  Wenruo for the review.

v1: https://lore.kernel.org/r/20261125221849.1424464-1-elkin@google.com

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 fs/btrfs/tree-checker.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index d2bf21c7b848..40f2355cbb1d 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1665,6 +1665,12 @@ static int check_extent_item(struct extent_buffer *leaf,
 	if (is_tree_block && key->type != BTRFS_METADATA_ITEM_KEY) {
 		struct btrfs_tree_block_info *info;
 
+		if (unlikely(ptr + sizeof(*info) > end)) {
+			extent_err(leaf, slot,
+				   "tree block info overflows extent item, ptr %lu info size %zu end %lu",
+				   ptr, sizeof(*info), end);
+			return -EUCLEAN;
+		}
 		info = (struct btrfs_tree_block_info *)ptr;
 		if (unlikely(btrfs_tree_block_level(leaf, info) >= BTRFS_MAX_LEVEL)) {
 			extent_err(leaf, slot,
-- 
2.56.1.839.g22a8290db9-goog

