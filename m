Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF217FF7
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=U4i7z1jGLLioJYi9TDEcLiRvRYzXl6AqAACZeSAVHVg=; b=SBLpIgKh9BvTgin8OgClkKlYXg
	X5ams+FHzFQ6G1lMnSouT1mDdb4OLsixaSq0XGTpb8qMCrU112HpuhNQoPMpu5LuKgc0l67v7cO1h
	u5ptXidisQWMYnTu9VRqL7lCU0qSFMrhITDD9gjBmwe8Ob3g4CMGsAIsrtG8NhdHIlElo7XiHuBGk
	i6CUfsyeQ89E6j6aUDbi6UnyyLpJP5feQWE/A/0f7bznVuaG82q1C6WO47OsY3j0TTRUJpg1Of5WA
	IRcAI8pTAmFoYuUbcG3n6PWRD/wAaLyzUwLu2dB3lMCN4lr3Q2ZxqN2zU2caRGifvgztAd6QumekK
	vRuQDjXw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0q-008kRX-2x;
	Mon, 12 Jun 2023 09:39:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3FB923033B6;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id D03BE30A77B70; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093540.253514702@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: torvalds@linux-foundation.org,
 keescook@chromium.org,
 gregkh@linuxfoundation.org,
 pbonzini@redhat.com
Cc: masahiroy@kernel.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 nicolas@fjasle.eu,
 catalin.marinas@arm.com,
 will@kernel.org,
 vkoul@kernel.org,
 trix@redhat.com,
 ojeda@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 longman@redhat.com,
 boqun.feng@gmail.com,
 dennis@kernel.org,
 tj@kernel.org,
 cl@linux.com,
 acme@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 namhyung@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 bristot@redhat.com,
 vschneid@redhat.com,
 paulmck@kernel.org,
 frederic@kernel.org,
 quic_neeraju@quicinc.com,
 joel@joelfernandes.org,
 josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com,
 rientjes@google.com,
 vbabka@suse.cz,
 roman.gushchin@linux.dev,
 42.hyeyoo@gmail.com,
 apw@canonical.com,
 joe@perches.com,
 dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com,
 john.johansen@canonical.com,
 paul@paul-moore.com,
 jmorris@namei.org,
 serge@hallyn.com,
 linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org,
 llvm@lists.linux.dev,
 linux-perf-users@vger.kernel.org,
 rcu@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 tglx@linutronix.de,
 ravi.bangoria@amd.com,
 error27@gmail.com,
 luc.vanoostenryck@gmail.com
Subject: [PATCH v3 38/57] perf: Simplify IOC_SET_OUTPUT
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8


Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5762,6 +5762,11 @@ static inline struct fd perf_fdget(int f
 	return f;
 }
 
+static inline bool is_perf_fd(struct fd fd)
+{
+	return fd.file && fd.file->f_op == &perf_fops;
+}
+
 static int perf_event_set_output(struct perf_event *event,
 				 struct perf_event *output_event);
 static int perf_event_set_filter(struct perf_event *event, void __user *arg);
@@ -5807,19 +5812,15 @@ static long _perf_ioctl(struct perf_even
 
 	case PERF_EVENT_IOC_SET_OUTPUT:
 	{
-		int ret;
 		if (arg != -1) {
 			struct perf_event *output_event;
-			struct fd output = perf_fdget(arg);
-			if (!output.file)
+			CLASS(fd, output)(arg);
+			if (!is_perf_fd(output))
 				return -EBADF;
 			output_event = output.file->private_data;
-			ret = perf_event_set_output(event, output_event);
-			fdput(output);
-		} else {
-			ret = perf_event_set_output(event, NULL);
+			return perf_event_set_output(event, output_event);
 		}
-		return ret;
+		return perf_event_set_output(event, NULL);
 	}
 
 	case PERF_EVENT_IOC_SET_FILTER:


