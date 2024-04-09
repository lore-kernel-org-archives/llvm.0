Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D825E12F59D
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 22:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712702582; cv=none; b=rJlE0VCR3ogjLo9T2ZaURjjvBZ29UIJwSbwwHWONydZ3ZVu4DVMKrzRoRQ05LSWQ3XvzlE5m/hPhPCka6KVxGoX5TTjqAgIZLDzAI8UJOM1pnpMI2WPHFva4fRC9Y9X8N3OpL237O1gTFFPpC8DH5DTMv+tmArxCvN1JSswyaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712702582; c=relaxed/simple;
	bh=EOPsmlwJFzGM2UI4dOfw8LD2YE7U8XKi3h9Rz8SnOGo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UlrhLgXQxiCo6sk/2xlhKLvM8lCsHPkcn1VLN4BLLhEVdGjtpleiM7fJlXNWoACrSo4UyiDI9QWwutqNtmqTYZOKh651ZEhsOIzZXKoFc0+i5cn0OmS/TVeUbZBE8YT1cl3A+iMwLwP83ws82MFWNjNrDLtefgGeKXf+iUd3O+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0yg7WegV; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0yg7WegV"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6180514a5ffso27200867b3.0
        for <llvm@lists.linux.dev>; Tue, 09 Apr 2024 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712702580; x=1713307380; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvOU5J+d22A5HC2jQZ6Bg8Tqj0DfjFxuF6JsjQ8c2sA=;
        b=0yg7WegVnOJUit+wV7Xw+t32zhvKiPOjBToWwhUfmH8AvsXvCeTN7eRJ9qvZJTiWbC
         QDb5F9Hrvw06xFXYpzCmkxfe6z1NSLZ4110cF4W7XhShuRRbnYeHp3n7jNYxHJiFO5f8
         LPdg46HW3wA+igg2lExSBzwTMPyanngE5PfUPLha3+jL6jPj+h9+u+EvO6AqnqCRbn+u
         O7LdeTCocR4FmI/05JOAM637333c/eSK+tf6vK6dnW6ucweq/hDH0akOzbAdrnyVx5mY
         vENTmdDk6S2ywMcWrGEkqm/PhThIQ0hRO4kohIYOE6gdOvqzo9uOpHYVhzG/vGfuE69/
         QJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712702580; x=1713307380;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvOU5J+d22A5HC2jQZ6Bg8Tqj0DfjFxuF6JsjQ8c2sA=;
        b=e9M0tQuz01ckAI6JWbsYAyN/sSixu2N9e94885TRt8zxUs0PdevBZXSyK/knUkOhTb
         cjb8DuZH8e8P9jThpfGY2uyaLo+l3FMuchcIpOl8BwVw22SkEvBdapbBFdMoRR8B275P
         frwA5N6kEVA1IywohKg3YTD6vyBQ2qCEzlz9FHNAws3oFY2WiXQXsL5ObHnJZjfmo/qF
         WPY/Haxx/qXfpA3JHm7rd5U1V8PVWDbyyhPXSwFFc+ne7XGYmRnz4iYullU/eL6TgEAb
         WmgUKNx7dmmZ5DH4LC7M+y7oX4eJecQAFNE6TE5vZ9qYuWV3JiV13C5joZqrb2OPHGeK
         j0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/UYie/2RBeHjooUeRZepgY/HPD+8ho3i4II6cnL349g+qNYq8HVwI3m78TitcN2S/mSKfZZ+GOKqL9MkRCJEHEVuVQg==
X-Gm-Message-State: AOJu0YxyPigDOoDw7l8C5G742f3uHQstDl97ivA32DqLD3fG6OGDdQ4P
	bLymNy/tJb/P1oNN86qY/+mYSNI9qsa4Ci+5jc5DG7n3DxQq8EVgcVSwpOWavVtz8GTMyDl/wFd
	rvA==
X-Google-Smtp-Source: AGHT+IEG/dXsyx++mqFslFlSc76Kv14rRGbklYITWYGwB/A65qSHXmzSLYmI3ivC7yI9+fzybcMRqsjyIHQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:a002:0:b0:614:2a7d:5ad3 with SMTP id
 x2-20020a81a002000000b006142a7d5ad3mr980648ywg.0.1712702579990; Tue, 09 Apr
 2024 15:42:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  9 Apr 2024 15:42:56 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240409224256.1581292-1-seanjc@google.com>
Subject: [PATCH] selftests: kselftest_harness: Print empty string, not empty
 fmt on PASS/FAIL
From: Sean Christopherson <seanjc@google.com>
To: Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

When printing nothing for the diagnostic on PASS/FAIL, use a string format
with an empty string, not an empty format with a NULL parameter.  Clang
complains about the empty format string, which in turn breaks building
with -Werror.

../kselftest_harness.h:1205:30: error: format string is empty [-Werror,-Wformat-zero-length]
                              diagnostic ? "%s" : "", diagnostic);
                                                  ^~
Fixes: 378193eff339 ("selftests: kselftest_harness: let PASS / FAIL provide diagnostic")
Cc: Kees Cook <keescook@chromium.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kselftest_harness.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 4fd735e48ee7..79ac9e9ada33 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1197,12 +1197,11 @@ void __run_test(struct __fixture_metadata *f,
 	if (t->results->reason[0])
 		diagnostic = t->results->reason;
 	else if (t->exit_code == KSFT_PASS || t->exit_code == KSFT_FAIL)
-		diagnostic = NULL;
+		diagnostic = "";
 	else
 		diagnostic = "unknown";
 
-	ksft_test_result_code(t->exit_code, test_name,
-			      diagnostic ? "%s" : "", diagnostic);
+	ksft_test_result_code(t->exit_code, test_name, "%s", diagnostic);
 }
 
 static int test_harness_run(int argc, char **argv)

base-commit: 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
-- 
2.44.0.478.gd926399ef9-goog

