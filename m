Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646247;
	b=ibAOZYLZXV0RRGoGDjlIyblh/RTXUlbF7hp1nKjS+49sxhwCKeCKS8ragkLNlipwUjvC
	 MiquZSkTGVQWKDFLpZArWEBWbMwzGtJgoWBG9fwTgoGeLmmKmIw511rxEoMSZ8CRe7sCT
	 Y/3MxlO6ueJKfcdkvQCTJKARJAhzrj5MUW5JWdZ1gKvv1gfUL0B5nr0RpaOqnKMEfygVF
	 PaghkYtupNfMP4qlzVa0rJ5I8uJKfqWMWnpVJoVHcaUMd8KRMPDn1EVmcWwxoQKX79b8o
	 GQkvCFlGE1hawOMdmCBfQcZ2UPdinjhponB/OagBYULYGH9FvFdnTahKeVaBIOO/Teg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
	b=VRZ1/0zY2Re/kz1UyoOdnDkL3TdU2KhJLRGbvgI6G0Be//VTaw+2ViLOBt1DFp6eexWq
	 72UixdZDdeeNapDE3XpmYN1DtlDILZCF905EAQr+aXMszllybh0ZgVV4irXxGn1iyHfV/
	 HMr+7JumGmZyZdQlIeZonkTy1xj9/ZCKG1YMC+QtOCt3sgXhxWBguHsDZTXQ1/T7e5Bm1
	 4H/D+zaQqoEh3aIRfoY1gcfAlOxYv9Ez0mkR6B9wYcFvhgp6W9JodmwBcQHIgT4yWtBcw
	 nbTDBzJ+Pe8Ks/PGywgkPYokeHyfK2A4+Zz3vNFe/1NNPL1rGq3EytG+ichqlQNCK6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwrSKBY6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C687606A31E
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C687606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwrSKBY6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1df146015so10968285e9.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646245; x=1793251045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=bwrSKBY6ZK6sep1A1/edPyuVrwzzAzdcN9fqrnOw+Re/YdYrMnl2k67kmOjEH6LMck
         v+N6kSRxrmDLk0vkPzc6161GEikxLLe3kmjWpf8L5VNSSJxGzriMuLWd3Kx4vArB/YEr
         Ov6PgxCiJLqs8YfaGQYg6fwTfxCbI61mzcSdQWZBocvhg88IVrrfNI5suIncqbxvTt6k
         qlFIJVymuM9wclaBwuu/MzahHlBw6c52n1KTZJ6jnlMvfr9oaxej6cuJKMq4ZkspNhCC
         KcwSMm10fDhDT1arIymqA0B6kpke5/gTEGnyaEjZF2PGb/gyO8gvzdCkKJOfH9TFruUu
         F4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646245; x=1793251045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=j12MIYm+6IdbVWFt8h2IRUIgNLEkdSc+jW9rufgzgnS3KCafJtE8aXsxzXwy4C38nJ
         5JA43Bi++z3QIEEJtF4CjwY8r09xEEdXfeizuMFBbDXtDNdfk+yA/91SwFsQdG3+x0x2
         q3rjImKiQMh61lIKo11ZueleVUcd+VNqV8GGRDSze8vWX2t5cJhEzp+v47oG4EA6JD6H
         MDNHI6MgJl1jWW6/xdgVlOdNPGSy6TizUhPWK7W8iPhPBKLWdKBzbHf5hD3OiWQ/mIQl
         +cTtSs4oRmmE/Hswly19gCPnDN2CNURbNBq6WYx5U2y4TVsD6x8s4ilAy/i4FZDTnVBs
         EAcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtA7joFFZlkgujRJsWdymnod29e1QKRNzh67tI1JDM8vxf8MDCvnUDZqEkjCrHOWNMq9io@lists.linux.dev
X-Gm-Message-State: AFq9FYL3x3zNEXb28J3A8xShvxTz8NM/d+laW8v19qrsEo3T+/7ewATg
	KBllzHFz99Zi0WBwqBqxXgfTEUGaDZsuH/afi/2ca0tAGuiYHNy1R5r1
X-Gm-Gg: AYBFou0vbHwCyN1UKQlB9NS67EzOB6JjlBhkI3ZjeElZjFHd40n2+mTkx3/4wRjStpt
	SLcyVvkqwpylX2DOoTZibIpw7qKoA7ugItVDR2bVXmO8qXOaogUHMnnKrlHu0utYR51TzjOGdM2
	DmCC1aYoWVbwp4WGp5ig2dAUvv8pvMRq2IJ7m7XUj0nuI9Vpe6EG5ngUhNj4J2w00cyhZEm6k6X
	zMB/X/+k9ATLoJkQM9cS6fj55wn4JhrxRv9DGm547YKTKy20wPZOlWT+fBqyuqtouaPBKHl8sg3
	p73yQmO91beW48BFfKOg5ZVPFByt7+Fh4MNHhqEgycV5TAiOwXk+f7iQpppsC5Pe5g8DgI8EyiG
	3TZycsuBze+J12DWACmC56C+5TdDVRPNjYZk6NVlojvNeYQCFjIaovs7IoXADXJStkUP80hYJzK
	Z8N36o3U8VBiB49cVBs+BKP0/ycoihEWFv+ZXJbEhEGFSsLIFeYJtm7wPHT4ES0pPg9jSJW2GPS
	yTLl+dpLq7+yB0oncHv9RXW+EAtH6u5916zMJTLJBlktgIfKTMQxCNPQTZOeBoP3xIU5I//ia9G
	ZQvA8NJPJKERfFGHc+K3oUXo2S4+9bx/Xux7z3lKqmy+I13BpVodGlPJVHCZzy39WlSEtJxa13W
	LItgbIYtpMfi0cARxhNDqNTu6ZfAAE01MC6ACQcMDFtkwX4kIEmWv6jI+Fsc=
X-Received: by 2002:a05:600c:4f50:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1fdb079ebmr98097255e9.10.1792646245241;
        Wed, 21 Oct 2026 22:17:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 04/12] entry: Skip inactive IRQ-return reschedule calls
Date: Thu, 22 Oct 2026 07:16:46 +0200
Message-Id: <20261022051654.79224-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irqentry_exit_to_kernel_mode_preempt() calls the dynamic reschedule helper
when preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 3ee80e926a17a..24c2b9fdff4f4 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -487,7 +487,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)

