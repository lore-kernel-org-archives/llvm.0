Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325383AEF47
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362725; cv=none; b=sh9RPHj5buW2A72leGgam5vYa/y43hxx8tRuHOrKFOeLdbZe8+R3IyGi7ScvfXOmQb2weJv8H6x7PH29Wk0HEE9R9jwL4Xdlaa1Hr+xYFzPtI8wiUzidfKJWlkMuSET6NEFvtNan05W15ArSDkQgtgjFqosj0yfazMBcIQq3nQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362725; c=relaxed/simple;
	bh=LQpZuqWDhGaY8Lp7XP00kP+hrd4jA3kaR16Fcs8BB8Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mjYeCQo4JY9vBQE7YD3bUTEaZxLoQITS5uX9XOVhM5zDDSB1k5EIkHIzf4AvmZ/aOU8V+nvKCwuKgIhQPOwwurX1fzEojG/86oI3FbtPSSec4AxkyZDMBeKYScvJFA1wnmNcsBxb0NjDfq5hz+Mzx8xHg+BmALxo9J08oKKKNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SGmwXBek; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SGmwXBek"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-44d2204d393so2632590fac.0
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362723; x=1783967523; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaPUDS5X61bEGf4R9DTCwdGD0nVsXP4UZeidWRH5cHA=;
        b=SGmwXBekM5AZM3pqoSzY/X8JthXkw/cHnG/cYg2DgGtn3Ok6zdJxeZCfqapybZAEMe
         JMqLHlnzgdJ76stf3UFHF+1zLjJAzqPhpi9zsdsaO/G5JVKFkMVvSets8CY9ypSVKSDp
         8+kuQHAOIWiDSW6HwWTK09ELWRAFKsQ8d83IzAB4bDboZdUu+EGM/twy0XquJjv6RqoH
         R6OKXDh1VRMto3MSHEmlvDyj1gqe1sjZRG8uSDVbgQn6FYVVPzG+51LA+oG79IHGFc4/
         Izislleo2/+aSaKenjPY7ZoQD/FBrUNyKrUxfS51fVtBLxan5U/ya8xM0UyatmuHKZMY
         s1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362723; x=1783967523;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaPUDS5X61bEGf4R9DTCwdGD0nVsXP4UZeidWRH5cHA=;
        b=PnuZbkkVEwJKuzZwk2YuB4LSCJ7sgmOpfmVW9OYW5QBmqx11PwvWWMszIP7CKs+iBm
         yuYo4/FOAzMcjZ04xqNxv0Fa85Z/Cl6v9EkhJSMCBYyGKWZojjUldvv9fugsTXLchGVl
         gS/jsHG1rxgrQvfQb/wCrj2EpCo2D3SL2NL36n6NrIATbVY2VDPdDGOfTb1TJ3pSXU4K
         6qQpkxA0rs41Mdct4lH+r3PBaidmIGy/VM5dL+6SLRAytn/VR0p4sNux28I32MUj77nX
         glucRZ1TmKojlEpEOIx4OsJhutcsD0KCRJ0FuEkXstx/36PcNsJ/zvTaVw7LnZxAjUdz
         zVzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OIqbiCusqHjDWh0JXUUV+Ob7o+bCbtj4gaGpsrp23BNiEKmDFVw/oAmAKLqvTYW4TUSdw@lists.linux.dev
X-Gm-Message-State: AOJu0YwGLw6gb/OEE47ANLFJPG1MKIGyaLnSGT1sCX2QCfeC48djg39v
	Tx3bXhIZl+y9BvJ/kIJpql6m8J9ZLf/sckNyCx/vmvE+RurRiTyw9mjs393m0fbvGobjRViQme4
	jBO/iOVvl0lBa0w==
X-Received: from oacg2.prod.google.com ([2002:a05:6870:d202:b0:448:c6c8:879e])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4b02:b0:6a1:50eb:d519 with SMTP id 006d021491bc7-6a3556d62a2mr1000185eaf.58.1783362722788;
 Mon, 06 Jul 2026 11:32:02 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:31:54 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706183154.2660394-1-dmatlack@google.com>
Subject: [PATCH v3] selftests: harness: Mark test fixture objects __maybe_unused
From: David Matlack <dmatlack@google.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Andy Lutomirski <luto@amacapital.net>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Will Drewry <wad@chromium.org>, David Matlack <dmatlack@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"

Mark _##fixture_name##_##test_name##_object __maybe_unused since it may
not ever be read. This pointer is only read in XFAIL_ADD(), which tests
are not required to use.

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
Reviewed-by: Alex Williamson <alex@shazbot.org>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
v3:
 - Pick up Kuniyuki's Reviewed-by tag.
 - Pick up Alex's Reviewed-by tag from v1.
 - Fix commit description accuracy (Kuniyuki)

v2: https://lore.kernel.org/linux-kselftest/20260706175228.2468730-1-dmatlack@google.com/

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

