Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0872C35970F
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651571; cv=none; b=nGRUdtqIfmDFutFHriTuiRV189o2LjG/lR2G8rLDVpRE21m6DbsPAUI6cv5UIKsdPFbJ9pzGb0dPhA9Gu6frY+zoFar085Kzz69bOFwDChQ+kfZV+wYh4y/72bRH6K8UhBapLHquk5NuhZLKmPO2GhlwQBIL4kZ/LvM+2WjCAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651571; c=relaxed/simple;
	bh=JsRVhDxMTESFNC0k9j5iAV1EVftZ5NwIrNhmhZrLX5Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RHGVbECMroXAa5kz9aBF6JcE1zqnodNyB74B1mF4xCvd5Qj8lru2LPd1647ThREL/rAOPuJk15j8bn3dS0Ia6aJPINWNTmb3aP0jRpxfFqkfy4jlwZ8juRtRSKhmUduhz/R3D6KcwzpC99CvSml1QS6YZs4SnT82u9ibXM1a/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4R1BrUY; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4R1BrUY"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b3ed2c3e3so1087906f8f.1
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651543; x=1764256343; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YhzmKujL7bNVWf02jAjaSOrp3urplpV1YekSTYKrBiM=;
        b=E4R1BrUYt5Xphwd1+ORb472P98Dhzw7W43beq9aINMRM/W35ZIam+wPpkoDz8b93nZ
         x1oDFhQcf3ZqIbeHUcNwohvmkImxlN5+UchLKUy4vscU2QHy2lN2YTAFRkZF4MR6DEYv
         RAhqkJPX9x3V0Pf67KKcsIYb7n3vNJ2QfnVz2amNESmP+3Qvnbo+D3BIr+6UpOzxzOmm
         wEBRUA7LrKwjjAtd2sGdk0hNDbxCL78AYnLPcjrs+xtoolu13pflHcld+ip5Gci/u5RQ
         qLBGdHb/zErcH9NdZa8op4QaTYOj9uiHuvbRaD/piyiEdWJRPdO1/RMQurUPvpr3s/MO
         s+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651543; x=1764256343;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhzmKujL7bNVWf02jAjaSOrp3urplpV1YekSTYKrBiM=;
        b=X8QxUClzgV6GS+2fGgMTK8vqf5pPAycDy7N2i1rtPJjdGO07iUnD0GFpyMKN08Dt04
         VZP5CnqZ0FecE/OH9fGP/QRnSImFZTBDD9Vd2sWE8o8+7rTIj/ll0PYFHPF0Bfh/P/Y3
         PejTI0PPo3leYt8uHj+3Zzy26vX7g6ZlbrGrILS2DCYh/SGvRf1WrOh31j9cngahhB4W
         I/V5WDE74Ru7BTZPV+ROx2IhQsTXnd2MFrBaZQnRYOx9xDI8sH4ZUYdlnRlIQpNwSPqe
         mg492fNU/VUtKz/r3dE1km8heY2CIkgwT6+y+aIs92N5mAgU2yzJMW5G+EnFYtGnmQdK
         lY+w==
X-Forwarded-Encrypted: i=1; AJvYcCU/MWFMN4UFHtDa3qlBQzEQhGDtfvoA0dhHXHwq8r3kolhL8lQuAHcblibfagsN3EZG1hPR@lists.linux.dev
X-Gm-Message-State: AOJu0YzRJLxIPYUf35J4yMlO1Hk0wukcv+qN+LVpTEaHifdaG0tMDuiy
	ON1jH2pOTfWAcSeyxsV+OMpowN0QE/ANWDboAhajLwN9pEYMVQdgNWFMeG43wEu+7I8NX/6Il/k
	I5w==
X-Google-Smtp-Source: AGHT+IFL0EI2FVZUMy6GZbaXFPeZWxMdszC7G+QJPxJYJ5Tt54juOMlly5lP2pxtgOuHE3Qi1fA/jEG3bQ==
X-Received: from wrs17.prod.google.com ([2002:a05:6000:651:b0:42b:328d:1994])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2287:b0:42b:3bd2:b2f8
 with SMTP id ffacd0b85a97d-42cb9a603f4mr3376737f8f.46.1763651542984; Thu, 20
 Nov 2025 07:12:22 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:37 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-13-elver@google.com>
Subject: [PATCH v4 12/35] bit_spinlock: Include missing <asm/processor.h>
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Including <linux/bit_spinlock.h> into an empty TU will result in the
compiler complaining:

./include/linux/bit_spinlock.h:34:4: error: call to undeclared function 'cpu_relax'; <...>
   34 |                         cpu_relax();
      |                         ^
1 error generated.

Include <asm/processor.h> to allow including bit_spinlock.h where
<asm/processor.h> is not otherwise included.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/bit_spinlock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index c0989b5b0407..59e345f74b0e 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -7,6 +7,8 @@
 #include <linux/atomic.h>
 #include <linux/bug.h>
 
+#include <asm/processor.h>  /* for cpu_relax() */
+
 /*
  *  bit-based spin_lock()
  *
-- 
2.52.0.rc1.455.g30608eb744-goog

