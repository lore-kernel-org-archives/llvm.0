Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A514F115
	for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 18:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712948031; cv=none; b=V8Zt5ZR+vZbFsZ/8KyqXdofPsUiM8941FIb379I3Aj244LFD/NmGDi33mNOLpB//RwOxqkfTvJnSq+uGWsjKSpq9lC9gbWbI7gGRqWqSDE0Jku6ksMiKsLHN+3wuABBQ6/OluRX/3s4sw7RJqvR4EWKAcUh78zNwhzXi3R7OYTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712948031; c=relaxed/simple;
	bh=FHYmDrKaqpfpTRuPXl2DoFH5LA+zgDT0YDVnlDewaH0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=J7/cCza1b1PhZuLV8wi4lSKBagTPKhRuosEXXS+zavbi84KturrmpQIkuJ6pnMWMF8h/TJwD6hb09bV5DQOxynbu3MS7BerXO4c+sYkrVqiQ3mmBHj2TbPLmcdDIz+UvUjFGFBxtnxz7yoxh0hxITOqPVcuaTYjR1ei8oDJ6ARI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hO+z4jzF; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hO+z4jzF"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-7d5f08fdba8so176714639f.0
        for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 11:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712948029; x=1713552829; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ku+cYfV3CL9NDsoRJLchzk83CxUteslcXBw1rBPpBQ4=;
        b=hO+z4jzFZGZ6g6waZQyFCjy6vidrguidYZ+YBVYM1aBb+wMNIYSjmF7uKMWAzdlwP7
         0GmR3ULBzhKR9JJdpXLSz4YILYVmGXDfSg3DEDQxIIIcggTNPqcgMieZYt+qEXn23ymr
         BxiDdXpZa+hKQcd94L8rcvsO80FIpLT47B8A1cXD8pQpVd5BeqxBI3GI15qkkrF5+h0Q
         fdFtrpm6TGTo0HJS2nhe9Ib2sy8PHAKQCrUXGm0aTqXPeicTbs9xoy/W+080t5/qpHWJ
         i93+NnddnT2uQoSJONgfsrMgQqAVptBU//nrrsIrN2KF32nTXPr7USt2xoMdTYO/Y1rZ
         MHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712948029; x=1713552829;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ku+cYfV3CL9NDsoRJLchzk83CxUteslcXBw1rBPpBQ4=;
        b=DSvFX3YZzAhcl9KAE/7ti9ZtecEpqt25ivtdOm/2TZR9TZDYH7bFkcI7S+Mqy5Ua4s
         rD3SDK4bshmXaBm3Vcdz6TO04hhsjMGbmy8O2a7Ro0IfxIv/S76kmffNwElIs1xkg+dJ
         RF8C7tQNjm36itJkXjF0NH6gaM/em79qE18bwFSnakHAV6paA4cQzOBLS5OtH3S+mszv
         pJfB1sadHplIBOFAuJfs11iPALbJjXLT5L2iugYbuO07XY6owMr2/Yjd38L4BwbVdFrx
         5zYyiAAIW9f5oiukwMoa3HqfxZn+UumbXq+C/SoAxkaGlUrqRHQ43VaeOn7oRZMkr3Lf
         w6HA==
X-Forwarded-Encrypted: i=1; AJvYcCWj71YvHnyJiKj6T/RsNE71YijeyFh2Fpt/mobx/zJpmNYISrYGKP1NNqx5c+fogOEsMeH+dgBzuM6Y0C8YqnkkQWufFA==
X-Gm-Message-State: AOJu0YwUclbBggKk2dWe3nDK8i2b/6oh2px3Z0ivpYI2aUK/j+dwUkm4
	gXBK0Cl+z4yjbJAiXyqA+vjUSeWYxP9lAh50ivo93kqpzP+XRz6LmfVYprZ7wrF4HAV0DqO5ush
	qQ9hDD6PDffX+gAoKTE/0PQ==
X-Google-Smtp-Source: AGHT+IFIgCcbrNG0WVTnmYkDHfTcUVCEG2xc3xCMlYSow98Vu7k7eQ29VCUlewX5/iqYIg8yJw0Aoj31HUwl+kTG/A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6638:2720:b0:482:dafb:95b7 with
 SMTP id m32-20020a056638272000b00482dafb95b7mr108126jav.2.1712948029249; Fri,
 12 Apr 2024 11:53:49 -0700 (PDT)
Date: Fri, 12 Apr 2024 18:53:47 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADqDGWYC/x3NQQ6CMBBG4auQWTsJVBrUqxgXWH50QilkRgmEc
 Hcbl9/mvZ0MKjC6FTspFjGZUkZ1Kii82/QCS5dNrnR1WVeO7aMpzBsP0ITI49R9I3hoY7RtNA5 88edr8GievW8oZ2ZFL+t/cX8cxw/Rj1rpcgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712948028; l=1692;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=FHYmDrKaqpfpTRuPXl2DoFH5LA+zgDT0YDVnlDewaH0=; b=pWm/MHLjmrDU97kGz+go/s2QQbsbuuiO6zSazvNgFRTlpwEH0VSe83O/r1uhKZsmlXVlSBlD4
 r6ftS/8HNstBETceWQdRRLeikrnqi2Zc9U6HVKPIW0at/1YtRhfCNrR
X-Mailer: b4 0.12.3
Message-ID: <20240412-strncpy-kernel-module-kallsyms-c-v1-1-ba3f0fc16163@google.com>
Subject: [PATCH] kallsyms: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces. The goal is to remove its use completely [2].

namebuf is eventually cleaned of any trailing llvm suffixes using
strstr(). This hints that namebuf should be NUL-terminated.

static void cleanup_symbol_name(char *s)
{
	char *res;
	...
	res = strstr(s, ".llvm.");
	...
}

Due to this, use strscpy() over strncpy() as it guarantees
NUL-termination on the destination buffer. Drop the -1 from the length
calculation as it is no longer needed to ensure NUL-termination.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
Link: https://github.com/KSPP/linux/issues/90 [2]
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
---
 kernel/module/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index ef73ae7c8909..62fb57bb9f16 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -348,7 +348,7 @@ const char *module_address_lookup(unsigned long addr,
 	}
 	/* Make a copy in here where it's safe */
 	if (ret) {
-		strncpy(namebuf, ret, KSYM_NAME_LEN - 1);
+		strscpy(namebuf, ret, KSYM_NAME_LEN);
 		ret = namebuf;
 	}
 	preempt_enable();

---
base-commit: d7ad0581567927c433918bb5f06f3d29f89807d3
change-id: 20240412-strncpy-kernel-module-kallsyms-c-8539c5e7bf57

Best regards,
--
Justin Stitt <justinstitt@google.com>

