Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AFD40B6E9
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553610; cv=none; b=KpMOV4rncLWdtlkzpU2oXL/RxKrx3SO6HMZM4mfeU0ZuUVockGqbF2ZUFzVz9M+tY977NBkV4NrEmARg1n2VbRuPqHGm1CwZjr4UMbb/gC+8RJTAROZrGI7qrtoKBc+ov9nmAkGXbS2AQbTxHbmeo/xbCQhcwCcD7lGYGPzE7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553610; c=relaxed/simple;
	bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oH10MH/jOynHsw+/S9fzjSXt+R1CY4t+jsPOK6IPA6CwSjwmkQZto6O6f+NmyWnG4etZaSbGA4Gx5LikfKmRfnwt+a5hIvDHBbjTy3NMgu0tdPi1FHQd0npJoKFF8gLTwd5uvqnc4MdUnFCFzf+3JSqbJ24X84bSjP03LGgNJdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RbPOs+UF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RbPOs+UF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so5869315e9.3
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553607; x=1778158407; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=RbPOs+UFdZkLk5B9FecaEVjbzJzgLz+LfLlpP+NwG5EihQ88qUyXEc5oZlQb6bXU+v
         uqrz/N1UiffYE1FNfkG6DNzy753y++u9RboLAknbkqC70O5Ud89Z+RE0fn4Ht1DX6Njg
         YmwzTRAIZxyaOphy2xTKRzmFTj8tAZxzvlttRFddmbJcHCt1rHDposwzeJ4wdGv7+Iq9
         /Jd6Mm1PTEE75oU83x3+9EndMjBp+ZcRXtv/8Hv114aWS+sgOEymNKj2nIJpwPDPTUrH
         IQ9Gg4/BC5NolLoZy3Hoj54Ue9xMgwO2JExIbZdrlQGD0V8bI3zaZxVseKMOjW9RRcoS
         Le0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553607; x=1778158407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=jUAfbLL20zW23wVJcSGXFXHToKzoufk50aWL1133jRJOazyBH9XzbV6OHEHiRTbACe
         i4ZuJcOB+kzJRgwQ+xBLYQDNHR87rEuzw8Le/oDPVacN3gewHaa4pexMaDP0GM460el0
         O+WyogDRM1EvRYdgzyIcKCPzNKb1Akr+tujj0J033+cXvxgmcFhPX7u2WrrUWH0yvCuX
         dUd2wxUwnI8+LYlUHO5hhGWKpvXaPsPtAO1a78/Y2f9llgSeN/m2g9XcfNnheaoEO8E2
         xU5az2JKXp8mAx1X9OZ1VYy1WfHvbhJhmGTejdnTcN+kdGXbduhDbp393PXGrfLRkBwX
         Jn0A==
X-Forwarded-Encrypted: i=1; AFNElJ+4l88TNhsBvrEJjKy6BQsmPXUoNylCE5aQSb6WDzSJN+iToB57aLoB/bSQbKMqBFaEDn2I@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Vy1sCRsCkjsepqmIlucz1smDK6f61HRC46wGnKLzVL+HcRyN
	DxjxrvcQQS0Anh+QWP491Etpv0WWbESvdqMAeO7lvID5KdP0NvzP3qJtcji1KHQun8Q=
X-Gm-Gg: AeBDietVKnCsh8uisONUTafRHpEdovaQc4hvrsWlqMXgYIspN84Dhu6sxH34av7lK2z
	lccuJG89H2v3k0nb45+SiPAXpS8A8TYB0zLG+H5zyaeF8gvQLXDqXsR9NHBJgoSXOUwngEZMQDj
	vba11tmfiKh8SwcyyqZhkgWDROHecTO/qEvfVH2+98G8cy+jrCvDtOF/aMOoDQikSBqpvQaaerR
	bKZ6NjD3zVe8LKnfnID5qetbUmxtPh40jJgNZW2/ckcwdacMBuFZU5MMugbge3g0zBi8qOaOfmd
	xmKDYQUX1yjb2yvYnqAOBh3dxB3dYtneBpm1HcuwPHxG4wzX9GXf4Q02V0t+2VGQBuLDLY2Z+nn
	ghD/o4HCswxaeeqnw1JHn5zKGvdbRc4EW4oQ0+zluO4W41LTAq2QIG+e2BCFXYMvyEsjsd0bS5v
	k3L8YC6Fna3oED4H5rwxMwd8Pz
X-Received: by 2002:a05:600d:8451:b0:489:1c09:6c4b with SMTP id 5b1f17b1804b1-48a83f6e2camr36515955e9.6.1777553606714;
        Thu, 30 Apr 2026 05:53:26 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c0d218dsm6470287eec.27.2026.04.30.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:25 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:13 -0300
Subject: [PATCH bpf-next v10 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-1-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=1573;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH6rhM5l3D06tpi0qU8Si1/N1l9Wd2RxcyfC/tNWuUnFz9wkBshuox3jwVTAQY8IE4x05O95ehI
 qWHtqeAxplgs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Distro kernels often lack BTF types or kernel features required by some BPF
selftests, causing the build to abort on the first failure and preventing
the remaining tests from running.

Add BPF_STRICT_BUILD (default 1) to control build failure tolerance. When
set to 0, the PERMISSIVE make variable is assigned a non-empty value that
subsequent Makefile rules use to make individual build steps non-fatal.
When set to 1 (the default), the build fails on any error, preserving the
existing behavior for CI and direct builds.

Users can opt in to permissive mode on the command line:

  make -C tools/testing/selftests \
       TARGETS=bpf SKIP_TARGETS= BPF_STRICT_BUILD=0

Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 97ee61f2ade5..6094fe99b5f6 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -44,6 +44,12 @@ SKIP_LLVM	?=
 SKIP_LIBBFD	?=
 SKIP_CRYPTO	?=
 
+# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
+# benchmark compilation failure is fatal. Set to 0 to tolerate failures
+# and continue building the remaining tests.
+BPF_STRICT_BUILD ?= 1
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))

-- 
2.54.0

