Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273FF18AFF
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=EsmTLBQmhx/5yfk2nLo68eqoCP+8wKcpRacytoeqYb0=; b=JzK5IH8N1R0w4ZPrNfetawJ1FD
	4HZrGOhuVRVxIjDqPv4bYvnb7QgMPLGLGbdmzXEeopa2Prn1HDOppF+n5P5gOlMqMa1rdEsmqPEJE
	4zBgEggg6IN7xsZthS4nKfRazAMzS25hqr+4XdaBRjA3vJM1Mf/NxI5bxu1nbrUK1A2Ubu82JAHSM
	7r3CLrHjarSxYkkwoLGDZyzSihPQlEnLAKdVCZMJD67a0SVrio/ew27bI86+tYTFxJh/PoFqk+7MA
	bJTfwuPDgRuesPge8HP/Ym8Yt0fzjq4uMGF0XSD2tgQVynOwPRpMBq97GidZ/ZIylVHt7tXcWAldX
	or+ZqRYQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0v-008kSB-1p;
	Mon, 12 Jun 2023 09:39:13 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 59D0430366E;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 03E4530A77B79; Mon, 12 Jun 2023 11:38:49 +0200 (CEST)
Message-ID: <20230612093540.779825032@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:58 +0200
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
Subject: [PATCH v3 45/57] perf: Simplify perf_event_parse_addr_filter()
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

XXX this code needs a cleanup

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   56 ++++++++++++++++++++-------------------------------
 1 file changed, 22 insertions(+), 34 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10495,6 +10495,8 @@ static void free_filters_list(struct lis
 	}
 }
 
+DEFINE_FREE(filter_list, struct list_head *, if (_T) free_filters_list(_T))
+
 /*
  * Free existing address filters and optionally install new ones
  */
@@ -10658,13 +10660,15 @@ perf_event_parse_addr_filter(struct perf
 			     struct list_head *filters)
 {
 	struct perf_addr_filter *filter = NULL;
-	char *start, *orig, *filename = NULL;
 	substring_t args[MAX_OPT_ARGS];
 	int state = IF_STATE_ACTION, token;
 	unsigned int kernel = 0;
-	int ret = -EINVAL;
+	char *start;
+	int ret;
 
-	orig = fstr = kstrdup(fstr, GFP_KERNEL);
+	struct list_head *fguard __free(filter_list) = filters;
+	char *filename __free(kfree) = NULL;
+	char *orig __free(kfree) = fstr = kstrdup(fstr, GFP_KERNEL);
 	if (!fstr)
 		return -ENOMEM;
 
@@ -10674,7 +10678,6 @@ perf_event_parse_addr_filter(struct perf
 			[IF_ACT_START]	= PERF_ADDR_FILTER_ACTION_START,
 			[IF_ACT_STOP]	= PERF_ADDR_FILTER_ACTION_STOP,
 		};
-		ret = -EINVAL;
 
 		if (!*start)
 			continue;
@@ -10683,7 +10686,7 @@ perf_event_parse_addr_filter(struct perf
 		if (state == IF_STATE_ACTION) {
 			filter = perf_addr_filter_new(event, filters);
 			if (!filter)
-				goto fail;
+				return -EINVAL;
 		}
 
 		token = match_token(start, if_tokens, args);
@@ -10692,7 +10695,7 @@ perf_event_parse_addr_filter(struct perf
 		case IF_ACT_START:
 		case IF_ACT_STOP:
 			if (state != IF_STATE_ACTION)
-				goto fail;
+				return -EINVAL;
 
 			filter->action = actions[token];
 			state = IF_STATE_SOURCE;
@@ -10706,18 +10709,18 @@ perf_event_parse_addr_filter(struct perf
 		case IF_SRC_FILEADDR:
 		case IF_SRC_FILE:
 			if (state != IF_STATE_SOURCE)
-				goto fail;
+				return -EINVAL;
 
 			*args[0].to = 0;
 			ret = kstrtoul(args[0].from, 0, &filter->offset);
 			if (ret)
-				goto fail;
+				return ret;
 
 			if (token == IF_SRC_KERNEL || token == IF_SRC_FILE) {
 				*args[1].to = 0;
 				ret = kstrtoul(args[1].from, 0, &filter->size);
 				if (ret)
-					goto fail;
+					return ret;
 			}
 
 			if (token == IF_SRC_FILE || token == IF_SRC_FILEADDR) {
@@ -10725,17 +10728,15 @@ perf_event_parse_addr_filter(struct perf
 
 				kfree(filename);
 				filename = match_strdup(&args[fpos]);
-				if (!filename) {
-					ret = -ENOMEM;
-					goto fail;
-				}
+				if (!filename)
+					return -ENOMEM;
 			}
 
 			state = IF_STATE_END;
 			break;
 
 		default:
-			goto fail;
+			return -EINVAL;
 		}
 
 		/*
@@ -10744,19 +10745,17 @@ perf_event_parse_addr_filter(struct perf
 		 * attribute.
 		 */
 		if (state == IF_STATE_END) {
-			ret = -EINVAL;
-
 			/*
 			 * ACTION "filter" must have a non-zero length region
 			 * specified.
 			 */
 			if (filter->action == PERF_ADDR_FILTER_ACTION_FILTER &&
 			    !filter->size)
-				goto fail;
+				return -EINVAL;
 
 			if (!kernel) {
 				if (!filename)
-					goto fail;
+					return -EINVAL;
 
 				/*
 				 * For now, we only support file-based filters
@@ -10766,21 +10765,19 @@ perf_event_parse_addr_filter(struct perf
 				 * mapped at different virtual addresses in
 				 * different processes.
 				 */
-				ret = -EOPNOTSUPP;
 				if (!event->ctx->task)
-					goto fail;
+					return -EOPNOTSUPP;
 
 				/* look up the path and grab its inode */
 				ret = kern_path(filename, LOOKUP_FOLLOW,
 						&filter->path);
 				if (ret)
-					goto fail;
+					return ret;
 
-				ret = -EINVAL;
 				if (!filter->path.dentry ||
 				    !S_ISREG(d_inode(filter->path.dentry)
 					     ->i_mode))
-					goto fail;
+					return -EINVAL;
 
 				event->addr_filters.nr_file_filters++;
 			}
@@ -10795,19 +10792,10 @@ perf_event_parse_addr_filter(struct perf
 	}
 
 	if (state != IF_STATE_ACTION)
-		goto fail;
-
-	kfree(filename);
-	kfree(orig);
+		return -EINVAL;
 
+	no_free_ptr(fguard); // allow filters to escape to the caller
 	return 0;
-
-fail:
-	kfree(filename);
-	free_filters_list(filters);
-	kfree(orig);
-
-	return ret;
 }
 
 static int


