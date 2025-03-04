Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76FD203713
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080361; cv=none; b=c8d29TE0Nd404E7foKjtqc7mRnrzKrKhgV0SQ3L9fMG9740KpVZm10EXXD3ZjWvqOhhIeGiMuF3sNAEca1YozlIZDoueH/f65fPK3umSgXIfV3voVzbaXCsAMeh4daddk0DubkleIv+8FxTDEPqCMfQM4cxkerAI+HXW76Kc86k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080361; c=relaxed/simple;
	bh=lUYIYSgoA2ccoaBS4kBmkDa5sN11OxStd6T3cwMJmGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XY5eYbcXGM2JSSPe24MWCQ3OeOK6xl/7v2NCdGJDaLdd6I6BXG55os+Le7tDneJoZs1gLDJUMiP53b3RVMfrcXldkB8di3ZEhOEs9DiZw6ZkHW4oU+XfneBqDBY7ZOV8acK5XM9v8MLmgmJzNjkqWczdwqCykgt8kM4KVz472vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=or1gVRrj; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="or1gVRrj"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3910cd78330so747825f8f.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080358; x=1741685158; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNf/nM4zXVueSeYIgASkm7nQo4wF4e7ceuZttNxifgI=;
        b=or1gVRrjvnlZ45Inq+atBMVhDi4p/vSDTHKBVgf6/zn2RlIyZmgreRW3fkrNtLP0HQ
         wCbNrZjcU9hO69HM5s/2Dz4wqyCqs2W+AVo8Zpon8FcGcZKRHHkZHgydPlY7zQEsw+8z
         NXVKrFT/vaC6jBR8jAtFUxOT6Pf8C3j5FUNWogN5st6l5EBCt7Nc3QrjwkoxtqDM61J/
         IcgtEKxYDsqJyce2z3ROKI/0ufAaMLTmcaY4KNpanO3gcQXF2b4eJx7inTL4H8K16nZk
         I7Mdc8XCkAVYKm+UfYzp97Umto9i6Hr6U72fsyaMTVUd6aDxnfJt4nmMnHcSI1fmXlMR
         Iqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080358; x=1741685158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PNf/nM4zXVueSeYIgASkm7nQo4wF4e7ceuZttNxifgI=;
        b=U/tG2FtWfHS4+YorrAc7l5CnIFaZygVJLCVU4NeVIqCFisA+PbOx6KkCtojoBBRlwF
         qOPco/tub2MCvuBb1o858FqXkvZEdVP9YdRT3/HSMknBv8G6LgJRtqTr+av2cerqVOzc
         G1cnx3HTMaFFev5SuClSFCwQkILiPrfZkrTyUisWEXHSg1xxgYqr5wtbZynHXkmZmyKM
         M/7GvBgPj17rXuf/0iCq+d07JbaRcwAKCfbXuEOzXAZlMYAyTKX+5bV/OLRq8JwKvX9a
         wqVwc8te6on9rRW20i8oqBit4hNCHYux7v7HBd2KLi8hAr8F0vpUyfn3A+uNGBreW4IL
         /hXA==
X-Forwarded-Encrypted: i=1; AJvYcCVYNmK6zvDiXAVgA73hOAWAI0EW/VQrMUPDOZB3p5uc2dpXgDl3zhtRj42hAhGKvXrw3NGw@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw/K+3AgJi1l+jeybhQWnil0TAliTYoWWcxaDbjhibB+0mevGA
	GkSkEaHMVM6cIL7sXhoLNSHQIGPnULtEkacWFRTBXvOcgo2QPmXHIyYy3pP7muzK6y9D+UHNVQ=
	=
X-Google-Smtp-Source: AGHT+IHNV2rVLk7DI7p2vN5TAoqWsmdPeX6tGGapgde3jO/7IaOi1K3xi+RVcuZ51YKSvmN00fSkAHnG5g==
X-Received: from wmbbi24.prod.google.com ([2002:a05:600c:3d98:b0:439:8c33:5ed6])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4022:b0:390:ffd0:4138
 with SMTP id ffacd0b85a97d-390ffd04350mr7740206f8f.24.1741080358018; Tue, 04
 Mar 2025 01:25:58 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:17 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-19-elver@google.com>
Subject: [PATCH v2 18/34] locking/local_lock: Include missing headers
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
index 8dd71fbbb6d2..420866c1c70b 100644
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
2.48.1.711.g2feabab25a-goog

