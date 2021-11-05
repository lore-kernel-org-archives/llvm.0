Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB922C80
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 16:31:41 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id k24so15931111ljg.3
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QO84fTKdeSMmm9QNKq6SjNHfztt5W0wJHSODBJ8ZtRQ=;
        b=Zj3KicFxHklL6gL6RLRmq5P3kJ493cqHFhK/GOV0mcMbwhDhOiILWvYZcT+HR6uowo
         QgzqvPSrZ8eN1+WHeuLX4/EtKpQJiVf8DnMpN2abq3qiOGfYsFNguaB046j19cFxpH+X
         WGbJ1IFtYHQD+c2w0jCgpK3ytizPY9sBRBiARXZAlHBER+xBG8dMQwNQe2Q/wUGQtwE2
         fzSk68NG0DXrWfnHcPypDoB4IP6LZyZwp5CdeFUP7Nw1Rittw/eM/qQUqHNSnqnR5SMt
         BT0Y1bJrDBJz3p4vfSzisCuZJlFsST2R5lhCY3jcYVhgRP2f++yIvMdPlsl3GDBN/No+
         EWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QO84fTKdeSMmm9QNKq6SjNHfztt5W0wJHSODBJ8ZtRQ=;
        b=wUlA0d6+DCZNDeZAbUe2KRE/ycA4qkzq/P+Bco39QjYzhZ36op0H3W9hnWHR0kh8Ud
         hRSWo8w9Zt0qJoWkdpcGfJx1WRIerE231EEi7YLKQgyFLVOumbYNNAqnXUFSU2Xd/9FG
         6LVWzIqVrjTV8LzfY37jYDQMFWi4nPU7+G+I0YPXHbemi8nFxgRTUmV6F38QAVWbFm3X
         xtUBZ3q6bP74Kr2UnT3YtvahB7pPauvn/Sx4cq4KVy8pVyDleQPLz4zjDFtH6Req70wJ
         Or1ti3DpoTncdmJxdqkD7mUiyDNrSD/uFwOETxmqwK8dCeQ5RgTDoGk7EOOiGoIL8Eh3
         QULw==
X-Gm-Message-State: AOAM532LeraHAyauFMQik8Bs+g1slQSKuFZe9/hMQoyqhGopZRM0BVeN
	f3eIIizlaUcGBNJ9p+WraAZwEQ==
X-Google-Smtp-Source: ABdhPJwRU0Hv8s5/OoopP3Oc9keJl5PGu73f4BB84MA4jNWit0XnQiLj/PheRa4C/FFO8OnGzrTzlA==
X-Received: by 2002:a2e:4952:: with SMTP id b18mr52307516ljd.255.1636129899645;
        Fri, 05 Nov 2021 09:31:39 -0700 (PDT)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id s6sm877010lfs.236.2021.11.05.09.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 09:31:39 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: shuah@kernel.org
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 1/2] selftests: timens: use 'llabs()' over 'abs()'
Date: Fri,  5 Nov 2021 17:31:36 +0100
Message-Id: <20211105163137.3324344-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building selftests/timens with clang, the compiler warn about the
function abs() see below:

timerfd.c:64:7: error: absolute value function 'abs' given an argument of type 'long long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
                if (abs(elapsed - 3600) > 60) {
                    ^
timerfd.c:64:7: note: use function 'llabs' instead
                if (abs(elapsed - 3600) > 60) {
                    ^~~
                    llabs

The note indicates what to do, Rework to use the function 'llabs()'.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/timens/timer.c   | 2 +-
 tools/testing/selftests/timens/timerfd.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timens/timer.c b/tools/testing/selftests/timens/timer.c
index 5e7f0051bd7b..5b939f59dfa4 100644
--- a/tools/testing/selftests/timens/timer.c
+++ b/tools/testing/selftests/timens/timer.c
@@ -56,7 +56,7 @@ int run_test(int clockid, struct timespec now)
 			return pr_perror("timerfd_gettime");
 
 		elapsed = new_value.it_value.tv_sec;
-		if (abs(elapsed - 3600) > 60) {
+		if (llabs(elapsed - 3600) > 60) {
 			ksft_test_result_fail("clockid: %d elapsed: %lld\n",
 					      clockid, elapsed);
 			return 1;
diff --git a/tools/testing/selftests/timens/timerfd.c b/tools/testing/selftests/timens/timerfd.c
index 9edd43d6b2c1..a4196bbd6e33 100644
--- a/tools/testing/selftests/timens/timerfd.c
+++ b/tools/testing/selftests/timens/timerfd.c
@@ -61,7 +61,7 @@ int run_test(int clockid, struct timespec now)
 			return pr_perror("timerfd_gettime(%d)", clockid);
 
 		elapsed = new_value.it_value.tv_sec;
-		if (abs(elapsed - 3600) > 60) {
+		if (llabs(elapsed - 3600) > 60) {
 			ksft_test_result_fail("clockid: %d elapsed: %lld\n",
 					      clockid, elapsed);
 			return 1;
-- 
2.33.0

