Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F4D449999
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457575; cv=none; b=hfYq6Uf3AFK60JCmX2k0FodE01/sopWQq7DV+lQUlFHtbRHgL4AAGxb9YvzE+BlPJXZpjIAEWvxSsC62K2cElDwq4JXK3zi+nCRj+nQ5tTcAU0sNa8sYgFFUEf0OW4YE3hRyfI4oABmxfZeU9lF53YIqZ5V/SHMX5AwRr4CMauQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457575; c=relaxed/simple;
	bh=LjIubD3Zg+wcYFo41RfpwdNGP6TjBzaPkrqdHz0k0BI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N6KPsZOTKgfTqpbW3W2Ia9EhlKDCaIad1RTztRn4THoxs/KmB/Vh5WnMVWSrstjkhQHFsL/mz3zt85Ltpr/nJJIaAGTJV8ed/0buUivaGOcs0HKBO55DNAD6XuvFJT1u7Pnz0KPdaNb/vnWx4nhvh2KCFuOvBkMw0gLle5MB55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He3hgQwP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He3hgQwP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956242332dso30731845e9.2
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786457572; x=1787062372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o80QnEVKUcuUdd3OZFAdxnODo4B1zikCcE/tvO9NxHk=;
        b=He3hgQwPdRj6VhS+gqm1fptLbEBdQybVrx1P1Iz/Ac0ZAhkjA8ziFSTuXzfnYPSmA7
         je6DjNqN5bA4ElwqL7Gki8Xxzlpd8R4EbQ0jPMY5OsSkD/imUV0gWQDjjU12vyswR6sg
         5n7uBZ7e79t2//rA9j+CRI9Cqi/pZFUXBAUv3VWogCtvsNn4i6bzK7LA6roEwi/GHcxD
         wakqjsU+i5+O9wO6xgQyaWwkwAmP7ETcj3kuKdB21yBDPqasYx1vyAOQiv1OGkCJNHhV
         +t/0Cx3hob+R8Mqw9Y7MxZ7t8Jxry4KKKeEns0yvRFk6EPIrvXqsDGCYyx1I8uTgg1l6
         pp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457572; x=1787062372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o80QnEVKUcuUdd3OZFAdxnODo4B1zikCcE/tvO9NxHk=;
        b=JPejV+ASmcS0WJD974X4Cz43H8q/CDoJxPQnVw9Ki/K7luYQLWpjoqx6VMTryCkino
         Jw8nXBBpp4N54SjFp/GHCS/Z3rVBoIJ+i959CJydSlunIeyRpL4kkqgp/6QwEg5qAdXI
         G88G9XjAVaCdyTKCMe15H+aYVE5NwA/ps++P42xmjChjM6PjRTHFBRrzFzKYo+wex8wX
         wvYHdWZXN3ZToGdgfMN/N6hre2HFhMaRKTlAh9Kl0p6IEBeRq8rrK7vhVXBBOtsi4PZ2
         Sx1XqcGoXro/fx38p3zsQx51cIJU2vqmAhCKxIi+UW2/HsjrOE7HRGk0VJ5iko1hR/Ld
         vj0w==
X-Forwarded-Encrypted: i=1; AHgh+RonJZ3k+U1Cid+to6kmF6Mt9MeLSyF7b8greFMqJYZuU9gXDee7ajGyJG3Rqed6F106ixAB@lists.linux.dev
X-Gm-Message-State: AOJu0YxumpBoOuetPbKosTWaOJpnQPgwO/uuu2q8WYIZUb4aUrFcZ7c0
	QpcOoMyy+NkD5ZeoVuuVloP6glwIWjrsNqkIgF/peo4U/OBx1YiiW1KY
X-Gm-Gg: AR+sD10e52CZ1D5Z2vFELBoTbygmcrdBSs9JEgisGB6b4HIAgidE/l9bYO3ocDEi/E9
	Mq/Q36R/4WuciIavn6kqM3EUHu0opqJo9i/uRJC/rjGjLmCV1wRS+V6RWtdhy39acpbr0iqzenf
	2cHMnz7RKCJU7XNUlPwyhO7R38j3yYPh5g7Jn+QSswry5dqw7zweuRU35Mc4RcXz6UwNtUdoC10
	cG63H1apNXfR5sGJPbizR1p1Y84FnPsk9PJmx3OuwEhA8jmo//VXScvPw3eup6CaJIGA8n+6By6
	a+up7JTk9v7fsUQ72vcXBAZgzZJfrtxMDYvoP2JlhGnRkVq5Dub5cPTt50jFBBoanDWBYcXYtiU
	BRXfr3THenXhu9FazbHRpBZb02qYIJ2nCPBVPoZuQXG3FZMLGxqJwLOZ0yOOKFyBeA0UfaULAGi
	WpTFymtPyDnepS48/Nc7MT+WU62thangf/q4IUVcW3q/4HfJYzDMKUgpLYjsI9TSlZBXHE4dEGu
	biK817FZVJeCUfGtpxp6NZntSbG/L0kJJlGNg/CgWXZbAGUSQSfmY3i4hS0CJ7y7WXljZNTpkSw
	Js+jr01l3s+NWz1x8XHhNTs+fOOkXpQxzZg74XJwB3ngkPmuX+xCeeoOUp4NuPXLS0PvGmSeiQ=
	=
X-Received: by 2002:a05:600c:4709:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-4997844c55emr61209035e9.10.1786457571515;
        Tue, 11 Aug 2026 07:12:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5be29fsm4464099f8f.12.2026.08.11.07.12.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 07:12:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/3] slab: test zero-size allocations in slub_kunit
Date: Tue, 11 Aug 2026 16:12:40 +0200
Message-Id: <20260811141240.62519-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811141240.62519-1-kmehltretter@gmail.com>
References: <20260811141240.62519-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit coverage for the zero-size allocation contract, including
ZERO_SIZE_PTR alignment and exact ZERO_OR_NULL_PTR() matching.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/tests/slub_kunit.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index fa6d31dbca166..a02fc6b401e3e 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -380,6 +380,48 @@ static void test_kmalloc_kfree_nolock(struct kunit *test)
 }
 #endif
 
+static void test_zero_size_alloc(struct kunit *test)
+{
+	unsigned long zsp = (unsigned long)ZERO_SIZE_PTR;
+	void *p, *r;
+
+	static_assert((unsigned long)ZERO_SIZE_PTR % ARCH_KMALLOC_MINALIGN == 0);
+
+	p = kmalloc(0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	KUNIT_EXPECT_EQ(test, ksize(p), 0);
+	kfree(p);
+
+	KUNIT_EXPECT_PTR_EQ(test, kzalloc(0, GFP_KERNEL), ZERO_SIZE_PTR);
+	KUNIT_EXPECT_PTR_EQ(test, kmalloc_array(0, 8, GFP_KERNEL), ZERO_SIZE_PTR);
+	KUNIT_EXPECT_PTR_EQ(test, kcalloc(4, 0, GFP_KERNEL), ZERO_SIZE_PTR);
+
+	p = kvmalloc(0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	kvfree(p);
+
+	p = krealloc(NULL, 0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	r = krealloc(p, 64, GFP_KERNEL);
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR(r));
+	p = krealloc(r, 0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	kfree(p);
+
+	/* Only NULL and the zero-size sentinel match. */
+	KUNIT_EXPECT_TRUE(test, ZERO_OR_NULL_PTR(NULL));
+	KUNIT_EXPECT_TRUE(test, ZERO_OR_NULL_PTR(ZERO_SIZE_PTR));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)1));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp - 1)));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp + 1)));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp * 2)));
+
+	/* freeing the sentinel must stay a no-op */
+	kfree(ZERO_SIZE_PTR);
+	kfree_sensitive(ZERO_SIZE_PTR);
+	kvfree(ZERO_SIZE_PTR);
+}
+
 static int test_init(struct kunit *test)
 {
 	slab_errors = 0;
@@ -404,6 +446,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
+	KUNIT_CASE(test_zero_size_alloc),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_kfree_nolock),
 #endif
-- 
2.53.0

