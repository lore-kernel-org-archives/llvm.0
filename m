Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991927;
	b=cMrWYOb30y1n2PqmaDjig14Wo2aE8VRuPcBs2H14Ot83GSATiUdLfrTHRs7P6lveShgO
	 /TptHm7tB0QTVN1VbLxdq3DU/1nhI2K/XSNF12RgW+7m1AyPCHzw7OEJH7ucXRTqeQuTm
	 JvmeVK5cF+6UwsW5g//luQFbwb/icyWOso6fOYm51vdJRzlGRoSg7q9RV00hWao9Q01sF
	 C4fVwjHDdQNpBNT05xSJSqdeldY0kiRRsI7xmIK7x1Vao4bk2m0q0R3aqVqpcL4TmXaPK
	 rgBIEqkHV2cOZC16haXW2cxEd9zQWcDufUkf42gXabnbLNMCLDTXSxS3744kR1WH6sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2T8ZYwQtl91zdyiQJyBoQRMm+I4dJMf5ghcXGTax8X8=;
	b=epNq896byreF/ThsVB+3Jmmfm0JI/a6Xb0SwlJEvZcvmCtcTgUkXxRnFgtTT4Vl54s1h
	 apAm5YHahIT5fzxMoU+uj963RE5XpEAXyUNktpR6vtRDbmWKVEgpyh+NurNlN5owlub0O
	 CcIHMAPoeS9QtwvY/H0SuEHqyeGhoojO7TvYiCWXAIoO1N7gWzMT71w+Q8aopn5EbrcDe
	 kkrhMXD//FiLUOAtAFyyRboaXyh0OGgmaMHnSjDFJ6sPLcT1Jo+QYKIoHf0eVrK2J5wyQ
	 rgG1lOm8pt+RW2DNFK1geiJw4Vr6mtXuZNfnq0LIV3CW5hO1sBSgogJ6zlDugFr9waw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZKrmtK4Q;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00080606A339
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 19:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00080606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZKrmtK4Q
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea0fe07201so7185115ad.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 11:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793991926; x=1794596726; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T8ZYwQtl91zdyiQJyBoQRMm+I4dJMf5ghcXGTax8X8=;
        b=ZKrmtK4QHGIUCb8htPmyiBgltoSbw0uAziD6vKwpqHPBmWKceYy1Sbu6l/X0Z1D1Bl
         +uz/p75aoerCWsbzW2ydOAYf7bPrWeOZfx73ISDH8OB3qgryMjhDeJX1Yn0jr/FxlzR8
         kOeYv/TXupFQHyrVvsa7c6x8RRcVLdFpnUU+vUkz6SNlQ0JoATGo6viUFuMMdiwFYacj
         vZvxHVHHiFQ4vvAjlvy//BKY/2QfairXO1cQUZJhib7Avtu8apLPvh6GOYWvYOCGDPHi
         ME8gOh0M6maPG0f1fu5hg6tZd+P9sKwa+eyI5j0/P+mEnmJai6datiuP4YmRw02MziSS
         2Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991926; x=1794596726;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2T8ZYwQtl91zdyiQJyBoQRMm+I4dJMf5ghcXGTax8X8=;
        b=Nly7aCBrvWv9GNOppTnzUb6PUz7rNAbGdkHRXEglZZUA5Td+k+Nth6Fakr/UI8yLi3
         SXoVT6L5ZaBTMTO/dRajfS/0Fm//MxBRQxcS7g4Hp0oq25tnxq/vpvjJynLDbVlL2Jlo
         HaXKWv3kdAp/ZhaKkb9RXfCbvumtr3xySB0wuFHPr8tPpLh1UcNKqP7H+e5TGY3oZzhJ
         azyEMIgESHxsK9+EuDukmfkuuk8DVKt7Jgln4p1pArhIp8PtwMJEHAY1HZjNeLa7Qm3Y
         4nqxzczQ0RNu3/R8PlQQKqQcPqSjrxI8wOaY7/wpv6IV84loXAYdUmRnlr/nLsv/xIZI
         ZJPw==
X-Forwarded-Encrypted: i=1; AL+hErEOAcmgpqt8+i+z7tMbIeiwfyojOnqIb4mj87rbd+PXNNZFpHLz7e0FWgmGdScqBSzRwbSz@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZjGdDmEvtUZS9sZ0EGcNiR8hQpidW6KVYxVbtCNLViT0rMDmP
	8dp1pGpNcu+H0vaZgAh/mvzMX+b0I+avhnYpnuC20HT1Zihiq1Myyj+FP67z9suZ6R9FP0+WYZc
	SXfk7Wg==
X-Received: from plbky12.prod.google.com ([2002:a17:902:f98c:b0:2e8:7c6f:de6a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2b05:b0:2ed:101c:480a
 with SMTP id d9443c01a7336-2ed40c9a8e2mr42904045ad.37.1793991926030; Fri, 06
 Nov 2026 11:05:26 -0800 (PST)
Date: Fri, 6 Nov 2026 19:05:25 +0000
In-Reply-To: <au347UiVUe5oUuxM@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <au27Y9m78_3EH2v1@gmail.com> <a69dd097-7e71-41f0-9a6b-eda001773236@linux.dev>
 <au347UiVUe5oUuxM@gmail.com>
Message-ID: <au4kpSGVSH3tYiZm@google.com>
Subject: Re: [BUG] bpf: tcp: bpf_tcp_ops_set_rcvlowat() missing from BTF with
 clang KCSAN
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, acme@kernel.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, ast@kernel.org, yonghong.song@linux.dev, 
	bpf@vger.kernel.org, kuba@kernel.org, tj@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 06 Nov 2026 07:58:01 -0800, Breno Leitao wrote:
> On Fri, Nov 06, 2026 at 09:16:24PM +0800, Jiayuan Chen wrote:
> > Thanks for the report !
> > 
> > 
> > On 11/6/26 7:38 PM, Breno Leitao wrote:
> > > My arm64 KCSAN builds of linux-next fail since next-20261015, because
> > > bpf_tcp_ops_set_rcvlowat() is missing from the vmlinux BTF:
> > >
> > >   WARN: resolve_btfids: no BTF func for kfunc bpf_tcp_ops_set_rcvlowat in bpf_tcp_ops_set_rcvlowat_kfunc_set
> > >   WARN: resolve_btfids: unresolved symbol bpf_tcp_ops_set_rcvlowat
> > >   Failed to generate BTF for vmlinux
> > >   Try to disable CONFIG_DEBUG_INFO_BTF
> > >   make[4]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
> > 
> > 
> > 
> > Has pahole fixed this issue?
> 
> I don't think so, see the line below:

Could you try this ?

---8<---
diff --git a/dwarf_loader.c b/dwarf_loader.c
index 01049e9802a3..92793ae6cf98 100644
--- a/dwarf_loader.c
+++ b/dwarf_loader.c
@@ -1782,18 +1782,32 @@ static uint64_t dwarf_op__const_value(const Dwarf_Op *op)
 	return op->number;
 }
 
+static bool cu__is_arg_reg(const struct cu *cu, int reg)
+{
+	if (cu->register_params[0] < 0)
+		return reg >= DW_OP_reg0;
+
+	for (int i = 0; i < cu->nr_register_params; i++) {
+		if (cu->register_params[i] == reg)
+			return true;
+	}
+	return false;
+}
+
 static void parameter__set_loc_reg(struct parameter *parm, int reg)
 {
 	if (parm->loc_reg == PARAMETER_UNKNOWN_REG)
 		parm->loc_reg = reg;
 }
 
-static void parameter__record_loc_reg(struct parameter *parm, int reg,
-				      int64_t offset, bool is_deref,
-				      uint8_t size)
+static void parameter__record_loc_reg(struct parameter *parm, const struct cu *cu,
+				      bool for_inline, int reg, int64_t offset,
+				      bool is_deref, uint8_t size)
 {
 	if (reg < DW_OP_reg0 || !size)
 		return;
+	if (!for_inline && (is_deref || !cu__is_arg_reg(cu, reg)))
+		return;
 
 	parameter__set_loc_reg(parm, reg);
 
@@ -1920,7 +1934,8 @@ static void parameter__finish_piece_decode(struct parameter *parm, Dwarf_Die *di
  * ABI-preserved or should be replaced by the single used member candidate.
  */
 static void parameter__multi_exprs(Dwarf_Op *expr, int loc_num, struct cu *cu,
-				   size_t exprlen, struct parameter *parm)
+				   size_t exprlen, struct parameter *parm,
+				   bool for_inline)
 {
 	int regs[2], nregs = 0;
 	uint64_t piece_size = 0;
@@ -1951,11 +1966,12 @@ static void parameter__multi_exprs(Dwarf_Op *expr, int loc_num, struct cu *cu,
 		switch (expr[0].atom) {
 		case DW_OP_reg0 ... DW_OP_reg31:
 			if (loc_num == 0)
-				parameter__record_loc_reg(parm, expr[0].atom, 0, false, size);
+				parameter__record_loc_reg(parm, cu, for_inline, expr[0].atom,
+							  0, false, size);
 			return;
 		case DW_OP_breg0 ... DW_OP_breg31:
 			if (loc_num == 0)
-				parameter__record_loc_reg(parm,
+				parameter__record_loc_reg(parm, cu, for_inline,
 							  expr[0].atom - DW_OP_breg0 + DW_OP_reg0,
 							  dwarf_op__snumber(&expr[0]),
 							  !had_stack_value, size);
@@ -1994,14 +2010,15 @@ static void parameter__multi_exprs(Dwarf_Op *expr, int loc_num, struct cu *cu,
 			if (off < cu->addr_size || parm->loc_reg == PARAMETER_UNKNOWN_REG) {
 				uint8_t size = parameter__loc_size(parm, cu);
 
-				parameter__record_loc_reg(parm, expr[i].atom, 0, false, size);
+				parameter__record_loc_reg(parm, cu, for_inline, expr[i].atom,
+							  0, false, size);
 			}
 		} else {
 			reg_pieces = false;
 		}
 	}
 
-	if (loc_num == 0 && reg_pieces && nregs == ARRAY_SIZE(regs) &&
+	if (for_inline && loc_num == 0 && reg_pieces && nregs == ARRAY_SIZE(regs) &&
 	    piece_size == parm->type_byte_size)
 		parameter__record_loc_reg_pair(parm, DW_OP_reg0 + regs[0],
 					       DW_OP_reg0 + regs[1]);
@@ -2009,7 +2026,7 @@ static void parameter__multi_exprs(Dwarf_Op *expr, int loc_num, struct cu *cu,
 
 static void parameter__decode_location(Dwarf_Attribute *attr, struct conf_load *conf,
 				       struct cu *cu, Dwarf_Die *die,
-				       struct parameter *parm)
+				       struct parameter *parm, bool for_inline)
 {
 	Dwarf_Addr base, start, end;
 	Dwarf_Op *expr, *entry_ops;
@@ -2051,7 +2068,7 @@ static void parameter__decode_location(Dwarf_Attribute *attr, struct conf_load *
 			continue;
 
 		if (exprlen != 1) {
-			parameter__multi_exprs(expr, loc_num, cu, exprlen, parm);
+			parameter__multi_exprs(expr, loc_num, cu, exprlen, parm, for_inline);
 			continue;
 		}
 
@@ -2060,11 +2077,12 @@ static void parameter__decode_location(Dwarf_Attribute *attr, struct conf_load *
 		switch (expr->atom) {
 		case DW_OP_reg0 ... DW_OP_reg31:
 			if (loc_num == 0)
-				parameter__record_loc_reg(parm, expr->atom, 0, false, size);
+				parameter__record_loc_reg(parm, cu, for_inline, expr->atom,
+							  0, false, size);
 			break;
 		case DW_OP_breg0 ... DW_OP_breg31:
 			if (loc_num == 0)
-				parameter__record_loc_reg(parm,
+				parameter__record_loc_reg(parm, cu, for_inline,
 							  expr->atom - DW_OP_breg0 + DW_OP_reg0,
 							  dwarf_op__snumber(expr),
 							  had_deref || !had_stack_value,
@@ -2103,7 +2121,8 @@ static void parameter__decode_location(Dwarf_Attribute *attr, struct conf_load *
 			if (dwarf_getlocation_attr(attr, expr, &entry_attr) == 0 &&
 			    dwarf_getlocation(&entry_attr, &entry_ops, &entry_len) == 0 &&
 			    entry_len == 1 && dwarf_op__is_reg(entry_ops->atom))
-				parameter__record_loc_reg(parm, entry_ops->atom, 0, false, size);
+				parameter__record_loc_reg(parm, cu, for_inline, entry_ops->atom,
+							  0, false, size);
 			break;
 		}
 	}
@@ -2171,7 +2190,8 @@ static struct parameter *parameter__new(Dwarf_Die *die, struct cu *cu, struct co
 			parameter__record_attr_const_value(&attr, cu, parm);
 		parm->has_loc = dwarf_attr(die, DW_AT_location, &attr) != NULL;
 		if (parm->has_loc)
-			parameter__decode_location(&attr, conf, cu, die, parm);
+			parameter__decode_location(&attr, conf, cu, die, parm,
+						   ftype == NULL);
 	}
 
 	return parm;
---8<---
