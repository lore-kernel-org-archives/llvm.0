Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426924B9222
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189135; cv=none; b=aB572zaPLDw/4XMeeC36KpTP0ldM8Bx/58Gqq+kT8M0I+ag6YvrFV6V6GVE2Rolh2sE7I7lPmQxKhAN2p8mEsIsXJjvD4PEcdAL/WT+zRo8Y7eW8QKZ5lw3EnW0kxms3NQhbbFuvDqK7N2caco2F3BOtJFfitUrJfDc1RJEEYoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189135; c=relaxed/simple;
	bh=X9NMUUN/PE8VFQes15e35IRr9fY8ZZsea9uEfdcgfJA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Je/fSWBJsu6Z8SF+82yUgnzCb5nwWBEGqH4wZzuEIUFWa+mzcKRLrjRN3L4fLonYi+DlDn9eYvLcBws0GmB8x+Icl4X/IFnsvYV2zOjibpdBsm/rWl7KJAAvPNdUVC9m+kDCQcK1CAwXHUQvLuwMPAqxpuuEId3BMVcJ0MJLm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KMcZtBAK; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KMcZtBAK"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so557964eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189133; x=1792793933; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=KMcZtBAKOrzQL+ujv9l0WYQlimHZSEL1Kms+CSC91Ul+LWtCZ9iSgKHpLJPOVWzYbt
         tU2t0ACGLNxBKEGmqK/O1ppUcMXdp6Q2o9Tra3Fi549St/7O1xVzeDkTZn5rJdNBvNDx
         xiMZ1eeoWoOEYzJVXkPxTU92YOK/+KLyCTDHHVH6UrfGi1GaiknjTcn/vM/itHO3Guo8
         hnT9FzBzN+7VwF5vbWVJPH6f1bwCXiS/nk1On08DgF/ycAglibk84HwL5uiQN+5uiFVz
         dtvwrP/wwW7/2xKFf9R3y+7ZFwN4CmeWbjW+MKjGk0U8en/YojfwXo/FKp9Vjpx9Ydf8
         Meuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189133; x=1792793933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=XvFli39yLOjQkAb4GF0TpfZ3lzPyXG1qr9bcH2lRYh0iUPtxtVC8vKesTl7Pne+/lC
         4PAYRK3PMBH7NLvayViwZpl/Xc+H3YwQw1WG4rEPA74nmU9DPxUfPQmoTQFTA7UG62ID
         LmUCM96dV6zMBgBk6r1aBRnI4axZ82lSSsf3tZCA5XVP/vaB98TvvuEYIjch6LV7kQtm
         Ku0W1EujY6sdrxn/rYrUWzw/3Elw4Z3dKKtA9ThAJaHnTJgmtz0gXFnC3L8tjxA+Zk4D
         jt/10sO0D2h0Dv3J92LNv59VoVzsKUMbZ7xEXDbodw1ggAKIpXG+eZw+xpNc9LpjMUHW
         JC9A==
X-Forwarded-Encrypted: i=1; AKwUvBwYhj6BRsJRw4oMLY818hKRJCyXybYPfjCSNPncBwvlRKUQd2mNAC7Xqav5TAUhX0okn5dz@lists.linux.dev
X-Gm-Message-State: AFq9FYI7SJhJReLwbWk7F+NuA3a8G8Z1pi/Y/O7vV3Tp6Hac+JxfrXML
	9WtH0oWtjthThP+p9RASKAmP6Rd15/TM34sxGPUIG9vBskO9oEmBPLrOXUg7d7A/x849KzJTBTZ
	83IMvMd42Ug==
X-Received: from dybmd43.prod.google.com ([2002:a05:7301:182b:b0:359:261e:1706])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8092:b0:35d:8c3a:38a8
 with SMTP id 5a478bee46e88-361a2942646mr1432826eec.39.1792189132086; Fri, 16
 Oct 2026 15:18:52 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:59 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-17-irogers@google.com>
Subject: [PATCH v4 16/17] perf maps: Fix lock inversion in maps__load_first()
 and bounds check in __maps__remove()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In maps__load_first(), take a reference to the first map and drop
maps__lock(maps) before calling map__load() to avoid a read-to-write
self-deadlock when loading kernel maps inserts extra trampoline maps.

In __maps__remove(), check that the index returned by
maps__by_address_index() and maps__by_name_index() is within nr_maps
before indexing and removing the entry, in case a concurrent thread
already removed the map.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..acaf93c7c206 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
 #include <stdlib.h>
+#include <string.h>
 #include <linux/zalloc.h>
 #include "debug.h"
 #include "dso.h"
@@ -548,6 +549,8 @@ static void __maps__remove(struct maps *maps, struct map *map)
 
 	/* Slide later mappings over the one to remove */
 	address_idx = maps__by_address_index(maps, map);
+	if (address_idx >= nr_maps)
+		return;
 	map__put(maps_by_address[address_idx]);
 	memmove(&maps_by_address[address_idx],
 		&maps_by_address[address_idx + 1],
@@ -556,10 +559,14 @@ static void __maps__remove(struct maps *maps, struct map *map)
 	if (maps_by_name) {
 		unsigned int name_idx = maps__by_name_index(maps, map);
 
-		map__put(maps_by_name[name_idx]);
-		memmove(&maps_by_name[name_idx],
-			&maps_by_name[name_idx + 1],
-			(nr_maps - name_idx - 1) *  sizeof(*maps_by_name));
+		if (name_idx < nr_maps) {
+			map__put(maps_by_name[name_idx]);
+			memmove(&maps_by_name[name_idx],
+				&maps_by_name[name_idx + 1],
+				(nr_maps - name_idx - 1) * sizeof(*maps_by_name));
+		} else {
+			__maps__free_maps_by_name(maps);
+		}
 	}
 
 	--RC_CHK_ACCESS(maps)->nr_maps;
@@ -1459,10 +1466,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
 void maps__load_first(struct maps *maps)
 {
-	down_read(maps__lock(maps));
+	struct map *first = NULL;
 
+	down_read(maps__lock(maps));
 	if (maps__nr_maps(maps) > 0)
-		map__load(maps__maps_by_address(maps)[0]);
-
+		first = map__get(maps__maps_by_address(maps)[0]);
 	up_read(maps__lock(maps));
+
+	if (first) {
+		map__load(first);
+		map__put(first);
+	}
 }
-- 
2.56.0.212.g129ede20d9-goog

