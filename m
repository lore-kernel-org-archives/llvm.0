Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958E147A6A
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 23:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712877599; cv=none; b=kim7C5S26/NgO2kCmt5CG06A/xLTHA1Bn+oP2Xaf8mGDZ955KLvGVL/VzeDaiZAAo0oKm9ycrdFa4qLep2QxR0QyimokYAvLzNPf0kK4H7CyH2MUioweE5j3UAtXshax2YqQnzGrtQMEee/1MWwDvMyRpkjfuErx4bo1pz251os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712877599; c=relaxed/simple;
	bh=ls0xJJ270NTOYnvfFdGUV1ok/VYXdsyzhUfyHVXx5Rs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mY+mFIWPWPEqCo8M5YvWoWM9aRIfRBcFIOai8/7L7iX8MWDTekN6K56S6c6sTfbxpn8ZKbygxgyl0FTkU8YGZBiKz99c8jSVM2em++d+GGYziBPwMhQ/8pnfEKnxzGpdgUFbBeGnJ+6akuj1SOLvItUr9dBawCJvVOivK0TQQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2VymVw5v; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2VymVw5v"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6ea80a33cf6so383340b3a.1
        for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 16:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712877598; x=1713482398; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5zpMelPR/Q05P4yZbANW3smZq3nLKCEwEnHHYOEX7BY=;
        b=2VymVw5v4MmsVrqQvvS5+dBtCdRrBjBOcDwkv+Ht9jBinXIurPPXk+AWIvO8fx6Duh
         zFeXM0M3PRq4Z/7vLbkxtyMLSe7k0b4n9xJ/Kz3LRVVyBJYcOHLiXXwZCJILtazJhZkp
         Q1xRbQtaVj8oBXywk9lpmP9gZcLklrwerFsbP5jg0djwOzNn3L+/P18mSOz10ggqtOav
         6e+uV1sFm3pB0G4C6DsIXfzBHZAsHiBWdzxc2Kxo3u8KQi2nedhUk1KFrleYd6E+0BFR
         4WX04v0bSGNaAYpQIPUdgAdQOqzMZ0l5vWLtvAWBU3+AlTc/+WD+wkhMlrJkIRdQSd9j
         DHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712877598; x=1713482398;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zpMelPR/Q05P4yZbANW3smZq3nLKCEwEnHHYOEX7BY=;
        b=YyAfkgXZBJlUqi+km1Hf8R55yHQJe/wXqZb1TTCSCUf7pEWnkYsm9wVuN1wy1v3mDG
         /s/F0NlwjBTdvS+pPRUD6ZVzWzSQmyIG+Uer50inMZi2X+PNV+7qwhLPTHiuJDAMYeTT
         E0kK/BP+gBwgXIdvGa0jdhCME3qyI540AO5l7bmUvLxi2IN6jjy01kbK6LCcHsWf9MKv
         uUcai5MF5fje8L32hsQwAfzy/VQ/d3es+txFauAwvLJbc8IJ4rtmD7a1GwAwb0SArlp5
         qjL4thfZxrKUEfdvUsP+BPW4FxQa9CVf8I/JsIGoWOabkb+no1W+KiFxHYLKVLG4fqaG
         toWg==
X-Forwarded-Encrypted: i=1; AJvYcCXts/QZ3k0uTt58So9cDv6m1BsYkoowPrNTi+xdvtF86e3kZAhD3Hf62yzc0ydbZVT+dkHFwshz9PAuJRUCqA36rkULtg==
X-Gm-Message-State: AOJu0YwayPcgkaam6+phk4foNH/8fgB3XypdmnXsKWa74X5umjnpB0AT
	pNKDUq8cq2/oUCsbZY2A0bCiCanVIt0BLJf/gjpCpx6Nf9G+27TWI70Lykg/uEq+x5UD3UetYGb
	doA==
X-Google-Smtp-Source: AGHT+IFLfDrP1amVJB3d3HaxnBLnZmZqMjR5reHrOoeYxEPUItc4VJwMrhhWU2YhVGvypmJmcL1x4zlOcQA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:a16:b0:6ea:8a0d:185f with SMTP id
 p22-20020a056a000a1600b006ea8a0d185fmr70673pfh.2.1712877597805; Thu, 11 Apr
 2024 16:19:57 -0700 (PDT)
Date: Thu, 11 Apr 2024 23:19:49 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240411231954.62156-1-edliaw@google.com>
Subject: [PATCH] selftests/harness: remove use of LINE_MAX
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Android was seeing a compliation error because its C library does not
define LINE_MAX.  This replaces the use of LINE_MAX / snprintf with
asprintf, which will change the behavior to not truncate the test name
if it is over 2048 chars long.

See also:
https://github.com/llvm/llvm-project/issues/88119

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/kselftest_harness.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 4fd735e48ee7..70fedd2411ed 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1156,7 +1156,7 @@ void __run_test(struct __fixture_metadata *f,
 		struct __test_metadata *t)
 {
 	struct __test_xfail *xfail;
-	char test_name[LINE_MAX];
+	char *test_name;
 	const char *diagnostic;
 
 	/* reset test struct */
@@ -1164,8 +1164,8 @@ void __run_test(struct __fixture_metadata *f,
 	t->trigger = 0;
 	memset(t->results->reason, 0, sizeof(t->results->reason));
 
-	snprintf(test_name, sizeof(test_name), "%s%s%s.%s",
-		 f->name, variant->name[0] ? "." : "", variant->name, t->name);
+	asprintf(&test_name, "%s%s%s.%s", f->name,
+	         variant->name[0] ? "." : "", variant->name, t->name);
 
 	ksft_print_msg(" RUN           %s ...\n", test_name);
 
@@ -1203,6 +1203,7 @@ void __run_test(struct __fixture_metadata *f,
 
 	ksft_test_result_code(t->exit_code, test_name,
 			      diagnostic ? "%s" : "", diagnostic);
+	free(test_name);
 }
 
 static int test_harness_run(int argc, char **argv)
-- 
2.44.0.683.g7961c838ac-goog

