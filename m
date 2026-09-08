Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8C5908C5
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886523; cv=none; b=oG54pFE7MMI6UzK7NLEfX1VlUnQgdaduw+gU6sZV9KWMKXeIKRCfLb093z2vGS84nCKCd/gUXdvm8cCAcY+mkIj7UOevpJIsskbC4TTCJQ+mAiWDVmVn3rty9+InMiASomWhRzA3OJ9QWdppN9xbyVct8Q6QwloPdRm/l31RnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886523; c=relaxed/simple;
	bh=nI7UZDHKHLOeR8gHis7kZKBzbvddfeV62d7kRLq8zjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsoeKRzlWyteLX3XcJcRa20hUkWVq8fnsFkTnXEUNFbW6J17KPdfGvKMwgAPuOvcB5G4fdB4woJ/q9k4UOO0nY+V61crBpFUa6tzXqY/CZ0GiPit5YZyob9TJ/RGYj9SB90Ej3IwZWGOEl0mCSLLV0Vyg3IyZGk1pCWcw9lvnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rXpoMygA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rXpoMygA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b5e50eb70so101975e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886519; x=1789491319; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaUxdToouQ436sBgssARKpnXWAtos5uuXm7i5Fmx0oI=;
        b=rXpoMygAnqdcnnx1Mf/l8/D4HlaQtqNUMbcNkDvCKqHjIOUkuiCgD71ANWb61/KDmT
         57aqAYIJKZ6wZjUJ6Maob0SzlOUrwzJL9NPW+otBZbm+MxQYPkp/A8b6UdxXvAHbeJa7
         6SLjB0N9EQ+JA4z/YeV5j+V33hnwflrVwseVMpestsNTqLv4+xCnyHfmakW2HvOsiCSr
         5tm/ooiaYe9InlweFI2qL0UGP/r4IjfC8u8D8S5Q0OyJCso12/ANyiY2E6knmQ5ghNRU
         2LQ4JFrz/wcoxdeatelK7NL1c8zaYF/J0HcRWk7uDapSF0b+bxG3fBflVi6B05U/q2R1
         0XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886519; x=1789491319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaUxdToouQ436sBgssARKpnXWAtos5uuXm7i5Fmx0oI=;
        b=bW0o315GOEIJ/h0FIsWrFbypquDGEWc/wTPs4POMIitD5vvjNrvjZFg4Jtd2Fih99Z
         xdzRseMTZG77kSm/Ng9F9Vrd5RWV3RbZ/Ydl/DCvScUo01VFVLdqvsNz3H5oY+lvX8D1
         Q5Mgh0q5lb8SxAbOMwe4z2NaUe0aRCiSYIaRJA/QXR38Wj0JVCAtc9RYE1riLLO/hV55
         9U4yAslPazRKpEPzFlRAiyOOxOydlCC2p2n2nbEadUCigsbXauyzlqIEFqWcY9iUP0Z/
         k5vWR2CZmhbTdlcXTkrr1qtNi2vRLUYDESeVxid4v9rplsH7H64l7f6NBto/TaATMZLC
         s2mw==
X-Forwarded-Encrypted: i=1; AKwUvBxChGNGqC4x+kSi+l1Ea7mLojLwkgpegB+wsLU4OVW+DtiDACRhRDBI/hP1PP6QNUaYkRGG@lists.linux.dev
X-Gm-Message-State: AFuF++njzxiCGIWQ54+Y5jrrwFUnTGiamMxvKp0HMv0fHEBEkOoZNrur
	waGxGYUPWkSuw5D49arg68TID+NCnXXnMax6tvWfGfsyF/WeSOWws8M1mpj+VmpRNg==
X-Gm-Gg: AYBFou0WRIwz2olqXXyQPzyngcQQdKggNNOfkpubsyH2f8bkuaJKHl93vRfVxOCSOmy
	dvVZvTDj1eKvGiQHm7TI8p6Qx+SW9X0pGZy1N3ytMhg4ElQRwZpX0G9USytnVI4er5punaDGVzZ
	vymWGMhhhUZuxCYp5LuppmyWi4GlC4M1Tw3tMW8JaOEy2Pa5xlCwWaj8r+TzrGFmgZPgtJk2Nef
	jwiGDZg/4ycBeVN5UbTWNg/GYnTgxXaYh3Rup6GBIS8Oh1WgVgCjhL/t87NCjkrRnl5cGU3hV+E
	+KUK65ePPSvyEzxEjAgzoA40NeHKGR7hwRUgiVGgYBxiSsJLcSOwWkeg2031sslL2Q/2/SxaOgo
	p4EuRbYlhfuD6S6MiZWGGdZjnPdOPde4sl9DSiZDiNvB5XjVEhnrclcbuidq2AApHPQrqooBIUr
	CG+4wLzjlFb6+wxRL3+17QfMUavDj6EK7MbZlLLRn77Lv7IoBJCRLclaAsQuweijOrunb+QHsp9
	68bRaBauIKqfW2eDuVsOdmoCrvTOdXY3gpQs3Rv2233xQ4R
X-Received: by 2002:a05:600d:10e:b0:495:4593:616c with SMTP id 5b1f17b1804b1-49d1f3bc3bbmr19965e9.1.1788886518456;
        Tue, 08 Sep 2026 09:55:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm36061757f8f.16.2026.09.08.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:17 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:50 +0200
Subject: [PATCH RFC v3 10/12] kcov: log old value
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-10-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=2312;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=nI7UZDHKHLOeR8gHis7kZKBzbvddfeV62d7kRLq8zjs=;
 b=Lkb5Mmm5ypM1UlMzH2etDVDhjeF5GU8tDa7HVHPAceBtEplvzPo1Dw5v/cbOiOulRWKt0hmfK
 2WnKTrkqFwQBC+8ppvbSQgDl2Y5GEsO75520U6hPrKQqxpU6Q/iJXtN
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

For manual analysis of traces, log the old value at the memory location as
part of the memory_access_record.

This is best-effort; in particular:

 - the value may not be recorded if it has an unusual size
 - the recorded value may not match the value observed by the instrumented
   memory operation in cases where the value is modified concurrently

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/uapi/linux/kcov.h |  2 ++
 kernel/kcov.c             | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 76822d1c119a..235f73e11d59 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -91,12 +91,14 @@ static inline __u64 kcov_remote_handle(__u64 subsys, __u64 inst)
 #define MEMORY_ACCESS_RECORD_RMW 0x20
 #define MEMORY_ACCESS_RECORD_ATOMIC 0x40
 #define MEMORY_ACCESS_RECORD_FREE 0x80
+#define MEMORY_ACCESS_RECORD_VALUE 0x100 /* value field is valid */
 struct memory_access_record {
 	__aligned_u64 ip_address_and_kcov_flags;
 	__aligned_u64 data_address;
 	__u32 size;
 	__u32 flags; /* MEMORY_ACCESS_RECORD_* */
 	__aligned_u64 time;
+	__aligned_u64 value;
 } __attribute__((aligned(8)));
 
 #endif /* _LINUX_KCOV_IOCTLS_H */
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 88aedaf41a9e..ef405940a2cb 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -1267,6 +1267,26 @@ void notrace __kcov_handle_memaccess(const volatile void *p, size_t size, unsign
 		.flags = type,
 		.time = kcov_get_time()
 	};
+
+	switch (size) {
+	case 1:
+		__get_kernel_nofault((u8 *)&record->value, p, u8, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	case 2:
+		__get_kernel_nofault((u16 *)&record->value, p, u16, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	case 4:
+		__get_kernel_nofault((u32 *)&record->value, p, u32, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	case 8:
+		__get_kernel_nofault((u64 *)&record->value, p, u64, handle_fault);
+		record->flags |= MEMORY_ACCESS_RECORD_VALUE;
+		break;
+	}
+handle_fault:;
 }
 
 void notrace _kcov_handle_memaccess(const volatile void *p, size_t size, unsigned int type)

-- 
2.55.0.979.g7e5102b832-goog

