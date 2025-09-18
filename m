Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443AA3101BA
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204363; cv=none; b=TXtVDyTQMPMXEOtv6G1DtTDPR6W61hgJWK3x+V6xtfV/l9fd8cZhrdSIbn0sPPxYV0qQh2xRqlH7N61C3OJk0rKFyJDaxkmpytt9Yg6Z5pm2dYVdGI6ZTNoBHHcT8hwCrumihCIvqIn9cIeEY+ye8ZiH/xzqralgrdMCBRbl5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204363; c=relaxed/simple;
	bh=/5HhdQcxMvAGlf0Tsk8GdQh2Mls549x0+PiJde1VHsw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IZfaLH7evEKpQCXT16sqkAY9O2844TyCVJ8Rmy+6t1Yg6S8sex0PDf9TGUWJhcE4MuLlfM+xl2QRxjutoayvLSgibcCyE6xmjk+GJxVfMxdxeY8kvABN610XF4jJYzU3eJdF/zO8tOFAbrEZ8BkW47nIYG7GIOdPq2FXVhjwTcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qru6GewL; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qru6GewL"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3e997eb7232so453687f8f.3
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204360; x=1758809160; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lBqaGhUvOv+7EeFvUiY/U7KvKRahgMMUHhFj4QhTCc=;
        b=qru6GewLk2QZNPkLL+EcmCx4ineO65dVPj3BoLhGTRyle9vO2zdN8XaK3fssXuZR9I
         0MVyh55iTQZHmajSKEyMuc8Afs5KgMszTBDZPyNvfs4bXZEXTOfutGViR5FBAOI+S/XN
         NnX/+NGdf+CmHuTQrI/+aXWCadONqH50xh9NV4WmOZKY/M5a7Wg7bqYRWKcYNZ+6CsC/
         Hu+uVq9X6Jq0xwuFx1D+cwUszg6KDbegjPIUsK9AB2NXrY7O+zf3ZTkLbXK1AXiHk6Z8
         yvzVqrMe8A58SLAbK5tulqhbuEeHrGvP4bcWTvbpmI1sKlbwZo8itZCWhOr5oX1BttoO
         zG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204360; x=1758809160;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lBqaGhUvOv+7EeFvUiY/U7KvKRahgMMUHhFj4QhTCc=;
        b=QQYMsTUPHmXLgylOkwCHDQdF3aEGPuszSyC9juLWma8wPc1iwBMgiqsmEZA5nYTvnX
         70cDRag2y/P3q7N3qT2mkt8YsQJLioClrtuTlU6QnrpC+4NSFY6LV/wHVT24LRq/2995
         EvgpKb3pAOTtvuI00+U4cQpfffWWRxFU9H6Q5CBv5GlL9VZUakqbysWX9AQkmJmRyVeQ
         l7/viViA8t+IgNa73r8KgNiNqaidKsA9i+ovyKSLz/1y7cuESXVCW5ue9LjhvYb8jy2F
         5+Bc/tVdtDVkecsMhmALCvNfCj9LoeGk4H6olsPBAXE5vcHXk354TKnlZfcPmltjkZq5
         DnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiED5zZj6epmP5r2SLOgRiATlqe6EE0mWBjRDBg4+JWciA01Rovqbq5yq7NDkTakg2Tp2J@lists.linux.dev
X-Gm-Message-State: AOJu0YxX17RAoYxJQ4S0NLZYl1Dv5JjbJxQHj035LR3BkG3u0s2q3vWj
	aHoCAXFwwVfI422XDdGjxOyKwx43gh8Nqdwr04v7PLd5aismW8sS7CW1CdKcpjpo76LweBRUOop
	dqA==
X-Google-Smtp-Source: AGHT+IHiULKUOB+EsrBDrVl5HZcjneDq5C1ugpdpG+JWPfxVb71lR0xGZgLTOsEBDQp8WA+TeuGcjvm7Gw==
X-Received: from wruk7.prod.google.com ([2002:a5d:6287:0:b0:3ec:da84:10a4])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40cb:b0:3ee:1461:1659
 with SMTP id ffacd0b85a97d-3ee146119c6mr1267126f8f.31.1758204359630; Thu, 18
 Sep 2025 07:05:59 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:23 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-13-elver@google.com>
Subject: [PATCH v3 12/35] bit_spinlock: Include missing <asm/processor.h>
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
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
2.51.0.384.g4c02a37b29-goog

