Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20783C9EEE
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228362; cv=none; b=jOjw3m/m8IvdRtKFUoNmeQt5MHNRI2FhHwO0kTpKTbupTvcK1ekKd9MyIzIP2VL7i6XxZau0Npagyuxm6hQU33cLvGEMpZHbFm9wtdF4n5vgfvPCon+fFOzP5H6OImIt9ugioV9tdQkPixq4BDvMP6H+vOz3GNgsAtMTjdYL1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228362; c=relaxed/simple;
	bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kW5cSVyD3+t/F5pxtBQtocJop262HrnudjxYkVXuQ8WQO1/0xYqrE62wDtQgkAd/Yd8Vxp0IFsI9vpzVf54ukDiOSL2PwAAZZRvgaCyvd8nlv5tpTuyt2BbjfqiOyj5lyTl/1p4ONnz5HPrs22vpon+gCcqsJleez6hP5wlqjzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KBs0iNAk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KBs0iNAk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so17917935e9.0
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228359; x=1775833159; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=KBs0iNAkYE+zPP9nRo3fcbT36MEnekqVZHDXmiT7U1aFSVeYnFqnQYaZ5+5mESlqeF
         4zrYabJLOmCIXxhRdTzz4DoOdnmZvzYfgIewUvFpyMi52OrdobptP1j6e5VqVXV/luSL
         9KTMhVGDcufFDCJkgIHyYiPbEwuLLAti/sAfrljQXVXXDfkC4E8jRpAh1vOPo8gTby5w
         6H/EHm/KUkw5L0dozBhcXY7iM3ji0NEmf9o8/n1Br7UgIeEHp40d47UgmoY3WSDZ5a4b
         f4YcQ1/1Y09e5+Lxr0UUWpmcAc1opn/fJD/V05tAKXRev3ZJ2jtGIQq0jc8V2J1qteP4
         11Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228359; x=1775833159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=YgjpWznkmiBgcP0nUgXC7WnqxrDVQnz6Nu3XZKjJXiUWa+QJqXTU89u7NLfLENcQk2
         QsfR3/WFKUanKMO0rflcvoclSZmsZkpVYfYJBiTV3xZvpytqrG61Dq6E0a77dR7XCUB5
         yYARmQdDpYKw6M45kUww0LxzxqJVYNRU0PrrNrjwJF/XWZVxCthLj42J1Q+mc2xc7vLF
         CpRvGISQlaGgOZ1T1qybuPPcYMYx9qbxvbOOFn8XVNeHzWRhR9raarLzc2dMRiqJ9aUX
         Uqs2eEbCHRDYw7AJ9Cu+dRsgdb1YSiUGQiTMfXixHT0jytOomj9wirbNw/q7cINi8u+r
         JaUA==
X-Forwarded-Encrypted: i=1; AJvYcCWE/x1e4SNwRIL01NEO9sbm0szHt5VD+Hukp9Sa7iOzrQOnFQRtHo80EGry0F/4eBxmDBD2@lists.linux.dev
X-Gm-Message-State: AOJu0YyvuT3vDZpvR5gSx2x6jBixD5rf2Worjun9ZLpXKbxtCtTE59F3
	rEOnp2nIbsmbYZ7u5jDQcGMID/mQZuGbwhlzNiw3iU1sNjTewFmDuJQWztv/8rPQjcw=
X-Gm-Gg: ATEYQzyCWI0VUZHSWyFRb9RKFZV4rNIrvXqA7Ed6rCwCI/Vb+yoI8H0nZfTVCkOpF4h
	UDBzlRHSy+aFCEgT1YTW0BE8PGAwlIfag0x03+t78vzt02hoviEqKvbPgWO418b2MV5mb5BT6OR
	dUdxdj4+GSNAEKa5cRg5OZnFD8s4FQC4kHTVTPy8/jOGrXooSkRsF9+2mS7Wfte7D8Ny+kQOi3i
	zT0LR+KqCy316HeG8ZXGEpKeAGgyxO02m8AdsLYMaD36urveWwf7r/OwPTHuboEzHeEyZHwNseW
	QBpWnL4zNBZXFmG5J8rW4+a19zR828q53SFIlc8Hx3dIiP5AQoPVZ2/ZfUHq3v/7sTAnnhdi6J/
	AOlNstObpLGJ4lPKMHpi6+jaCItcsDEFAK+C0NlnfIG48aINR3A+CU2PaAWTMN8b3klE5FWTu+N
	viY4VFkgKV
X-Received: by 2002:a05:600d:8449:b0:487:1fbf:e0a1 with SMTP id 5b1f17b1804b1-488996a1e01mr40470055e9.4.1775228359261;
        Fri, 03 Apr 2026 07:59:19 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm7057743e0c.0.2026.04.03.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:18 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:56 -0300
Subject: [PATCH v2 03/10] selftests/bpf: Avoid rebuilds when running
 emit_tests
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-3-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1031;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHm0vdr2N5i6HZ4gffnwvQbcf2SfTzaga49ypwgLvh9I+uo+pRH9t5bZhXy6KgdapZF0ZhDvChf
 zV+dxXyN2Vwo=
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

