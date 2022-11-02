Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2183368
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 00:13:03 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id y67so17694538oiy.1
        for <llvm@lists.linux.dev>; Tue, 01 Nov 2022 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2tOmvWTorwzYfTjHy6C/DClMkHfDezhOWG4NAYHUCE=;
        b=KDN1VoDEflRLWhSnY5maR8KTuoUmKoitKzf3Ylw7ozOZM4+2Q6WJnSeeX9d4qnNnYx
         XOeMhEZ/ZJW7/Ec1zVVjLpaxyjoJd3f8ge17p10FvxJvH1+QDV94r9uSDJlHPr37KHFZ
         oAXVDgmKJXwVb4GVieWGaYw2XvLH9B/2GVZHmm2eDLBFcVAtwE4nB3akx1DVIDAKEynp
         w66XlPmIxXKZTn9v3rZHZ5xsDT/iqdoD6s/1gPLOuZ7iapEgUEN77rElBQVMOSzPr5Y0
         k57QBzDvdCOtWIVsZ7xLS1yoANJYzGreeXSJ+nYldd4uJd36SOrdDeFzmsqofgrY1LsG
         HBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2tOmvWTorwzYfTjHy6C/DClMkHfDezhOWG4NAYHUCE=;
        b=pjNpAQRvHO3msRBDSIDOkg7DVMzC48TqksZD8Tn4n8EmMK+yhBLwFaRJO8w74bOcru
         b7kDA3YX07YZRQWMF7kRnHCDoBHlWO+JENmB0UsYeWTv0lCkueGmsq2S0n8GdtpUfNc0
         GuTkxVpMCTieMRVAb/zkAO1FvRN5zuHQAUlkMo+zsYxJgM9jzo4CGcDmXijUWOaz9cto
         oHo2At3ucYOhsE6qBdgBlwMxIX/Gfi34fAqTooKNVMPb2UcTpE3EekGPP5KpHGXEeM6p
         H0JWEMbjGunDN7XwsGxWoiLo+LpJKe8uYqLwHhSrmyAJKHrYfvgUs1hmY/XzHEklHYd6
         3w5g==
X-Gm-Message-State: ACrzQf0YyQm+XuHR9obzdOiozIfSJAtVwVGfi/VhKCFDUrayiZRpLwaM
	cTxSkeM2lKVEqBUTL41g9Cnz6g==
X-Google-Smtp-Source: AMsMyM7bZ1LtttYsIMdTbVMVc4laeTQK9eEb/ItA1o82tItOoOs4ch2l79nr7Q5d5lvHsKfhAYTimQ==
X-Received: by 2002:aca:df03:0:b0:355:2ae4:296e with SMTP id w3-20020acadf03000000b003552ae4296emr18547158oig.173.1667347982431;
        Tue, 01 Nov 2022 17:13:02 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id t14-20020a05680800ce00b00359b83e3df1sm3973836oic.9.2022.11.01.17.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 17:12:59 -0700 (PDT)
Date: Tue, 1 Nov 2022 17:12:50 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Liam Howlett <liam.howlett@oracle.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    kernel test robot <lkp@intel.com>, 
    "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
    "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
    Ammar Faizi <ammarfaizi2@gnuweeb.org>, 
    GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, 
    Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 46/244] lib/test_maple_tree.c:453:12:
 warning: result of comparison of constant 4398046511104 with expression of
 type 'unsigned long' is always false
In-Reply-To: <20221101170854.43lt42yokl34vemc@revolver>
Message-ID: <63b5f2ce-589a-80c6-49bf-c0cf7b3ea920@google.com>
References: <202210301224.r9RDzf4K-lkp@intel.com> <20221031161048.a2fd2ce1c210b9cd1a499cb4@linux-foundation.org> <20221101170854.43lt42yokl34vemc@revolver>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Nov 2022, Liam Howlett wrote:
> * Andrew Morton <akpm@linux-foundation.org> [221031 19:10]:
> > 
> > Liam, what's with that 4398046511104?  Wouldn't 0x40000000000 be clearer?  
> 
> I had the hex and changed it to decimal so I could easily search for it
> in a tree dump - it was more unique.  At one point I had it as a comment
> next to the hex, which might be a better way to keep it around for
> searching if there is ever a bug here again.  I'll include that in the
> patch.

Huh.  I made the point before, that IMO the tree dump is itself insane
to be using decimal rather than hex.  There can be patterns immediately
obvious in hex, that are thoroughly obscure in decimal (unless you're
some kind of savant).

Fortunately, it's a long time since I needed to look at a maple tree dump
(all credit to you), but here's the patch I continue to carry in my tree,
in case I ever do need to.  (But I've not checked whether more long
decimal has crept in recently.)

So long as you are the only one doing the debugging, the choice should
remain yours; but if anyone else has to look...

--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5641,7 +5641,7 @@ void *mas_store(struct ma_state *mas, vo
 	trace_ma_write(__func__, mas, 0, entry);
 #ifdef CONFIG_DEBUG_MAPLE_TREE
 	if (mas->index > mas->last)
-		pr_err("Error %lu > %lu %p\n", mas->index, mas->last, entry);
+		pr_err("Error %lx > %lx %px\n", mas->index, mas->last, entry);
 	MT_BUG_ON(mas->tree, mas->index > mas->last);
 	if (mas->index > mas->last) {
 		mas_set_err(mas, -EINVAL);
@@ -6669,9 +6669,9 @@ static void mt_dump_range(unsigned long
 	static const char spaces[] = "                                ";
 
 	if (min == max)
-		pr_info("%.*s%lu: ", depth * 2, spaces, min);
+		pr_info("%.*s%lx: ", depth * 2, spaces, min);
 	else
-		pr_info("%.*s%lu-%lu: ", depth * 2, spaces, min, max);
+		pr_info("%.*s%lx-%lx: ", depth * 2, spaces, min, max);
 }
 
 static void mt_dump_entry(void *entry, unsigned long min, unsigned long max,
@@ -6680,14 +6680,14 @@ static void mt_dump_entry(void *entry, u
 	mt_dump_range(min, max, depth);
 
 	if (xa_is_value(entry))
-		pr_cont("value %ld (0x%lx) [%p]\n", xa_to_value(entry),
+		pr_cont("value %lx (0x%lx) [%px]\n", xa_to_value(entry),
 				xa_to_value(entry), entry);
 	else if (xa_is_zero(entry))
-		pr_cont("zero (%ld)\n", xa_to_internal(entry));
+		pr_cont("zero (%lx)\n", xa_to_internal(entry));
 	else if (mt_is_reserved(entry))
-		pr_cont("UNKNOWN ENTRY (%p)\n", entry);
+		pr_cont("UNKNOWN ENTRY (%px)\n", entry);
 	else
-		pr_cont("%p\n", entry);
+		pr_cont("%px\n", entry);
 }
 
 static void mt_dump_range64(const struct maple_tree *mt, void *entry,
@@ -6700,8 +6700,8 @@ static void mt_dump_range64(const struct
 
 	pr_cont(" contents: ");
 	for (i = 0; i < MAPLE_RANGE64_SLOTS - 1; i++)
-		pr_cont("%p %lu ", node->slot[i], node->pivot[i]);
-	pr_cont("%p\n", node->slot[i]);
+		pr_cont("%px %lx ", node->slot[i], node->pivot[i]);
+	pr_cont("%px\n", node->slot[i]);
 	for (i = 0; i < MAPLE_RANGE64_SLOTS; i++) {
 		unsigned long last = max;
 
@@ -6721,7 +6721,7 @@ static void mt_dump_range64(const struct
 		if (last == max)
 			break;
 		if (last > max) {
-			pr_err("node %p last (%lu) > max (%lu) at pivot %d!\n",
+			pr_err("node %px last (%lx) > max (%lx) at pivot %d!\n",
 					node, last, max, i);
 			break;
 		}
@@ -6739,11 +6739,11 @@ static void mt_dump_arange64(const struc
 
 	pr_cont(" contents: ");
 	for (i = 0; i < MAPLE_ARANGE64_SLOTS; i++)
-		pr_cont("%lu ", node->gap[i]);
+		pr_cont("%lx ", node->gap[i]);
 	pr_cont("| %02X %02X| ", node->meta.end, node->meta.gap);
 	for (i = 0; i < MAPLE_ARANGE64_SLOTS - 1; i++)
-		pr_cont("%p %lu ", node->slot[i], node->pivot[i]);
-	pr_cont("%p\n", node->slot[i]);
+		pr_cont("%px %lx ", node->slot[i], node->pivot[i]);
+	pr_cont("%px\n", node->slot[i]);
 	for (i = 0; i < MAPLE_ARANGE64_SLOTS; i++) {
 		unsigned long last = max;
 
@@ -6763,7 +6763,7 @@ static void mt_dump_arange64(const struc
 		if (last == max)
 			break;
 		if (last > max) {
-			pr_err("node %p last (%lu) > max (%lu) at pivot %d!\n",
+			pr_err("node %px last (%lx) > max (%lx) at pivot %d!\n",
 					node, last, max, i);
 			break;
 		}
@@ -6780,7 +6780,7 @@ static void mt_dump_node(const struct ma
 
 	mt_dump_range(min, max, depth);
 
-	pr_cont("node %p depth %d type %d parent %p", node, depth, type,
+	pr_cont("node %px depth %d type %d parent %px", node, depth, type,
 			node ? node->parent : NULL);
 	switch (type) {
 	case maple_dense:
@@ -6809,7 +6809,7 @@ void mt_dump(const struct maple_tree *mt
 {
 	void *entry = rcu_dereference_check(mt->ma_root, mt_locked(mt));
 
-	pr_info("maple_tree(%p) flags %X, height %u root %p\n",
+	pr_info("maple_tree(%px) flags %X, height %u root %px\n",
 		 mt, mt->ma_flags, mt_height(mt), entry);
 	if (!xa_is_node(entry))
 		mt_dump_entry(entry, 0, 0, 0);
@@ -6862,7 +6862,7 @@ static void mas_validate_gaps(struct ma_
 			gap = gaps[i];
 			if (!entry) {
 				if (gap != p_end - p_start + 1) {
-					pr_err("%p[%u] -> %p %lu != %lu - %lu + 1\n",
+					pr_err("%px[%u] -> %px %lx != %lx - %lx + 1\n",
 						mas_mn(mas), i,
 						mas_get_slot(mas, i), gap,
 						p_end, p_start);
@@ -6873,7 +6873,7 @@ static void mas_validate_gaps(struct ma_
 				}
 			} else {
 				if (gap > p_end - p_start + 1) {
-					pr_err("%p[%u] %lu >= %lu - %lu + 1 (%lu)\n",
+					pr_err("%px[%u] %lx >= %lx - %lx + 1 (%lx)\n",
 					mas_mn(mas), i, gap, p_end, p_start,
 					p_end - p_start + 1);
 					MT_BUG_ON(mas->tree,
@@ -6898,7 +6898,7 @@ counted:
 	p_mn = mte_parent(mte);
 	MT_BUG_ON(mas->tree, max_gap > mas->max);
 	if (ma_gaps(p_mn, mas_parent_enum(mas, mte))[p_slot] != max_gap) {
-		pr_err("gap %p[%u] != %lu\n", p_mn, p_slot, max_gap);
+		pr_err("gap %px[%u] != %lx\n", p_mn, p_slot, max_gap);
 		mt_dump(mas->tree);
 	}
 
@@ -6928,11 +6928,11 @@ static void mas_validate_parent_slot(str
 		node = mas_slot(mas, slots, i);
 		if (i == p_slot) {
 			if (node != mas->node)
-				pr_err("parent %p[%u] does not have %p\n",
+				pr_err("parent %px[%u] does not have %px\n",
 					parent, i, mas_mn(mas));
 			MT_BUG_ON(mas->tree, node != mas->node);
 		} else if (node == mas->node) {
-			pr_err("Invalid child %p at parent %p[%u] p_slot %u\n",
+			pr_err("Invalid child %px at parent %px[%u] p_slot %u\n",
 			       mas_mn(mas), parent, i, p_slot);
 			MT_BUG_ON(mas->tree, node == mas->node);
 		}
@@ -6959,14 +6959,14 @@ static void mas_validate_child_slot(stru
 			break;
 
 		if (mte_parent_slot(child) != i) {
-			pr_err("Slot error at %p[%u]: child %p has pslot %u\n",
+			pr_err("Slot error at %px[%u]: child %px has pslot %u\n",
 			       mas_mn(mas), i, mte_to_node(child),
 			       mte_parent_slot(child));
 			MT_BUG_ON(mas->tree, 1);
 		}
 
 		if (mte_parent(child) != mte_to_node(mas->node)) {
-			pr_err("child %p has parent %p not %p\n",
+			pr_err("child %px has parent %px not %px\n",
 			       mte_to_node(child), mte_parent(child),
 			       mte_to_node(mas->node));
 			MT_BUG_ON(mas->tree, 1);
@@ -7001,25 +7001,25 @@ static void mas_validate_limits(struct m
 			void *entry = mas_slot(mas, slots, i);
 
 			if (!entry)
-				pr_err("%p[%u] cannot be null\n",
+				pr_err("%px[%u] cannot be null\n",
 				       mas_mn(mas), i);
 
 			MT_BUG_ON(mas->tree, !entry);
 		}
 
 		if (prev_piv > piv) {
-			pr_err("%p[%u] piv %lu < prev_piv %lu\n",
+			pr_err("%px[%u] piv %lx < prev_piv %lx\n",
 				mas_mn(mas), i, piv, prev_piv);
 			MT_BUG_ON(mas->tree, piv < prev_piv);
 		}
 
 		if (piv < mas->min) {
-			pr_err("%p[%u] %lu < %lu\n", mas_mn(mas), i,
+			pr_err("%px[%u] %lx < %lx\n", mas_mn(mas), i,
 				piv, mas->min);
 			MT_BUG_ON(mas->tree, piv < mas->min);
 		}
 		if (piv > mas->max) {
-			pr_err("%p[%u] %lu > %lu\n", mas_mn(mas), i,
+			pr_err("%px[%u] %lx > %lx\n", mas_mn(mas), i,
 				piv, mas->max);
 			MT_BUG_ON(mas->tree, piv > mas->max);
 		}
@@ -7031,7 +7031,7 @@ static void mas_validate_limits(struct m
 		void *entry = mas_slot(mas, slots, i);
 
 		if (entry && (i != mt_slots[type] - 1)) {
-			pr_err("%p[%u] should not have entry %p\n", mas_mn(mas),
+			pr_err("%px[%u] should not have entry %px\n", mas_mn(mas),
 			       i, entry);
 			MT_BUG_ON(mas->tree, entry != NULL);
 		}
@@ -7042,7 +7042,7 @@ static void mas_validate_limits(struct m
 			if (!piv)
 				continue;
 
-			pr_err("%p[%u] should not have piv %lu\n",
+			pr_err("%px[%u] should not have piv %lx\n",
 			       mas_mn(mas), i, piv);
 			MT_BUG_ON(mas->tree, i < mt_pivots[type] - 1);
 		}
@@ -7067,7 +7067,7 @@ static void mt_validate_nulls(struct map
 	do {
 		entry = mas_slot(&mas, slots, offset);
 		if (!last && !entry) {
-			pr_err("Sequential nulls end at %p[%u]\n",
+			pr_err("Sequential nulls end at %px[%u]\n",
 				mas_mn(&mas), offset);
 		}
 		MT_BUG_ON(mt, !last && !entry);
@@ -7108,7 +7108,7 @@ void mt_validate(struct maple_tree *mt)
 			end = mas_data_end(&mas);
 			if ((end < mt_min_slot_count(mas.node)) &&
 			    (mas.max != ULONG_MAX)) {
-				pr_err("Invalid size %u of %p\n", end,
+				pr_err("Invalid size %u of %px\n", end,
 				mas_mn(&mas));
 				MT_BUG_ON(mas.tree, 1);
 			}
