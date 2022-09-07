Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19A5CA6
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 17:39:11 +0000 (UTC)
Received: by mail-lf1-f73.google.com with SMTP id h35-20020a0565123ca300b0049465e679a1so3839828lfv.16
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=BmEi8gIwQcUUQptKaHcLNwXSjRU/vHM6B2OOTGvVDXE=;
        b=dko2SfaLeLucDtojaFxk9/p0aOv1qZKDkQKYFaggxikX8hhzEizTQ417LdYHh6nTox
         KDsBAknOJ+6Eo/ArssQbhLT+hoJlNuokKbDReVVCeU5JfNFLZSWj2hEF93uJqVRs8qmp
         lvDIZ16cH/V5ix87Ny61ePlKOnhFeqzEC5UpHbxUkB8zmnIBp7wYvj5lf+KySeFV7968
         QDkJYZCZJRxhS/PFq3Sp8wTOns+YvZmZs4EybbydI/wuFSFXa3hnu1TVuEncjt6j2LBS
         Vj/MxCuENHCle3qb5gvg0+znGmCJa5a5CTiKTD7LkwA6mid05caT6rvJtJO4hJBaPKir
         kzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=BmEi8gIwQcUUQptKaHcLNwXSjRU/vHM6B2OOTGvVDXE=;
        b=bICWDfwhGhvR//0SNHI79MyCSAoriQipgGPjJNW9JGrg45J0waLJHzyjO5NmX6s5T5
         pPlxCjghRCX9hEgQqkmaVSM9ArfbamxnnZxwtdO10jPPgxtQToKaNItzY6NsBQH/1xUI
         ndgg3kpzEt/VplC1G5sBUMfBBn+Ay28+p2DE4dB0kPI//9tKqBYxtEOxKfYNIORxr2us
         vknr3Q/iy0+MqHPuFeRovjS7wSFjce7GzArSOoHfXRZYM/Bot+P/3+vNHH5iDwlNLnfz
         uMdSc9EwsJe/gT/6v9SXpE1vAzNULBUra6XshK+V2k2Q5GMxtbAMEW2OK0yWk91OQgKk
         EUlw==
X-Gm-Message-State: ACgBeo33nazoYQP37Hz7NzceaBWl3NEsHctd6mKC3W1d6V+4crzsSgbp
	QUFS/uuhZ2K7VLZUTH3Y1kjCpE/dwA==
X-Google-Smtp-Source: AA6agR5egxwtxjD+OnVXZYPoC3wFjV2aF+IAhyqkuqSkuJ//nrmP6TRx2UYFpIsZzh6M2wys1t9NiZGavQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:ba52:c371:837f:3864])
 (user=elver job=sendgmr) by 2002:ac2:5ece:0:b0:497:acb3:a6f5 with SMTP id
 d14-20020ac25ece000000b00497acb3a6f5mr554128lfq.112.1662572349920; Wed, 07
 Sep 2022 10:39:09 -0700 (PDT)
Date: Wed,  7 Sep 2022 19:39:03 +0200
In-Reply-To: <20220907173903.2268161-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220907173903.2268161-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220907173903.2268161-2-elver@google.com>
Subject: [PATCH 2/2] objtool, kcsan: Add volatile read/write instrumentation
 to whitelist
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Adds KCSAN's volatile barrier instrumentation to objtool's uaccess
whitelist.

Recent kernel change have shown that this was missing from the uaccess
whitelist (since the first upstreamed version of KCSAN):

  mm/gup.o: warning: objtool: fault_in_readable+0x101: call to __tsan_volatile_write1() with UACCESS enabled

Fixes: 75d75b7a4d54 ("kcsan: Support distinguishing volatile accesses")
Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e55fdf952a3a..67afdce3421f 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -999,6 +999,16 @@ static const char *uaccess_safe_builtin[] = {
 	"__tsan_read_write4",
 	"__tsan_read_write8",
 	"__tsan_read_write16",
+	"__tsan_volatile_read1",
+	"__tsan_volatile_read2",
+	"__tsan_volatile_read4",
+	"__tsan_volatile_read8",
+	"__tsan_volatile_read16",
+	"__tsan_volatile_write1",
+	"__tsan_volatile_write2",
+	"__tsan_volatile_write4",
+	"__tsan_volatile_write8",
+	"__tsan_volatile_write16",
 	"__tsan_atomic8_load",
 	"__tsan_atomic16_load",
 	"__tsan_atomic32_load",
-- 
2.37.2.789.g6183377224-goog

