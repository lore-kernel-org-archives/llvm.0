Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59790182D1
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ldnPYKUyHMdijInwVZoC1NuQUIqnzmW6aookZYRZh1U=; b=cgW4db+34EYcfOD+ugAWlih6L8
	L/jNDTcu2i9fG+nvVlktxcUddMXQJ7RsD+BbDjolaEczhlhwpgja7UDOuAxNJCIWpKjAkzOPYv2Zx
	/Qo5p0lq52KBp0V1ZxkzEeUvyoDKAYxG62owwp6I9frl7ils+cPmIyH7sopXDWmlS7dHyvIU5mP3n
	287Bf1+i+xEltlqpgI9i3OH9vcj1m3RPGORA4wagSRH85wRp7rZK9n2Y+KiaoBCKZcOcY1vWYIcbx
	G/jFuwTTD0+cX3UuWtvW2BIX9AITSfqAc++zFQPfgkyqeUSM+GNLDTl/vI31A4zql2673ftWTlir6
	EuKHS/KQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0l-008kQY-1q;
	Mon, 12 Jun 2023 09:38:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1838F30313F;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 7F8B230A77B61; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093539.300603001@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:38 +0200
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
Subject: [PATCH v3 25/57] perf: Simplify perf_fget_light()
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Introduce fdnull and use it to simplify perf_fget_light() to either
return a valid struct fd or not -- much like fdget() itself.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/file.h |    7 ++++++-
 kernel/events/core.c |   22 +++++++++++-----------
 2 files changed, 17 insertions(+), 12 deletions(-)

--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -59,6 +59,8 @@ static inline struct fd __to_fd(unsigned
 	return (struct fd){(struct file *)(v & ~3),v & 3};
 }
 
+#define fdnull __to_fd(0)
+
 static inline struct fd fdget(unsigned int fd)
 {
 	return __to_fd(__fdget(fd));
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5802,18 +5802,17 @@ EXPORT_SYMBOL_GPL(perf_event_period);
 
 static const struct file_operations perf_fops;
 
-static inline int perf_fget_light(int fd, struct fd *p)
+static inline struct fd perf_fdget(int fd)
 {
 	struct fd f = fdget(fd);
 	if (!f.file)
-		return -EBADF;
+		return fdnull;
 
 	if (f.file->f_op != &perf_fops) {
 		fdput(f);
-		return -EBADF;
+		return fdnull;
 	}
-	*p = f;
-	return 0;
+	return f;
 }
 
 static int perf_event_set_output(struct perf_event *event,
@@ -5864,10 +5863,9 @@ static long _perf_ioctl(struct perf_even
 		int ret;
 		if (arg != -1) {
 			struct perf_event *output_event;
-			struct fd output;
-			ret = perf_fget_light(arg, &output);
-			if (ret)
-				return ret;
+			struct fd output = perf_fdget(arg);
+			if (!output.file)
+				return -EBADF;
 			output_event = output.file->private_data;
 			ret = perf_event_set_output(event, output_event);
 			fdput(output);
@@ -12401,9 +12399,11 @@ SYSCALL_DEFINE5(perf_event_open,
 		return event_fd;
 
 	if (group_fd != -1) {
-		err = perf_fget_light(group_fd, &group);
-		if (err)
+		group = perf_fdget(group_fd);
+		if (!group.file) {
+			err = -EBADF;
 			goto err_fd;
+		}
 		group_leader = group.file->private_data;
 		if (flags & PERF_FLAG_FD_OUTPUT)
 			output_event = group_leader;


