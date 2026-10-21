Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602689;
	b=C/XAh2Wlhq4BCUIKE4PKAGaJATDh/Arx40Yhwhqn1ryR218FhD5ouxtcnukI/QzrfFNo
	 TQ6/8BY2st2HHmzwiImvYudviYCWhvpHGAImeH2lup7xVoalE/p9yh+BOM0LtzkQDWx5v
	 8ZqE5WB23NEw1glfxV1LfwAhseojY04MHYFbt7AvWuSnKHzarKW6MnBYW5AnfgMew5y2B
	 +9iz2CMm71gvELpxVSTP+Fs1kukbzqaZAACPGLiFRzI1BQyVwYQ7wvS4n+VxXPoNf/Hs+
	 Smsde/xf5G+Lm6cHz6jDxxD05M3Ts2vdnodofGUwp0Put+YCPsxmrcYCMQTqS5O+yig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
	b=YojMckZFFNJbqQdwzY29yJStW/V5Qfc7Y8jrbcdLDzohLA82iq8/e88Uemme2C0Z/x74
	 cJzQOcz0goViN1+kg7U4tGqtitdXDYzJNYSns3R70zEWUCdgWmoTcFr1bM6pjyhvTqDne
	 9GzPOX00fXa7llttUkgF61ffM5dfwg8Qnok1E/d0+tuJy0eTXO1XbW9gVt0pBeDbZdjuc
	 vTbbzWI9prZP3+mWeX4XaUBJTHHDDF3e9zQSuxbeMMOX4unu9xCP8lBejpZJDbYNA8No+
	 48S39QNtKzErPOU6rWLFMZow1DJiaZZfvOTnEIoSCo2TLr+bQb3W3RhmRlTxOp1IK+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cSRFOeTF;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B96606A321
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B96606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cSRFOeTF
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so1723653eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602688; x=1793207488; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=cSRFOeTF71Jxihpr8XsVnUg3vfmBnfv1/V8uquSZmDR7GJgAEYufPgan7gP/gLPOzt
         hvcVsbhJFVAt4MY6u2YkzNvsGd6JLONLIEq4Ih7+a2jMrn7qTeQVwR6uGuE9TaK7jCLj
         9/C926CApYloiHc8IH/C6TBH7EDoWRTt19fvtCWTV/Gz9ewMfn/6eGazlqct+XLd+JQf
         uGJHkthcvwuPJP7Obefq/Q05UeoBn8yvwNDobH32Dl6sZEW99+CzF190n7/N7ifC/J55
         Q4/iwf05+73y2v4UXHNZCROv+WXlBkjpTv4RNCHpWWDdYvAvsTJdWIDN8y4oLOFPRRok
         DK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602688; x=1793207488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=tFCWZsyrEX+wpsCJhsjAmaMv/Y8ub9w3EWjTbnHc8ZSgi7MmTH77iVPmalsFagF4ej
         6i7wyZG1OGFMwUj6WylZQ+Y2Z9YdwvMbiI9//1CbhZwu/pe54Pf1xMCJx/fYN1jgXMv2
         WC7fpy1AK8DZ0PM4FWIVfxWocnWnC7OjORM3ZMdgKl8mtRc6hSujEGiU/dxT6wIWQAzM
         N1UTgFRqpKo0blnkrIJztTnPbh+A/9K1p4kBz+kID4iQ5jNbo+SUvrGug9XUZVNMJlX0
         AxAw71XpLFMGccz5NQ9sXlAZk7BGntSxmIqS7N18wN6e0Ozm/BeV21GeYJuTEodsqt0m
         pV4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHMTOeE4RVg3omu1jm60VcYqXTYNeeqsFyRknLJ7JnQk40o0qi26BOf8GxIoPlYzfcdYrl@lists.linux.dev
X-Gm-Message-State: AFq9FYLgIvNF2Huq9NCvjpC7B/nBkV6buY3buSJQ/2AfMJ+6fK/YnQu/
	cDoF/wZZ+uzd3jdxXwG+h3z9sxAaPoerzz4+RMSi8Lkb/cFCHnvuw9a4GbzJI984h9gjDdaaAXc
	QgPlrT/vQug==
X-Received: from dlea17-n1.prod.google.com ([2002:a05:701b:4211:10b0:191:592e:bf3b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:ca01:b0:151:8280:2c1a
 with SMTP id a92af1059eb24-190a6dbd524mr3636882c88.42.1792602687882; Wed, 21
 Oct 2026 10:11:27 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:32 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-7-irogers@google.com>
Subject: [PATCH v6 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.218.g1ec904b173-goog

