Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213013921F6
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499752; cv=none; b=qcHGedfTBCiXRelpPpXdEBDBZamvX/Nq7Y2gvs7GiDWFx/nZPamqVyrUnYPRguXG1O+/cSTW0bRgKybD6lsc3gl+24iDtmZ/ZSktNMxHRnMkeosb0lQYSIlgbTqHtjcSNcyRrnZsf1QBgP2ZdPWMrVzucwXNdJktd/MJvqTH7xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499752; c=relaxed/simple;
	bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfyN67PHQ4KbKATwf2K7MRAmgFd4sflD3M4xA45OQ1ZULX48v4n8CIZGTDgvbOtt3OE0ye8TfKTqZJZCzegmTO2w+5+u8qQiEsltt4F7Rr8E9xtWRlqkUOUO/nl2RO+GszVdbQTjArB2yAr197lTORLhpDQSPmo8J5H6/5sHD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R7Idjx9i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R7Idjx9i"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so28599545e9.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499749; x=1776104549; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=R7Idjx9iC+2VUPMLH/SunN8oRxbOZzqn4oH/ayG6dEYQGv/Jfh4kC9BWY834jz/fK2
         QHjrJhEJsw6jl8U82Pk6+3d+NtmGGRWBJuA04LUBmihZE7CYoRdTBtfUWAgAIFSXdlFP
         UAJlO46wptBsE4WSPrylVWxOjIw3sQGzEA8p332UwAIe7C3mXAwJGUo4EgO7Ve6BxUsO
         v3y9Gauz+V8PlBSY8HVuOVw3MGLHVoMSWfLhPCzgfhjxybPSBxu9PcUq6VIHJp2LaY+G
         JQfVlEmVytEeOnhfNvLeihAGzCIpW8roSczXlQeKsM+fkDCmoBmVsSdrp6HjjaiWwrNn
         80pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499749; x=1776104549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=gVPXQmozBwT2u25lYqvq0PhDzEXk6ufB7fd2DSp4mWJAfkiSKGzldRtUv8Afv/vWkp
         q43F8ANGY67sAyhIDDyI2Te72uXgmOvHzay9n19iUcNAZ8zLUWv/EtkhsXnx82paOTtm
         XyzO0ftyBMQpqAhRPVHOhbVxXY7xHJw2MyW9e1vZXzJR+cwCrjfG/dXsE5pMU4pvIhGI
         2+9uX2jiiC07mwrgFpjEqD/fs7be8E3w/K4EfP2oxzorxejSFHuZ79kcLnJe7+RMztfC
         KxEcNkgSS1EhOWMybsfgk1q7XDa/K6EXd1ZLPeZONCy6Et6UIsP4GG1atdES1eAa6cJl
         wpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+OM61zPyY52uuMyUCEXlivYSpf/EA+eY0PB4BWTdKeyGACOSCFPLP5izmLs64I8RgfAvH@lists.linux.dev
X-Gm-Message-State: AOJu0YyrvOSBBzJpsFs1VEhM5dL6S2IjdHjjCMIc3ETmJjA8oIxH3cNd
	9lOyhdBuK6DYBkHwNL0xsEBvq0DZdfC96NP1Bb9BJnTZYn3W5JV2bl4lfK8tbHRg7Gc=
X-Gm-Gg: AeBDieuaYTa4qMcjGXahTtAORhd1CiwXLrkRGTvjEv38rkvBHmOcACJl/5ifnqkeq5X
	JLqqqcl0tBbO0617zGVZrYxF7Lewx7W2U67MzKmaG4MHZ8uJT/qqbyICdEm/skys2+AWeH1eaEy
	DnseCkOUqhPgn+kcR5a5Q4ncjqdHCak/auSTndsUh1J25+XJ/ViJ/3AQo/pdLkScx8C1HLB2yUZ
	sJvgQyRBJbe9cAfPCvdSLMH4wLPtd5EubZaK6Ozc3+AnQxQ6HRoAEtJNHHUoXtF7pDJToHUsrqd
	Hp1w9lwK/tN9PWl+/Vk0oxJ1hYLUrpqSAluOv3pERL3Kn60n2PBlsXhEzOdsSTq/hjYObsY2vZG
	dGCnMd9UkgJTlGTTG7fIZ3BUX2Zq/zxx+daAWvR7yYJWyxAfgZpQCIFGjDeNUaolgTtFGIW1K0X
	UKrgODnu7bMg7n3xzZDodh5D8=
X-Received: by 2002:a05:600d:a:b0:486:fc3b:3e61 with SMTP id 5b1f17b1804b1-488997d1788mr158558915e9.18.1775499749438;
        Mon, 06 Apr 2026 11:22:29 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bc41sm16853202e0c.11.2026.04.06.11.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:15 -0300
Subject: [PATCH v4 03/10] selftests/bpf: Avoid rebuilds when running
 emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-3-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1031;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHxdcziFu6PN48z0Fxo285Wtd1vV/o9yNXb1hgsHpGglvB7hPLWkf6rVvug1UFkNyMTLJB1G2lH
 gBI9xF+/Nrgo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

emit_tests is used while installing selftests to generate the kselftest
list. Pulling in .d files for this goal can trigger BPF rebuild rules and
mix build output into list generation.

Skip dependency file inclusion for emit_tests, like clean goals, so list
generation stays side-effect free.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6052bba2c157..781238152c4f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -703,7 +703,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

