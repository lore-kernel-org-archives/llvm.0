Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6762C82
	for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 18:04:21 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id l22so7974693lfg.7
        for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 10:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LhaYpGZE0UbJvh6Nn3mP+o6sCA1NJHCl7ZX/I6n4rjw=;
        b=y9IC1G868iVb+OHqDVfF2LTsG3gKZU6xHEChe8Z+2oWK8hUnasf7SIsinMOv/h5tgI
         TsXk8W4ydBqn/W6pjBnQPpcViFhJZ996Dnprf/PDBPbpFU5/YjJJp+3JW8ZqJI6fd5T6
         5XgAeELA/04uVUtsecW0lh94hmTOsBHWaFWXVnCnszBCU1+T+JKVc+TsCcpWCbPI5Gmi
         JZ8IDKypGtAMT3iwwSBJnJ2ABOHRcqG+4q5MMKjDo54it1V3gVH9UaaadQJ9ppC6CtpV
         UjnpRiPzoNH9Crh6vZGJVTf3vstfk1Id8DGccONhrw/Y26w4sJgEoj+mLGlPOgFWLeGR
         j4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LhaYpGZE0UbJvh6Nn3mP+o6sCA1NJHCl7ZX/I6n4rjw=;
        b=noCC/koYjfZJheQ+GkZY/mgJdjPCEMQbEMmDtzpmeS1R3siBtLAFRWhDGr7acMzeCj
         4B+NdtnFjPnXAciU/50iSam1LdD3ozz1jLF3FYrzDslsrQ+GEm+BbD4KnV0/9seCm9El
         GdYf83NJ/cEsZQ9n+qKC25hQKFVp6h7ILmtS84DEy6B1HRyH8J0+qv3Hf6ya/0xn2NIY
         2ttOUqOwHOeobrbaJPYcFVIssV4BB//jjJ1tJP5MX/K9QBhTynQ8qVwIzVGm8nwxMTRn
         KRIp7fCeK0fV76KlFkY6p17fznKt3DwRY3/AF/9nJiP8PcUhc2dgqx3eYVaDY1awG948
         RHGQ==
X-Gm-Message-State: AOAM533Og0C6ZkMJ+7hIQTsS+a/IXsYlVSNDQZFqYWFAR+mh7GZPHMw6
	9kMvWvNaZbrVYyuxFxZWP+x5CA==
X-Google-Smtp-Source: ABdhPJxt6kFT7aaYzV2PxgSdguip72HDGxZwRYc1vD3JI8NzgMHgfVJWRaY7qs1AECSc9RTpJWT+dg==
X-Received: by 2002:a05:6512:3b2a:: with SMTP id f42mr938801lfv.282.1636567459495;
        Wed, 10 Nov 2021 10:04:19 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id h7sm53110lfu.253.2021.11.10.10.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 10:04:19 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: shuah@kernel.org
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv2] selftests: timens: exec: use 'labs()' over 'abs()'
Date: Wed, 10 Nov 2021 19:03:59 +0100
Message-Id: <20211110180359.2338349-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <CAK8P3a3ZuL9TQbj+tGkdvRRmEv_jT3OvzmaoFKHwdw=5J1w_SA@mail.gmail.com>
References: <CAK8P3a3ZuL9TQbj+tGkdvRRmEv_jT3OvzmaoFKHwdw=5J1w_SA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building selftests/timens with clang, the compiler warn about the
function abs() see below:

exec.c:33:8: error: absolute value function 'abs' given an argument of type 'long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
                        if (abs(tst.tv_sec - now.tv_sec) > 5)
                            ^
exec.c:33:8: note: use function 'labs' instead
                        if (abs(tst.tv_sec - now.tv_sec) > 5)
                            ^~~
                            labs

Rework to store the time difference in a 'long long' and pass that to
llabs(), since the variable can be an 'int', 'long' or 'long long'
depending on the architecture and C library.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/timens/exec.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/timens/exec.c b/tools/testing/selftests/timens/exec.c
index e40dc5be2f66..04439e6ac8a2 100644
--- a/tools/testing/selftests/timens/exec.c
+++ b/tools/testing/selftests/timens/exec.c
@@ -21,6 +21,7 @@
 int main(int argc, char *argv[])
 {
 	struct timespec now, tst;
+	long long timediff;
 	int status, i;
 	pid_t pid;
 
@@ -30,7 +31,8 @@ int main(int argc, char *argv[])
 
 		for (i = 0; i < 2; i++) {
 			_gettime(CLOCK_MONOTONIC, &tst, i);
-			if (abs(tst.tv_sec - now.tv_sec) > 5)
+			timediff = tst.tv_sec - now.tv_sec;
+			if (llabs(timediff) > 5)
 				return pr_fail("%ld %ld\n", now.tv_sec, tst.tv_sec);
 		}
 		return 0;
@@ -50,7 +52,8 @@ int main(int argc, char *argv[])
 
 	for (i = 0; i < 2; i++) {
 		_gettime(CLOCK_MONOTONIC, &tst, i);
-		if (abs(tst.tv_sec - now.tv_sec) > 5)
+		timediff = tst.tv_sec - now.tv_sec;
+		if (llabs(timediff) > 5)
 			return pr_fail("%ld %ld\n",
 					now.tv_sec, tst.tv_sec);
 	}
@@ -70,7 +73,8 @@ int main(int argc, char *argv[])
 		/* Check that a child process is in the new timens. */
 		for (i = 0; i < 2; i++) {
 			_gettime(CLOCK_MONOTONIC, &tst, i);
-			if (abs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
+			timediff = tst.tv_sec - now.tv_sec - OFFSET;
+			if (llabs(timediff) > 5)
 				return pr_fail("%ld %ld\n",
 						now.tv_sec + OFFSET, tst.tv_sec);
 		}
-- 
2.33.0

