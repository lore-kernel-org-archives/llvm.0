Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57658F071
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886507; cv=none; b=JrZL5DfJytNbBBeEykAl7/7lYF3BnNkLkhYLe7IzF25fxiH9FFcCMENdomUtq/Nghz8zfi1S4nvPdG/H1MFGMXXlyq/oE7jLOWnUudfQCSu+Wa92XhDQNTrTbf9PtoY0jTL5bgvH5Xa68PTcMy6XjceP6E1Zs5Rf/VYkr7WD3RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886507; c=relaxed/simple;
	bh=zMSdv79W/28vOlNus87Hr0NP1H4bhJbv+hYzEQlIBho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=to0ao2YsCtmeIzZ9qqPr++85ejiutlA5e8w6olNmXzEjk6k7SD+9DbcbedrTOc2kk8P2naCKAy9CmqziqmfohYG+/NDhtctMAYaCVkb6YkcA0RtN72TD5OgMPqOxw8QmjlPkSTKkZDqr7Jnn0DdW/juEsM+olbIA6mStTrtSzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qUAPOdAG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qUAPOdAG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso140775e9.0
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886503; x=1789491303; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RnG64ZBEYmtca9ZKg3SGvzKLOcbOD+eKnvKZpxSN+E=;
        b=qUAPOdAGOKLmNEiN//kubouzDdyRfi5pDA9ubjaUFPIXEBaCjPmRTZSxJrejw85W+e
         wFBYFmhR/aBtl/J9BpXf6GhQSc2wsrYYDgtM5EphvX49ECV07TaOZQPLU/PNpvIOa7c0
         +EoKo5SE7CH9BufwiNTUuwI1pNuEQH7fj0Jyt79HuUkO3yfRe9pswBFTXBDto1bcOocd
         3pZGJZrheU78EwaMN2cnb2KyLVov9loDsr+WcKuGiKZk2SZDlmXpkKTi79hwXnBvMyaZ
         NqbKm+9XqE4lgkjQa/IJXX/lzDD/xh4+Bmx1eRZbTirWZLWOx2iToOzWR14nbr57rcYg
         djOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886503; x=1789491303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RnG64ZBEYmtca9ZKg3SGvzKLOcbOD+eKnvKZpxSN+E=;
        b=SWPeVdE3d74U1EDhkfWNLUqEYIN5MFxj/wQTUGMxlhdwX+/OW135CSS0pIS/EWR9Yw
         +YoH1s6l5EHAPGSIvTkQ4boBl0CJV9r6WCbO9yTBkUXA/9r7vhtb+O/v+CIwkj2kICuM
         2qjXQ//Zj1KiFbd/dw2M3blPuxhZf4RMmdTBhb/u1MIMpq/8h0Ab9f7iJLGwFma9c6rY
         qOofTYoAlW2CoibW4XkfQgy/tP/UWCABmlelbSpqKpcxsc0t6h18sb+qIx8qHwhn7qV7
         J0AP9FVxTmnI2aL0Gyqn/978/p2+mejT6K+RrlYFwVQNZMZsu7HRD+7GFwjrlaMbU+DH
         Nu5g==
X-Forwarded-Encrypted: i=1; AKwUvBx9Vq77ZttHSWUykCVlH39VmDrro7F1X7L3R9WY32OGIN26XExphlW9z1ePAH0Uc2/nrATP@lists.linux.dev
X-Gm-Message-State: AFuF++nvPJVEPf9cfnSuexSNxz+JiDZLdcfzRTONIzwchVGir5u5SafO
	YL23rTtxbLd39+BQCpCVZjQZOtA+w8e/cVbOSXDspC20mGiOgOLflEXfc11v4zrVcAd/wpL3/wc
	8mt7kHK7x
X-Gm-Gg: AYBFou1fFiLSRa78k3lx/Sx1l4ay0YR5lKIRzJfZCygiRJOxBXMjaC5CjIGZfo0gr5j
	5dLtainqJ2UXwxUNkFg0QbD/Ot7w0JaKBxxLKSr0V4vJzZmr01EEJDUVbyro63HR4SD6CR4vIvN
	NFrFU57MSM+clqaamLvEltjNWPpp4gUQ4DZTh64quWXcMfbqwHorg7qPbe0YF7BwV5pqA8Q7Wvg
	MckyyrZUHYRit8fijsO7xioeO2N7lYNz4XF3nctGeFvSoOghGvse9q2NdZzhRQ0k8zdNCy6bl7s
	zWif6lPEdTbhNQ1pE102kH91801i8N/W2MekmSUAH82KZ79VXtmCB0cVQ3B1DSxWq4IPUZtXs9k
	NWDp/mkmCWCUGhKwekNatVLq44HDNJN+Mjbgca0QaPX+MTi2R/fm2cpRBQEGqQqWthZInpQ1lkD
	KzTZ7y1pERSyOpUtSn7SvIj1F5WzbmFNrTHObZ+u6Ro6JfMUgA3tLN7Dti2/9gPo9I2KDbrujsH
	fszKvNJVYora2LOu7NEfvQyxa29KwvKWWdhb25QBS1hf3ax
X-Received: by 2002:a05:600d:8498:20b0:49b:c90:e1ee with SMTP id 5b1f17b1804b1-49d1f6edc70mr25955e9.11.1788886502918;
        Tue, 08 Sep 2026 09:55:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm42560497f8f.12.2026.09.08.09.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:02 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:42 +0200
Subject: [PATCH RFC v3 02/12] kcov: refactor mode check out of
 check_kcov_mode()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-2-dcbc11593e88@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=4314;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=zMSdv79W/28vOlNus87Hr0NP1H4bhJbv+hYzEQlIBho=;
 b=dc+rBp1W+qTZPJAb2xVJwbP8NlsZyRFXM4Sx2H+OrYfUbG/leu3BWxB4V4UE2C9jlKusRh70p
 pgZDfOg+3/aBNHPOcsYwX4To6jVbLUPym3MCTzTQ3ybFpAbQtTc89Ns
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

The following patch will need to check t->kcov_mode in different ways at
different check_kcov_mode() call sites. In preparation for that, move the
mode check up the call hierarchy.

Signed-off-by: Jann Horn <jannh@google.com>
---
 kernel/kcov.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 5d9686c8b3ec..26baccaaefa9 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -167,10 +167,8 @@ static __always_inline bool in_softirq_really(void)
 	return in_serving_softirq() && !in_hardirq() && !in_nmi();
 }
 
-static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_struct *t)
+static notrace bool check_kcov_context(struct task_struct *t)
 {
-	unsigned int mode;
-
 	/*
 	 * We are interested in code coverage as a function of a syscall inputs,
 	 * so we ignore code executed in interrupts, unless we are in a remote
@@ -178,7 +176,6 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	 */
 	if (!in_task() && !(in_softirq_really() && t->kcov_softirq))
 		return false;
-	mode = READ_ONCE(t->kcov_mode);
 	/*
 	 * There is some code that runs in interrupts but for which
 	 * in_interrupt() returns false (e.g. preempt_schedule_irq()).
@@ -187,7 +184,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	 * kcov_start().
 	 */
 	barrier();
-	return mode == needed_mode;
+	return true;
 }
 
 static notrace unsigned long canonicalize_ip(unsigned long ip)
@@ -198,14 +195,12 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-static __always_inline void notrace kcov_add_pc_record(unsigned long record)
+static __always_inline void notrace kcov_add_pc_record(struct task_struct *t, unsigned long record)
 {
-	struct task_struct *t;
 	unsigned long *area;
 	unsigned long pos;
 
-	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
+	if (!check_kcov_context(t))
 		return;
 
 	area = t->kcov_area;
@@ -213,7 +208,7 @@ static __always_inline void notrace kcov_add_pc_record(unsigned long record)
 	pos = READ_ONCE(area[0]) + 1;
 	if (likely(pos < t->kcov_size)) {
 		/* Previously we write pc before updating pos. However, some
-		 * early interrupt code could bypass check_kcov_mode() check
+		 * early interrupt code could bypass check_kcov_context() check
 		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
 		 * raised between writing pc and updating pos, the pc could be
 		 * overitten by the recursive __sanitizer_cov_trace_pc().
@@ -231,20 +226,28 @@ static __always_inline void notrace kcov_add_pc_record(unsigned long record)
  */
 void notrace __sanitizer_cov_trace_pc(void)
 {
-	kcov_add_pc_record(canonicalize_ip(_RET_IP_));
+	struct task_struct *cur = current;
+
+	if (READ_ONCE(cur->kcov_mode) != KCOV_MODE_TRACE_PC)
+		return;
+	kcov_add_pc_record(cur, canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
 
 #ifdef CONFIG_KCOV_EXT_RECORDS
 void notrace __sanitizer_cov_trace_pc_entry(void)
 {
+	struct task_struct *cur = current;
 	unsigned long record = canonicalize_ip(_RET_IP_);
+	unsigned int kcov_mode = READ_ONCE(cur->kcov_mode);
 
 	/*
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
 	 * basic block; it should still emit a record even in classic kcov mode.
 	 */
-	kcov_add_pc_record(record);
+	if (kcov_mode != KCOV_MODE_TRACE_PC)
+		return;
+	kcov_add_pc_record(cur, record);
 }
 void notrace __sanitizer_cov_trace_pc_exit(void)
 {
@@ -259,7 +262,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	u64 count, start_index, end_pos, max_pos;
 
 	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
+	if (READ_ONCE(t->kcov_mode) != KCOV_MODE_TRACE_CMP || !check_kcov_context(t))
 		return;
 
 	ip = canonicalize_ip(ip);
@@ -379,7 +382,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 	t->kcov_size = size;
 	t->kcov_area = area;
 	t->kcov_sequence = sequence;
-	/* See comment in check_kcov_mode(). */
+	/* See comment in check_kcov_context(). */
 	barrier();
 	WRITE_ONCE(t->kcov_mode, mode);
 }

-- 
2.55.0.979.g7e5102b832-goog

