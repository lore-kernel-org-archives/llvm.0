Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEE34B414
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159201; cv=none; b=r4ZL5yVVQjQ30ULvM8ALGULNMY1sv7h7VFdPEpxGPJJS8r69fhaXrp0dVjBBAvVgu2RtvokHE+huauwBm2WiK2/IyBVDSSHhFAvH/kT2TP3MVA4r0txi9346bHZTyQumv1kx7B4NF1Aoj8kvima9gfc2iVuHfMVleDd0SsvaFyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159201; c=relaxed/simple;
	bh=ZqqBArB2yoGPi5pRLFHBWVfZ5IhyubnYslnOT+L1Eto=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GZPl+fCy/v3H80eqNx0uVZ+Oc2QwIrp5aaICfcOTYXCKZ+lYmyEJs/2fje8EwQrWYHDb8r2Zuz4qxPm4zK2Z2yX5qYilh2rbduGz/0mW6xXb2wguXvD3scc94pzYT/Mcy7TmI9kc5Ng3kcGqHnsSXRL2oXrO52VYKd94h//SyyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bx0lAYF5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bx0lAYF5"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso12101625e9.1
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 07:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159197; x=1766763997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnCWdNxOjiV83xbv6/Q1ySENLnYMSFtAYAkCgCH7C/E=;
        b=Bx0lAYF5k36Hxp/zC8sZOK/8CEISD36XFJ8o4V5uWLpyKv7isb13rNuheGuypw9MhK
         tHCJafU6eNFy/RVAclU8RlRSz9tVfwXzy8w5BYGZwSkMDGMBourdokbh5/bCSfg5P1/g
         yj2iYS8BL83xX2hmXsL09P+JR/bDUqjgBfXgq06ghVfrvfkBB2/cLfjRVpYHzBzp+oqD
         PMjii5ZWZbsyNandGMKsoxMkqzTvrN+ihC5Zm3ZicDkG7KCHaf+1SOuMelbqrZ1x8/oD
         N+7I0t9zVmyP3zAHs9psQvOrXNFZ4Q8X2SJx+9UqccGYV6DGsOG0bd/MbCPVz8p8zP72
         Y6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159197; x=1766763997;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pnCWdNxOjiV83xbv6/Q1ySENLnYMSFtAYAkCgCH7C/E=;
        b=aW/0eJPQZp9vR4FXQyeCRGNrX6FiwbflM87Te/xdCMU1tByIV5leZ23i0TlBDy77hQ
         7fnSWf55tDBb9R4JbgItej+KM8SwWyL6wNya+BaN5lWk8zJimNCHxsmB5Lp0CCet/7X9
         h0xyTn6YgP0gA4OfnAGeJR6kGiMja5TiurSibJ6W9bKNBMIT9Es+Cvhs6t7dG7G38aBb
         fzd7tH4V//1Yy37ekkvJ2aR2aZa55Ef7h5uUCLqBhZ/TFsK3T3T+NxieJGsWZbrmZWvp
         IUil8O8EAH1I3KaR14td2vz1Gf2yiR4uRuGKAr2WqJhzjCLJEScRg6VsSb9V1ektLMxu
         EEMg==
X-Forwarded-Encrypted: i=1; AJvYcCW7N0KU98e8c4i5abf4Gqb6TYqPUxF+ZzRXm/Lc5Ype9s5W7zRdYejt9KiRijL+AONiomCg@lists.linux.dev
X-Gm-Message-State: AOJu0YxhJCAWYzNQN/J3EOMgMhu0EQcWGuAQHA4M49SXsNrbDbSGZrxg
	y2ji5ir26UUOB82K5Uojayu+FbR14FWUydIr+W9tyBxJP1u0kVVAUT6IbD6Faa1v4Afm1zL8hr/
	2GA==
X-Google-Smtp-Source: AGHT+IH94p9GxjeE5eZFV8DN+RguEekXTKbRPlnErvQrVGXfEBJeQJYNzzYoe3WVGxRFHI0q7jnGDkVIDg==
X-Received: from wmcn13.prod.google.com ([2002:a05:600c:c0cd:b0:477:a6e8:797a])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:888b:b0:477:9cec:c83e
 with SMTP id 5b1f17b1804b1-47be2999667mr56775795e9.1.1766159196727; Fri, 19
 Dec 2025 07:46:36 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:07 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-19-elver@google.com>
Subject: [PATCH v5 18/36] locking/local_lock: Include missing headers
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
Content-Transfer-Encoding: quoted-printable

Including <linux/local_lock.h> into an empty TU will result in the
compiler complaining:

./include/linux/local_lock.h: In function =E2=80=98class_local_lock_irqsave=
_constructor=E2=80=99:
./include/linux/local_lock_internal.h:95:17: error: implicit declaration of=
 function =E2=80=98local_irq_save=E2=80=99; <...>
   95 |                 local_irq_save(flags);                          \
      |                 ^~~~~~~~~~~~~~

As well as (some architectures only, such as 'sh'):

./include/linux/local_lock_internal.h: In function =E2=80=98local_lock_acqu=
ire=E2=80=99:
./include/linux/local_lock_internal.h:33:20: error: =E2=80=98current=E2=80=
=99 undeclared (first use in this function)
   33 |         l->owner =3D current;

Include missing headers to allow including local_lock.h where the
required headers are not otherwise included.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/local_lock_internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock=
_internal.h
index 8f82b4eb542f..1a1ea1232add 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -4,7 +4,9 @@
 #endif
=20
 #include <linux/percpu-defs.h>
+#include <linux/irqflags.h>
 #include <linux/lockdep.h>
+#include <asm/current.h>
=20
 #ifndef CONFIG_PREEMPT_RT
=20
--=20
2.52.0.322.g1dd061c0dc-goog

