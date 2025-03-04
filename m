Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60E1FF1A1
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080326; cv=none; b=I746uV5nJSrUOkoRWkAPYVb2G/b527XbFq3CC/oRfOPE45Z3et34pwmkF9e9VGw3coFdK4W/Y6Fl0gbNakzFeXZBwPAN+Mp7vcsxBM+wWGM2idKiaiiyUAX+InUMilkmI2+s2j6QVGQPUEPQidGj7YaRxrslAI0FcI9ggXP4wB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080326; c=relaxed/simple;
	bh=StYpncqzFSXHEYm8ZOW/8xsOKbkMA3l0kvQy8Snle/I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FSxRitt9bk8kINMaUaJRCJujOM7zxVacjhA9zYchvQDa+idkg1593Id+0toTrigfgth5TLfgy5DiGdl8dciLpcMVIXG6lsOHl8o3Dj8qKeJhI/TbwhUDOEZ/VLcE7YJ+fqsRNukSpGuSqiQurCX6GyQqIAUVDm3aCaLM9beUIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zO9jv40k; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zO9jv40k"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e55cf1e9b4so2191474a12.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080322; x=1741685122; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp+E8sKoonvgdGAMVoQXSiL/gMXgRdJZHQEkz4wDB8k=;
        b=zO9jv40kCbFyqufhFyAcUG7m+mudYPjLMTYnjEUSP+AQ0CYuYZislbjQvEOaqvfXT0
         JhdDqkcdzZwCh8JsseGeKXmcjAz/jsMpWThjitMnQZFcEGlvIdUQlzY8fb8E00rPkWPg
         J742fmDm6EFM3MJeC/7ytTsFyDJGiK5Bw+JgkHOGuFmhSP8ARyESRJzWdbVcwUOwZrVx
         d6Nc3vzy0cDFwPsc79ANz3T7L4xyJPyboMcIaeFh4WS4A5hc5yd4DT6VMJbSUuDZiFWN
         kG7K4CvRdfG8iNCDu3exZtN761jm/tq9O18JKiyp+BmCXA9g8Ac3mLPADuYZZwyBNSGv
         9flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080322; x=1741685122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp+E8sKoonvgdGAMVoQXSiL/gMXgRdJZHQEkz4wDB8k=;
        b=rb6WXfop4lOq6jw2HAD9d9JJVwR/Y8mD0uLt7AmBck8Spz9xOP+d4eSZk9LksMuiTQ
         wwMRSl4VInq241Rfhxk8u/EdlRsu49TtBxEA82eJw0W3Yy7o3yyi8Pf8BbFt9JIBC30p
         zUcpoXAnF0BG7drO7RWva0sZ3QCyQqF1QBLiqWauD0AnILu22bE2xAbS8LP/J47Kvm2f
         TocYT2krJi/3ALV70C9x1/udcLYKbtV9iC44Czimnc9KZNcSn9L1FuiTj3mWl8+5pntG
         JxtGhgOK10ZQYbEx+0DMn+s7bW4lY/TV4bA7/iKNkNN8hfkprdtgXfWi/1ZYWlvpk9cE
         Q49Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXfCbXC4/qpw6I3beOFc5TH2jK2fev6gcqFRWOFKm12ES+euICQDhlY1FP6pQ3sD7yXcf9@lists.linux.dev
X-Gm-Message-State: AOJu0YzDMSCTIRQwjErfM9ffZ4/3i+AvN6msQFkbQL9nQSuzGKASpCCl
	HewlMNg1tFPLZsDDZskbQ2Qo1pIZyz+wQvlndV/JBIRbBNumvnoRun6LoMgkoFkg/v0I0xvxIQ=
	=
X-Google-Smtp-Source: AGHT+IH9KyF8MJ1v+l119Ih9d9zKK6oLF4W3jM8vNIisJnYl0p8zp9JkukwRd5xgRYNmt/zF9O2bCVvi1Q==
X-Received: from edpr11.prod.google.com ([2002:aa7:c14b:0:b0:5dc:578d:62e9])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3487:b0:5de:3478:269b
 with SMTP id 4fb4d7f45d1cf-5e4d6b75ef2mr15880706a12.32.1741080322290; Tue, 04
 Mar 2025 01:25:22 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:04 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-6-elver@google.com>
Subject: [PATCH v2 05/34] checkpatch: Warn about capability_unsafe() without comment
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

Warn about applications of capability_unsafe() without a comment, to
encourage documenting the reasoning behind why it was deemed safe.

Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b28ad331742..c28efdb1d404 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6693,6 +6693,14 @@ sub process {
 			}
 		}
 
+# check for capability_unsafe without a comment.
+		if ($line =~ /\bcapability_unsafe\b/) {
+			if (!ctx_has_comment($first_line, $linenr)) {
+				WARN("CAPABILITY_UNSAFE",
+				     "capability_unsafe without comment\n" . $herecurr);
+			}
+		}
+
 # check of hardware specific defines
 		if ($line =~ m@^.\s*\#\s*if.*\b(__i386__|__powerpc64__|__sun__|__s390x__)\b@ && $realfile !~ m@include/asm-@) {
 			CHK("ARCH_DEFINES",
-- 
2.48.1.711.g2feabab25a-goog

