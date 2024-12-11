Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D221FF1C7;
	Wed, 11 Dec 2024 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939289; cv=none; b=HzQLI3LYV6rjTZp3yApnl3gX0H0b+Y9Ean4/z4zQ9Yrn9U73B5Xjdt2mEsP66IwL4Bvy1NtxZIcDuBl31wo5qf8KUGQDxPlM+Z8DSCTnHld6HaWQk34VEJX8nhXgZjbT7ZX7Kj2AV8nJx5EaWkz0W1rFedoPa6/mX2RDdrS5Y6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939289; c=relaxed/simple;
	bh=10mTZ6Baz1w4vZT0DsoF5FMFN4WwL6kq6s4V2xKqoBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCyWr8iG69pZZBp0mu0KKl/VjNEncJ29P+W98KdSueQ251fmUcb+x2r1EvheG08/X5sBVQPAuo2MQxq5WyzV29eSnJ34txAgtCyhwvSE5D1qtRwVh2pEUED4XndYLYAE6MeGCJ/j6UmcaSGdVgvFIsLceDcLqVcFr1uNVzDD/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNWFan3Q; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNWFan3Q"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844d54c3eb6so14412439f.0;
        Wed, 11 Dec 2024 09:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733939287; x=1734544087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoQjUEiKcHT4k34GxlmM0v6sAaxxYb6I9s5NiJskeoc=;
        b=bNWFan3QhTPBXWuRnEnOrFzQ/BCxPAqHLc7jw60VUQ+BVCnJ/TJ61jZ7kWy+CQg5WK
         O0brbn1ADtqh225sI6BQu5DMdu9l9mnkEgJxSLkBg4F9wvxy3a6qvjmwjUdd/ZgjNr0T
         xn/t+z/o3gvhARnftHAy/W/S5OVKQu4rhD0S7VDj07HSVzOURcYfTniNakSwK5k30vox
         kAoxdVrjqX7wVjjsKk7t247qccjRm1MfFudNlYHb9zTEzAGyxG1t6gsZ7vCk729boUEG
         xi1Dx2g9Mi4A30lpQBYNo4CJHeWpQNMoXyS/zWMIK0jgC6MtGOOetK3N+kNxiTJdwcFu
         pQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733939287; x=1734544087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoQjUEiKcHT4k34GxlmM0v6sAaxxYb6I9s5NiJskeoc=;
        b=lAtS5bNfwM2wFbdyCoJqMZNEok/dgke+8+qBd+faNGRlFNruZdyiYK6mZIGarsp6E1
         Nr4a9CaWKdRZn6MtAb+6LR2epSaF00cOMmyc55gwPd2Wwjq2ExKKHHYaxX11mYYHPQIc
         6PjOWT+I2TY1478Uev43LN7mgIosTGZp1VPOEdCrOUsjkJSSo/bGSll1SwJS+FTN9glq
         EwvJJMlEGYE4aI4c1VTlxJ5zMZ0poiBj6u9SlBKgGKhr6+kMO7uklCcBwui3e5YtU+Ke
         WabXci/Cky7kmCUYVebXChRQTeznZfonbubnxZhclLNAcfuB6e1CM3Ys5KfJia9ZzSgR
         A5jg==
X-Forwarded-Encrypted: i=1; AJvYcCXcalBdiSfnMUDbh+8GyCjWiihlUmGMyOVA8Fbs8G9bilmxhoWYmdAJ+TS4pi9GmNRI2vVZhGonyhyXhlzngg==@lists.linux.dev, AJvYcCXd7rOF59ENXLBNiSmbjBFK9T8D9k8ViaTaRVHBSqMk+Pd333cWwGX7x+NZp1PFD5kJcQjL@lists.linux.dev
X-Gm-Message-State: AOJu0YzHnUIu8rSafdvCebqaxnYHGA1+EMFkylQ/JzQyZRvnvZp0PWEp
	qnqxLowbkeGtCoCbMbsugvJ/Xfxz4fP7JaxRQGJk1y4oR/CpYh9R
X-Gm-Gg: ASbGnctv3a1UAEsPxartsb3NW7Ncg6fvcmyRhFDbgfJPfTBbt3JcVbscU31A4gPJ9o7
	sS1jRWPQ1KTyRCbMO+djlPMq4fp/6dolz7dHWVm7yNkTK6atw9tILxeU4LfCSr82sgG+508vCII
	zBctphKW3w8+WX+Km0m07JI3mNh0f4MJ6bmfUvTWCJcmqAploRudcqkgrC7iCzv2HbwHHUm/YBh
	i4+kSbM/74p3LYXhKxLJNwGIhERJ3SFU1g5+NWKhlKe9ZL1Ncf/aV6Zi8t+oc8=
X-Google-Smtp-Source: AGHT+IH69BOOoy2fz1wD9KgMNdJfrwJoVi/CrO8K0VgYeuPucjqk60n4YgQMAYpD19ZYyBWYgImzlQ==
X-Received: by 2002:a05:6602:6c05:b0:83a:9820:f26b with SMTP id ca18e2360f4ac-844d741e564mr64441639f.2.1733939286658;
        Wed, 11 Dec 2024 09:48:06 -0800 (PST)
Received: from LeeDev.lee.dev ([2600:8804:1a84:2a00:be24:11ff:fe2b:2474])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844c317e930sm77069139f.41.2024.12.11.09.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 09:48:05 -0800 (PST)
From: "Roger L. Beckermeyer III" <beckerlee3@gmail.com>
To: lkp@intel.com
Cc: beckerlee3@gmail.com,
	linux-btrfs@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 1/6] rbtree: add rb_find_add_cached() to rbtree.h
Date: Wed, 11 Dec 2024 11:47:54 -0600
Message-ID: <4768e17a808c754748ac9264b5de9e8f00f22380.1733850317.git.beckerlee3@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1733850317.git.beckerlee3@gmail.com>
References: <cover.1733850317.git.beckerlee3@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds rb_find_add_cached() as a helper function for use with
red-black trees. Used in btrfs to reduce boilerplate code.

Suggested-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Roger L. Beckermeyer III <beckerlee3@gmail.com>
---
 include/linux/rbtree.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
index 7c173aa64e1e..0d4444c0cfb3 100644
--- a/include/linux/rbtree.h
+++ b/include/linux/rbtree.h
@@ -210,6 +210,43 @@ rb_add(struct rb_node *node, struct rb_root *tree,
 	rb_insert_color(node, tree);
 }
 
+/**
+ * rb_find_add_cached() - find equivalent @node in @tree, or add @node
+ * @node: node to look-for / insert
+ * @tree: tree to search / modify
+ * @cmp: operator defining the node order
+ *
+ * Returns the rb_node matching @node, or NULL when no match is found and @node
+ * is inserted.
+ */
+static __always_inline struct rb_node *
+rb_find_add_cached(struct rb_node *node, struct rb_root_cached *tree,
+	    int (*cmp)(struct rb_node *, const struct rb_node *))
+{
+	bool leftmost = true;
+	struct rb_node **link = &tree->rb_root.rb_node;
+	struct rb_node *parent = NULL;
+	int c;
+
+	while (*link) {
+		parent = *link;
+		c = cmp(node, parent);
+
+		if (c < 0) {
+			link = &parent->rb_left;
+		} else if (c > 0) {
+			link = &parent->rb_right;
+			leftmost = false;
+		} else {
+			return parent;
+		}
+	}
+
+	rb_link_node(node, parent, link);
+	rb_insert_color_cached(node, tree, leftmost);
+	return NULL;
+}
+
 /**
  * rb_find_add() - find equivalent @node in @tree, or add @node
  * @node: node to look-for / insert
-- 
2.45.2

