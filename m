Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBFE299A92
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035553; cv=none; b=uwLHG1upSG3D+XtSq74p0HvWJznbaIo9X2YanuVyRysfdN2nwnfK5bM28WqZ+5SeebBgPWBpVqezR9ERceZEStvsP0CIdhxUx0OOmkhhsZCarQ9NQDgiOtzmikeRUGhFhDWxCOBkKF1iaHAe8kMsNyxY1nJmCKbWh5qfy8IjdAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035553; c=relaxed/simple;
	bh=kyIAaqYv5feUAAH9a7cG4X9qbJk9e6Q/D00eURyg8ms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k3r0qY5FkvZp02cEWp3HmiubMGILHOT+7tb3vS8VWnbct1bMigCGdX7MfvYM+pnKu/zA11rAoUWNk6kKMZkczs2ucfxp93jHgV40DTnEg+0WVl36lUzzoBaddHORkRI9bB7Xm2kkLZFc+Xiecma1tEHPcT11mCoxw6aAfZxSpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1N2Q2e9J; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1N2Q2e9J"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b078af4b07dso56871a12.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035551; x=1746640351; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xcg6wjMvXME6KKvdjmH0neAjL3wA1v7P5CrDBAB/BDc=;
        b=1N2Q2e9JMI+Bfksexy1uppb4RTkkndfHRmet5hsQGnsemMbb5L+GLcY096VSfM+LAk
         ToPtGWk+ti6cxrys+Q6D96ExR8xfz65mlBE1vExmpPRc8BFqBqLRjVnbZzSdk1JztJnb
         h5EyVz6J5zvgQMRY2jhA41Dk1MNYq+ujKp6iU4QqGvAD+boAGyHtoXYNjjNxc/iJQp9J
         oJFUErjZjzuSYK+ziTXRuGAD3CP6TG0VsR/BDVAtRxroAAdtrfznVeIPGC4bKNp2eFVg
         zXqjWF7ix0AzbLfpLZf+BFowqwuOQKf7KxQN3qDFtCb5bc+A9ryDtgzINTz9TcHh/3Sk
         9buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035551; x=1746640351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xcg6wjMvXME6KKvdjmH0neAjL3wA1v7P5CrDBAB/BDc=;
        b=HrkzRc3sWMM/TDue6j3oBKENbuC1lhXzhULRp1ieBdTzE428hRV2pH+6djLPKuUAhf
         xack4XRlIsbj4EH0Ucq5g4Spyb90c0bjcLfKJAhKs/UyfYJDSF8RFPO1kRVidYwuSeQg
         P8RW/63asj/5C40w1nktN3qfI5WDm98zEQDy7XF3J3wy74KuHsBPXrhqsLsCayPZQ4xa
         ocd3JjKTQ4PSTK2M9WwTY205rjkb4Vv4qkrK9jxgm+9kFE49ainRLbU8VjB4knN9a5PB
         LgT+oL0wpsiMo+2KnICKF367LxR8PNTlOZ2oTSmhMqIN4Zny0eVd5yETgmsSCYGdILzS
         3B4A==
X-Forwarded-Encrypted: i=1; AJvYcCWEFCfydajCEWwxpoXzTKn0W3nJV7zIWvkkDlg1+NGRZlNp4s8JrR2xM3MdUAwlL3INVoYr@lists.linux.dev
X-Gm-Message-State: AOJu0YzfHKRDWhNS5xCBXz68ksLnAJm8XPRAv0NQltN2iHcvG/8Ee2P5
	hsy0kLTXYqKj9LsVwg6oWLfc7D0cn9Mys2xImd1cG28uNFOm94xSIgnrXYUhoajsXdaTNsqEvDN
	sOxi+Nw==
X-Google-Smtp-Source: AGHT+IEKyz0de2SDHs2Wi3XD69kNX3qSVqi0GA9WwmSWKDFlmr/T24Ck2MF0lTbNZtV+tulQOwG0zYD0Vjfx
X-Received: from pgkb21.prod.google.com ([2002:a63:eb55:0:b0:b1f:857e:2198])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:118a:b0:1f5:93cd:59b5
 with SMTP id adf61e73a8af0-20aa41839ccmr5344128637.28.1746035551081; Wed, 30
 Apr 2025 10:52:31 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:34 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-47-irogers@google.com>
Subject: [PATCH v2 46/47] perf hashmap: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/hashmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/hashmap.c b/tools/perf/util/hashmap.c
index 140ee4055676..f2719f522b84 100644
--- a/tools/perf/util/hashmap.c
+++ b/tools/perf/util/hashmap.c
@@ -115,7 +115,7 @@ static int hashmap_grow(struct hashmap *map)
 		return -ENOMEM;
 
 	hashmap__for_each_entry_safe(map, cur, tmp, bkt) {
-		h = hash_bits(map->hash_fn(cur->key, map->ctx), new_cap_bits);
+		h = hash_bits(map->hash_fn(cur->key, map->ctx), (int)new_cap_bits);
 		hashmap_add_entry(&new_buckets[h], cur);
 	}
 
@@ -164,7 +164,7 @@ int hashmap_insert(struct hashmap *map, long key, long value,
 	if (old_value)
 		*old_value = 0;
 
-	h = hash_bits(map->hash_fn(key, map->ctx), map->cap_bits);
+	h = hash_bits(map->hash_fn(key, map->ctx), (int)map->cap_bits);
 	if (strategy != HASHMAP_APPEND &&
 	    hashmap_find_entry(map, key, h, NULL, &entry)) {
 		if (old_key)
@@ -188,7 +188,7 @@ int hashmap_insert(struct hashmap *map, long key, long value,
 		err = hashmap_grow(map);
 		if (err)
 			return err;
-		h = hash_bits(map->hash_fn(key, map->ctx), map->cap_bits);
+		h = hash_bits(map->hash_fn(key, map->ctx), (int)map->cap_bits);
 	}
 
 	entry = malloc(sizeof(struct hashmap_entry));
@@ -208,7 +208,7 @@ bool hashmap_find(const struct hashmap *map, long key, long *value)
 	struct hashmap_entry *entry;
 	size_t h;
 
-	h = hash_bits(map->hash_fn(key, map->ctx), map->cap_bits);
+	h = hash_bits(map->hash_fn(key, map->ctx), (int)map->cap_bits);
 	if (!hashmap_find_entry(map, key, h, NULL, &entry))
 		return false;
 
@@ -223,7 +223,7 @@ bool hashmap_delete(struct hashmap *map, long key,
 	struct hashmap_entry **pprev, *entry;
 	size_t h;
 
-	h = hash_bits(map->hash_fn(key, map->ctx), map->cap_bits);
+	h = hash_bits(map->hash_fn(key, map->ctx), (int)map->cap_bits);
 	if (!hashmap_find_entry(map, key, h, &pprev, &entry))
 		return false;
 
-- 
2.49.0.906.g1f30a19c02-goog

