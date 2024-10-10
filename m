Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C427179A3
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 03:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728532620; cv=none; b=An5z3vq7uZ0emodbPW3YbcAtk3jK0kTGnVSg3ZLeJdJwI5YygGjNfrod4Mqf3Ahom3dKUL0yzY9oqEHFJgfoF/QpxdyJafeKT+Fq4XHLv6GovN1TKt5awA5Q7nuBvPqt1F9SPo8hz/BqYo7IWBc8Vr/yKGdTTiL4Hk7ckDJG+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728532620; c=relaxed/simple;
	bh=c69vCHD9sXglxFuU3cVQfkkP0kz++Bt/tDJFXTJAkGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=emDHmosu2zJEQuFaspgS775cFF8RyDnMjdIRDcegaCi7phaH0+1Fusd+P1DJOSxx9t9yhTpeDeJvGJEuhivQs2pwLPRDv8evCBh0Za4MvF8fZvQ6L0OrabbU5alye/tudzBhKJeJ96dD6jgFA9HKyan3R+BZA/RoRwCSgVZ4HvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+qsHzHH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+qsHzHH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43117917eb9so1600235e9.0
        for <llvm@lists.linux.dev>; Wed, 09 Oct 2024 20:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728532617; x=1729137417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIK6iHiUU8vNnmDPHqJUi9UmAD/kMAdpbZF6z5E3nlg=;
        b=U+qsHzHHCPwt1aQRjNreEBYI2VfgkLNWlFcIMvnO8zT3y/Or9He0lW2XQRDpxmMGkg
         Nwt4c+STp73qwEgPk8jkjcaCw+GBCHG0F5njac8pxe9fPLch/Tw/TRMWibznb6wCVqOj
         LXkJANRy5eTQHLjKQMbCX7AU/1bW6LObe7cLoABkT5AzzZjkL9Hn2YUU+RA88UjSWTTY
         E9luhdGtgLO4Bgucye4WFKqyWcTg4ez1tLVa7bn/xqv6mC/jHA2I2Fn7fnm1DS1WnKBG
         BQTYUwloXI/7/TIetJq8DjyjnA2iVxg7u/YYx+Rzwbhn7jXJVT1rUYbpS+pd4PfZDCPB
         JryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728532617; x=1729137417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIK6iHiUU8vNnmDPHqJUi9UmAD/kMAdpbZF6z5E3nlg=;
        b=dEfDG2B3zdR4KMUZCIMB0marM74ZxAamZAfA0ePTZi6j3Do+CZeER7H888/kZZrzaK
         KZ+/WNjpjgn++GEJPLoYKxKPL8DqqZaKLX3eHLl+Aoxl5zTrYU/UFHdI5LO9szTNIwcB
         GB/lZTzmWZ3NP3YHKcuzoiG2+obW5oFurKGNeqchN19tIw5j6ed8V7nAOApZxpB8cYJN
         wmAStxUhxA4TS/6f3D5HC39PsxdoZiKx2IvpLTHVozsPeONgOX2WHoscmmM6n13Q/6/P
         GI+6gUAfoB8Qoh0OEV9d1w29Z0WH8GsNQex29LmkD3RefJM0kONdL2ViL0kiY1A/3IPD
         R5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXH2o44fQypbduYlyxbyqh4egtN0jkSV4g9AoL+Elp1o5MlYLlbLzh36ZEJg3MgXx4ZVo+Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwnpxEq3mMnkY7XhwgIEfVhxKDdqC9oK0fSVFgtETJTIY3rUGA3
	yRtkc1bSNzQBkS7B2qOaf0W1ROEBqiHVS2UkFUTmMfWDt87klzVC
X-Google-Smtp-Source: AGHT+IF2PPPAibzydI13yi59X74PcyvhPrQFB548ORc0y0pRt0MzmM/lGezSHvyjE3CG9Cr9BfeMyQ==
X-Received: by 2002:a05:600c:8707:b0:42c:ae4e:a990 with SMTP id 5b1f17b1804b1-430d748ca2dmr31731065e9.35.1728532617099;
        Wed, 09 Oct 2024 20:56:57 -0700 (PDT)
Received: from teknoraver-mbp.access.network ([89.101.6.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf5188dsm35659375e9.24.2024.10.09.20.56.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Oct 2024 20:56:56 -0700 (PDT)
From: Matteo Croce <technoboy85@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Matteo Croce <teknoraver@meta.com>
Subject: [PATCH bpf v2] bpf: fix argument type in bpf_loop documentation
Date: Thu, 10 Oct 2024 04:56:52 +0100
Message-ID: <20241010035652.17830-1-technoboy85@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matteo Croce <teknoraver@meta.com>

The `index` argument to bpf_loop() is threaded as an u64.
This lead in a subtle verifier denial where clang cloned the argument
in another register[1].

[1] https://github.com/systemd/systemd/pull/34650#issuecomment-2401092895

Signed-off-by: Matteo Croce <teknoraver@meta.com>
---
 include/uapi/linux/bpf.h       | 2 +-
 kernel/bpf/verifier.c          | 2 +-
 tools/include/uapi/linux/bpf.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 8ab4d8184b9d..874af0186fe8 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -5371,7 +5371,7 @@ union bpf_attr {
  *		Currently, the **flags** must be 0. Currently, nr_loops is
  *		limited to 1 << 23 (~8 million) loops.
  *
- *		long (\*callback_fn)(u32 index, void \*ctx);
+ *		long (\*callback_fn)(u64 index, void \*ctx);
  *
  *		where **index** is the current index in the loop. The index
  *		is zero-indexed.
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 7d9b38ffd220..cfc62e0776bf 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -9917,7 +9917,7 @@ static int set_loop_callback_state(struct bpf_verifier_env *env,
 {
 	/* bpf_loop(u32 nr_loops, void *callback_fn, void *callback_ctx,
 	 *	    u64 flags);
-	 * callback_fn(u32 index, void *callback_ctx);
+	 * callback_fn(u64 index, void *callback_ctx);
 	 */
 	callee->regs[BPF_REG_1].type = SCALAR_VALUE;
 	callee->regs[BPF_REG_2] = caller->regs[BPF_REG_3];
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 7610883c8191..5937c39069ba 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -5371,7 +5371,7 @@ union bpf_attr {
  *		Currently, the **flags** must be 0. Currently, nr_loops is
  *		limited to 1 << 23 (~8 million) loops.
  *
- *		long (\*callback_fn)(u32 index, void \*ctx);
+ *		long (\*callback_fn)(u64 index, void \*ctx);
  *
  *		where **index** is the current index in the loop. The index
  *		is zero-indexed.
-- 
2.46.0

