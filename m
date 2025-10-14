Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C22ED14E
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435129; cv=none; b=t4fZDKyfJpxzxbI+ZLFO9FgAsq4BO755kslm5XEl3+pxVaRVFwxzcv2UHibPjV7PhhrBt4K2JvDlfPKydznjsFOdwV7KxAz27S3CiNCfq+Oyi3hP7cuCxbecY0dUky99rwreS6IhFHbBCGYe5j4lKWrwvWDpO3s8o3xl86QaPfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435129; c=relaxed/simple;
	bh=CdJERmWvNp7t0aS7szl7vFW60Q5hzog8gZxLGjoRqyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMFmDyK0DCAGewFs5AcD/qxqau5FYlZKTejgNeACtv87MOHCxpDkAByrjK3G9p66llhU2riSU6DXJlDvDCK1hQphIojxvqhaARvJpiXt5HrYTOWVr7iJCHLTNvnPkK8DI1dSToNBbGjZrIt9Sy5vHumnCVEb9N7WqZRbfb7h/3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=XetqUFTe; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="XetqUFTe"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A044F1FD0A;
	Tue, 14 Oct 2025 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1760435119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZNxn908i10T5ef/uzJnec8IbaWn/a7A52AraZk7MdQ=;
	b=XetqUFTe0JfS3FKDc8kSnMhqQgEpNh76KiAwGnkdQ7a6sziShiHeFZFYTeG4aujA1e6b2G
	YYrbqU9aHAdfiu8nlscq9yS7G6eg+pAWPeJU//GmGzKG0d3M8abo0qMLAZMrGJPkY4f+G6
	HV94vfL1Qb8bhW05x9B/Sgu/005W0D/lzJ2ES3zOg5u6c1uklxUJLvnrRutc8ejO0IKoW5
	kBRr0Pe6HE7k5Yh9gYUTguFLpYEm7wccFj05BOMnSHfpOr3MXXhHNZvjooqBS7l5GgeK7j
	ha15lIJOJQ9JGktJiwwjVCqzJUla4p1WxPR7oRsRrHkIXzX/NucVwfToV+lIMg==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER option
Date: Tue, 14 Oct 2025 11:45:11 +0200
Message-ID: <20251014094511.627258-2-gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014094511.627258-1-gtucker@gtucker.io>
References: <20251014094511.627258-1-gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io

Add scripts/Makefile.container to wrap the make command in a container
using the CONTAINER= variable to specify the image name.  For example:

    make -f scripts/Makefile.container CONTAINER=korg-gcc defconfig

The container image name is entirely arbitrary and the container tool
may be Docker, Podman or any other compatible alternative specified by
the CONTAINER_COMMAND variable.  The default is set to docker for now.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 scripts/Makefile.container | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 scripts/Makefile.container

diff --git a/scripts/Makefile.container b/scripts/Makefile.container
new file mode 100644
index 000000000000..711cf9188016
--- /dev/null
+++ b/scripts/Makefile.container
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifeq ($(CONTAINER),)
+$(error "Usage: make CONTAINER=<container-image-name> [...]")
+endif
+CONTAINER_COMMAND ?= docker
+PHONY := __all
+
+__all:
+%:
+	@echo Running in $(CONTAINER_COMMAND) $(CONTAINER)
+	@$(CONTAINER_COMMAND) run -it -v $(PWD):/src -w /src \
+	$(CONTAINER) $(MAKE) \
+	$(subst CONTAINER=$(CONTAINER),,$(MAKEFLAGS)) \
+	$(GNUMAKEFLAGS) $(MAKECMDGOALS)
-- 
2.47.3

