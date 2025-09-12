Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFF2550AD
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757648699; cv=none; b=njBXKizHfmiYsaVHFev6eRLLdHD6JiN+CmyxhiorMAlCoANc3qXSYSlBcfz51L8o4XcFtwd3fyo/VJczWLnAWE5z01E80E+WlOkgwLcos2NMEdSUZRiqPmJnX5+LUqYy2tH38aDOe0Qb7rGAtQWRVGPJ08Fv4w1E/sjaNoa3V6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757648699; c=relaxed/simple;
	bh=ZpxiM4NXhcZmKQdU/kQz5uIyINJQczpioixRluD7LSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwlo32C+gFCGap0F2dYf8bvw5zpa+8gMICCfdYF1Lxl9PfTBsYEo2wjFUXRW3CVDNZEYEgIKidw8PTlQ+iEzMbyRQz0uwvJ0qBhenhXIvOX/BNd1LafNhp+c10H/T3sNgsyxK7gKFr2lIjfYh5WDeIp2cq59arnyzNDBAqEnvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XEvDxzQ8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XEvDxzQ8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so1692186a91.2
        for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 20:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757648697; x=1758253497; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dLXLF/8rG6hnfrvnt+B3nOdP0tZ4TwcwQmPFhduodfg=;
        b=XEvDxzQ8VeuGLp2IlDc+MlbXwFYkb/hxBfeXDZrsPB5LVN9l1p/1bf6l0olMuo/xiE
         0MAmxtvXVZoRpON0qViAyk2PFY84Q1u0KhIBMeAtz2jcr/NE7Z8j6wyTytn8rHxjVlBx
         GXr+hWfLh2lz6pVcX4NgDCMjEuCFnPkdT9Np0SMRu/zEOle+530F3Avnu3EQlmDKHJOL
         TIc+Cfz/I28X7ZDllsjACTmBKn37eHONZ4Vfpn5SyUt0SgfRn8ghFyIirGl5oDl4/FsO
         VTDGSZwlw2Y8018Ey03XNWoI1BmQj4+Pa/U17duqvAUrFO+IyELn04+PcxSjqjlZr5PK
         u6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757648697; x=1758253497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLXLF/8rG6hnfrvnt+B3nOdP0tZ4TwcwQmPFhduodfg=;
        b=sJVrpJCOqB+WFNr5jfZqCQWx+3bU0ATl237rUyUQtwX72y2gcqCWELo7AhU9TE5569
         LqQ6pwI+t/zFhK/TLKWKWc5xWtUoIEQPDI6M6CQwOVsLJMFMR8o+Thy+OdMmm5xKMpLR
         A/utRF8k5hyRjBVw8IDMZDSIymjOWoPE9ui6gfiupzK2eZom8J9q6XhbwnsXcrILw1ch
         ngKbLPMoVagerAi7qafmhT054tWEgZDoK9zYrWjGScraWg1jzmV9TV5J1k96Nt7a0Uu5
         5Tb6/xvtUgDdw2NnCj4mceApzVoyFXEFzPo2uVIeU/lXwmUGUf456jjSpqzCqjSzIr8I
         ONrw==
X-Forwarded-Encrypted: i=1; AJvYcCWAqZOX9etSdQPzoVHQWWiWzLpYjHa4IPyscQksTUUzFbEnnqzu+MmstHmPLmEZ5h3ZMfIo@lists.linux.dev
X-Gm-Message-State: AOJu0YyOT8E17IDUIpCKkTc2IyMngXIRnf03m/HAhdPiML69oq3WHzqA
	2MxT1pWWqoVBl6fFmQMIlq2yxI1VmfdY0gDuodeJ1t9fWYMha4gHghNIvWgO35QATg==
X-Gm-Gg: ASbGnctwv8dTK+zlyNO5rL2ZSj1mAXmQr+VIMhNLSRPERrQ/Td3K6PuaXZ1lSqt75RE
	19D7DwHWubV1jmxJc7T0NkkkCkBUafdIB5zlN3QQp2Dz+yHeAc7GYJhEYTGhnQZAplhbSqCcy+I
	CD4krPZ62kJaFNymDHWsF1BSkw+yhgm/WQovso6Yre7lmQW8yd61PoRuNqlYzSREC+FQDMcA5nR
	ZQxoh0zBhh7noVC0dOBhiOyaeWmWmTKZjYECZsP5oORFb/AhStIJz4i5Z8ADTCA59QrXqQ6SFSl
	RMI7SoLhOoSKWWtDEVucTSuNUj5y9/xxKmLym489fFaAgGvnZ3aV4hIcvQ+ZHDnL0nfsEruD8fl
	8+f3j2ew6UcY+9g1qESW0Ms+EvyiYsbWSxmQQaAvYykDMqV3GXw==
X-Google-Smtp-Source: AGHT+IFy47WDgms/J9fw3Arbmga7E0E69RmMlFIFl878TTLy6zDNn+h2L90/JBQCa9swVYMkh+9a9Q==
X-Received: by 2002:a17:90b:5386:b0:32d:e413:966a with SMTP id 98e67ed59e1d1-32de4f9c4aamr1454436a91.32.1757648696964;
        Thu, 11 Sep 2025 20:44:56 -0700 (PDT)
Received: from bytedance ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a36d0d5bsm3385304a12.22.2025.09.11.20.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 20:44:56 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:44:28 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Songtang Liu <liusongtang@bytedance.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Matteo Martelli <matteo.martelli@codethink.co.uk>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH update 4/4] sched/fair: Do not balance task to a throttled
 cfs_rq
Message-ID: <20250912034428.GA33@bytedance>
References: <20250910095044.278-5-ziqianlu@bytedance.com>
 <202509110908.a2P8HZ8A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509110908.a2P8HZ8A-lkp@intel.com>

When doing load balance and the target cfs_rq is in throttled hierarchy,
whether to allow balancing there is a question.

The good side to allow balancing is: if the target CPU is idle or less
loaded and the being balanced task is holding some kernel resources,
then it seems a good idea to balance the task there and let the task get
the CPU earlier and release kernel resources sooner. The bad part is, if
the task is not holding any kernel resources, then the balance seems not
that useful.

While theoretically it's debatable, a performance test[0] which involves
200 cgroups and each cgroup runs hackbench(20 sender, 20 receiver) in
pipe mode showed a performance degradation on AMD Genoa when allowing
load balance to throttled cfs_rq. Analysis[1] showed hackbench doesn't
like task migration across LLC boundary. For this reason, add a check in
can_migrate_task() to forbid balancing to a cfs_rq that is in throttled
hierarchy. This reduced task migration a lot and performance restored.

[0]: https://lore.kernel.org/lkml/20250822110701.GB289@bytedance/
[1]: https://lore.kernel.org/lkml/20250903101102.GB42@bytedance/
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
update: fix build error reported by kernel test robot when
CONFIG_FAIR_GROUP_SCHED is not set.

 kernel/sched/fair.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3dbdfaa697477..18a30ae35441a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5737,6 +5737,11 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
 	return cfs_bandwidth_used() && cfs_rq->throttle_count;
 }
 
+static inline int lb_throttled_hierarchy(struct task_struct *p, int dst_cpu)
+{
+	return throttled_hierarchy(task_group(p)->cfs_rq[dst_cpu]);
+}
+
 static inline bool task_is_throttled(struct task_struct *p)
 {
 	return cfs_bandwidth_used() && p->throttled;
@@ -6733,6 +6738,11 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
 	return 0;
 }
 
+static inline int lb_throttled_hierarchy(struct task_struct *p, int dst_cpu)
+{
+	return 0;
+}
+
 #ifdef CONFIG_FAIR_GROUP_SCHED
 void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
 static void init_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
@@ -9369,14 +9379,18 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	/*
 	 * We do not migrate tasks that are:
 	 * 1) delayed dequeued unless we migrate load, or
-	 * 2) cannot be migrated to this CPU due to cpus_ptr, or
-	 * 3) running (obviously), or
-	 * 4) are cache-hot on their current CPU, or
-	 * 5) are blocked on mutexes (if SCHED_PROXY_EXEC is enabled)
+	 * 2) target cfs_rq is in throttled hierarchy, or
+	 * 3) cannot be migrated to this CPU due to cpus_ptr, or
+	 * 4) running (obviously), or
+	 * 5) are cache-hot on their current CPU, or
+	 * 6) are blocked on mutexes (if SCHED_PROXY_EXEC is enabled)
 	 */
 	if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
 		return 0;
 
+	if (lb_throttled_hierarchy(p, env->dst_cpu))
+		return 0;
+
 	/*
 	 * We want to prioritize the migration of eligible tasks.
 	 * For ineligible tasks we soft-limit them and only allow
-- 
2.39.5

