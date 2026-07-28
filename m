Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CACC3ACA40
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 12:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242590; cv=none; b=sxjFqNFY0voafUDlbJdLjAbkkp/KsGOZWX5Olq7l4h1E2C/QE8wXZ2dxbYMcJsn+E/7tb8yw88z3U4htP/SBI5vrvdXwKbbRERGmIvDRV5a79LxMR0g212Smb/65A91vn9aoGbhYzRqpgWJ9TOSYlvZyWcZGRrRSoSTo8hpQpN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242590; c=relaxed/simple;
	bh=+I542TCyEiR2dkdc/EjJMpQVyAenOURWCaveKVfQk5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fdIwU7ZdyfGW7N/Z3HYXNmD58pfbcuXq44LHWjRgj/BOCt43LGqiOuMv1wuklnpt7ORl5Alwcj2tV2vci44FwmcVgHufYvY9cVaBJBGWnLkQlw8sEnCT+HvN+vccJeWvHQIbs6edE56/zaDMCSAR0EXEXFsyDKDnNLJdS49jjR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYGhTbEi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYGhTbEi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a02aedabadso1451508a12.1
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785242586; x=1785847386; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fD4Ka0zrPbVAg4KYEq8UyY0zj2IasFwu7KBSI8jg6EM=;
        b=xYGhTbEizxd8jGrVLav7FdlRDbfE4gVoLqm5WwRktmf8vdcfghO0bQewXgbbvoiU2c
         /FlvIAMfdge78VS2c1jgbQC3a5SLzD/CEBArcL4JE+0JmoyN6c73ZZXKbcw9zfKjE1ju
         aK99TxlXeWfbuxnv/RM8DckRS+8Xw1GE/L8FKRDYjFzMTQfa8cERCg+g3BG/UmvkQt5F
         D3GkmbkYDJnfP9iLjrlbqlTNDRkUQW1p6k6QIsHIZV1CtHH8TI20+k91dn1lQv6PZHUo
         zINMnP7ml3mZtm4FZi7XVElkCZrBtxPxahkiHL6iO+bByY0if5LUcAXMUwUD9OFpcAhd
         jyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242586; x=1785847386;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fD4Ka0zrPbVAg4KYEq8UyY0zj2IasFwu7KBSI8jg6EM=;
        b=B2sQdaTsD1fWumONx22Nz7HjJj7YZdzwlVGq1NrvKgNN76n7iY0H81eyMoUKvlu73w
         ZLK3fEpIdDd1I/pSYtz4GNZT4VKdUpV3p1ZfqO/ykh6CvlVWSFCYv2IxcVN8uHHq2OJ9
         pSZ4wwVr8cKG5qxRM+LmQEkn31Sm+THuFOCjTVoD/JAgbeBY9ZYDXfmXV2ZDzOxHtq5h
         VG0d1NYya+uFO6Tb+Z1H58EWETtwcek3nxg32P5qIKbdxlzlWtNUJFRZNiGNr/t387OC
         uX2OjKPFQD9u46X+gUhco+kEjj8cqH6ifuH/axGjjJ34BJejzFd1J6stExzei678oyes
         UHeg==
X-Forwarded-Encrypted: i=1; AHgh+RpiidmPBq0MAgYIKAPH0DWkAy6hB5oQkHupHpyXKKghdeKoWL7cusY+2l1l3/LspE4XMOPM@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj7goxlOrwSLKgYq8sTy/a+e1twkQhuwIiertJJxNKmDZnszJK
	qkuYuBryA0KkW1/x8He+iLHVyHQ+ZrRVH5audPnXCzqJyNhls0/HxWVe55u9btbR3etAkELR65a
	vQGvQL53GFg==
X-Gm-Gg: AR+sD13z76GmDpWnkjr+Zi54Xect6PevgT6UYhs40vZ73G1+sxCs4PGQ2y/AaRFjjbA
	B5A/CMoDPaksbhKmn/estiu6JERu8xSbqv6upW9XdGyh4AioCE6WHTNST7xNUGaVwK+Il+cZ2sE
	P74vyCVfG96QHK3eBgM6h0qO5z/awCVnTVVlqUq9Fn9tIjPlYmE59OOjBH3OdHgKd356FfK89k3
	7+MtghN5sfEJyunovLSklOG3dJRIk4yCCo0N9dhzKYU1uqc60sffuYA/4fFRDBOslE+bPhr2+mZ
	bfswyRykNr5f/DVF+bLu8LZngNQeO1s1tyhme30p4Pa5oigshGss5rJlQxF4mZV2j9zhMgGIfTs
	NwNE1OiP18PhZb7Klb+GaYVYfidyCjC7b4nzVCD/IQmS0CJL0g9DJs9xjTuZIPcOVQWgTS6DNIw
	JrQdlazVmtE9rq0vSSqBKwfBvtNPHoNVr0ys6VN2ylU/5t4ttHyWKQV0b7tPk1nfT1kA==
X-Received: by 2002:a17:907:d113:b0:c12:5e26:da50 with SMTP id a640c23a62f3a-c1f7223e43amr112857566b.65.1785242585774;
        Tue, 28 Jul 2026 05:43:05 -0700 (PDT)
Received: from puffmais2.c.googlers.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm745805766b.34.2026.07.28.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:43:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] kbuild: link-vmlinux.sh: more reliable 3rd pass
 linking
Date: Tue, 28 Jul 2026 13:42:38 +0100
Message-Id: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL6jaGoC/x2MSQqAMAwAvyI5G9C6+xXx4JJqsFZpUBTx7xaPM
 zDzgJBjEqiDBxydLLxZD3EYwDB3diLk0TOoSOVRoUo0bI8Ll84YuVdBzRdWGWmdVn2R9Qn4cHf
 k9T9t2vf9AII7pq5kAAAA
X-Change-ID: 20260728-linux-kallsyms-fix-95eff49b75b3
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

link-vmlinux.sh currently only uses the file size of
.tmp_vmlinux?.kallsyms.o to determine if it needs to do a third pass. I
was hitting a case where file size didn't change, but symbols changed
sufficiently to still move subsequent symbols in vmlinux to invalidate
kallsyms.

In particular kallsyms_names grew by one byte between
.tmp_vmlinux1.kallsyms.o and .tmp_vmlinux2.kallsyms.o, moving the next
symbol to the next alignment offset (4 bytes), moving many subsequent
symbols in the final vmlinux image in turn (until abosrbed by further
alignment instructions). This failed the final link with:

    Inconsistent kallsyms data
    Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

The two patches here are independent of each other:
* Patch 2 in this series addresses the actual issue and also has a more
  detailed explanation with exact failure case
* Patch 1 could be omitted if deemed useless, but I found it useful
  while debugging the issue. It just updates the kallsyms.c to instruct
  the assembler to also emit symbol sizes.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      kallsyms: add symbol size for kallsyms symbols that can change size
      kbuild: link-vmlinux.sh: improve detection of third pass requirement

 scripts/kallsyms.c      |  4 ++++
 scripts/link-vmlinux.sh | 20 +++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-linux-kallsyms-fix-95eff49b75b3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

