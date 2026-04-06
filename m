Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DD3939D9
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499778; cv=none; b=ZId9/htIYymOU62OST5RQHSHn13u4Iigw+5Ciy3EB7dsOZUxfP4M2lZOT7VALv0JpUniCT5XWuSydfXDsUsZfe5m2b8xKJEPJUmQjV5lKbnmr1RjkguO9H0ae01ANi3cn2fZ/CFx62x4YOqkulB5PCtCNuNsTPakl7qiQxD/dmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499778; c=relaxed/simple;
	bh=oPNoWp44Ch8dIaWH8jcjnz5vhr49jgxtCJBbGnfyb/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IroAO4sn4jTqlnzdZOIfnmRnFjSp5lxbyT+D76drtpcBN3Dh4Ub6/Pvl7zsqxdcKdGFllGOLemR/oCLV6wYkNJxEjst+Z9FGtptYHa6hVhokbOsI6LpCA/rneHd4s+ij6SGMPoMqsok1SFA7BlDG5mkhjltY8FklBJmdPHchYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IZ0GWXGc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IZ0GWXGc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48374014a77so56084725e9.3
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499775; x=1776104575; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lG9XFANpBIri4ZwFlF+9G0jzztKra84hF5dQuOesbq8=;
        b=IZ0GWXGcPBbggyFpo7fUOvJkzVutN4ww9K6UPHJz1Zh8BUSIpwntNu2nLQT5nL6WZQ
         nafFhoaoziU38V3s3cBcGREFv8jciZx7jhK/8gg2KV7wF65T6RapS1OWfjKGi8F9SFCG
         xe/ub50xCM11kqsEsso0WhK0rBqQ/1/veoQ2G7jmvpT97d1WBjX7O7AYdRyjaC3O5XBe
         m5Jijhryl6rRt2kY+1PZHFBpH5/liXhnd6vO4v7XeSgJ99l9wvXjYZyMZv+E+0x9EA26
         GogbEVo1IQBlIzXASFhlGYHHvJY+7OJxzjMUEnUsbYYNnKS+o0flP6EV6Kbd005OkcXM
         slug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499775; x=1776104575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lG9XFANpBIri4ZwFlF+9G0jzztKra84hF5dQuOesbq8=;
        b=SBz+6L2N4XjK7X5VlvyLf78C9oGwA1rJeA2iIfAHD4WaPTyePLNt+SJlCqHj7L1wgI
         5TXy0Y2oQD7bhxwZKTRkT6BNCvSmQuyZdsmwVdMIHtWQdpVlTlWje4KnmWUCu4Q+n1k6
         PJ31f16PThWpboNgii9nonsOIAbNtdYWg6zMd+wPY65z+gHNTXCFSAB/jWo4ZdFwULB9
         9JK/nsRMsesZnVOXeRZVvmy+vMIW6c91Tl1K3IqkVwr3hzjqlfYxcAlk3+Pc7V7EhexN
         zr5p2cY+LvcXsVNnrP8zpOhKMW0bZ+zQWvzC9LJVXcsoRjYASGaKLMiEUzE1/O8V0VRe
         o8bg==
X-Forwarded-Encrypted: i=1; AJvYcCVqv4Yd43hMKIU3UceypuN1uDNFxNlUn3FLJp/UrrRT80NVlu8JJKBu61FYB5cG2CaORDYy@lists.linux.dev
X-Gm-Message-State: AOJu0YybZSZ9tVckVnMy1T/nGFpfZWIKSemmVK0YJlkBGOTHeFCG/wGA
	FJfGrCuNQqEpG0G0zYnYHFm2sfkdtIh9lvJZN/rqwuPIhWFsVOhBRuO3atFP+y9wGb4=
X-Gm-Gg: AeBDieu/OC/2kAWa4+ZWp1sI0lnLWbseaL/DHo3it0g1eRMoSqTnibkV9b1H9EvoPQb
	lMJrdvNS5mPi3LsMsf6Zw3OvisAhHewHnbhHFgb8XmsdamBhfi8FzobzPbhTkr8j6kf3AXA0shL
	sKQhxB3def8me34ihXqxHAOG/52K8l8vnoc+3FGBETApWi9tBlVlEKLlDxaH9oYwsJX1FCuAt6D
	LaWsQ/mhZYS9a2HhcnW/R9ad7q30j6sx0cH+jZK8ZUuYRX4V0WaGwP6SJ6TmHQnqD3BZZlgeARq
	l0nKYFEVlZ2XMSvtKOiPFaOTblo0/Z6lquwb+MmgQIlnXiS1vXA71J7Iv91d59VeJpA+yPM+nQP
	tq18+NjhgEhGLwbOfA3EmHXSkKzI5gm/ceHjhpGqfnfvXqOY7S2yPWb5TBYiDDzm5YrAJfkO6rQ
	SWNUd7rkvMW2m1
X-Received: by 2002:a05:600c:8b03:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488997d3188mr196188305e9.23.1775499774791;
        Mon, 06 Apr 2026 11:22:54 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9b75dsm17165582e0c.12.2026.04.06.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:52 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:22 -0300
Subject: [PATCH v4 10/10] selftests/bpf: Tolerate missing files during
 install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-10-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1301;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=oPNoWp44Ch8dIaWH8jcjnz5vhr49jgxtCJBbGnfyb/o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO32X2js1+9VB98RLm846QzI9EOnFxUKUrv90O3Dev0b04fK8r/TKh5q6VGB9RgJWYffoVNlFQP
 fnluA++pJhgw=
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
index 2b0747604d5f..e1c100f1ef36 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -953,6 +953,13 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
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

