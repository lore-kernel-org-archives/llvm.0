Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045F238944B
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491931; cv=none; b=Ukrow4a+D2gGI00MNLKsrXVdZX2sjN7oq5TcugQzWSbEKnKd7313NSskFI95PV8Gnj1fPp5/+QmdIjgTLP7v6zbtS9wxbqpc4+N8m98H7A6uwifBADTh2awPHe+ZT92nm9E8MGm0JypHjnqup4ZgBfp6Y3yAD8xsAddOPu9NU24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491931; c=relaxed/simple;
	bh=/+Gi/l9wdVUQGM5LCHXWoaW6E/VYQSmnTSa7McD1NPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NX738m3vvmvBBpsr50ZBtksWrSXczwkUh5kCpRN0KKAKJOyOO0Fzb9KFNCYTh/E44eD6/V9ponRqS6tDG+Wuk7wdV3eG3B2blPwsCWPnEauyUQMI6LqawaaW+XXzJueewaoUpsaKt4n69Oz+kKsCQ6a0zPSmll1i1PrcaJrRYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fnx2NPIf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fnx2NPIf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso33857635e9.3
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491928; x=1776096728; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTBYFNqkxGFNopGVGZu2b+8zsPm9XVKJaoqPGL19kgM=;
        b=fnx2NPIf1ra9dP2ENifEXPjekpc5v9NlxpBnnm8aLGPChF4sB4fQUG/ZfFqdn2rA6q
         ubt73jNQVLdk1DPr0sMQb6lwceiVsFiid5aJjEVT4atDRnsqYcSVC//Nd9MEKx8R23Wa
         1lsgJXOG2VDItIMIO2YQ/VldTJU1ytZdUEIcsT0QoOu+5Jvlicd1WuilKU9DBdXxHREr
         0H79Ry+SyaIgFYi5+0L4lmUBaYyvcH23QgYHnHYcm++Z1Q96pe+M82wVClmDkRLWAFj9
         eOqmzCVjybLh8p3cwwMjLu8bkgmx28qF7eI6Nj9YS6JGicDfFVK7QfpFB5WiyPzZtzDZ
         zNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491928; x=1776096728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTBYFNqkxGFNopGVGZu2b+8zsPm9XVKJaoqPGL19kgM=;
        b=hSDO9cfXN+7c2qUxgJ8rCwUBCbGJwVZyZs3hhJBRrOMxX5KvMuEnF2H6AxjZF3Ld80
         YL/KyjGPrFnVrwsAlcZ+AbrEESvjfX9Ky9ilp+pRZkuF4uK0f4SFkxv3zM/yURtriOCe
         Ej2Jjvk5GeBo24P5wGW8nsAcVxiP/CiZ9Pe3+VEEB3ZLGtvz3IaPk86BpewskgpQAl0s
         6EFTPvpoYVNT9o29ZLcrLkGsPkYzPum5/fr1QzYEmyN1TLM8ysWeJkvOPYezaqM6aSXy
         0NDL+Jjq5B2B396XvSIiKOilAlvEDGYGINgf/xxcN9z/REszPA8V5rXxpgOu1Bg/gq2P
         +u+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXodquhrA+X8cKEPkspMINy44syuGkkWVILB/EvlwzEFmAuPEez6OjsnBDyqrAi0T/WeKRh@lists.linux.dev
X-Gm-Message-State: AOJu0YxMSZL22kwX5TQBgARa1aom9KYrdmOpuh+1EKyLY3VA8/dzaQKq
	ntyWK5Kr10pP5aodjXKQ9y3f/6mQMYQLi+Wm6ri6gt5YdxIPtjsJjN1OtdM3lp1kQ3A=
X-Gm-Gg: AeBDiesMWFP66ME9C5l7stN/IdtWfNVfQfblyiHAuseW8yB0DFVEwffEGYe+gLq6j9j
	SnCWzYxE4M6+CM4mX36+ic2+K9LE2pIXeAdq5AxHjvdqenroFpCzjph8lKOWG4l3tDkzizVi2oi
	5wXWeD5cvLNNNiNNsW5QOdKXt9k/AGK/AGQsj3DZHBEqoO/kLEzM1v9n37wROYc3k0ntPfn0tSc
	clLrGplP/Hm80gq4g9ktntK+6p+oMopaDfgSZX3IbA2p06U1SClaJxo+iKHJdlEyqFwaZycBfTp
	DH34htrfocWDp4+AX2YFhfTNzGNYkNeCr3/LfRAW8nF/0yrR8QghEQbdwdmOFjhNozmHCu20ij/
	gi9cFaTVTr+6kwaZTD1vVu7L8yOUT7M9Z3Q4o/PAP+Rd8axymd73Tq3RtKpIaCUXya3VoxQo1Ko
	Xn8lT35OmJjVE2
X-Received: by 2002:a05:600c:3f08:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488996d22f4mr213373435e9.1.1775491928345;
        Mon, 06 Apr 2026 09:12:08 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm11120032137.5.2026.04.06.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:12:07 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:33 -0300
Subject: [PATCH v3 11/11] selftests/bpf: Tolerate missing files during
 install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-11-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=1301;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/+Gi/l9wdVUQGM5LCHXWoaW6E/VYQSmnTSa7McD1NPI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKu/i+AikVkWXo/wn7tgFrAS1mTmlvuJI5hDj9PkQmbAfqICG13gCJninE/aPi5oGYthBnNByBU
 gNGnMc+RAJgM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 1e1da26153a2..209bde90c3dd 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -949,6 +949,13 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# Some generated files might be absent when only a subset of BPF objects
+# could be built. Tell rsync to ignore missing source arguments.
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)

-- 
2.53.0

