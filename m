Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F3B2066C9
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080404; cv=none; b=Cz6atzlSRcRTztgjWJscmC95sNY/77WowCwFZ4QbOYuozdkH6mTmRDjkjtztR+DNVCekNnS0Bc1brDVAqTXXGJ2KoINCkWWNDTSbcoyHRm+XyVLweCn4zj3D3XJR3b8HDP2/cTCn13RoyXszT8z8zX6zdQnncZsoBKlF9gbG3Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080404; c=relaxed/simple;
	bh=Pb5v8XeAHlUAdU8teJGT/joxk1D2UYCLbNbcthK7dEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PgVOvvKiGrU/NXD99AUyVy/YuSrIIrDxon0e56YRMmzAr/+xr07QxjcBL7lhHzgTEimR3w128aa2i2WavObHuxeA+bbE4nOEU4gXLBdhYBH7xOMWbhQ1Lr0Aae61aTDZddQ3X6IFLSVvBLOUWmyyvqIV9NatQOBkhsRtgupdZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V8I2IeZR; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V8I2IeZR"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-abf48e1e70eso288416166b.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080401; x=1741685201; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vumk0HTnchdldWRc8wT0cAdQjFLn1MfJ3/QC5i3Nw5Q=;
        b=V8I2IeZRjcAbJAYIV75I1XEQ64XlWu+dAnF6oiG3eX5PZUhJ9P8nSmBuo7fDH/zfAg
         9jrUF55UPmHU4J2Rgrq3sCt1jdPX7xdMyS7p8g97E5IOzLGvBgnl3WYxjCrPTcm9R84/
         nHsezT36kKIsPVyeUsMuu+Rkt4RBlU2WDZdWL4hD2tW0F1BQQr92L0KycGb9BvWuwoqL
         jYTyWPaFVrEQy/B5y8VHW3TQczmn3QrR4mRz+EBFRAwZsLlw0BgTa2lO1VxacVytK4yb
         tEJg9N/RZTojRULEH10cTQ8lYoGOJnD65MffvXZiD8UuRKw6SNHwx0LyBhle2IDILIeX
         ts8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080401; x=1741685201;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vumk0HTnchdldWRc8wT0cAdQjFLn1MfJ3/QC5i3Nw5Q=;
        b=A7945iT2jZU939MqYg64SSUV2UdFInHPTwYGNUjUwgku9/vQiCdcQ8dF+bV07daG3Y
         RarcCY4FNzLxqdeap98fKSQWgCFGCp/tt85rz8h5XYF54zlUJNime9o5oqEIOglpGyb9
         x2oAn0/wa+9esL9U3/nuqI5KN5H0c4ApHbZT6TFiVLKt4ty5bWj/mkQBmiv36wzOkBzo
         921pWE95gVpoVFrEpkbzhLj2S6P5yoM047wPwCyuxn0KIgR2Rh8yQTdFrP63JxtV+V8R
         zSM/US/EfGYstR1d+z5S4DOqwHJDA8VtR3sgraYfVboJifU+xAJXTl56vn2LasUDm5+T
         A13w==
X-Forwarded-Encrypted: i=1; AJvYcCUedWn/7MckZtxOSvyfklrzt/17eDKyIUhVdMMc23DLfb4LKO9eppoB2MxNwkbxw2qWeMvB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx561lYF98nZyb0MEfkChBH4zTgPrN6lcYGAj9f2hUv0JI/z2rR
	pJm6GNRjsyU/9sV4HvDPIfA/xDMaK98hY1BIa0lWGm6kEGr4/0eppsh1xJqOqoPMeV6kxIPfFg=
	=
X-Google-Smtp-Source: AGHT+IHe+2tTUNkWh4sjbCTVRn346FQZX3D8pl7o+PzR8CFWDsL38sKG72bCeLReMhyKEWhXvddJVO8sWw==
X-Received: from ejckt25.prod.google.com ([2002:a17:907:9d19:b0:ac1:ed2c:ab54])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:7fd6:b0:abf:46cd:5e3f
 with SMTP id a640c23a62f3a-abf46cd7414mr1245962366b.16.1741080400857; Tue, 04
 Mar 2025 01:26:40 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:33 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-35-elver@google.com>
Subject: [PATCH v2 34/34] MAINTAINERS: Add entry for Capability Analysis
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add entry for all new files added for Clang's capability analysis.

Signed-off-by: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..cf9bf14f99b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5638,6 +5638,17 @@ M:	Nelson Escobar <neescoba@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CLANG CAPABILITY ANALYSIS
+M:	Marco Elver <elver@google.com>
+R:	Bart Van Assche <bvanassche@acm.org>
+L:	llvm@lists.linux.dev
+S:	Maintained
+F:	Documentation/dev-tools/capability-analysis.rst
+F:	include/linux/compiler-capability-analysis.h
+F:	lib/test_capability-analysis.c
+F:	scripts/Makefile.capability-analysis
+F:	scripts/capability-analysis-suppression.txt
+
 CLANG CONTROL FLOW INTEGRITY SUPPORT
 M:	Sami Tolvanen <samitolvanen@google.com>
 M:	Kees Cook <kees@kernel.org>
-- 
2.48.1.711.g2feabab25a-goog

