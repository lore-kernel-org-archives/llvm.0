Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FC51993C
	for <llvm@lists.linux.dev>; Tue, 30 May 2023 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685455199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4RT388VnQCYZW3nYzowL+p8Lhxi1vKrwW2Bk6UlbFw4=;
	b=eL50lmbu0V9YsFr4juQfNkwX2r9h01sufiFYpg+33uVpFzWfzF8ONaJnbRLpS/T4SJ7l8K
	WEt15k/e+F36YOo6fz45lhqRKLdjiCBCJrnrJej3Bwp0bHKCYtJ46IBEJ8DWEtWkyPdhz3
	fBHl4m1CJ2aCSsyipsRZR9Yc/NKBhx0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-ifJ-jz4EMrCQ0ldxRnZvZg-1; Tue, 30 May 2023 09:59:58 -0400
X-MC-Unique: ifJ-jz4EMrCQ0ldxRnZvZg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-75b17aa340fso604653185a.3
        for <llvm@lists.linux.dev>; Tue, 30 May 2023 06:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455198; x=1688047198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RT388VnQCYZW3nYzowL+p8Lhxi1vKrwW2Bk6UlbFw4=;
        b=NF1bmWDAcwA7lV8GHndMXnpa4716i77ISSi9nSZJYAHy2d9omg7cap8K8AqOfyfDc/
         t4PGipbRCOtwHYRBVttLR43lAVZzbNkmCg+LkHMPrmJo2oLPCPeAHnRHQfiMBmXKzEiA
         451NEHe2sgwP79GHNgQFxtq22QZKxvtp5kaZGVlGASCPjJHPHM3EoNqKX1VMfQM6u+Fx
         +1qOCCJq0a4Z7G99A86AErEgVFXctwSUqgGaFn8rh7gbnk2ihxgZVa2Zf1TWtq0aKROH
         8Jr39ThLVqwCzp0MbEd2YccPqmWaWUjWJG6Y49rumDXrh7E8d+VONa/+2Tdkp+1JmWBU
         39RA==
X-Gm-Message-State: AC+VfDyrV2YIe8iVbf2gh9rJVc33fdALudbhGQIXo8Tr3oMBTgjelA6a
	JdrUQbkNiHqtprOSiO2hWSHO8/9uYhKr+vu9borwlka16kKqYz7Wc33vSiYHsb4A6WlzrT9dFLR
	8b321cB+TA3LYWg==
X-Received: by 2002:a05:620a:1b96:b0:75b:23a1:456 with SMTP id dv22-20020a05620a1b9600b0075b23a10456mr2095116qkb.28.1685455197830;
        Tue, 30 May 2023 06:59:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KhIBZdP1fPs6CXWxZOvyl5jXEFHI2OcLhwSX183uedbOKNfq0+qZi8wwa+CtWgI+VJcheRg==
X-Received: by 2002:a05:620a:1b96:b0:75b:23a1:456 with SMTP id dv22-20020a05620a1b9600b0075b23a10456mr2095096qkb.28.1685455197619;
        Tue, 30 May 2023 06:59:57 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x12-20020a05620a12ac00b0075cdad9648dsm2179295qki.25.2023.05.30.06.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:59:57 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	goldstein.w.n@gmail.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] x86/csum: Move csum_tail result parameter to a local variable.
Date: Tue, 30 May 2023 09:59:53 -0400
Message-Id: <20230530135953.3341174-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
arch/x86/lib/csum-partial_64.c:74:20: error: variable
  'result' is uninitialized when used here [-Werror,-Wuninitialized]
                return csum_tail(result, temp64, odd);
                                 ^~~~~~
This is a false positive, but there is never an intermediate value
of result to pass into csum_trail, so move the parameter result to
a local variable.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 arch/x86/lib/csum-partial_64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/lib/csum-partial_64.c b/arch/x86/lib/csum-partial_64.c
index fe5861951b15..cea25ca8b8cf 100644
--- a/arch/x86/lib/csum-partial_64.c
+++ b/arch/x86/lib/csum-partial_64.c
@@ -21,8 +21,10 @@ static inline unsigned short from32to16(unsigned a)
 	return b;
 }
 
-static inline __wsum csum_tail(unsigned int result, u64 temp64, int odd)
+static inline __wsum csum_tail(u64 temp64, int odd)
 {
+	unsigned int result;
+
 	result = add32_with_carry(temp64 >> 32, temp64 & 0xffffffff);
 	if (unlikely(odd)) {
 		result = from32to16(result);
@@ -45,7 +47,7 @@ static inline __wsum csum_tail(unsigned int result, u64 temp64, int odd)
 __wsum csum_partial(const void *buff, int len, __wsum sum)
 {
 	u64 temp64 = (__force u64)sum;
-	unsigned odd, result;
+	unsigned odd;
 
 	odd = 1 & (unsigned long) buff;
 	if (unlikely(odd)) {
@@ -71,7 +73,7 @@ __wsum csum_partial(const void *buff, int len, __wsum sum)
 		    "adcq $0,%[res]"
 		    : [res] "+r"(temp64)
 		    : [src] "r"(buff), "m"(*(const char(*)[40])buff));
-		return csum_tail(result, temp64, odd);
+		return csum_tail(temp64, odd);
 	}
 	if (unlikely(len >= 64)) {
 		/*
@@ -141,7 +143,7 @@ __wsum csum_partial(const void *buff, int len, __wsum sum)
 		    : [res] "+r"(temp64)
 		    : [trail] "r"(trail));
 	}
-	return csum_tail(result, temp64, odd);
+	return csum_tail(temp64, odd);
 }
 EXPORT_SYMBOL(csum_partial);
 
-- 
2.27.0

