Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F4944465
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:52:26 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-690bd59322dso2022673b3a.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405146; x=1696009946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0V3jWlF6ThW9BuslQEoTcg1mHcaUXfGXFyJTs8W3R6E=;
        b=PK1p39BAImji/f9qS6YLwGFLNEt/55FkCTv9d+Q32823v6u+RL5aTWWrO1dBDm7AT6
         GAoffeToySDIwYvzSVbflfPMAsCPG5yB9jeUOEO1rZhuFWAEoHRStgKlQE0PU3RwRHpA
         RUaZrFsDCQSUb5dXtk1e7gcXJZV3s5PniQ3JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405146; x=1696009946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0V3jWlF6ThW9BuslQEoTcg1mHcaUXfGXFyJTs8W3R6E=;
        b=BOdoZEOBMyfklqot55SSLVhmWM2RD5OGY7aNCdhPnNjmfCc1CsjNGYNGRpaw/gwMjG
         xy9VTbm6D7AKoTG5gAoScDdg/52dpymi7W2rnm/l8q0IKZMNEU1TBaBQitaAdvDozh88
         AjT3jDTR9HYpBQxRhJjlxYO5Cn9MTYTvbaZAP9wn9HGYHFtlU8/U06VGKA7xgSrtZ4Vi
         MdmazC9ZInoP6/ywjs5e+1NGl26FZdbP3aTWKk/QCNNymt76LTBnnAFPgqSFPPcNgmRn
         hnrM9RQ1pw1q96pNLIsxnHUJhEPhwivlpQoYR8GNaNQgGIsniEdnn1dkNcrkGaUZqrqc
         t60g==
X-Gm-Message-State: AOJu0YygyD3uwdaY73QuemLvjBONjBWyMPzGc4TdfSAT+8EbeUffNQEC
	cSSsfB186bfn8lgkhuwom1I0Ww==
X-Google-Smtp-Source: AGHT+IHx4GnSNddp0w77bsyIRrhbxTM/759paXQ8qQVs8QwwnJM4CYqUGvwQocxlGPM8jBTrYu6dZA==
X-Received: by 2002:a05:6a20:918a:b0:149:9b2f:a79d with SMTP id v10-20020a056a20918a00b001499b2fa79dmr290578pzd.6.1695405146334;
        Fri, 22 Sep 2023 10:52:26 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n6-20020a17090ade8600b002680dfd368dsm3539391pjv.51.2023.09.22.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:52:25 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>
Cc: Kees Cook <keescook@chromium.org>,
	kexec@lists.infradead.org,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kexec: Annotate struct crash_mem with __counted_by
Date: Fri, 22 Sep 2023 10:52:24 -0700
Message-Id: <20230922175224.work.712-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=keescook@chromium.org;
 h=from:subject:message-id; bh=L7QtPm9sV53utHLzzgBlBEkBDQ4wLhHXIn/rOvcMRB8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdRYVSnSoLrnQY5IDtf2GC3u6QkTIyJo8C8QH
 UxbqYg6Z1eJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UWAAKCRCJcvTf3G3A
 JiO2D/4/umN2M56qMMDxw25gfk0XXrNasJyvVidbf0iVWd2FgMZqMzVjLLRZKgALKtPtlbDlkh2
 uMauyeoWwoJreiokLRDV03uy+dbxUuXicnyG1bqS0hQX79TIbLta7QucwkDPvl6ApHxx5G7/lM5
 n1+Vo5Onde7/uK/2hXqgKAZObP3bWuBXqt/r7JbPJp709MTsA0KotCN0R3ZCUfDz2t8xfPIxvpR
 S/BBPo6ZplYLWO9EVXoJzCvwZxEGL0JmSI8IMvIYrw6hZRXg1j/dR/pmBplYZnXwLByQXsphPpR
 S1nRV9zZoQGb6SUX4mf/M71DVfcZKchFA9BihrGb4YXnLb47CU6/+m0AXiLZp5Qx5eVC0cZTHgM
 Qps2mjfP+ph6xuFEcF/gF8bWWrNbKVvtftK30Li+TojYHIK2xvrdmuBbOCY6g6EVijg0KCGHx8K
 i9yJ+ibNvqF2ArwEQHi13ri0WBKLiujrfoInUBfMHwjtOxZqjnVpwz1I4W5F22E6+6rWL1CaSZA
 QOK0C9uuoYEZJkZ74kv04YXgsLbr85durHrVptzD6/83FJLlgZAwX38fwmJ54utqv5Vmvv7EPlN
 eFnyapYuZ/+5urqf5Q8HplGM5D3AFfSZ6y+Y8OToC74qQf4wevVdjZsyKPHA2o6OuQXX0GnGdR8
 Eahlr6L R5b0zPWw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct crash_mem.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Eric Biederman <ebiederm@xmission.com>
Cc: kexec@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/crash_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 3426f6eef60b..5126a4fecb44 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -131,7 +131,7 @@ static inline void __init reserve_crashkernel_generic(char *cmdline,
 struct crash_mem {
 	unsigned int max_nr_ranges;
 	unsigned int nr_ranges;
-	struct range ranges[];
+	struct range ranges[] __counted_by(max_nr_ranges);
 };
 
 extern int crash_exclude_mem_range(struct crash_mem *mem,
-- 
2.34.1

