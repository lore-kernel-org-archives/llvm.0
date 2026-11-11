Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418953;
	b=ATkUoQ0Ko02Pqgp29Jw3nBdewGXltWn+/F36aZBzTP36hxyNGQAQUq9pDb8NMbXOga5b
	 omaNpweLIsdwbXvTO27iAfrFcNtFOwSiXyba45OfYGrw8jNdf8C0OdGSWEyZNDBdmGr7j
	 3sQv1bjk4YPYi2wldGPsVI7q0qlv4jejLOTjW34o/zqWLbmbXwpoV8XsTSNcvhnAC6Z7I
	 ZsKMsjJdY8H/PHA8T5xaC2+NGP1A+gpruCSsdu38wpuigSlz+FCHv0l7rQoWCrVLlkIIw
	 Iv/Zr92Hwna+jSGb21frklOTLx/w1JcjYLUJVBYtIa6L5bYc2h+G1V+ujzlflxEfA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZtiosLYJbRApO8KRSkyBJePzfep1nH8y43FCo0J139k=;
	b=nyrUI4VCZgWPcFP1JTjkfoDlM/bLC3oOc5A/G2By7TGargXCRVm9NK9LLTR9a+6Hd+5Q
	 c6UI8hVIL6Bcrj8FJeXMYXwgosmQMBPe6HSzSiWe9KzecCJbDiVg4SglgcksS9CnnLJp6
	 aTk/fQq8ybEQroq3lU1n6Uy/Otq9sdSRtdWA/OiqE+2rklxZ00609p71nqDefHksUdNVh
	 SXvWzLlVDo0peVamX2GLkSZi20zWAP1RUKpHF+bGQjJg9MOGHj7oANIsPBLl3LrInjg8H
	 r5roMyNQ4B1PCg+rS4xqR+EKw6wOMy/G2CEWceVabUjlsGBDSM62W9xeL+3ndH8iyaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bPW4PGlK;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64E60A2613
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB64E60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bPW4PGlK
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso69806eec.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418952; x=1795023752; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtiosLYJbRApO8KRSkyBJePzfep1nH8y43FCo0J139k=;
        b=bPW4PGlKoQ7hnpHv68tVeMXU+aDDG49VK1bxnIuIY61RO4Z0VenCXg0obwhY6jkTwc
         cNv/W9oxsTk0+gxxkco6yYOXw0cChRdCq1e21bJ3MGj04PMMyjWKiR7SVgY+KIU8kA91
         vntG8qtPYLgfgh/8uWcKrNo2etnYzTkw5ju5jYtGun+Z3BYN2qyJQom7BjRbEN5H0Ta2
         FJSy+KsrW5Ispdixg3+vCJMpkASwoRx1ddXc6mwdJICHXY+GVv5iHN9+tzUgVZfxhd+U
         ia0DLEKAWRw9pwdcT2JigQo5RbnudX/n0eg5P7gMRFwGeXBmzL1ad7RzCLfiJMy6nCBl
         9faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418952; x=1795023752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtiosLYJbRApO8KRSkyBJePzfep1nH8y43FCo0J139k=;
        b=BXkKTMLHB5iWr2DC7RChcNqNGgEsTNQZgWs6U4CG7rET5xjh7ijdLJHx1sER0lO+oJ
         3Vim+qvLDddi7JebYw++Docemx12J4DC9dDA2rALkhmQxsQFMUrdflJrJ3wriSIiPuC+
         fHUjouOPG8us3jBQxaQfiSg1qdftn4wkEhJsW+E59QwDtfCnRsSvBZTMvQg+X5JpIjta
         Rlw5Zz68CM7BIx4D/8Zo9aTsvNB+LoQQkEK4Kh7bH3Esjla6yZYZWvRmcK5uXXsTY1uk
         X0KEz87m0PoeODbmz36RbgdyMFA1d4ikPLLsuOtYhxenIXjEU7P/uJrXQ7+KParSJYt/
         C2kQ==
X-Forwarded-Encrypted: i=1; AL+hErGnVc4n1wWsax5Op0SvsrBPJ/DlBxd44dG8UA5dKW6UapRTFbtFWwVW576IhTP2w8A6P70F@lists.linux.dev
X-Gm-Message-State: APuU4Z9UWiUDXO1lLp0GuDbeK6yeBf2iBj49xdwPZPlg01VVjNHXBwwZ
	cR2rhS/fBCWk2edwuvRUCRAo7E2ifrQ6uBJRif9PfT57XwdxnlH5ZBBV6GFSMhfelinF/25FCS6
	OwvK3kwb6pw==
X-Received: from dlbsn12.prod.google.com ([2002:a05:7022:b90c:b0:1b2:3bcd:9068])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0e:b0:1ab:90a8:87a2
 with SMTP id a92af1059eb24-1b4f5f34a37mr121144c88.11.1794418951516; Wed, 11
 Nov 2026 09:42:31 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:58 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-7-irogers@google.com>
Subject: [PATCH v12 06/20] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.542.g3ef89b7020-goog

