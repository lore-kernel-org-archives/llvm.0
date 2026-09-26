Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E272F8EAA
	for <llvm@lists.linux.dev>; Sat, 26 Sep 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383956; cv=pass; b=ady1lCBL3PJXGYVsXM1OBRW4e9ObaToMsZsstkgFZMPOf4Kqd9Kjz32h2aDkF+fC+/E/tN6mYUBYmMjM9h+cCI4ogy/NuFz8piQxaMXVSHebcpB4EYE/ykBotXr4gvS8VmYazwURN/JzuCQAeC1DJc3TL28VY6J4gT95/GF+QII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383956; c=relaxed/simple;
	bh=cxL8RY8wdmdsnxOD6Ni6qWQL/8tWTp4bkAuJvPRW6kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiq7L/ViP26Xt0nqfWLKuN5fUAeV5E12SvWI7Aa6itcaeZF6HcrPogcIVr14d9emGHqZdufJoFjsDnxjEH6qvaavyfjh21Qsc0wWfFHWiXMy0MUCOV31NAANwSl36zykHroBsiV4V+fmzOpqrhVB0bsHufcpvSY2SrvC4qlwMsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBhEYXfg; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBhEYXfg"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5311edbc154so13408911cf.3
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 17:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790383953; cv=none;
        d=google.com; s=arc-20260327;
        b=lmUXsb1sE0ha4xLzurOBBnIi0hdnpFwX+2Uc0g+mtAZL5ZIgWZnf5CdO0uOqlGwHJr
         btlJCuNyhy/Gw0Kf1/DoAf5GDnukpSGXVrNxtLrDJWDhSqFPnalE+1tPousvc/9WIjVP
         9ndOY9ZXLa1Wm77oue84jI16PaC9plgGUMR5iB8rzx8bYy87mXNl2Bx/l6wTP+HswRAM
         bQr4cGFyLwaZQOIdWgGzMyatU5Nc8JRVswyaXEgNbZffzTTSRN/jVcm1ouyQSfC/bbO4
         f8u/mwShvDFKAJqoj9XtRhF/YzAteRTMb7JctTd3l6C5PM4B8RslcLpVsitbEYqz8Kbh
         NlSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        fh=QNx5daCv2hCsxHcOjLh3HE6TMuHV6lst2piYvjH/QjU=;
        b=VBV4WABw5lZyCm6sAFvBDbVoetjhZKP+ynZK21VQ0y0twXpPZVNQ2CL5kL/M5gA7dQ
         XuUFj0Sfcibhyavrt7W1Qg26b5b80ZxLSTeuE4zJM3tkRM6egsFVndidJWdo2ylb6zzK
         vO4MovGrfZity+31l1CUTVObc2nSZM9jAyspfeMPA0V9Eyhm0QlsLmZ7CZahhKtbYY4x
         w85UZa9ybMkGCQnEUPRrpXdb0XwGZZrymx+cKVGgIUDEmnEY//BaU63io4xQwOYFr5Ga
         2BPbGI5S450Xv6nfTa33f6rVlyQ/Bwx1KFxobKOEuxQtOvGVGiNics62vTKS1GU1yxUC
         d5mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790383953; x=1790988753; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        b=FBhEYXfg6ot+BPho1oBejV+w8ijOhSqkNlgeiIm7we4YKpce75xSMdK4nhUEEnzFgT
         O9AL5qAhBRRmnETa/LiW03ECTMDyq00I6hSSILYB4lUcMWKWVyZ9ptoxhru98Wc1LHDS
         l0LPJUjudPsxMcPYWNlIjokirbRnxhRQ4yZRNTnU27tjl0vsqLyQy1s4i8TSRXeNyOEO
         S+DxjCTJ215iea6UncXZgInGc1MWyOcOycCYw2yCKMs0y2GoJMA0kULn4HexC4GxbaKV
         uKSo5Jq+OjMM5DeA85VLUqWy0PnDcXwONYCp4ROwEM9fGNzbGMa1WUvQBdbKFTdwe2qG
         s4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790383953; x=1790988753;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        b=nn4bxHsPLL/OBhX2FBIl++HwrSpowQN+0J3tTI4ltekoAQ2oM6uVZxtOq5YPP7QBbe
         Y17lJczb1iUNbL9dmB3LKGPCMHD2haL5ZjvSlK50gfUW+eyd24O3cr+GIhZqXH1/XQk2
         1rAa6C+6dpFUwnVb0f1DojUnk/gEShUqGL6Wzl/qM5lX5F9aREy6oCNN/Ooc87Pzozlf
         vWoeuULNZKCL8VsEEHjFK0ckEjce3MF4P3er6QsJzWPUMgf08JIbuafxMJCnSgNw8U18
         NqVQT/N9qK0C3ARGBQM8xduqZS8kloJ/eLbTiPvz7QQ6VBobslRDhlpNHmysbw1kBBOW
         l3VA==
X-Forwarded-Encrypted: i=1; AKwUvBwH+OSsrKToq6CEP8H8n/tAyNLI/2ZeIEMb6jbJUil0zbAgZdVw2POfqK4R70jOHLR0CDiW@lists.linux.dev
X-Gm-Message-State: AFuF++nfTlEdTxazhB3hT6UbG0hUhFcOjW8uKNAIlpB2vpeU0XGOa/MH
	vNVAtpMX4/1u0G0pxSSgmMpSElIFdCeui/47OT527ET5USplgnXjeOTvUNmjXmWLcNBh7/7u4iY
	T3EwM/1QNZ1J+y3vQrJRMGrX34Euh+KM=
X-Gm-Gg: AYBFou3i4AHg3RPM/HILA0pu2F4IqIamktDyltHXQ9sanruMaJ5hJb6+HRpc78C5rto
	nyiVNNQcFQHJPvDVsEC+b+fLtjlLKjTKLQOYA783yjhIBW6J38OqUSH4ZLc7aCPQTYjenLCGiE0
	gEP+9Uj5VzL56ivgJl1vHcicEWB5TGVdE4fAg0A+Quu2XtoGOGStq4qDtW6GrtFsEjtSDGwsT1Z
	cU8ElzBZ1V+f48/pz9bYHrIgFAAVpB9ZKpQd9QZV2B9HyfLFiOQwqKpy2IMthR3rC7UvwLbApSE
	YTIkK2YzZifSVXFFuceXRz8YJXUgp2V4BurFLQ4wHjxCN4/oW2+dEU14KXoeCp/SFqfADFJPt+z
	GRmSNOR5YNthgBbksFgBVlz1W47iBABNxWVT5tjpZ/OFpbFKf8u8w1T0gUGKqvR21eAgYt+0pKP
	y/jDhG/7taRbIaI3WL5PLc759ssSO4M9blGsTYDhv7cDD4g9hpQRn0mbrXwGGbuQF3rClsoSHSh
	loUpDN1rpnBJTkzV+X8A5A=
X-Received: by 2002:a05:622a:1818:b0:533:a4a:8826 with SMTP id
 d75a77b69052e-5330b5eed0emr80806541cf.19.1790383953335; Fri, 25 Sep 2026
 17:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <179017337986.52388.7943687183785012868@gmail.com> <179037565553.3985470.12035061965740287126.b4-reply@b4>
In-Reply-To: <179037565553.3985470.12035061965740287126.b4-reply@b4>
From: =?UTF-8?B?MTTkvq/lu7fnv7A=?= <ue081723@gmail.com>
Date: Sat, 26 Sep 2026 08:52:24 +0800
X-Gm-Features: AclHuK9Ua7kqnIr5kUYr-Cnfwv_MkcNfJmZDDmk3ND4mcEnL1T_GfZSWuwa6lP0
Message-ID: <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
Subject: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ting-Han Hou <ue081723@gmail.com>

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py
b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys


base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1
