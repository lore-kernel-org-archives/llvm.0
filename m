Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8D41AFB35
	for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412135; cv=none; b=enFfGovKIG+dV4sx3dzJxxqyWsafL8xRR/z+00hxlEt75jT0IwBZ6iomYFkMEM/KdlioKKbF07N6uA6WtMzjjbI+qhGtMB3y84Ekl0KW8wcucMXTFwFHAMPcCmQLTGOuvIEOzG7jJgQUwjVLdc2fw8nXAPdWKw/p8B9446ibwH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412135; c=relaxed/simple;
	bh=sexKNXD7XnpRvBHnDNQiw6uZrGJfJ24MEeItqx5xgu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sU8bBIkH8oKOJskXfykyeuNINeDMLMDLGm1waDIGJ9LdgvdTTtIntSpq2RENNK8Gou4sb09LHjgytqLfhxtTGiKkRD84vsunADTbRbWkeIYGAGMSnIBWJD4vYj5Yg0/n+GhFYEXcl9reU8vjzOstDmeImUBCcB4CDhT1HWhVnfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VrIrPawh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VrIrPawh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731412132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+FPaew/J2nFAbKvuzEnykWeNVwVW0+Al07LcXLfJeJc=;
	b=VrIrPawhVhlHCGSuhIFPrSGjkW+9itx/HDhqCP06mwmzQUj2J0mXnzOwWzFeyu7rMupHol
	sxla08R6bwYrqeJIIQCxC3qpdFDNJqsT2HKEcjeO/XFI6Co1rhUUfi21C/ae+uLcf8w9zv
	Zgi7iGLUzKikbAOoDPLqNCBtddbWfak=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-dDbMOzeoNcGLMdABTcSMeQ-1; Tue, 12 Nov 2024 06:48:49 -0500
X-MC-Unique: dDbMOzeoNcGLMdABTcSMeQ-1
X-Mimecast-MFC-AGG-ID: dDbMOzeoNcGLMdABTcSMeQ
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b16c9a84efso721389985a.1
        for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 03:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731412129; x=1732016929;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FPaew/J2nFAbKvuzEnykWeNVwVW0+Al07LcXLfJeJc=;
        b=CL1JEbxytSx0UFlhTKvu/QBoGOKKBEFF5g/6ws8wPbiNuDw4n3TE12bd1i8DnNExG0
         9PuDRqrX4cyPXt2MOwfj7NF1OUEM2WyQQaHeLp5lN69vjEb3UTh3yWkaDMjW5rVYa1ng
         1tayJIgQltxIIpeLpOaTZga3fno9J9DVick4N1ROr+7Ik1HUIyFWHR8HGLCYVm9hfmow
         O/msdEew8dypD+cWpqln8r88kEK6IY0YnGLV9cixIu5gfl0BYzn99Atg8mD/pcR5HS76
         DqwSeIiiYyblQMx/ON0bb0a8/AojEx8NpAJttzcgUeSbtuD19Sj+rbTm7vQUqB3kOa8s
         5pWw==
X-Forwarded-Encrypted: i=1; AJvYcCUTSzu6dB4kWE60Q1uNkRyrPJtlCWW8r6v9APGPXx5ScpgUcbYPb6uFsHYGCyYavPc4eeVg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8gTUEPLQ8S8xRPwaDc0I4ufusCIMbL8ukcaoCXdV1c3f995Lh
	xpbqRD3F4gLUym6IV0uuCYy7ES/cPOZVwiosT0EAgrGjD5QilHTowiBZXKMwo9Nyhtv/vps9E1N
	WTJr9JqKaizhwqkM699nAGI990aaQC13CHXNw48BkRdJLex7pFvI=
X-Received: by 2002:a05:620a:2943:b0:7b1:4579:61fa with SMTP id af79cd13be357-7b331f30f83mr2118315685a.55.1731412128852;
        Tue, 12 Nov 2024 03:48:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn8DsE5PCyIYersXMpgZHU5Oevhjar6lRDGEWUDoYfsGQSD6wAakm5smKreq1Jiix5BtG4WQ==
X-Received: by 2002:a05:620a:2943:b0:7b1:4579:61fa with SMTP id af79cd13be357-7b331f30f83mr2118312985a.55.1731412128516;
        Tue, 12 Nov 2024 03:48:48 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ace4fd7sm581186985a.108.2024.11.12.03.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:48:46 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ingo Molnar
 <mingo@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] sched/fair: Mark cfs_bandwidth_used() and
 m*_vruntime() with __maybe_unused
In-Reply-To: <20240905171210.267626-1-andriy.shevchenko@linux.intel.com>
References: <20240905171210.267626-1-andriy.shevchenko@linux.intel.com>
Date: Tue, 12 Nov 2024 12:48:42 +0100
Message-ID: <xhsmh7c98d65h.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DqsuZfLvgjMefMykIY764vvdnn9eRhAm7HJbUJlwo5A_1731412129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 05/09/24 20:12, Andy Shevchenko wrote:
> When cfs_bandwidth_used() is unused, it prevents kernel builds
> with clang, `make W=1` and CONFIG_WERROR=y:
>
> kernel/sched/fair.c:526:19: error: unused function 'max_vruntime' [-Werror,-Wunused-function]
>   526 | static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
>       |                   ^~~~~~~~~~~~
> kernel/sched/fair.c:6580:20: error: unused function 'cfs_bandwidth_used' [-Werror,-Wunused-function]
>  6580 | static inline bool cfs_bandwidth_used(void)
>       |                    ^~~~~~~~~~~~~~~~~~
>
> Fix this by marking them with __maybe_unused (all cases for the sake of
> symmetry).
>

I assume that's with CONFIG_CFS_BANDWIDTH=n? Looks like
cfs_bandwidth_used() uses are tucked away under helpers that themselves
only really do something for CONFIG_CFS_BANDWIDTH=y, so you could remove
the CONFIG_CFS_BANDWIDTH=n definition of cfs_bandwidth_used() directly.

This compiles:
---
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2d16c8545c71e..57abb4ae8af39 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5373,8 +5373,6 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 static void check_enqueue_throttle(struct cfs_rq *cfs_rq);
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq);
 
-static inline bool cfs_bandwidth_used(void);
-
 static void
 requeue_delayed_entity(struct sched_entity *se);
 
@@ -6754,11 +6752,6 @@ static void sched_fair_update_stop_tick(struct rq *rq, struct task_struct *p)
 
 #else /* CONFIG_CFS_BANDWIDTH */
 
-static inline bool cfs_bandwidth_used(void)
-{
-	return false;
-}
-
 static void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec) {}
 static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
 static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}

