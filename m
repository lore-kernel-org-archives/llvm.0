Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FD839AF8
	for <llvm@lists.linux.dev>; Mon, 22 Jan 2024 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705914772; cv=none; b=rJBZGSCTxQcrZaDVPX0cMuYVIDQp5LjZmq1B8mJRhcd9+drLTdO+CoMoKw58CR813MOA8QbqSwWos/nHJ3j0Fm4VSINyQxMeeRStqPdP0rYAd8TKmN+UZ1qnykDUS6iwZlGpt7acOlaIcLjsaoK7SJOwzhuzys53tZghZqu3kW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705914772; c=relaxed/simple;
	bh=7WqvfI2V9xt/Od2Zwwt1owQ25hJdvvX/uuPnR9lgy1Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AVmzjKWJPlwnOleqBPIKjEG2lD5QBoC0wPKtg21YyaA/yAehLjcunkSTFtjnZZZrBfEwZf+raSaPNy4QYbNVRTYXHXW8XCPlGOwBC0EFMqnVJThLzxO8jky8cqZ4Ppg+wdIHAsCluZ5imlY9Y8QMaOU/HRrYaciZgMPJsNpmrxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KZjl29xx; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KZjl29xx"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc2470bc0bdso3796281276.1
        for <llvm@lists.linux.dev>; Mon, 22 Jan 2024 01:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705914770; x=1706519570; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=anpwjJFJvKmui4DbRVFl+bq/czyO2Fw5IsMP2KX6EWQ=;
        b=KZjl29xxXOk8YvD57oTSVZ79vPF+QbtRWlDMqSLkP4FlA51EItHAKYf0Z3ks6uMYzQ
         6YRmamVslTeZmkaJtJwCoX+uX4IWzxMwjvTXqYGqWyd2EQ6zZ/cEME/koxIqxFUQ0Jpn
         ORk1D4C27gBXiM0wpePb1yLWupWkc9Mn/zjS4oD4rJA6oYnhW0nB8NloePzDccv46kZV
         LD0gYWVz+LwknHTzMJbRQFV/t1OCyi0BRM7KCYGAUAt716TwHl+0NxmRyJB/ZLdhsSoS
         yLMqlaiIliyybxjisx4HYSBj3IgAqbVBtcjJ1QmUnukST1TD5YBJDVcdOhM5YLCIgLvl
         z95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705914770; x=1706519570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=anpwjJFJvKmui4DbRVFl+bq/czyO2Fw5IsMP2KX6EWQ=;
        b=DVYXr3ClDFXpheM4C5Fv5yWZXaaMctbQDygoE/74Y8Lqf0wLoXsOthyuaFXT3JTBuQ
         r/skW6+/XCt2vIhNOoVeKDIKQKWFewyShhJrVkVRRYQP0PaMSFFqldsLj6VorELFKuW8
         OVtA+meTcaePphBQ1BmUgV6YRcw/tdbb1JDL7ZC+mDcbhh0VkTMiMctVv0d0Gk6DGkje
         ZUpf0C+VmdnpUnIIwiWzDpRT+MJk5GZIr3oRx0aB1EAm5dSl0sHOeRHD+L57aS5iU+6w
         aCJDruQbTvZdv5qUKbl3oIfoI5AXsk0cdNGKOETMtxni2C/byQ4m6NsN9VN9ZszHKYMl
         gq+A==
X-Gm-Message-State: AOJu0YwcbYxhzG/LCel2474NnOc7eASy/VaY7PZZOUd3HO2V5pbKdJmT
	fU8BmnqyH6qPZPxunweRLAClpQ895BN+VfCIYefoZnnHqbaLbHr8TvU4ZHok7bMRS4Cq7w==
X-Google-Smtp-Source: AGHT+IFFPnrivenEXAeTge4xUB//ErQJ/nlZj8/EpO9cvDlG7OSkvrz/wCrriJHLaNBS6+w1f6cwmANP
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6902:1808:b0:dc2:3426:c9ee with SMTP id
 cf8-20020a056902180800b00dc23426c9eemr240839ybb.11.1705914769920; Mon, 22 Jan
 2024 01:12:49 -0800 (PST)
Date: Mon, 22 Jan 2024 10:08:55 +0100
In-Reply-To: <20240122090851.851120-7-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240122090851.851120-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581; i=ardb@kernel.org;
 h=from:subject; bh=thQkn6eFYWU4rIO38nRY5rSfaRiPUJPmqajniqH14XU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWdwXL25bMmmm1ZFF9evWDmkTcTIha1sGp3zPaal+6zr
 4qB+1xVRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIGztGhtPFZyb/Xb5FN/f7
 90CdRWd52mdPLC3t2LdyTaY67xfrJysZ/gpIeM4/a/g0Y3fTyS5Nqasbk9+o34rxme419eRVjen fGRkA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240122090851.851120-10-ardb+git@google.com>
Subject: [RFC PATCH 3/5] btf: Avoid weak external references
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

If the BTF code is enabled in the build configuration, the start/stop
BTF markers are guaranteed to exist in the final link but not during the
first linker pass.

Avoid GOT based relocations to these markers in the final executable by
providing preliminary definitions that will be used by the first linker
pass, and superseded by the actual definitions in the subsequent ones.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 2 ++
 kernel/bpf/btf.c                  | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index a39e050416c7..ef45331fb043 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -456,6 +456,8 @@
  * independent code.
  */
 #define PRELIMINARY_SYMBOL_DEFINITIONS					\
+	PROVIDE(__start_BTF = .);					\
+	PROVIDE(__stop_BTF = .);					\
 	PROVIDE(kallsyms_addresses = .);				\
 	PROVIDE(kallsyms_offsets = .);					\
 	PROVIDE(kallsyms_names = .);					\
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 596471189176..a659fc7045bb 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -5581,8 +5581,8 @@ static struct btf *btf_parse(const union bpf_attr *attr, bpfptr_t uattr, u32 uat
 	return ERR_PTR(err);
 }
 
-extern char __weak __start_BTF[];
-extern char __weak __stop_BTF[];
+extern char __start_BTF[];
+extern char __stop_BTF[];
 extern struct btf *btf_vmlinux;
 
 #define BPF_MAP_TYPE(_id, _ops)
-- 
2.43.0.429.g432eaa2c6b-goog

