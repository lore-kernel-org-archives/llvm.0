Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53948156F3F
	for <llvm@lists.linux.dev>; Thu, 16 May 2024 19:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715888315; cv=none; b=tpgEQj6tIzV0jo0s6vW7Az/ebpsgKESJO1UeZH7JtVVy//DfXfALOL9FoPwMNKMxVjFwQIa/5Py+294oi/f9KdtH0vIj4IJEsiFZRZms7JzVSxf222dBZlpXlbQFQrMmZUOQltHH7w5Rx2A/kNqf+b7TqaF77gGAHHEVIHo75FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715888315; c=relaxed/simple;
	bh=mlnMYRMZywee+bU7X3E/HTKmms1wgK1WMiDq3bygPLc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c3lags+GuWULCAWBB39BrI0TKEMOiDYOmkNNC/9t6jQQ/8H3Fb8n73v/qcF3XXFN7wKHQwPv5m/UO/hizHWYSh2kQ+r3CHr0jRRiA0PgECGToexcinxsY5Y4r3y58DQghFGlQM5OddY8CmfFhpOR04WXqCC33g3MELjPUGjk/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MRezFHiF; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MRezFHiF"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62035d9ecc4so161353747b3.1
        for <llvm@lists.linux.dev>; Thu, 16 May 2024 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715888313; x=1716493113; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GTNya4KcgcK2eGurHUl9hyGe1sf/dMjmphGQ/IQpeU0=;
        b=MRezFHiF409gX5WwrULGRb/heHSOvIfL75krw0kHICER31SzToV5LiARyCD77uhuP1
         BIueEEzsDWQ5c1Zo09DtEDasteAdanF4avj2lW6Qa/qv4z1bc1kuP+L3J1PJSR9D8buk
         DpB86MvmES7ULeahGaHZeFImgrDdy7ZQnkExqRyMZvpwjPMrzomjefNmNLwvvccrvPZ6
         EA4tIs3N+TOJjilqKWL/7sxy9pwtxVfFtwcliUz45dNpEoRRLR7M4FHyToCST8xF10ye
         lt7j93nBbfiU8/sLXmHOnceKWHTQCa7V4IhF2YJVlu7kX6gyc6aG4c5Tl3gAeVahJ3ck
         cw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715888313; x=1716493113;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTNya4KcgcK2eGurHUl9hyGe1sf/dMjmphGQ/IQpeU0=;
        b=NpD5Q36Nn36gXX8FLjorrOfUnfEu0V2UZYnK+hln6/wvs+F7qQLJ7RD42OSQ2LDFYI
         gPjPPCXH2/e131Qan1kig7wpBrx/ZJTzIuyZPju5/ZhHJ8J44ot5+f7y9JnfhNl4/yEc
         ZAb6W4byptmEsn4aFHyYe8ASHQOlwLixpW1kMJm1Zo+UCMPTB6TTDsvkh1bIQQTf/ZhF
         F15qNCfelM/N8iXwz6Nghwg819NN+4R6pM0DcPhwWzqv376bLsI56OXKmWsOfS8c2dIY
         EwMBe6jbE45AdPpLoOyC+nn5dE+kAYmtvyVG54veHp4bvbMLLdxeKOybrLbIcfj+gxnI
         FypA==
X-Forwarded-Encrypted: i=1; AJvYcCX0O5GOwRrDvi0s+tJrnaMnC/cKkQJ+l2nqWZWDROT4kkrdGNv+8ddY8BwE+a+ZrcORWjzgB+UjSb23cnALsulcMwz/rg==
X-Gm-Message-State: AOJu0YwCQJSSxHMu1CsQG7oe/AZUAjzynik/JAaJF7knXX4deblZu++y
	8z8Mnshfzp+w4GsMTDUN1PMTIW1elVOkIs7/r8AvD1cqEwAPf6iOp5Z2HBs6stk8XZ51ICMCggK
	c1Q5fmZR2KQ==
X-Google-Smtp-Source: AGHT+IGr/aLkFgMRkSjlxVh1xA+fX/na3/5ELahuHu4kuYZN2vLitNc/Cs2NtJ6FKvCmAN8Sir+chzojBjOS2Q==
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a05:690c:b96:b0:61b:791a:9850 with SMTP
 id 00721157ae682-622b0168adfmr51024257b3.9.1715888313401; Thu, 16 May 2024
 12:38:33 -0700 (PDT)
Date: Thu, 16 May 2024 19:38:30 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALVgRmYC/x2MQQqAIBAAvxJ7TlCxwr4SHUy3WioLrQiiv2edh
 jnM3BAxEEaosxsCnhRp9UlEnoEdjR+QkUsOkkvFC1Gy6fC0M7suG834cTHeRea0VrxSvZUdQoq 3gD1d/7hpn+cFped4W2gAAAA=
X-Mailer: b4 0.14-dev
Message-ID: <20240516-kunit-compile-commands-v1-1-05fc32b79312@google.com>
Subject: [PATCH] kunit: tool: Build compile_commands.json
From: Brendan Jackman <jackmanb@google.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

compile_commands.json is used by clangd[1] to provide code navigation
and completion functionality to editors. See [2] for an example
configuration that includes this functionality for VSCode.

It can currently be built manually when using kunit.py, by running:

  ./scripts/clang-tools/gen_compile_commands.py -d .kunit

With this change however, it's built automatically so you don't need to
manually keep it up to date.

Unlike the manual approach, having make build the compile_commands.json
means that it appears in the build output tree instead of at the root of
the source tree, so you'll need to add --compile-commands-dir= to your
clangd args for it to be found.

[1] https://clangd.llvm.org/
[2] https://github.com/FlorentRevest/linux-kernel-vscode

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 tools/testing/kunit/kunit_kernel.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 7254c110ff23..61931c4926fd 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -72,7 +72,8 @@ class LinuxSourceTreeOperations:
 			raise ConfigError(e.output.decode())
 
 	def make(self, jobs: int, build_dir: str, make_options: Optional[List[str]]) -> None:
-		command = ['make', 'ARCH=' + self._linux_arch, 'O=' + build_dir, '--jobs=' + str(jobs)]
+		command = ['make', 'all', 'compile_commands.json', 'ARCH=' + self._linux_arch,
+			   'O=' + build_dir, '--jobs=' + str(jobs)]
 		if make_options:
 			command.extend(make_options)
 		if self._cross_compile:

---
base-commit: 3c999d1ae3c75991902a1a7dad0cb62c2a3008b4
change-id: 20240516-kunit-compile-commands-d994074fc2be

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

