Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71417A586
	for <llvm@lists.linux.dev>; Sat, 30 May 2026 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780103595; cv=none; b=bmVDpqc8fvewDBYAnSdcE5nl43ekXsmNKjh9eMuRLiaQ1XwpPh3+HRSRysTfJi8tLB8wX1J15I6RO5+gvFNazlpwU7ZTy6L8R1MTWN0A4vgiiBucAukF7GZDheqyco8yW3wIx4wjBNI8tFCuj74XrzeKnUMyabqTVHK4DD8nCoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780103595; c=relaxed/simple;
	bh=3UnX09p/RsUwab1+mBzMfqmj167P9iLQdXjXopkWBnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvKOx7rb961VUHkJ9Xf6HDe/JeY+VpeBG/2kr3FRKY8XOWXG80ithFjgRbPkKiSjzXjpCcw23LhzrwnkUqO4K0UQGIkr9zpGd8Ayj+6TOycyJ4V5y6YxhCZU6dGha9voiDRfhGLiK3+Oc/y4ktxvuew+Se2U3PGKFFeEGpon3Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvJzwqJh; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvJzwqJh"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-835c98b659eso11376788b3a.0
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 18:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780103594; x=1780708394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwoi+zIOmB8T48lEoYYS1b4s148mrV/1IF4tO/5dMRA=;
        b=EvJzwqJhskRlr8AMlx8MJJp19xpQzVB7FkEk0zPQU8D5Wg4W5shJ400YqmJ/1EdCNr
         88h+sFWT10CN3qkkw05ZmdJg8ptiL8mZVmfKDRuo1fBBJ+MMOHmgE4c6DRuFl2Le+UaH
         H2IKq2/f7+e4TAVGAOslu0F0bwHTJ049fnO8K3KWP+N3bfT8CnL5QlsrYenvpYbiTHLJ
         Zl3Rlu7sXL/oyj0F5i8XE3D/pFegtCE9h+jq9fNJFkXWH6TnS1seZFCHlx3hIMMdTnLr
         KuHh4WcSANdUWPXD7Y6pF9Es/qlWB1GdooNVxu9BJYgMp7ltheI4iS1eQao7EhhRpiXE
         h16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780103594; x=1780708394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwoi+zIOmB8T48lEoYYS1b4s148mrV/1IF4tO/5dMRA=;
        b=bd4rHWpcwJxdTe/9aQIcaNJOqL0bENFKPUDWaqnGmnW4x6bquk+e/D2m1GOZ7XIdJ7
         EVj/JG+i6UMrajlqV7K5sXFTzs09GI3q2aN5+VdMS2IS6gXc7C7knj1mo0y1FxvIlnai
         9BIlVdbiv3z9WVAZSvowE5edGDtz7Z4pRFnwngKlAEgq1SKF2E+uazQ9EQxddKUss0IV
         uTmQ9I1evJf04bGAUyjHlsDUzr6thGrt1HZEHnmA8O695kAmuZAQHYKY8EGzSspHH6id
         4x9+3whAZ0ZThd6WVPy5t/WjHnYsaHlloUTkrPcSp3v+BZC0ObgbXfR4W+Y/oWgfqZWH
         ZYRA==
X-Forwarded-Encrypted: i=1; AFNElJ/k6rvLEGKUmccUe17p03/zGRdyhRXbq7b474I2T3NlBVxUfdI4QKR5jCuURcG4uAJrS0St@lists.linux.dev
X-Gm-Message-State: AOJu0YzQa6K6DicSGtQjzuXB5gGuImB3X8hjBkktAP3vbeiASwbs+U8A
	jFFH9I6bgviTW1qTCTiGHn2pJjR1WR7INkq6fadF8HEkN0/MwbsSoVMh
X-Gm-Gg: Acq92OEt5h+2dlppCSuweX8Q8DEEnDIzLLKZDuEZiEwIXUOoojtS8r9n4GgEbkhcvOD
	M6khiAgOd0fg/xvFxFqGAWOfEjL8OFV/nGUYJNdCzDTnk583mvONvSITMwtY5bN9LNocljM8udS
	JlfnKoZN4dyMyKQnjn1UBUqf7qP6nl1Ah0wuxWfbT98lMWZYWUNwEYbsa+Ny5hvuKUQDRxT6M4g
	0bu0FqHbJpK2QR0+dNMt10230SwQqVBohc4po1Jrn7fBYxd8gWVrsDw3X+nFwIFztI7BL3XnSxe
	XUY6i9n0rqrdxGyiToUaTyhGxsOlTlDifWDTZtLK7W9D7CiicxVpJqLl0OMEXKwSlcyHXLv3MP+
	lHgtpd/lOxwIlO5JSjEm3ZQ9ijRTZZW8xf/L2xX8apm6Dq0B15bzCfzZ2yZioe0VIW/oIW+STUW
	iud+G/jlm058yrqcDXdeFNzXvHH82HtMqFpnKPFMNQbVQ5aqsXfBwzW3qCqr+LmZDsCmmYNYbni
	fe66kSFIdH65x2AmeOmwOO6LyDYvpc68bipyPo0Gn7Fjg==
X-Received: by 2002:a05:6a00:9099:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-8422578d9cbmr1736790b3a.18.1780103594025;
        Fri, 29 May 2026 18:13:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cba602sm3230843b3a.40.2026.05.29.18.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 18:13:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-block@vger.kernel.org
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@linux.dev>,
	Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	ceph-devel@vger.kernel.org (open list:RADOS BLOCK DEVICE (RBD)),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rbd: check snap_count against RBD_MAX_SNAP_COUNT
Date: Fri, 29 May 2026 18:12:55 -0700
Message-ID: <20260530011255.52916-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snap_count is u32 but the comparison is against a SIZE_MAX-derived value
(~2^61 on 64-bit), which clang flags as always false with
-Wtautological-constant-out-of-range-compare.

The proper check here should be that snap_count does not go over
RBD_MAX_SNAP_COUNT.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/block/rbd.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 94709466ad19..25215c209484 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -6075,12 +6075,9 @@ static int rbd_dev_v2_snap_context(struct rbd_device *rbd_dev,
 
 	/*
 	 * Make sure the reported number of snapshot ids wouldn't go
-	 * beyond the end of our buffer.  But before checking that,
-	 * make sure the computed size of the snapshot context we
-	 * allocate is representable in a size_t.
+	 * beyond the end of our buffer.
 	 */
-	if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
-				 / sizeof (u64)) {
+	if (snap_count > RBD_MAX_SNAP_COUNT) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.54.0

