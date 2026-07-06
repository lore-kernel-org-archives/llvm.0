Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57FA4189AD
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360362; cv=none; b=r0UduR9Lz+UlP9GI7aPPs2wno6GwEpgeOdLm+Ohk9b2enemdg/2cgSbOiIXuVauEYEAtFnUoryRqEosdNkjvg2aO53GVFHHBJ9zGHxtyUGGAEz2VlEl3+LwYSqKOly/gk4GIwfYohqvmBHGePcFTjlluJRl+eN5qyVuBY2QbNao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360362; c=relaxed/simple;
	bh=GnkKxSJ7Xk2y+xY1zEhFtkt9ZoxLrW9bqQv35sZxlOk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=J+3XSOPq93dSVKTOk+VQl+G3grD5ZfOarTjpEKXATKoSdJZVH6maYBPPyjfloT4Lpwi8ILwFBhrpFrbXVcGsjNht89YgRL+Rr4lpOvDZECVwZt1Zt8VhI2yz+6ooCMXrKaaEzBbHMhXdQsY3ks6+v6obDQB0Kl/uoz1oGmvH7p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BvZu4PIN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BvZu4PIN"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2cc8bde6318so26482585ad.3
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360359; x=1783965159; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A6A8xAuC1RftYdiH1Z5a7OhOer4aDxqV+KFlphF++dQ=;
        b=BvZu4PINNyWlFxU7lVlTuANlhs92AvMelyMGaukdVTRX3hzBhRUKySJ1mvdY50VJwP
         YqbO4/eu3yUYefbStq0+t7TUBUacf6ilEw5iLksUbYtNPibO1Q69ioi7/oFBb/zVash2
         4AKLjmEVzVxHeEuKCs5DCsRBviTbpe4aqMOUhM5pXoPD+ts8ELgRq4azAJoAH94KYYyr
         NBXvq39dIvb6oJUe09vI33Z75NoKUDFebQxRNFSkM4lVhBkv6uRmb0g0VwVTYbOnQKS6
         kXGohd7XY+PCG9DhYE1I4UMM8+YKJISpP3+DRjPS3g+CNc1IGjLKk+lDKU4Vji9BuX/g
         8oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360359; x=1783965159;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6A8xAuC1RftYdiH1Z5a7OhOer4aDxqV+KFlphF++dQ=;
        b=TqqXo4iLuMz6k4Gu45eQiq6ksOu5ngA2n7O7dkNn6+sRDuZxDIOEX+X1+kNvlSsB9M
         V2njB8OUZLCLVxYP0yPbYmm7NwvxeIF6qKw7dQVgz1f8OBwX/qUbbA/XjIyWCClBeB3a
         kLINXnSgzNxL+7rzoaw4oe1NceXN1KyClyQU0wj4X75MJb3ISAJGzooMPmaUfIpdO8Zw
         j2xP8Ac6y7ZXczQqKwu4lseZITNSfWMqJkmINBnifh1U6FYAaIIHoewcysMFqvOTAEzL
         IjQFaMBJwFRpz8u9Uyy6W3QiuYHSogkx2S7EQOflr+glbaHk/XWMuiaursujkmYrYs9E
         t+9Q==
X-Forwarded-Encrypted: i=1; AHgh+RouxZpRkYvERXyfbEfYSzdbXyGHLqr8kQUPTupl+ig0Gw0tZ9P3GdoJjsZBIM5BHLaAAOGn@lists.linux.dev
X-Gm-Message-State: AOJu0YwnDGSPa0b1/5drn/ndiIViN+9k76+bjzqS19KHJEPRmyr6OL0W
	Ibnp3dKqupyp3MWpdnLK0vFKl/awh+dy15WhpKEOC5ym+k7L0oCVOKywigi5DaCwVlIZNmMkEA+
	7NdLYPQ+YU0zcBw==
X-Received: from plgs8.prod.google.com ([2002:a17:902:ea08:b0:2cc:9345:c60a])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f745:b0:2ca:d874:c6cf with SMTP id d9443c01a7336-2ccbe40bcbfmr16844165ad.4.1783360358471;
 Mon, 06 Jul 2026 10:52:38 -0700 (PDT)
Date: Mon,  6 Jul 2026 17:52:28 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175228.2468730-1-dmatlack@google.com>
Subject: [PATCH v2] selftests: harness: Mark test fixture objects __maybe_unused
From: David Matlack <dmatlack@google.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Andy Lutomirski <luto@amacapital.net>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Will Drewry <wad@chromium.org>, David Matlack <dmatlack@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Mark global test fixture object pointers __maybe_unused since they may
not ever be read (e.g. if fixture variants are used instead).

clang made a change to -Wunused-but-set-variable (split out into its own
subwarning, -Wunused-but-set-global) that causes this warning to be
emitted for various selftests and can be upgraded to an error in
selftest that set -Werror.

VFIO selftests have been broken since commit ff556bd98348 ("vfio:
selftests: Add -Wall and -Werror to the Makefile"), and the net
selftests builds have been noisy due to -Wall.

Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked processes")
Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
Reported-by: Aaron Lewis <aaronlewis@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
v2:
 - Update commit message about the change to clang (Nathan)
 - Correct the Fixes: tag (Nathan)

v1: https://lore.kernel.org/linux-kselftest/20260630213341.1664345-1-dmatlack@google.com/

Note: The fixes tag is commit 24cf65a62266 ("selftests/harness: Share
_metadata between forked processes"), which refactored TEST_F to share
test metadata across processes using mmap and convereted the test
fixture object from a static struct to a static pointer. Prior to commit
24cf65a62266 the static struct was always used once (the address of it
was taken and passed to __register_test()), but after the static pointer
was always assigned but potentially never read.

Cc: Nathan Chancellor <nathan@kernel.org>

 tools/testing/selftests/kselftest_harness.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 261e4df94d9d..29a19bc87084 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 				!__atomic_test_and_set(_metadata->no_teardown, __ATOMIC_RELAXED)) \
 			fixture_name##_teardown(_metadata, self, variant); \
 	} \
-	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
+	static struct __test_metadata *_##fixture_name##_##test_name##_object __maybe_unused; \
 	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
 			_register_##fixture_name##_##test_name(void) \
 	{ \

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0.rc2.803.g1fd1e6609c-goog

