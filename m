Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC111368263
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780369747; cv=none; b=rwqLYVCZbEu0KecrJdUQ78kmcKXfv6abOzXHYaydnPbHREVTou7Q9r8cg2LaTm9eVxcgmVh5kXUVMDDoL307OLmNBU5n7d6LzHh69hvIDCKXwZPYiNMqnpn3boesCt8GVZ8/dTLmmDklqlAcCadoxmLLnXyt5/tBdgm8K9RmMJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780369747; c=relaxed/simple;
	bh=S+5yjiqdurSwWGV3vZL82sGJRrRg3cT3Gkw6FXUX4Zw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NVzdWo7pqV876dJY0ChiCynpNT+5dso01lWzFwNQz17fUFYJ19JPuPjMUOmodMamBlHkzq4xI0rCls9HqwOEcavOR0qgzq5AhAZw6m/SzsLI6gmQ8Fr8YJu0XHZ0zbbWWYaZNqBHtzbH5ck5HCK2uGB5oxmaklQmRtu6CDYYkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8WEmBM9; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8WEmBM9"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so707938a12.1
        for <llvm@lists.linux.dev>; Mon, 01 Jun 2026 20:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780369745; x=1780974545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6//D+s1eomSFlvy221abQe65GjmCnQrDuYTvNngqlI=;
        b=A8WEmBM96g984FwvVULLH0pslHyYZV913QaMFxg84IhNQ2GYVHQ7YjhK8A7OBYs7Ai
         g1kUnH1ysvaBY8lhda6GUK5F4TjnLJftjy58gwV+ziVTpOAuwwrmREXg3HQyf+SqPnY5
         1FYsvYfl5HVzMwomese9YVOUVGG2B5Vk2P3btl/I3b6nA1EnLAGUrs85IYqEV9HqRf4e
         mPnJ+IpKogP3dGg+pt2QOcVJ1BwbFDqbtCenM0+IYxbqIXa/3WTXYg6AeGhWRzUjPGYO
         PrR95U2nk8/nnzHz5JPU6g37YmgGGzIW1JYrEsUBm08yfhM8ebCZZmlBjyzCoGhPxddE
         8M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780369745; x=1780974545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6//D+s1eomSFlvy221abQe65GjmCnQrDuYTvNngqlI=;
        b=VQ2nU6TFzsAtFaSA39d1GP4R2mHZ4kM7As2zdVFEZKBJl/yC/XjrXkqZDMMt4F6p3P
         CLQ5F0Iq/v5RvGdkjOnRu5uobB5dVZ6yfeCFLhege9uQ30uJb6tOBqMZRiOfHqQpqD7k
         GboowbcgVD9/A8QKspcKjMrz5/xfRrywGOIjG/6AIefqaR7LMzre0F4bCqocWWpfDMO5
         6uzZazNc5enVYKjcFL8e5cZYdrTAZQuEjckTyddieOShi0Yj9Uk6rzX/C/9leo/C6JdD
         8jnzjwSdy8Nwyv+Zi1IqUreIZcHvuio8xOudqJ9B0fk44yvn+P8UZAU+4GB3esC8ICFO
         uckQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yaeMt1RU1eb+6EOpDaLrlV8apfsnr55Q9gEh+cRKhRD71byOLefd/ciqe13XXCvs4czoh@lists.linux.dev
X-Gm-Message-State: AOJu0YwWvc/po0k9PHd3kNelcvhKFfZjjRyZPRR0q+xUbn8LYojCpOyC
	yweE6pBqgfB2WQKNWN5AMvCKszmYJ0kcpM3UfkjFE4bTE3VD1WkL9eck
X-Gm-Gg: Acq92OGzX9dlztiedtIETneS7j0iBZfqh7fJ29mltcZEpUTzDnPG4F6C6U46b9FO1Ux
	8ptORzfmCzO/hp1F3vpQYHtUmvehWS91mS2+2uOcy3d8xnjS0SAx56rlqZsz6UntwMupE1ftWsr
	930FaBuSxO1PMpaRZqtIwo9Cjk3mARb5WnPWsh2XIywGQmKtAtXfICWjX1rHblvrX7igmTJlf4E
	ARFUbZBi17GBLJ/VUGQcomW4VX6vqc3vXfNjDnK16H1JFOyJxyVymlrRgpKU28TP48o0mfpV45p
	rehn3b0KGL9YTVFrnQg4U3lQpUPexZF8+U9hLwD1eosLDbblHuq2asN6zEpNQso4grtVHJJz/9a
	ybuCyniY8EsR1DNN55MCcAzPOEukfzJlKooQN7w1Q/l9LJGCOKDxeQAhf81CL+/halkX4XsnE5Q
	uD5J6QRWYI4xw8b0eW9XqsdNMt2T9atv5Kw6KUjeWSuJo7fA8rM9ZRV3TnxZre
X-Received: by 2002:a05:6a20:4389:b0:398:7ffe:472f with SMTP id adf61e73a8af0-3b427bc7337mr14542220637.2.1780369745002;
        Mon, 01 Jun 2026 20:09:05 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85861d5fe2sm8836799a12.8.2026.06.01.20.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:09:04 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: peterz@infradead.org,
	mathieu.desnoyers@efficios.com
Cc: dvyukov@google.com,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mark.rutland@arm.com,
	mingo@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com,
	tglx@kernel.org,
	wangqing7171@gmail.com
Subject: [PATCH v2] rseq: fix using an uninitialized stack variable in rseq_exit_user_update
Date: Tue,  2 Jun 2026 11:08:54 +0800
Message-Id: <20260602030854.574038-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is an bug which is an uninitialized stack variable use in
`rseq_exit_user_update()` reported by syzbot:

BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]

The local variable:
```c
	struct rseq_ids ids = {
		.cpu_id	 = task_cpu(t),
		.mm_cid	 = task_mm_cid(t),
		.node_id = cpu_to_node(ids.cpu_id),
	};
```
According to the C standard, the evaluation order of expressions in an
initializer list is indeterminately sequenced. The compiler (Clang, in this
KMSAN build) evaluates `cpu_to_node(ids.cpu_id)` *before* `ids.cpu_id` is
initialized with `task_cpu(t)`.

This is fixed by moving the assignment of ids.node_id outside the structure
initialization.

Reported-by: syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=185a631927096f9da2fc
Fixes: 82f572449cfe ("rseq: Implement read only ABI enforcement for optimized RSEQ V2 mode")
Signed-off-by: Qing Wang <wangqing7171@gmail.com>
---
 include/linux/rseq_entry.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index 63bc72086e75..ed9da6e41a2a 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -635,10 +635,11 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
 		return true;
 	}
 
+	int cpu = task_cpu(t);
 	struct rseq_ids ids = {
-		.cpu_id	 = task_cpu(t),
+		.cpu_id	 = cpu,
 		.mm_cid	 = task_mm_cid(t),
-		.node_id = cpu_to_node(ids.cpu_id),
+		.node_id = cpu_to_node(cpu),
 	};
 
 	return rseq_update_usr(t, regs, &ids);
-- 
2.34.1

