Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107889;
	b=YD19tb/l23eHWyksdsV9WLs+JJCvH2XxDPMANBXRrclkZFTEh7GDh0pLjHadcnvOTOjK
	 XCpNhqjyAxdQMT0P98U5LPliNs3psDsgecVn0lU3DLvFa3QRSN/byDViztx83DtwYut9Y
	 qlluctIaIbG7E29mDm6IqfNqETvMCu2G3wDmeO9L9Mv6EQ6a2+oQGubOT62NpQAUhjYRX
	 rCZENBWk1jaH9DhOwyiiQeLMiQX5q+NRRD11u2XHQZeEMLSe+ip2Q9gV/dDg5US1vg+wC
	 oQZh0GR7jWnEvGaliXndg2AqUyu+s+DFdkTDktSbf2knucsSFY5rQja6VhBr/a0fLmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=voN556T4bQ5hmnwkn1P9G0D/giCnPNELWJFN9TQLbHE=;
	b=iS3pKvoeHK+2HMZI9U+OjiyTmDtybqkWESG3xHdPWEl9GhGe2De6VWOTUc/EKh8fNBjm
	 c7WPtFAucnDTZHXjd6jVY/TN4MJ9ufZXYpHw+4vqbTsNKnuhKOPZao7b9XcE50bulVStC
	 0dGfUl+o6kPT6aDDS7EnY0+QFOt7CDtJ6jFkeOVkEi1vKW7eJXlAAE9ERGlaRv/Y1/Aer
	 al5Azj6219CZDQ/6F3ZkurpmhyNTbaIpzSE0m8VyjPVTkJqv/GKsBEniSn5TQNY80KjAw
	 eHzFFUXhdCpbSKySbCbEh5ItS7mcRWlOCPEKqYS1XoPMaYITVZmJM/HLZg7anEt5/jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YBdB9ojF;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6243606A33E
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6243606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YBdB9ojF
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso94543b6e.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107887; x=1795712687; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=voN556T4bQ5hmnwkn1P9G0D/giCnPNELWJFN9TQLbHE=;
        b=YBdB9ojFR/85TW77GfHJo8+xsU7kXz/mg/+sg1lakQH05CNj2JZK6QYJaVTLJ29nR5
         l3c3rE3BW43LoQXeArbdCCsEqU00AwwYvMWytvrwHzvKReOAkWr6G/jqrZocKPM4xWEB
         4NgcOdgeE3GOsRnV8ZSGvkupFCFa1aC+BfbAdUhDDcqujET7Fu1PfUuZwYu8Wh7IxxJr
         shNpoNuXJt0o4dIQceiqFbMsUsXe/Qn8AnFz0sTAs71yp3mkuR27WaavNVMHgtN/JJil
         jaHpmBZiJnFVocl6l1Qywxgw+8E36S9KGmx5ofpdIFTHJPK3I9ZdbNqkpMsOv4cLwWiG
         hyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107887; x=1795712687;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voN556T4bQ5hmnwkn1P9G0D/giCnPNELWJFN9TQLbHE=;
        b=rbX58fOxeiNJ+amp0v3xnN6h9ViXncvMX3JPlhzIwDRE/znaSO6vtjVbO80KRrKXLt
         nLDV174vimgixmbXu46PbjaGznp7L7XbubYA5YtGGkRTloaradJeeTcJHOjIOy74h8nt
         hDNkPN4vnzba7Vdwr6pl3RJei+XUe63W4hOIj2a9I9HPMJjWqS0UF0Rh/q0+F6VYu3Xm
         1INTse2V8son03fHA4CjHsWaRWXIFejeWWeUb4ziCBtjd/Wii3GcxH7bmZgEgH5v3GYO
         6cA4JIcxRAKeTed2KISTiBGtZguYqdr18EhSd6f7O+zMiBjEoPvq8WK4YBP6mfoxqQFA
         hOsA==
X-Forwarded-Encrypted: i=1; AL+hErFVpdPqAsFW62Sd0d1KoXSE4uAfNR333pJ+u+JQPDNBALVxDzeeBPJBsXzYE95stqK8dCBK@lists.linux.dev
X-Gm-Message-State: APuU4Z/6KB7n5uvOWiCGYhFAAfLamaN3i8ZD+QT/7vsNOJQONH1cJgmR
	M0hLMzEYa0mIxqM6cYiRTtyI5mdwyss+4Aex1clXjIbwzx0nHADQ3MCYmAvhoxZ5BMFbC3464gY
	rd/RT4iCUww==
X-Received: from jafo1-n2.prod.google.com ([2002:a05:6639:301:20b0:620:c289:80b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f0f:b0:567:c773:39ab
 with SMTP id 5614622812f47-57a0aa2ee51mr623733b6e.39.1795107887287; Thu, 19
 Nov 2026 09:04:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:43 -0800
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
Message-ID: <20261119170443.1513294-1-irogers@google.com>
Subject: [PATCH] Input: ff-memless - fix 180-degree force inversion from s16
 negation overflow
From: Ian Rogers <irogers@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In ml_combine_effects(), constant-force Y component calculation negates
fixp_cos16(i) and passes it to fixp_mult(s16 a, s16 b):

  y = fixp_mult(-fixp_cos16(i), level) * gain / 0xffff;

At i = 180 degrees (direction ~ 0x8000), fixp_cos32(180) is -0x7fffffff,
and arithmetic right shift by 16 in fixp_cos16(180) produces -0x8000
(-32768). Negating -32768 in 32-bit int yields +32768, which overflows
fixp_mult()'s s16 parameter a back to -32768, inverting the Y force from
full positive (+127) to full negative (-127) right at 180 degrees.

Widen fixp_mult()'s parameters and return type from s16 to int so
+32768 scales cleanly to +0x100 without truncation overflow.

Found by enabling Clang's -Wimplicit-int-conversion-on-negation on an
x86_64 allyesconfig build, with AI coding assistant help to audit the
warning and prepare the fix. Verified with a standalone C test sweeping
0..360 degrees and Clang build; not runtime-tested on force-feedback
hardware.

Fixes: 559addc25b00 ("[media] fixp-arith: replace sin/cos table by a better precision one")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/input/ff-memless.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index d1fefd1dfc0d..ae8ff19905b6 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -229,10 +229,10 @@ static inline s16 fixp_new16(s16 a)
 	return ((s32)a) >> (16 - FRAC_N);
 }
 
-static inline s16 fixp_mult(s16 a, s16 b)
+static inline int fixp_mult(int a, int b)
 {
-	a = ((s32)a * 0x100) / 0x7fff;
-	return ((s32)(a * b)) >> FRAC_N;
+	a = (a * 0x100) / 0x7fff;
+	return (a * b) >> FRAC_N;
 }
 
 /*
-- 
2.56.1.708.g77570a6a1d-goog

