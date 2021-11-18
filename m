Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBFC2C81
	for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 09:58:58 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b40so23275799lfv.10
        for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 01:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+O/tRzRt0aTbXVnB+DdljjU6ah6dRQd6+vFzdM3Bi4=;
        b=unyu7OwgDMXJdmdaeFF8QYwhR4gXJQ4N9ifkN9rUrT9S9jlc64bD+g5bvhgJ/idc21
         mrXZTe7EAiwbDeh/ltOoWgTM+SWE8Pbi8bbX2PHF5bJSYsNE5daib5GWhY3VaelQyVCg
         qJ/+KQiQoGRJi1t3xJBhlp/ph+tuIa31a5ks4NXYUeSuMFUIxAtkT3gdjYFe0wpJb5MM
         FIJr3A/Gndm3YgULcXmA2q3Cl9zLeHu/CYqjtM1LAQHo9q95lWADqlBjVA3tUnD4541W
         XhLdjctdhxHLYCqbPlQT0wjpG1axTvu3lodzOi22YtfdgKQAHVUhVyIXkPbf/XcpQp8U
         5yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+O/tRzRt0aTbXVnB+DdljjU6ah6dRQd6+vFzdM3Bi4=;
        b=T2DjvohU8txvvgbWwPy8NlMVG64xeRhtYztdDS80bssTY/Eib6e0DrHCuvxA8Y4B/O
         6YDcZAZMgzpZboOxkQHSvT8a1L3tlk8iL8aeD66+/8+Ib01OOcc/VwB/o6MIJfVwqROL
         BxuH9LTkcsqTNjOazIIFPx5Ii4Ldl5amQYKPVJ5oHcyAEn4DFuZ7HKfXT/6IHlf7//7Z
         cwt/rEUKHMFcgL+45BC32deEF4erqEe0KC2kXT6YtLmt1GyBym2kJ/gFEcvcqouf3Tuw
         VezX9xCvTBHVxSE0j1wwVXiUs2XW+EUxOg6mQKZbRHvTgzKdbUkXac0oxLG/wxDTx8MD
         R0JA==
X-Gm-Message-State: AOAM532yX7F+11KINmb4DFRJ3FkPsOHgxU4/BuEizWjp+UOMa5cwiien
	EpLYErqFXSuTPRBwCKPbys+05A==
X-Google-Smtp-Source: ABdhPJyi+0spX3wn1r8IFaINux9dkP2tBGxxKfV7B+JfDeMQFSuA+QsMIZDKPY/sicQmrojvlflXxg==
X-Received: by 2002:a05:6512:1189:: with SMTP id g9mr22693442lfr.396.1637229537123;
        Thu, 18 Nov 2021 01:58:57 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id y28sm254570lfa.92.2021.11.18.01.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 01:58:56 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: shuah@kernel.org
Cc: fenghua.yu@intel.com,
	reinette.chatre@intel.com,
	john.stultz@linaro.org,
	tglx@linutronix.de,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	christian@brauner.io,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v3 2/2] selftests: clone3: simplify return logic in clone3_set_tid()
Date: Thu, 18 Nov 2021 10:58:52 +0100
Message-Id: <20211118095852.616256-2-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118095852.616256-1-anders.roxell@linaro.org>
References: <CADYN=9+_UU9qZX56uahGXxz00iayqJLRAaQrRXh1CMXTvwSbAg@mail.gmail.com>
 <20211118095852.616256-1-anders.roxell@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ksft_exit_* and exit instead of using goto.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/clone3/clone3_set_tid.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_set_tid.c b/tools/testing/selftests/clone3/clone3_set_tid.c
index a755fcd3af89..1b950c3c3b7c 100644
--- a/tools/testing/selftests/clone3/clone3_set_tid.c
+++ b/tools/testing/selftests/clone3/clone3_set_tid.c
@@ -250,7 +250,8 @@ int main(int argc, char *argv[])
 		 * that all those tests are skipped as non-root.
 		 */
 		ksft_cnt.ksft_xskip += ksft_plan - ksft_test_num();
-		goto out;
+		ksft_exit_skip(
+			"Please run the remaining tests as root - Exiting.\n");
 	}
 
 	/* Find the current active PID */
@@ -371,9 +372,7 @@ int main(int argc, char *argv[])
 	close(pipe_2[1]);
 
 	if (waitpid(ns_pid, &status, 0) < 0) {
-		ksft_print_msg("Child returned %s\n", strerror(errno));
-		ret = -errno;
-		goto out;
+		ksft_exit_fail_msg("Child returned %s\n", strerror(errno));
 	}
 
 	if (!WIFEXITED(status))
@@ -390,10 +389,6 @@ int main(int argc, char *argv[])
 		ksft_test_result_fail(
 			"PIDs in all namespaces not as expected (%d,%d,%d)\n",
 			ns3, ns2, ns1);
-out:
-	ret = 0;
 
-	if (ret)
-		ksft_exit_fail();
 	ksft_exit_pass();
 }
-- 
2.33.0

