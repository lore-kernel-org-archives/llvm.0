Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E141E487
	for <llvm@lists.linux.dev>; Thu, 16 May 2024 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715888466; cv=none; b=REAiK+H3HHYZSQYCnd5AtaS2Ge2y+CokHO8L6qWKntz2NTQhKDaJWFRslCBRDGD5SSp7YR1MEYsNNgyYOCbikk5p+ti7eouZfR5wlDoCf2iuB14+VbK64z4Ev3feN1vAjNQHpe2JcYxsVFW1URxBVXH1sG/8x6iyyf+Z9MKC3O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715888466; c=relaxed/simple;
	bh=qRGrAjcAOw/BpdIDpIw29VUbCdUpk5nCvIPyhVcCtco=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=m8pWQkI0dnPSb51ThdTLTxNpbwNfxZEE4H7xU81W5aGNPWbbnK9OALn7COO7ck88sr/nXd6RO/yVRtY38ExEeLZ8O0kod9QQvvi7IPCHvL/a2ftM72aItPVat4SjBMp5fxwbJV/X69AnOH9WRM/EcHezJ/waz00AjFWWdLFWZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0GXYltL; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0GXYltL"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61beaa137acso140262567b3.1
        for <llvm@lists.linux.dev>; Thu, 16 May 2024 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715888463; x=1716493263; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e1P6Db3qkzX3owazVizLczKyUZgazBAYnFdo7ANHUs0=;
        b=T0GXYltLGNCRZxwKFHzryMOY570hXmsGRHYZ/OWGhUaRXmH1ttrCvjqfBFDsGWUbm/
         QkpA2QN8J7MBIclNjppQk5Jy+wXyp8OZk0yQ8KS4oLdUiqjGc9IPYCgvHkCFtEQ20b12
         gAi4bcTEHHbLs6liEOuBxtqvsXEz3wfLwjcaO2PwI2vw4YU1uNxevMN5DDyBkx0pGceb
         YtkzXlclni57CoTGfCC08zSjFmqgzTBNLMr+MQ9zc03oEjDwl1Bz2u7NQceJk4vGEy9J
         AgyKgJ8U9gN5MiP5iWZ5rP1CqHvF0ATlyItA1jZDhOU1fP5UDtqqVPKmS5igdjn0F0K+
         ozhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715888463; x=1716493263;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1P6Db3qkzX3owazVizLczKyUZgazBAYnFdo7ANHUs0=;
        b=EIGe4ZpzNrJpRNnau9vULzcyg33U0FufNtcRdlJ6GhBH0dw6Z/pfUrJ9/5nUCvYAAK
         uyRvhVKDh6rq1eWKnUuPGeKs6u20GAhHFYWGl7jFFmZHDFmAi0RIcPuCYyoPiC5vakQC
         wZqn/97SV6uiS2ByZVcDM5/psI+/s+9cj9VvubouBnn2irBgCiXbzB4nIt8gDHSGx6tC
         ccGoHowIG+vNBcctwd8lWSkgTMYRXp8weSIP+2xJzTEzmuBglbUQkocVKnJwze5vBvlU
         N58MrUtx8jik+A+9tF4A7+qnw2i72jMf7J9MO0wQFojcO4Zdcx1NGIcFiggA3oJ5T4pH
         qnMg==
X-Forwarded-Encrypted: i=1; AJvYcCVHGdM2I7VN2I1bfwCExec7opWHn+AZmf0qmFsilNTmnelqDt+qYxXLWdx8eGlWGYecy6hMf2XOuwz2/Z6MnKZu8ouA/g==
X-Gm-Message-State: AOJu0Yx1ZUz+Nd/EMbtUqbrNQPk8pEKKoByRREr0CjIbbJEvLE+Of73k
	Rd6CoNe3nE+jDKfq9hhVxPkKy9DQHuyTEm79RQUIoj+Oj6yDCOia4UeultYQ/iau5yFyrYGuGSk
	OcGit6IupYA==
X-Google-Smtp-Source: AGHT+IFN8NHYHCx0Mp5JwPViDfrjX4xtgJESmyjLorrTrnPM7FlMf7IPZ+ZzzNyfzySoyjQbNXwc78fPagVkYw==
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a05:6902:1142:b0:df1:d00c:130c with SMTP
 id 3f1490d57ef6-df1d00c1507mr450667276.5.1715888462994; Thu, 16 May 2024
 12:41:02 -0700 (PDT)
Date: Thu, 16 May 2024 19:40:53 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAERhRmYC/x2MQQqAIBAAvxJ7TlCxwr4SHUy3WioLrQiiv2edh
 jnM3BAxEEaosxsCnhRp9UlEnoEdjR+QkUsOkkvFC1Gy6fC0M7suG834cTHeRea0VrxSvZUdQoq 3gD1d/7hpn+cFped4W2gAAAA=
X-Mailer: b4 0.14-dev
Message-ID: <20240516-kunit-compile-commands-v1-1-86e61857c820@google.com>
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
the source tree, so you'll need to add --compile-commands-dir=.kunit to
your clangd args for it to be found. This might turn out to be pretty
annoying, I'm not sure yet. If so maybe we can later add some hackery to
kunit.py to work around it.

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

