Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCB72C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:52 +0000 (UTC)
Received: by mail-qv1-f74.google.com with SMTP id kc26-20020a056214411a00b003cabea18f69so27485415qvb.19
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rzdCErYR7QVJMqQ7C8iOEn+pKBOJL+BpLP2uqDT2sRI=;
        b=iiJU/NFxnkO4QpNuEziwm44ZddXcfbqTjJ27RND0XQcNYVVoxyYjAqEozptVgUXNwN
         tUotgFLhO6hTdCXy/8o38iy2aym7FJT+LW4h57+kXk+ITZwaPtmf/ukrKduYHtwrNNVy
         u6zRnFErKVJc5tA07nIb20yQJs/rjFgBkkJfiMGCJ0+/frkqjjvq7sB5Qlsbun/G1B3v
         mpVqufLXr0RiWnvRXu2PZPDLndJRxYoHPg3pEXSdStYWib1eEQIROpsu8lv6/UvQvgN4
         KcSqzQSZ9rtkXbOEAqLYcx/YblyNiiImRh54NndbnYSq+4cJ1Y/85RKTI5bPUsrRqqxr
         ZZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rzdCErYR7QVJMqQ7C8iOEn+pKBOJL+BpLP2uqDT2sRI=;
        b=mbc2vKb9HL54J9z5NQ1pkeLwrKU3BltY5mEwZYjbJsxsX5RHVxipqjkROR7fXVYd5T
         pontATJzZw1nuM324snymFaPgJDMjwpoHwZrk83Q+AMgqHtu5vkGf5xNX+NTVSCY5Z6C
         jk2H+k7r/Ud5zzq+XhO2OUyY/tV47vsXKiEac6/vxvRAa8PY94TXMqEZJoczHhUCbnSl
         Dmb62DqDNfORp0NbphFl9xnY14zNROXjd2LuK5kHo5ZaggVEXXpK6sfrDm1LN4LZPRh1
         JLrFoTLEJ0pGAM9+fE36COHTQUh8K3SvrMHLZutdrvMvZuNSBuXuwMejx8LVBf4Lr6uF
         7xtw==
X-Gm-Message-State: AOAM5308iRamJm6sTgzUkCgdKiTfw+jstG2TAaK/mjQrsQgdX62TUrZQ
	lVDqFIyqmKBELoC/lA9VQMRXZ60uqw==
X-Google-Smtp-Source: ABdhPJxS2DvHFjm5rRAa2Cv18Mr86xucn8I+904NmrEkNJGoQhVDVa+JTgno3MDa7PBFHMKHIzeyW8Gdjg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:ac8:5c45:: with SMTP id j5mr51253786qtj.58.1638272751779;
 Tue, 30 Nov 2021 03:45:51 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:28 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-21-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 20/25] mm, kcsan: Enable barrier instrumentation
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Some memory management calls imply memory barriers that are required to
avoid false positives. For example, without the correct instrumentation,
we could observe data races of the following variant:

                   T0           |           T1
        ------------------------+------------------------
                                |
         *a = 42;    ---+       |
         kfree(a);      |       |
                        |       | b = kmalloc(..); // b == a
          <reordered> <-+       | *b = 42;         // not a data race!
                                |

Therefore, instrument memory barriers in all allocator code currently
not being instrumented in a default build.

Signed-off-by: Marco Elver <elver@google.com>
---
 mm/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/Makefile b/mm/Makefile
index d6c0042e3aa0..7919cd7f13f2 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -15,6 +15,8 @@ KCSAN_SANITIZE_slab_common.o := n
 KCSAN_SANITIZE_slab.o := n
 KCSAN_SANITIZE_slub.o := n
 KCSAN_SANITIZE_page_alloc.o := n
+# But enable explicit instrumentation for memory barriers.
+KCSAN_INSTRUMENT_BARRIERS := y
 
 # These files are disabled because they produce non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. E.g. slab is out of
-- 
2.34.0.rc2.393.gf8c9666880-goog

