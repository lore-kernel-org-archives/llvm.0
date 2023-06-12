Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A218C00
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ICqqJG5l0sWCX8xrZRxbU0jefpCN2MYfe0yl/+VCRM4=; b=mNGAL6VZhJ/wJTmZKapHx44ouf
	rgJzcjoCF7AAIeNDZbH6y8MPhHAI8Ey/JNzV7juiK/fgRbSlsjwwfgohDNyK8ptDQbXHNNQAB8/Nq
	QK0enwMcHVSSJzAm5BHJmn+ckyAarbqSUi9J2BAKB3wm3/RRzvnJA1RO1JKEASUNJPLa50zkb2wUI
	sq2DOOMTuHT7ec3WZFo10k/GNTVAVsl7SC3of50T0oqYnIhWK+Ol+7T+qr7e9fYkBnNjCMpQVGDpn
	lCywDdmbGmpIgPD2b/WdcySr15oBaU4wPjbzP9Hzl0MqHgo27XNjxW8g7c3oaKpEllF+ph37IseIG
	ZFdF9Tgw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0t-002NH1-Fh; Mon, 12 Jun 2023 09:39:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3E974303346;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id CA60630A77B6F; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093540.181605463@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:50 +0200
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
Subject: [PATCH v3 37/57] perf: Simplify perf_read_group()
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
 kernel/events/core.c |   30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5472,11 +5472,10 @@ static int perf_read_group(struct perf_e
 	struct perf_event *leader = event->group_leader, *child;
 	struct perf_event_context *ctx = leader->ctx;
 	int ret;
-	u64 *values;
 
 	lockdep_assert_held(&ctx->mutex);
 
-	values = kzalloc(event->read_size, GFP_KERNEL);
+	u64 *values __free(kfree) = kzalloc(event->read_size, GFP_KERNEL);
 	if (!values)
 		return -ENOMEM;
 
@@ -5486,29 +5485,22 @@ static int perf_read_group(struct perf_e
 	 * By locking the child_mutex of the leader we effectively
 	 * lock the child list of all siblings.. XXX explain how.
 	 */
-	mutex_lock(&leader->child_mutex);
-
-	ret = __perf_read_group_add(leader, read_format, values);
-	if (ret)
-		goto unlock;
-
-	list_for_each_entry(child, &leader->child_list, child_list) {
-		ret = __perf_read_group_add(child, read_format, values);
+	scoped_guard (mutex, &leader->child_mutex) {
+		ret = __perf_read_group_add(leader, read_format, values);
 		if (ret)
-			goto unlock;
-	}
+			return ret;
 
-	mutex_unlock(&leader->child_mutex);
+		list_for_each_entry(child, &leader->child_list, child_list) {
+			ret = __perf_read_group_add(child, read_format, values);
+			if (ret)
+				return ret;
+		}
+	}
 
 	ret = event->read_size;
 	if (copy_to_user(buf, values, event->read_size))
-		ret = -EFAULT;
-	goto out;
+		return -EFAULT;
 
-unlock:
-	mutex_unlock(&leader->child_mutex);
-out:
-	kfree(values);
 	return ret;
 }
 


