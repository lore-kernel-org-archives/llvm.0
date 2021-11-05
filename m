Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE42C80
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 16:34:09 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id d12so16307297lfv.6
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WzrUiRlOTDSyR0yIE9XOqUFOZskRKEswBH4H0O7JYfs=;
        b=r2PBYD0o/7yKVv84EqGaFVVcJIV9W1GBljo7y9hvbw5+a18HKBJwR6qJQMfh+/F3+w
         yslWA8z+hy+4/pUFfMYI0EvKEWT9S2n+abnTLYaNrqqY5oa7AjOoKXUpkRmIroPZmtVO
         iOjeb93++S5lV5Dd/e2PLnXsYFr40WK7q0hoJY26w381ckDpjYEiQodqdxUAMU6tK3mv
         EAOsxuiYQfAYEE21otp2/ll5sAesersuUKg0z4OEgqAphHu3IuoOK80p8f74ZTYx2q/B
         QS0/Nmpu48SImGqaf7D0FfyO4sA5XVOfMWJTKWnsTTtUoz0gzGtquweT6E27AA8JX7iN
         +9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WzrUiRlOTDSyR0yIE9XOqUFOZskRKEswBH4H0O7JYfs=;
        b=7+tP+M5DZ7TwObOuduL8K/5bXjxW7M3aeaqN3Z7JMocVKd82jyVhdgBQ1nzhikYcDS
         sQNMHMB6c24E2oRSiGKcGSq7mVFBwhIbpcvvFDkFn1tzfwsuhFiW0FjGO5Fn8KMRBpda
         rQNpZSxACvU1fRuimbK8kXgr0bbtKwjgwwQWxUC2WERUAWH19OOpYsD7AJCqmhUdPTx1
         kxt2MTTFYie4rAbcw5wk6/SxTiN0tAu0miISGiXHMAQgXNdz8rkirziJ/GFzto8LvS+z
         LB1cMO7h+dA2+tcmXYoeugpbZJStPJDwcovE7gb8uYDOTWyiu5HCmaxoOx4dbWxBFjfi
         A/Uw==
X-Gm-Message-State: AOAM533ucjzs3E0/FsZMm/OMBu8f9BR9Aux8+tJayZ6QYRdOkPEzIQh2
	7TtOQe7nTicfHzKR9wVyKx9yug==
X-Google-Smtp-Source: ABdhPJxRsIIRzYyKsBNMYNxRJ1ENdoWMYWMReqQjdDKf3Yx8utY6fyEAwzjPyisJ268xjPYHjvc0gQ==
X-Received: by 2002:a05:6512:3caa:: with SMTP id h42mr3684376lfv.544.1636130048161;
        Fri, 05 Nov 2021 09:34:08 -0700 (PDT)
Received: from localhost ([85.229.40.155])
        by smtp.gmail.com with ESMTPSA id bu5sm973559lfb.50.2021.11.05.09.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 09:34:07 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: shuah@kernel.org,
	tglx@linutronix.de,
	john.stultz@linaro.org
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] selftests: timers: use 'llabs()' over 'abs()'
Date: Fri,  5 Nov 2021 17:34:03 +0100
Message-Id: <20211105163403.3330950-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building selftests/timers with clang, the compiler warn about the
function abs() see below:

posix_timers.c:69:6: warning: absolute value function 'abs' given an argument of type 'long long' but has parameter of type 'int' which may cause truncation of value [-Wabsolute-value]
        if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
            ^
posix_timers.c:69:6: note: use function 'llabs' instead
        if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
            ^~~
            llabs

The note indicates what to do, Rework to use the function 'llabs()'.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/timers/posix_timers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 337424c5c987..73fb27901a1d 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -66,7 +66,7 @@ static int check_diff(struct timeval start, struct timeval end)
 	diff = end.tv_usec - start.tv_usec;
 	diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
 
-	if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
+	if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
 		printf("Diff too high: %lld..", diff);
 		return -1;
 	}
-- 
2.33.0

