Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFEE38D3FD
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076358; cv=none; b=gh9OiWvc8cqfN3Zc8PrejMBNx+D6zS9m73fp8ZiDycR8adaYyouiphAkiJtnjmu9ClZIlbcIRG9QOTYdzta03S4QNS1ONBOdEjVcHRy6OrTqQJjKMaKhVce+avE7d0Ih4tNg2bmZVg1AfC8c2APMWD1afflWIlTNn41Ms2fG4As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076358; c=relaxed/simple;
	bh=VZ7i9g/d+H47coYO3Xc9M1wiqaAKR5dvjmJyK4FiQPk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=Mc4fseOFrFJqosE4V0wOdHdfFfSILrm0ZKl2LjyluADaDonAeCXKNrh2GapXeq7OvmAdF0JGiRDx7Q0VIZgdg11yM/QvqvwA+Hz99TNkqiqVf8yzAxvIAy4OV70IGocJMu/QUotxFivaRQN4/2XExyBhGly/SNcYzCYTFjAKOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4f2Wxdi; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4f2Wxdi"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so299322a91.1
        for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 14:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789076355; x=1789681155; darn=lists.linux.dev;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6fbf9eOsE32d1ZOxCGBZBdmKD77pEwD9k19mpGO+TR8=;
        b=U4f2WxdiW3oa5EWalSYa4AWn/+g15Wy7aTP6cMr38c8wsH/YxAtyYnUk74/OFSr3sg
         Z163TUqJmdDG9AR6v8B4WzmkD/b+AkosXXfiAInxyjhGxqBbIaRpb0i/wU3AU7ExMsYJ
         ZXRgXfRhLdg+x6mfN6wKYTiaWtKK0WaV3CDCEBcTs0jQU59fcA+SxFnJU0FK8vL/77Pa
         iQ/LiDyiM7/Pu8AdlGf2rCpjOyFXG1tLgscRS5gpXwJSE79lP2e9mqPc9cp+39z8GrI9
         d7DaGjiK5p4fm7xYUaZfloM+Gf/BwuRf6Bc+spqGkgTbz/1vNGrymdhAJCtxxx7H6GK8
         0CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076355; x=1789681155;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fbf9eOsE32d1ZOxCGBZBdmKD77pEwD9k19mpGO+TR8=;
        b=G9rILn8Y9fAqYq85FYPw+mSEOGq2whcaG7LK5EzvhjCUd6ku513SMUOgmwTLXYSS53
         6BS9C5VU9CRWikTCUmGGBcR2aYRJiLcNbsO09YAz7YF9B7XRL3TV0af5r50+fFJmNhu4
         jgLs45YAV6IwJikTnHUrkq0my3lhQhDEMEP7NpQj+qyjpVL5dms4lFEiWiX8OOtdZPNC
         QOtQQzxerbDZE/oGp2RRY1yvbzmn22768h5nqqvOVgYOj7h5dcTKL4i/ASdYok828wDQ
         YmfEE4ek5o16SlAJZjW7V7Uqc6PJecY0drY21pJWWVRgLlOJ6oEyI9NYEo5F8cuTgcXh
         yIng==
X-Forwarded-Encrypted: i=1; AKwUvBzqFz9SEeYLvcnN57WdhoIj0cC0d/tGlQH6L8hygwc6eUevsmrzrHIQ3gg061jTLojorUXA@lists.linux.dev
X-Gm-Message-State: AFuF++n+EZxGg98TweMQ5KO/Vp78Qdl9Zv/KB9wDR5bkJe/53fuw19tI
	lqbZkUhIahMP3WkLeuashZyiJhMIOBLeacxx4JXA+mbYcb6plDjwbPhxWGcdhB1sUjYVfRi9CNI
	Hh3NMFysavQ==
X-Received: from dlbbq8.prod.google.com ([2002:a05:7022:6708:b0:143:65eb:f1ec])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8b:b0:398:9c00:29ee
 with SMTP id 98e67ed59e1d1-39d9c38fa48mr1037351a91.22.1789076355117; Thu, 10
 Sep 2026 14:39:15 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:39:07 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910213907.3206529-1-irogers@google.com>
Subject: [PATCH v1] tools build: Fix timerfd feature detection with clang
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Clang's uninitialized-const-pointer warning causes a feature test to
fail when building perf with clang. This disables support for 'perf
kvm stat live'. Add default initialization to new_value as a
workaround.

  test-timerfd.c:15:30: error: variable 'new_value' is uninitialized when passed
			       as a const pointer argument here
			       [-Werror,-Wuninitialized-const-pointer]
     15 |         if (timerfd_settime(fd, 0, &new_value, NULL) != 0)
        |                                     ^~~~~~~~~
  1 error generated.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/feature/test-timerfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/build/feature/test-timerfd.c b/tools/build/feature/test-timerfd.c
index 9c72c697a9df..f88e8cc63ef3 100644
--- a/tools/build/feature/test-timerfd.c
+++ b/tools/build/feature/test-timerfd.c
@@ -6,7 +6,7 @@
 
 int main(void)
 {
-	struct itimerspec new_value;
+	struct itimerspec new_value = {};
 
 	int fd = timerfd_create(CLOCK_MONOTONIC, TFD_NONBLOCK);
 	if (fd < 0)
-- 
2.55.0.1007.g17ff1f9808-goog

