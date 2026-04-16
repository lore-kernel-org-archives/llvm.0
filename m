Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B2A3E4C88
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367879; cv=none; b=pPhzOmqdRiitc3w3XoVosYR/itq1WjBtEsNSWOS72uDW+JvTr/mI9rkn7NKIBSb//c4lPdmCTMJfJwp7F0bVv2DQup64RuvJ5TWz7kIc6+MxXJ1WF6s8pN4FVKs6aGqmWjz0OVKja37yAi3O21YkMUDOg32S7S9q3aHz4kmCawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367879; c=relaxed/simple;
	bh=LGjyQ4DJZImIa+l6d/sVh7HyuyYJEGS3b/TTHgcThlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3aT14rfixKmFX3EtHyv8OnuA6CHz9ZaKIzYhJFXpylcVqLpy+W+eZfdd8dOqWBxyhsHN1GP/YrCQED208aAvhjMm0i/vRtOnIBvBN4C9IMklBcxOjmqMAsx5i+P1elst6706AXslIzrvz0azZYlOxfGSx8RE8VYKabI0Y3eXmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OQYyEpY7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OQYyEpY7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so57792515e9.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367873; x=1776972673; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+TFkSx0/A90udZGFwEtC3VdLgE/56vsioCu8yOMo9s=;
        b=OQYyEpY7oqU8be/ZEUnsGp8n/bN7UcMHGWM3TRQ3q0+2BwlLxknZnM2bzVxD/uKlxd
         Nj4Y7KiU8BcofGCywbQGaSVK6puG9HvLJ1KFWNqZxkTIjdkOgQ96MzvDQquPeJ9C/8SZ
         E9io8hpP/ijDXl86VzVK7Yy7DmHYD1J2aSCOaTmVfujolrggj6nxxOW4aXDzTsdbYoCZ
         5uTI0A8QzTB/2K0YDeo5G51SpZQSpsjBiOUz4yE0GHHeO6+cOoYldXmF6asMlRK9Port
         Sa4fQ1HkWA8JTIJllHnHFGN638NgnMNDHh4c6KZgQ1gnUb3Yj6TPIqEHgZ+leUPZcIFb
         /MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367873; x=1776972673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+TFkSx0/A90udZGFwEtC3VdLgE/56vsioCu8yOMo9s=;
        b=efGbwgkIu6GERrDVAMUIFyeJ8KyXoG1QgjQwchrcr2je+vnWWAIUxtLhsrh9GHJ6nT
         9aOf7zS5Ft8AzysBwwSIYBJf/tqQJ3ByR9gak33P3eKU1Axr2E4jM5S5jFCWveHdiW+v
         R6hntXnRntchHR3GC78Utk6op/qOnQhYVNbeRyvrYUiKvmmISVTTWUp4e5fXmCDl+uNY
         JbRqw4UPbD8//TCfEEXE6VJnGvujnsMlBOvvR4IhO/KtOEdrlV1Xxe5Gyy57DRmyaftK
         900zJxzYLByU/uGctxKUII/CUEozsrerBCfk+wUjKb9N3S65U7tf7HcwuWFt2Stimtdg
         AXig==
X-Forwarded-Encrypted: i=1; AFNElJ+h1G7N9inw5fB36cDwWlp0lNVwgAVqAvn0XRNTQw4pNap9VoMLCUQkhnucwEHULBVPObym@lists.linux.dev
X-Gm-Message-State: AOJu0YxOlBTNji28nn+oBhF595q2o7ntdCv3r0a70NbisaeG1kloyrxN
	10B+NqsGQtfKyG8qv6FISVG95Y4tUQBy5YFlLiDhEdQhMT7p9rGfDigHaIibJvmLnfQ=
X-Gm-Gg: AeBDievGBJuHwNcKbckfW6N9JXXnXzU1Lyp6JsUNqc2PHQXxioAl1Y3qnKc/FwMScuk
	D1YpILGSa7SXsYFM0FLfFwHR6t/bZP/nt9pMWMZeogJByBwQveAgTLk0rB47JUmhhy5yNOBJWMB
	pfpcnx3BnmCZikCPdVO+81a25k9SEmDBHOGZJsDHxpnYnfGv4pfaKi/vJXvOJjwpUVkb6PTRUif
	fWLaoUQhQ2ZnBCkinRhwd53Xm7ywjJfJD7RotLeNmFe4Y1mh/Bi0iI/hXp1QSnOmNAAqICgsxjp
	7T55JYlaQvsNJUvlm+xlOJ84VrfZzMt3Wc3IsblAbGHJ0fAd89GQBAeGDh7Z+S0yG2r4S0hQUVm
	34UhXxSej+92Az731wf5gWomFZtv7lfhrzq6KaqFSbaOO9zW+N6z/wY+iqfO3937ySU0HyWcQnk
	Gfs38kON7O5hNcp3tnslLa/Pg=
X-Received: by 2002:a05:600c:c0d3:b0:488:c282:e77e with SMTP id 5b1f17b1804b1-488fb2a698dmr1869965e9.28.1776367872924;
        Thu, 16 Apr 2026 12:31:12 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm8749784eec.14.2026.04.16.12.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:11 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:53 -0300
Subject: [PATCH bpf-next v7 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-4-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=LGjyQ4DJZImIa+l6d/sVh7HyuyYJEGS3b/TTHgcThlA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI08/ckqohz/nSiAlXnI3fU3hujs2YjUPKtdoTCJ2gaAO2XqJOQXDYVBE1H3ACYPQ+TXtotgsne
 sNSpimrFKZgw=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

emit_tests is used while installing selftests to generate the kselftest
list. Pulling in .d files for this goal can trigger BPF rebuild rules and
mix build output into list generation.

Skip dependency file inclusion for emit_tests, like clean goals, so list
generation stays side-effect free. Also add emit_tests to
NON_CHECK_FEAT_TARGETS so that feature detection is skipped; without this,
Makefile.feature's $(info) output leaks into stdout and corrupts the test
list captured by the top-level selftests Makefile.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b23703f2cf89..7d1e5d6c30ec 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -164,7 +164,7 @@ endef
 
 include ../lib.mk
 
-NON_CHECK_FEAT_TARGETS := clean docs-clean
+NON_CHECK_FEAT_TARGETS := clean docs-clean emit_tests
 CHECK_FEAT := $(filter-out $(NON_CHECK_FEAT_TARGETS),$(or $(MAKECMDGOALS), "none"))
 ifneq ($(CHECK_FEAT),)
 FEATURE_USER := .selftests
@@ -723,7 +723,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

