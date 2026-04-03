Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CABB3C73DA
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228365; cv=none; b=cMNbiZg89h0A8ME1gBZs79P9J5FMWI5ScemxepDGFCR1UOn6myHJDKCzk34DY54auwPUJxTJBf0NruGdjFw2oL3u5/n6SnXIi73MtkSdydndjdLszgDa+eAgY3pcePlolfGZd+HW/PSiWyPbL26ZphkQrCzxMO+bIhuj97H2fxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228365; c=relaxed/simple;
	bh=t1nbxFGOvUrbFlO+YSDPWdSnERxYyVW/+LqxXuvUGIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8/QvaunwBWYnuVeYVNodcxnKeqvf43BQSSu/tG5Fb52736j9fmbMhYk9ZDwcpYLCesCt9N8k7k6UhM4JQTDcq469P3xhHd6jBbFfh5kxg8gJywUzNBtaP0nOK68wdYz58t2hdokK+RMi/wMzjcMFwkdgFM6T7sVWhlUyWIylI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WgTSzK8H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WgTSzK8H"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso1564435e9.0
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228363; x=1775833163; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm04HqKISVuTOG2rwmdLIpXmgY4fspT7kbSOfzz2OgA=;
        b=WgTSzK8HKNJJ7Y8jGUbGHdQNgWuIfap/NmvjpyWVz2y9Xr5QWHtIYJX+lV06sG79os
         u4q8lINJVecFyfJKTd/0v5QpcGbxLcyh/PqgkZGSjvdThs/8ZBW2kxIVTfgN74ndlG7I
         QKcHc6YXy3Gd+z48lqIKNgtJJhLR+ZJ4IwlteoRpdlQNuLlkziriinZzYammckrG5wbO
         kIZLNdIueOI9EhXf83wypjs50OlJMIv3si6LXAu9vgthOvHNTYeErkOKWgsCqzFftfjH
         ftE1BlN38OyGYQRHtnmjvJ+qFaXvN/asSAXWZTO77IETD2nwmEfMHIzrnHJWHt3eAVFP
         jLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228363; x=1775833163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fm04HqKISVuTOG2rwmdLIpXmgY4fspT7kbSOfzz2OgA=;
        b=OamDYtX4Y3BcBaq+bboEv29cxCVADUT0O5lv/tC5t6PVjB/lubrqt6ciLwzQ0d1OFc
         QfkcTHYqPewgMiANUokJoMolzFjwtJ82l6ivz/no8mmyXnSp6UZ5qjip7FiPFJ6keAet
         hWGtTHV2JTrYXB/Y4QdGmQAbpmKdOx0UN/tzbCuNf62kSwRDRvpsWkUxsGUM4ZEg6aNI
         E0P0jdkWHzUB2h8XxGRgCUPrkfokxXq4Cp7FDqJQS82Z/mzALWOxdpjDeFCMCq/fi+UC
         RM+M4oHH7LLD3DpQtNdri4054x4n2ylFRPlErnOWsBWkRnf8MrhYoXunAXELJzSqOJO0
         ULNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp9StpSPVmXx/A4O7L592zqQNcbUNqPlcZREzgSl1+kpiNlfTm9bV+Lh2nU2k1oMbEmjH3@lists.linux.dev
X-Gm-Message-State: AOJu0YzRc4t9QQZSppuzfKtm2i5ct501gz8HXn4F78lO7qeYzjriWnd3
	QcxK0xM+KFsHb3ho5HYRo+tnc+QITyuLC9l23NHT17CmxGCQSqsGveD7+/ieA0Cb8DQ=
X-Gm-Gg: ATEYQzxTBGTFKeBrVoMuUJuGgkubyuc2yMVwdBYW4jfstmsTmNqfBBYkH7lb7ZFZ/g4
	eHGQQgEHuHC+Q6l4TuLHSo/YJ9m/FvBvZNklCKFUvJE8sP5HOWTOfWRNaP/FKmWbLR56+9QvZXV
	fSvg/B6WfAUxkWeMKbpZNI12tEPlAhR81E8aOPd3+94Ho2uoIB90XlYZvkXG9x+N3KMSasJvzA2
	+DyBQDacYE8nomvINWojycmPfS8XK2Jg8sX+pEf5jsutqG+DQ54O5i1UlPF3x1+tM24KAPAjZiS
	7iX3bje+jDdzW3esEAAjdbxhtphQ1vdvJLwxDunHPiLdgR6ysRxJL5mwEZoaDK4Y3sZbNPyHIp3
	XA+PebyRNHkUAZYkWUVbj8v2xln8HxZLrdHv1sVJcDmVR7VKJ5BlycgB9YXLWAhRScCm5CeUC+C
	NCGZ8DIw1M
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488998e3cbemr52789415e9.30.1775228362756;
        Fri, 03 Apr 2026 07:59:22 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9baff553sm6958583e0c.8.2026.04.03.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:22 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:57 -0300
Subject: [PATCH v2 04/10] selftests/bpf: Make skeleton headers order-only
 prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-4-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1609;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=t1nbxFGOvUrbFlO+YSDPWdSnERxYyVW/+LqxXuvUGIA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBwL4B70EWSZDKx9NQHTd0axQjesmwmJMuHscAgUJcomCeJbZwqZe3rAtU4U6qHJtlEnvTUEAN0
 Rdl054LosNQs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating
a skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 781238152c4f..72f576a8236a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -697,11 +697,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.53.0

