Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4C273809
	for <llvm@lists.linux.dev>; Sun, 26 Oct 2025 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470001; cv=none; b=JhH4TAsRDLORjooGrHvLoFb84YQ/5/n3G0bVk82rz0JMMDIweP+RJDCHwT2HRVm0SdKwNzBlQ5N9xrCLKpYx+YokfaM9o1t+PpmLThKIOJfwgU36ReW49B1vEq9dVX2b1sGoxj/ujYjBHMh8tCSkATen7ukcvAK700p3YU9fSDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470001; c=relaxed/simple;
	bh=5b5PYMxopEb8YY4FdGelcJUO0Yvn+/7BT0Giy57xNWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejKllYx4QMQz2FCGHuPB495+0XiU2YutWAYsSEK0TvM21jyGoocaPNTY+f0i3wv6Bn3y9LFQ0Gyd5+EJWKV71j5qFV3EKAiZQ71My12AQ7O41fwWE1YyZwl0qISfaEgkcQyo2qhY9kD1TCfAnJYWNJsMkIJgfdv1IskQ+b7DOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHfhrbZH; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHfhrbZH"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so3581169a91.0
        for <llvm@lists.linux.dev>; Sun, 26 Oct 2025 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761469999; x=1762074799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMX23+YLvbC4KKYE3owkIF/POC5qa9l7q+YDn+rGhBs=;
        b=PHfhrbZHku1jdUYtpr0g9+Nnsy1fLQB4fDxBRyFOItGFgMAXWAUuQ72snmekWt1z4+
         AhNx/F3pbmLoYXptdAkQMAz36STkIGC5ffkJNA+59CKmWm31p3qZr8whAx8b79ZndRkC
         hUtMgf2JxoXMUYOCwYY5iTWS1C5c/nGzCOMHca8Q3jYV1QBdPQ7cDc11VtNhEVp5dmYW
         /oSFc8oDHwRpx1xQwYappohcqJ3Uu/4obxvtoa0yUt9qmZrKmScwQZu/fYMQT5EfrCaY
         aNOOPe4LmTDAZjpwKUH6k9LufUiqBwhmKvu+N5MmjKEFSi5pmn10iSeB+6OSurNEHuxu
         w46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761469999; x=1762074799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMX23+YLvbC4KKYE3owkIF/POC5qa9l7q+YDn+rGhBs=;
        b=uX9/JzmdujEIxuj/Bx4OaewPoWfinnol7hBJs7b7xpWMwxhQIq5pSZFqG3qymVae0W
         o1FAY1LzkrZNylGicPwsEim4dr231aSD26FvZ6H9IAO3euKDtyzgkj6qXl37UR047U6k
         c796wn6L+VGKP/Z8jwwAp51XAiEmvQ7nAZXPjzsTB9dTkx9l8ZUcoMkqc1Vr3YWAMSWF
         rbf5opZ0Dgnf8/nUHfFwvMcecoiaTaAzsukBx5PwLxK0CqekVl3hOYecuYJek9no8Eyf
         H+IvQ0iMxjWUcFpWa0Npew9effwEcz9qUqDblt3uMprutOuv2ds54cPM/oPNq+wJfvQV
         g2GA==
X-Forwarded-Encrypted: i=1; AJvYcCWxHyAlnissEw+27wVg0GONmg2dJqFj1O248CaufeIUPB/H2XS0Q2vVKSG4qs9+6t+ScMxm@lists.linux.dev
X-Gm-Message-State: AOJu0YyM+mafGYe77PQ2veI9PtDomRic7of6poIoE5mqqwwt8iARwLQ5
	fMTE3Ww1vYXggd4MY+0UlyKJGCW7yFbjteYd2mAVwuPXtGxMTORaExWY
X-Gm-Gg: ASbGnctAUkBn3YAEvFNlssXYd+og92OH0D1ab9y6R6kV/JeUwS+9X+NcYR1D9bqJ9Ch
	dMVm892lRw6nKYw65/kjOpJGqc0UqLUNJGuIONUncdR4SnzRtG1qSXNcbJ8zgbb3iUCcMMv5OUP
	r4bFPamt6lKwvwKffL31SMk4T6wbUVwvmM3Fc3DBh5Tz98vBpZTlourelmVUMYJCawuP+UeLUEp
	wgq8y2rznMdxgJopge9GQD5e0hB0fp71Iv1zd8XAavRv0EH8D3bO5toAd1OEpLYhUs1vxfO/bfu
	H9J1m947iI3639mvYn6v8hqHZkvV+QuNZGYfS6lraGeTe++i+ryzBQxSw9LV4LTmrZej9w/nwyn
	R0DnOnvPHIv1luee4m3QG8lg4+hKtPp3SeYmX9KyfTb0eY5ZCumjJLARWGUpZtN8Pb1f5Lna/rM
	TL+AunjYxNwEkKZNpeKMx1xI/Ea7OCq21xtu5st8poPFtXSns/7La/u7Q=
X-Google-Smtp-Source: AGHT+IFQFXNUYIY4vSpSr/xv31CBewG848HOy0cOfx8lxhYhMoQ5KdF68P3/KWEwPTs9NKzCL3WWXg==
X-Received: by 2002:a17:90b:5386:b0:33b:b308:7655 with SMTP id 98e67ed59e1d1-33bcf861fc3mr44925100a91.8.1761469999250;
        Sun, 26 Oct 2025 02:13:19 -0700 (PDT)
Received: from prakrititz-UB.. ([2a09:bac1:36e0:1c0::10c:2f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a42aa5d9a6sm789558b3a.62.2025.10.26.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:13:18 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jiri Olsa <olsajiri@gmail.com>,
	sam@gentoo.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH v2] selftests/seccomp: fix pointer type mismatch in UPROBE test
Date: Sun, 26 Oct 2025 14:42:33 +0530
Message-ID: <20251026091232.166638-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aP0-k3vlEEWNUtF8@krava>
References: <aP0-k3vlEEWNUtF8@krava>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix compilation error in UPROBE_setup caused by pointer type mismatch
in the ternary expression when compiled with -fcf-protection. The
probed_uprobe function pointer has the __attribute__((nocf_check))
attribute, which causes the conditional operator to fail when combined
with the regular probed_uretprobe function pointer:

  seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
  expression [-Wincompatible-pointer-types]

Cast both function pointers to 'const void *' to match the expected
parameter type of get_uprobe_offset(), resolving the type mismatch
while preserving the function selection logic.

This error appears with compilers that enable Control Flow Integrity
(CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
on Fedora).

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 874f17763536..e13ffe18ef95 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
 		ASSERT_GE(bit, 0);
 	}
 
-	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
+	offset = get_uprobe_offset(variant->uretprobe ?
+		(const void *)probed_uretprobe : (const void *)probed_uprobe);
 	ASSERT_GE(offset, 0);
 
 	if (variant->uretprobe)
-- 
2.48.1

