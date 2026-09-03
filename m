Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACBC50EBE9
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467860; cv=none; b=oh4nTUup7CNwHGP3gr1SUOqDFN5F1GHAgmy8xI6tKa1fohtl+God/rKchTGKB9Te7XuUZHsQQFYExxlYtGJNmyb9bu0phyDNS9PAai2fbSMGLyUD5aTWGt9VEIeJpo4OAA3Lfw0M5ERHHh9EO1vIvczUEDrUqvl4F9pW7Kk1MVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467860; c=relaxed/simple;
	bh=eQHeON0BpQBd/tO8wP0/baPlZbNUwkPl8Dihm2uv+Ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ck5AbMVJJEu0+m/hmNIX01tBk5XUrJZSLCzu3Zb8frLdt70zIYSLLRN1VIiV/irTESKCWi9cDJFGvtASThq86MELWvLGSR3gwkiGih48+KBLWzBQq0LXoHcHwlPDvOAbQmBxRAc4KKOUj1suOOwic5r/I1M/S003+rIwKGl24zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+mmqn+a; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+mmqn+a"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843f205a5bso235014f8f.1
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467854; x=1789072654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akOv2wAC7HX7aMxE6Q3m1WKBtSvSbn9vu4HmmhmzJNE=;
        b=m+mmqn+ajkf6N/C2ni4R71z4fwn9zB/AJ2/XqvSChA7RgSSKKJFczGuPJAHErBl/5H
         vL6mfkWBwu2pNn0fBV+TwIIaYhltqK5EK8V4g6D0TubWArkvGTNT9I+9SWHxCSXPimj8
         3BYpk6GuAKZU9igCxmdLl6RAm/qqzuoPA90izTydD5vYyvSsPtMpgLz87BN70gsZlESn
         e4iPQ64OZXkjAV1iLi78/VWjS3wrGZzCWdAt+07Mm0Rrl9gLyTq+IX0QIqmvlaWsuS5+
         63yB2KNrHIwYa6/OPdrJRagx1O1qYdvshxP0GDIlu28CP0NaaKue2OHt2Sl3W5LFW10T
         /ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467854; x=1789072654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akOv2wAC7HX7aMxE6Q3m1WKBtSvSbn9vu4HmmhmzJNE=;
        b=eo2NlpRfXz3/T+0ZWccrjY4ydbADVzzZx2EUuWAUByyB+1dotVREiqTzcrPirGcFFo
         USfPwuYf/9vwjNUh//kmwvBCsAwIWLJcoSkn6MUZlQe4rwTx3maorzrqxfALZNBnXvEL
         Y22KihkqZjayInpwvZNhY7ZwFXkJomTCjykrhg+j/hzspZNoWZGA31nKd9y4zosK68Tj
         Cwtkopj5fzT3+FA4ELtDPG3Tz7XCgmoverLBtO3V//WFpDyKIztQ1Rm6h4vt5F0XjjG1
         /ZyXCB9oar1aiNPCVfgI8SU0lx0Rh4kwXWI6S3xaPP5uAsAzSHSUF9Pz/w3c1dzKpY7w
         WcOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKBl6GU0isFCS4TrmAgyR1Pbu8myxtqD2yUAo7wgtHkaOcIpy5+YBxHMIWFwDkNuuVvBTb@lists.linux.dev
X-Gm-Message-State: AFuF++mD66goQftabKHeqC/pdqrnBk29zQH703bPmSlj1uRGzJd0zjpE
	ni6lVWhkGdQqkzy6C5c876nL2J5m74t4cmxiYAnRTf8RErXiqkbT1i+Q
X-Gm-Gg: AYBFou3PEARPyXCoHh9Ti4/TjwhmsqmI/frwIX5AUzwVDYWbr3Hn6l6BsCsAkQv3En8
	7bL+61ha+3CjY7r4SG3v+SeY3a3KLiA2KCNWJzkDGTKPuV7oXLUByOiWAOBt8CTLCYMGW9u2hwk
	rYCkCxKNuuWmSJrptu31XabZwp0maqAZFKw44quzlLSK49kjNR/IhLIUvS1G4N4zExqtN8jmoY7
	0Rm/7hcpp6PQ642mArAPFjCXOAAPyu7LKJKusRp/e8/w8JymN7sn2JyFgUvZq4zJ/U9JuDAsJnO
	vIXmgeSSGaB/91mExBiOEfBiFMfguNJnCGkRNxwjx9I4lEwbUitGSvfHFCtUt1OiQy/RN6aEH+J
	WcUP9Xc9eyH8H3L9JcXArWwPApgiZQPx8LwAfXrLEQTslE/uPK9RXgzxU0bXCnlgFnYVan8nTan
	Dl+MuyFEl8eWRBHaEMJVxhgJp51BqwC2dtmd+B9G/jv3Y4JIUd34lTOxw63JDrK6IR1cySMe5G9
	pT5L8YWxs82LHPguOP82JRtJMNf+l1NJkSiFMUDhurt25YRVdJQfjQOmZKcUWIhJFZFtBzbGrku
	xwKE9Sw0DF8k+YrjLZzPQNFE8y/5KTl5w05wc5UdGUzHOMxU0rK1W17LBCjEZGF1BwtEW5BPSH9
	9VnzQ
X-Received: by 2002:a05:6000:220a:b0:485:81a8:6f09 with SMTP id ffacd0b85a97d-485870982a4mr3472028f8f.9.1788467854295;
        Thu, 03 Sep 2026 13:37:34 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:33 -0700 (PDT)
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
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 4/5] slab: test zero-size allocations in slub_kunit
Date: Thu,  3 Sep 2026 22:37:19 +0200
Message-Id: <20260903203720.63689-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit coverage for the zero-size allocation contract, including
ZERO_SIZE_PTR alignment and exact ZERO_OR_NULL_PTR() matching.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/tests/slub_kunit.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index e3b63f0338d5..923d8646bca1 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -465,6 +465,48 @@ static void test_kmalloc_nolock_and_friends_kprobe(struct kunit *test)
 }
 #endif
 
+static void test_zero_size_alloc(struct kunit *test)
+{
+	unsigned long zsp = (unsigned long)ZERO_SIZE_PTR;
+	void *p, *r;
+
+	KUNIT_EXPECT_EQ(test, zsp % ARCH_KMALLOC_MINALIGN, 0UL);
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
@@ -489,6 +531,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
+	KUNIT_CASE(test_zero_size_alloc),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
-- 
2.53.0

