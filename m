Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4348728690
	for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782855233; cv=none; b=owq1jTybxLK9qgkfDsPHJ8boBeZjwWXxhmZJ9vwkYkrBvQKkVXN8OBYFZsuH/uSzenztqiGcGyMV6hV4+QBt0gRHRmo30D1TAMWQv/kYzjSx5W9hAGrZCrk4ugiqEj3vZGFHmPJ572u9BB3uX/EI+Sm1uKmS8rq/53VJZ/ywJIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782855233; c=relaxed/simple;
	bh=7P5AGdyX9U2FgOtXbK8aoEINUpNsnYeYDub1cigFpDU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BreDh0yFMHZQimMFPD7S7MKq0kxvRuCBb3CGw+hy+PhZmf+Nz9n206WFr6m5F2m+hWLYQilR8//0lCMWJX1zGAuD9rGUaVKKNPLMptn+0E8J1fHkncAkJAdv9nZvUQStjEs3oBb5BV6O9p9XLEQtmV5Fg0AXMv8YtcGUxv2ZH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nveTGRqV; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nveTGRqV"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso2606987a12.1
        for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 14:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782855231; x=1783460031; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z7X3kTpmZ4bguf8y7uJQ1FnujZXkLnCFBhY8iEZTYJQ=;
        b=nveTGRqVlLE9LnDhC5bu5KxHtVm3bwximf1uvb3e8/LlBVo6wur/HzaVNi13PSUDbN
         36td1j8DQfvkXiHe9wK6biKeU5DXSqYMEWxSZHSXegGHOTLnZgx4gDUEUzrsviX8QYyF
         iYouVFZHXQp0bGaiu/wi2T0CzeQhHZmorv6Ok03weKhGD9wqS1+S2tHpxUACiwcFwqn1
         qe0u33oRIJdmOln/MGF73fgj71NN1iRnNe1ofGk2y+iQ74VILGWvk6mLsJxYqyNG9DYO
         HVNoG6eOEVz/LNZNDcI+xrAElxQQcLjOTXHXw3gaZnrnlNlMNfySDJVq+iN2Je5V39Zp
         S4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782855231; x=1783460031;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7X3kTpmZ4bguf8y7uJQ1FnujZXkLnCFBhY8iEZTYJQ=;
        b=rRxvWVY+zUr2F9MjlkmhCg0uP1YqoMSDJG6bEf/BLygm3XG13VofRIlaeoSJpJ2EHX
         IkDZGuZrig/PKQO6f0ngpHR07r3HbBGwwDqMxZja553L9+I+O3iJvsjT2tv9I8ehaQCb
         bo+F3J3rWlWjzohjsvaqqkJ5lPhh+RektYXt60MdJuwrXPfubPxrl8sbtwl7viTxoanz
         B51ma2vtd/zJ737+B3ke19WqNWZXXziS2+IHvoTZK2qNj1WGjEwmDkgGbRT2KcUbaWjm
         saHqypEPGAXkAqIo5Apfm4IdO8mucYYFySIAcJWbFSBEYDN0NS5QRS6CPVTRNCm4JrVe
         NZzw==
X-Forwarded-Encrypted: i=1; AFNElJ9DlL3YYOYElyVeMQiAhbJ9VyDs4ZKSUZxxzTbqpfO3j5B0CaTxCU709kaNLkSH1HNgvLUe@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ+lC/dwg2NbgL8dO75AqNkDa5RjNh88KB4ZK8PoKE5XKWOOZX
	IBtq0dkc5tCM+4LSAG4KyNJ3oToRDCOnMqUx8T9ZJpMBrLGEJC4k8uHCqqGjFwEjNzSDRpDo5HL
	Kx60jaizO/uVGFQ==
X-Received: from pgq38.prod.google.com ([2002:a63:1066:0:b0:c86:5f41:8c94])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:62c4:b0:3bf:49c8:f73 with SMTP id adf61e73a8af0-3bfc52b1d7emr4595479637.35.1782855231357;
 Tue, 30 Jun 2026 14:33:51 -0700 (PDT)
Date: Tue, 30 Jun 2026 21:33:41 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630213341.1664345-1-dmatlack@google.com>
Subject: [PATCH] selftests: harness: Mark test fixture objects __maybe_unused
From: David Matlack <dmatlack@google.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, David Matlack <dmatlack@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>, Vipin Sharma <vipinsh@google.com>, 
	Will Drewry <wad@chromium.org>, Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Mark test fixture objects __maybe_unused since they will not be used
when there are fixture variants (the variants will be used instead).

This fixes the VFIO selftest build with clang and -Werror:

vfio_dma_mapping_mmio_test.c:106:1: error: variable '_vfio_dma_mapping_mmio_test_map_full_bar_object' set but not used [-Werror,-Wunused-but-set-global]
  106 | TEST_F(vfio_dma_mapping_mmio_test, map_full_bar)
      | ^
./../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
  398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEOUT_DEFAULT)
      |         ^
./../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_IMPL'
  470 |         static struct __test_metadata *_##fixture_name##_##test_name##_object; \
      |

Fixes: ff556bd98348 ("vfio: selftests: Add -Wall and -Werror to the Makefile")
Reported-by: Aaron Lewis <aaronlewis@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
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
2.55.0.rc0.799.gd6f94ed593-goog

