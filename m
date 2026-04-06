Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D93876C3
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491908; cv=none; b=fRWAhsTd4p16IfssekBZSYhQMbhG22kzsnZ72Kc/Ku1qfyzE9dMxl3NzXOmuXoNmp9WO5JpvdVLt4pjMdu7qNx7hobIzxtecc+pPad3cRn52gcwSM8Ar1R6Ch/W+oC19aE6elauf/PVzCFu9BfIbJdTtle6gzYi5noeIZ4DvClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491908; c=relaxed/simple;
	bh=Y6Op61VgoKq3gdZe0FSy+wbwKQznkmsB5z8u+Zqjivw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rv4Gaqa9zdt4sP/05AAM/LPnds2i7c9ZgcxpzhQuj6rx4TVO8OtIH9cfJ18m3mZit/XdMJJJLIq+gz2ftQFkxcilREYPDaZKUSqDONFRBhFmJemLYWulLi7veA0YF6iRVWqfnbitBrPLnZCrfqPPvNjemq0E7fkn428XwT1bboI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PVCfq22K; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PVCfq22K"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso16610475e9.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491905; x=1776096705; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KyEH8CHmtk3sJaHZBn4POklyiKWwjDfRP+VG1KRjOM=;
        b=PVCfq22Kw+5BnkpXCSLiqi0TOWSVUkYkzDIqN0qLrze4/Xgo9X+gNU97X0B5HPt9Vo
         fFA6T51Hi3vi/YcUokLftvCguZ53TTA+2Sv7KjI85cPE3iITsUv+8eVvFzI68DJlqtAz
         HG71xd6k/vAPHfSm6j98Ug5GvD2UB8wUD4I/yKAVfk22Djl8n0REMTrY682BWGL9jw32
         Uy/lBVPWkVnfCQGfAoDl/55f/KEhlhy/J6yXrgmnteGCFMvB6V36zdW8Ixo0e+Yg443m
         tG6+e5t5PICtJLXJu9YeIIq6d7uxP1GVBP/nMuvcZYuTgQYTYYte4xBwq2jVJpU6vFAY
         +rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491905; x=1776096705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5KyEH8CHmtk3sJaHZBn4POklyiKWwjDfRP+VG1KRjOM=;
        b=bUnh3hProMbhK2jFDzQXwGTkYKreZqizmy0I6F3/td0K/hByTWmyiGS5cUlCwZv0nG
         qmnGOF1tEjCfX98zUaep6CuMgew/XHtj49sU5C+tSquFDOLnayAcinlhYnAZfAtLjOV8
         ppSCWEpnLlJza7Kki2pr9gR5V2HL8XqrsAcrTdNpA6AFRwQ4KohYhPS8YXJ4zdjAJj/X
         kulKsZ4z1jzgU6sAJ7pTJx4i2svdzId+QMypolpVHQbyqDU5HFQHN6dQcFSZNG6qcWmA
         JXnGtZWy3ItRyahZCv6irhk+gk0mxyJHJoE2o7ZAm5EY3AHC6rDBiv4txmfI8u0LuYhb
         TP2w==
X-Forwarded-Encrypted: i=1; AJvYcCW4j+9/G0dE+hf99TyQvFgZYMf4t0z4NeKVSJOkP9PNpgbTXK6mbhvGO+3BPEVWkKgyzS0O@lists.linux.dev
X-Gm-Message-State: AOJu0YyZDCf6fQ66zF6EQQjjv2n6vG9+UW2gsisi+klHmddzSaBRRXKA
	sIITUz/NnXpmhYObpO5oHHHyefEnothahIbzI0FsLyFyt+zHQOv6s4Mab799wMVzIWY=
X-Gm-Gg: AeBDies5GmE5kvRG/a3iNsydxn6PYw1kfE8oBfHTojOgXJZkO41odElsV8y7H7h8yIX
	Chbe3suYRUEwnMMOrQjFMCZodEPVP0nMTeT+dBV0HxAxek3z8/BgqFyLmGXOccg91JYMycSpOeF
	0kne2DAQmC1wMY5PZDEcr5P+pqegGfag7cRvH0YPgvFEYIPJH/kss89XzRkQvGIJG3u1kYTvgw5
	1XGyuHOQw+KxlegaPqpctb4cGX6NuWM+dc0MI/OfJ8c7TvhDB/zY/IgldqAnF9pZ6hhtMcDsJzT
	pfcq77q1KjS4cv6UeBqk4AckGQZnretstOzD86+Y1KEYM14/JprCzSr0AY3TQTy05h+VzGmOZb7
	Vo09TvJpduVwW9zRqyF/Qbs394O24oTOmFBfItaywwxCKFyTDB+C/l6Eh0A9l9BP++9e/Vq9BuR
	4WYLce8aHmA7ar
X-Received: by 2002:a05:600c:3f0a:b0:485:b6dd:5066 with SMTP id 5b1f17b1804b1-488996f9414mr206065935e9.7.1775491904962;
        Mon, 06 Apr 2026 09:11:44 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm13308897241.7.2026.04.06.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:44 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:26 -0300
Subject: [PATCH v3 04/11] selftests/bpf: Avoid rebuilds when running
 emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-4-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=1031;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Y6Op61VgoKq3gdZe0FSy+wbwKQznkmsB5z8u+Zqjivw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP6R45JmKPhy2oLtA7VAxCguDZoe1ylR5jGGacD358ZJbObSXP5EhX7BBRy9WyK1ozCENn2p37g
 7IfQIVY8odgo=
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
index 1065852e2b01..3e4c726870a1 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -699,7 +699,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

