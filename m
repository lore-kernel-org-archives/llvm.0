Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFA39D6EA
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 23:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419945; cv=none; b=cth8RDHgRk9R9+DymOvpZu4FIhhzh1B8GKEi7DRmD1lm8HgP9RZyggOqs4wvJZadJFMpKFdPF0Dm7wCeLulcZodxrexe1cmjgkomsQ+C1jisjv2+McFib2AwTqjWWKWuRI3/k/Lb3lO7PPlJ/tVhafMUJPOMas8pCMbkg+aEjOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419945; c=relaxed/simple;
	bh=L9HuTY0g8gIAf5yOwBttXUIxYT88+W0S1PATCxy+7ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l94JHwLc6DnCzy53lbWcgrLp6Y8rMXzpBocxidkFwdG5s+3BnB/X44R7y/87asDK4nBYAP7BWdsH47d5DUATfIeFNX0GmV4ucddQSz9jJw3oFn+rGhl70rFNJeeT7ke6CXnvYp7dHkvPWOe3wYhuWcN3E/09DvjokBh1vkgpXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FAMUyEGK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FAMUyEGK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0046078so107429205e9.1
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 16:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419943; x=1778024743; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiBkOsP3D37NyL+KOe67WxRClt62TKa7PSBgpnWneMk=;
        b=FAMUyEGKVwnhsTDA5neW9DpWoIS+6TP79WdFMLLAR9tSqbLwBU71mjxhwv/nD4IZ0y
         JDnIysZ4MXSid5el64g8UytdDyu8x2dr9VOvIHcTSWtGqixOMvzXP8eeUaJ4RyUYs+6A
         nGz1WckqJbBo/enG+fE7rTj5WUXFnkRObvSA9SMsodMxmv79ilrSH2FrxEq2bKgyzOKP
         bPZdkXKxv27bI5fGJMb1dCakY4mLIWoSnHH3joukB+ayUyYorRJO35AkzQ0RzfECw1jM
         oJJoADpJgZcbVLpjJcJ4DhsxZUZ9gXeNgjrofzbCXWsBLzc6NmOADyvMbjpOGl1W1jGU
         OGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419943; x=1778024743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NiBkOsP3D37NyL+KOe67WxRClt62TKa7PSBgpnWneMk=;
        b=gwcnkvUW0CEpAQlI/+CgT65rr/EZTaiA1h5IG131IdCnSKHN2+D5ZmBZ2he5f8bhZ/
         qmsNmzX4kCIpmf4jlfhNgy5lz6Kb3Hfnmk7SvjY+InLq+v7ARyL96/dlSI8sKUwyRJQE
         EcHdieLTG/H3x5utklEKjkorN2ZSIlRV0PdDtQxDRC4CdrxkC46KK2IMp/saksbXI8Gr
         ILsv0B7ffUSTAXFh5ET5YAWxW1Z0KD8Ec+lsKjW/nG2hMKBmzhCQUNztkZNJN4UNJtZO
         9uG4k1NBoiWIocjIaL3AzQVQR3dzhqai7P4dNM15NfwsbXlgpJ7k9WZdtx0KskIrOZAu
         WTvw==
X-Forwarded-Encrypted: i=1; AFNElJ9QqFhJ7sz5SSUe4W3lgX/WMQoW2hbkqF8TYA8iuV/QDbthSfGGQYLJZRXEMdnFWf/LeeBd@lists.linux.dev
X-Gm-Message-State: AOJu0YyIu8ElqZYLnEHoPtxw9gaDFEAyFnGa7Mms90FGlG5HDCCazqOr
	6WNAb8S/IyN/mqBQuSFHfR5SKJdrE35fGOgpCJIhcv4hLhbmBml7zRK2pZH0qKQFA/0=
X-Gm-Gg: AeBDiev4HYZkNy+LF75Wmns1Tx5Td+CmIQ0/fX9xb2GWxMYuNWYZOQ9HNdoo/FIWSBt
	jUpwY86dIWXPIujm5QgifjI32kNhEj0kTHapLfIWD48vI68Pi1V71zRYDCkU2wy+24B/jk3W4KJ
	MHFUBYJ+29PSMAMVYdWn+GL7KxUkI34ot10FHu9ZYfmtgt0Y/euDDceH4PAtmeqIxELIlH3XSJL
	pR8yRdqG00RPeQ49xSyX6ifaWl8I+Tt1RXA3AqI2g9FakFdPpxtcahmFDkCgvsCdJUeFLSXtt4X
	u0E29YKJMAJ19XaX4ZTbbAk8n3CbDYf4p/jY288Yn96Ua2I4dTMRzmQFC+OuA+OqVK4/vI3HoUG
	BzfuVD2d5/5yhVoA3tEZ5LoqRl4LYHVr2TrZuqy0zGUJEvZvp/YVpwIAKFg+lJ5Ug+71T04zw+D
	TAC405VM5VV6PluKjI04pJWyfe
X-Received: by 2002:a05:600c:1382:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-48a77b232femr77940045e9.25.1777419942911;
        Tue, 28 Apr 2026 16:45:42 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6bbace7sm247108e0c.5.2026.04.28.16.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:41 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:07 -0300
Subject: [PATCH bpf-next v8 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-6-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=2530;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=L9HuTY0g8gIAf5yOwBttXUIxYT88+W0S1PATCxy+7ig=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKrl4FW9lTL2fKXCoxAttbRH4v2StF8TjG5J7aB7amC9XyO8MvqrLBBGkS6a2KmtCFalKLmK1Rd
 b52LNnLz0Lgo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal in permissive mode: remove the
output object on failure and print a SKIP-TEST marker to stderr. Guard the
BTFIDS post-processing step so it is skipped when the object file is
absent. The linker step will later ignore absent objects, allowing the
remaining tests to build and run.

Use plain printf and $(Q) instead of $(call msg,...) in the BTFIDS block:
the msg macro expands to @printf, which is a make-recipe construct and is
invalid as a shell command inside an if-then-fi body; $(Q) restores echo
suppression at the recipe level where it is meaningful.

Note on bisectability: this change is gated entirely behind PERMISSIVE, so
default builds (BPF_STRICT_BUILD!=0) compile and run identically at every
commit. In PERMISSIVE mode, this commit alone is incomplete: the linker
still rejects missing objects and the runtime still aborts on NULL function
pointers; those issues are addressed by the two commits that follow in this
series.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 608e6dff0392..f0545ee6b32a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -717,11 +717,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F) $(if $(PERMISSIVE),|| \
+		($(RM) $$(@F); printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2))
 	$$(if $$(TEST_NEEDS_BTFIDS),						\
-		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
+		$(Q)if [ -f $$@ ]; then						\
+		printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]" "$$(notdir $$@)"; \
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.54.0

