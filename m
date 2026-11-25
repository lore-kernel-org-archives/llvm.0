Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587408;
	b=Ic3qAKAZia3HGV2ZHd+cGsf60C/ObNwqm8Ro4OjM2DzBpC/8gASLG+VZIQ02rFNlHtfJ
	 8TfcEcrG/Ho49HQ7CPYSoEhXtR9tp9ihRlHYtXaAvuseZd2rjM5oA6bu1zq3lsYnwa6G/
	 ZQBIdnyH7mSbIPTt9nfMkLADmyVyYg/xim4dPK3g4/Jh0E3LJc3y0ELNXqr6BJADbsnvU
	 RM2qP6ZUeRpoRSAV+qfqrLYi0zbShiiszLqFDAmmZb2KjHcFBGZ0znOUH1Cypm8mK7LoT
	 KeXLIg/eCvDlHuMpsUd0Mn7FKnH/0RlM1zQfYhpVfHrgxc2X2H3GtMQS5IhjuVv4Szw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
	b=UvN5dSLP6NH1H9y6NrqQwNluBRr7ynCol/v5DYOBEIes3xBptzKWuclo/q2Ed3CEUryo
	 qDHosQWyrMthobmzn1qqEeDPh1jyBF26q1LbbVeeKrWAlr+u3oMF7vGEwQzZ7NWVBjmVw
	 PBVXnFSTd7lSTMd1C39zU1qJzQMUNALP+DGCtbQdwJrXHsVdwkfotV4JsL0cmgtm5yjXc
	 qb1Jjs7hcgNAyRJNs+6sC1bnzfxNPSRn4NIn2Nu7kmma04dAzoRbwcdEDrkqsz2MOMwd+
	 Z0ys730dtB3R0jErTR4u52WYgneu/R9Wkvaieu4zYtQKuCT4On/kcmPghdAIgnrWh7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XyMjmpk0;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA69607AC0C
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 06:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA69607AC0C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XyMjmpk0
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso5633030c88.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 22:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587408; x=1796192208; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
        b=XyMjmpk0p1sQI6umoHMQ6AksU8ombyl0wjvSiZmXtWVOGLLeIEWmVh4oRLMKyOVRI2
         e7g6JNTy9UDczToDW3ZOey+JdR04xMO/RqmccymmQhn3YVDoaOBFujBZaiRpLVUIDSf5
         SIO5ii3Shp9TPEalvrOovR1iWaYqusZjgMWtKljhzxIUrNdbEyLx/AWKmJ7VjNLvX70V
         /8nA2WOPM1M6PdR+Hxw9eJFMqNM6x7JgYKporglrxCHwWe27qMTzWPkYm4DF0I+iWDFQ
         39AK7ftCAA9I4tmfjEp9mIdJJLwOOFk1vKqSprXvr6iqE8rA0Wgp9cGGT2w55+St06Nv
         nyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587408; x=1796192208;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
        b=jlflP5hHYqChIponsDl/wHuvqKIj2nJrJlaoqVCJalfeqlCS06oO9mv3OXfrnKNbL7
         MojhXfL9a7cY7SujKs8ltyT9NdcUQl1PJSAkA0riw6isAHuXkalUAZ1lZu7SSfLAHe6s
         7J061fqH4ww5G5NpTs2b3YhyG3AMWedifF2guxqlpAu9g0+LD/wP3Ums2KaB/eTiMcVH
         OSxgXX6ANf2l8/aNVsU70BoXU9LhPb5G8jDqkbpCRblUXhxyTwFmj0XpXHBobk3dnKG8
         h20Joy6nSY7Cs8645bbKNVMrL9c9tIA/Y3gH4XVP8hQNUY3ioyanu9E/dIuiaGjllYIY
         Ni5A==
X-Forwarded-Encrypted: i=1; AL+hErE/ZmEOv1ZtVH7PJBpBAdEbC/RjL+7k6DiDlFsvaFJN/ELZtGB7SE2dGBQc6VVyFd8GendQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/uA97fpYgHLQSA96OlNCaXWOb9bX9+rnu2vSiajR2QqYdZJ8Jc
	vVjIPMEgyYi3ecwdl5mk87mlnKmYHlbp2uCCUVx3r/90Y8MZjMG0PMzdxEvf3SDHC6aH7K8pp4O
	KecROMtUy7Q==
X-Received: from dlar8.prod.google.com ([2002:a05:701b:21c8:b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:cc88:10b0:151:6e80:ba7e
 with SMTP id a92af1059eb24-1b5567dcec1mr15970822c88.4.1795587407220; Tue, 24
 Nov 2026 22:16:47 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:18 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-26-irogers@google.com>
Subject: [RFC PATCH v2 25/30] tools include: Add linux/uaccess.h stub for
 userspace tools
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a minimal tools/include/linux/uaccess.h providing a no-op
might_fault() stub so userspace tools under tools/ can compile shared
kernel code that includes <linux/uaccess.h>.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/uaccess.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 tools/include/linux/uaccess.h

diff --git a/tools/include/linux/uaccess.h b/tools/include/linux/uaccess.h
new file mode 100644
index 000000000000..5a9e6bf4cfb5
--- /dev/null
+++ b/tools/include/linux/uaccess.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+#ifndef _TOOLS_INCLUDE_LINUX_UACCESS_H
+#define _TOOLS_INCLUDE_LINUX_UACCESS_H
+
+#ifndef might_fault
+#define might_fault() do { } while (0)
+#endif
+
+#endif /* _TOOLS_INCLUDE_LINUX_UACCESS_H */
-- 
2.56.1.831.g720f3f5937-goog

