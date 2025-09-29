Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF052FDC55
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146899; cv=none; b=Px+suhY/CeUa1Cl1QRdVfdcX+kVk5+CTgIshFr+PCkbGXkOMrKz/bJI9HQXANwFR+DB3ILnCStNnQmYWntNywsBYcWrMQw3MH3z+voQlljHwdv4lnjCQuV0Yb6YVmOLeUsgXqkMXuLNf+knHJDgwIQY8pr36nBhQYPu7h6Ubq+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146899; c=relaxed/simple;
	bh=vkwL+PGNZASsXf9M09tTQFZ5+KuEzqyB7R4nlUavslI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SO00mF4iI0fqD2FeXQ4VxJ9Yz4OM7SAguBQrABieYi6rYFILMzG8TIXG+0/8F511EGuX/faetZMdL0baSi+0wwmJNObVOtc02mQkeW8J37F/15xcZmBeWXJfR2aNrsxCIGlakQllA3HngBZkZDgnztScAQxKUDbIrJzCIa3qFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAFxTeKI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAFxTeKI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3322e63602eso5556943a91.0
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 04:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146897; x=1759751697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nxMwSBQwOydmRinFjGwKZjIbNHBnsDSojBIvT19KMQ=;
        b=RAFxTeKI5OGnV+sfeubsR/ssgFN8GhhfViGof14Iszf4FJHG63dCCkh1fpTo/OBQrw
         kAtXm4+Sh3Ecj+vCCn7mklMNdtouNH/usI7fFBufNGUng6Yw5attiIWqbUZPLMIqm3hw
         wdi0PjMjcpI34kWm2ZqVW8des4V7pooJssBSpXYKigkuofv2cM530/kb9bUyIJwpQzbl
         WnqpjEUYMRHU2YLepcJJ57T+TIi3YS4BannK7regpKcHYBdFAwIOo+PG0hGPyLn+lfJl
         zjF4jLMUFLHAKFvlRS6f1IY160N6eMvzJYeM3BkUHDsWMehoyEAnCp8FkDXFoFD1xj/E
         BD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146897; x=1759751697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nxMwSBQwOydmRinFjGwKZjIbNHBnsDSojBIvT19KMQ=;
        b=vA15INw89K7D2k8EiF5SNGWkEvim3xhPf1hQ2wEOVrI2n1RW+ZJPWP0dqlLYE8PiVA
         BqeIu1pWduuGhPQ8NBRO3KAOVySChb1YWQU8iyyPnhXPwMLnTfHgUi5DseqYHktj3oN4
         UXr4hzLXLbG3jOO+JgZmn6nr9x34BfHU8c2i6tyRaSvnz61HXfs2fsE8s0ufHdKUCkNb
         0vXIvX/d4KhRIE7mQZxrs2U2ovOE7GZgyftNQhfNsx2xOsneo/IAlI93R9OBsEjv21HV
         GIXXwLQWndyqJ5iovsuQ31ogGng7t1/M/YCs+IMGVxZ0Gsoh8ulfKcSs+IyDk1P8GSeo
         FQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUawX2a0CcHp10CwhSdpQeRixoMSG1eDYMlCEg8t7AnnlzSdngVusUo8MHfHuBA4saR9C5m@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr4bje+d5KCIQnv/E3Qdkh/krDjFfMgqzAJijcSB+nrqgk1Ufh
	oxlYYyKjadO1XzoSn1gLChVe/uH7XazHDufK/Lwy6uNspnTPBSIMlnWq
X-Gm-Gg: ASbGncsgVMmJVmDK0lK2lFoHbE6WDLLKoO6nPNpL9XAVP63fmyyd5bV0qeLGZlUoKX3
	H9R3MBi7GzSXS1cv6dWFHrCawku+S9f9paFZsfTSqStwjcyx8P7jHCmIox/7hcC1sdKaf7w9Mxk
	dg4DmhysYJkHekac8WQcg1wLkB1e6l2C7DAB8yUhFwpZSORKxcwxY9ikQa2GlnqiJvx0Ivr+OjT
	epJGef2acvwGSnsa4q/Z8MrwS5ni5vV2NAlWYIkA00y5rZz3tr0RsZ8hoUyUkV4e3Wm2vRtK++l
	xTbOFGfzPRna8iFTVaUV3Kp/5nfuACooA9lJyji8pkd+L2SewOLhImZ3DVcVGzFC5U8xiL8EJAn
	wmTSVUGfAWFJ6uezlpBAFIuC5RtWG
X-Google-Smtp-Source: AGHT+IGZZNUqAN5enffrxbMWSeJ5zzoNuwdSyjXDEWzGn3w9G1pwp20etolI1Qt0978OXhgQfd+jHA==
X-Received: by 2002:a17:90b:33c7:b0:32e:753d:76da with SMTP id 98e67ed59e1d1-3342a2abad6mr17486517a91.20.1759146896814;
        Mon, 29 Sep 2025 04:54:56 -0700 (PDT)
Received: from y740.local ([2401:4900:1f30:25ff:36cb:10ee:ba03:839f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be384c5sm16983570a91.26.2025.09.29.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:54:56 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: nphamcs@gmail.com,
	hannes@cmpxchg.org,
	nathan@kernel.org,
	shuah@kernel.org,
	morbo@google.com,
	justinstitt@google.com,
	nick.desaulniers+lkml@gmail.com
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	david.hunter.linux@gmail.com,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [PATCH v1] selftests: cachestat: Fix warning on declaration under label
Date: Mon, 29 Sep 2025 17:24:06 +0530
Message-ID: <20250929115405.25695-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix warning caused from declaration under a case label. The proper way
is to declare variable at the beginning of the function. The warning
came from running clang using LLVM=1; and is as follows:
--
-test_cachestat.c:260:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
  260 |                 char *map = mmap(NULL, filesize, PROT_READ | PROT_WRITE,
      |

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---

diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
index c952640f163b..0305e736f2b8 100644
--- a/tools/testing/selftests/cachestat/test_cachestat.c
+++ b/tools/testing/selftests/cachestat/test_cachestat.c
@@ -226,7 +226,7 @@ bool run_cachestat_test(enum file_type type)
 	int syscall_ret;
 	size_t compute_len = PS * 512;
 	struct cachestat_range cs_range = { PS, compute_len };
-	char *filename = "tmpshmcstat";
+	char *filename = "tmpshmcstat", *map;
 	struct cachestat cs;
 	bool ret = true;
 	int fd;
@@ -257,7 +257,7 @@ bool run_cachestat_test(enum file_type type)
 		}
 		break;
 	case FILE_MMAP:
-		char *map = mmap(NULL, filesize, PROT_READ | PROT_WRITE,
+		map = mmap(NULL, filesize, PROT_READ | PROT_WRITE,
 				 MAP_SHARED, fd, 0);
 
 		if (map == MAP_FAILED) {
-- 
2.47.3

