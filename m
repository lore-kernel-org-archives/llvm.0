Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668245562A
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755135; cv=pass; b=jw9lwvgnPpH3CmxTg6rRyzmObVzHBG2QWf9ObtmDk/omBarpqEfaCmdsAphXxNGtXEJ/V6waqPVWv7xDXv2xEeICP9qeUX8jluudXBdJMt53OOawqjviHPAj5zSey50pz2lyxJ1Uk5P6xS+cCi+C4XrJj7Up5syCHF4qCYeRAc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755135; c=relaxed/simple;
	bh=GQ67D7m6aGzZahEWTzQMkof7xobtH+TCj5JbR+ns31I=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7Z6j1SwA0wOPdRuBzikMqvReSCD6y50NXkVhhDxtq+vwXt4oPfFhkcxUh1TE8h5b0zOKQcKyDeOT95lGVfguns2nkboenKZ0vcNO0iyd/KfijMm/DsS2ipCijuRpkWrg+5gFMKJYzcy7q3cIFhK/sgFcM8TSSTdOK0nwzgjDC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcPTCMi6; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcPTCMi6"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so723460585a.1
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 00:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790755133; cv=none;
        d=google.com; s=arc-20260327;
        b=FX6W0iS5qn3iNCJ+9IJRXtnb2gwDR4++Wk6KTc04rW72R6VzQzUXG3xQqhDdqZqaqQ
         d5LHEmmbVErv8Nc2kBDhG6R/0EnVOENzX6lFEOXhuEsbsiuedcwz+P7ZJoPwyomiVdwk
         xJE2QXAxmR/QpiaWALiftXgJkXdzBZJyIdGEXS5t8jlROl8OYJLenYG3tHCsupoWtFLE
         9EElCR8oRrrbaSGT5FB5yUoz9KcJv0phCEGIM+gEuDFBDmUpUU/RTW21NOr48vDPBLsC
         FIy+K4c0jHCud0g3jvoyocpGg14Csi/hV4vLeweG4GktAORNj/YWef2icNLYsUaBrYSU
         k/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        fh=tgBAGNRN9jCH+Q7iHjahpfHrTUrPW2ZM1HoSLB4Kxxc=;
        b=Jj2vnuorMnG9c+GwAkysqy97LJNA8l9rMYA5I0OZEdtgGtyCseT0usPJGzRTsF2LBh
         uGq7zomLlUHnCQvO6dZiWPgqgv9XY1Vmka5UbAGUllA5LjzZg1fTaUVuXS1fdAUPhmee
         2HKPOyxOnYWOMQku7MXqhh/fJUYM7IfMoMlbnSLEhI1hHC3l6fHA82vD4qYICW2kUFaI
         cJMp0KKkV23m9kSvijMJA4FxksYjACSgxQcOHqBruUap3lilv1aPJ5MF1UrCJkqvfvRv
         KYv5UoLlCRL5Xsn0hVdtN4G8foChR+diw80AuGsE3UPbbgku6Xd7SsAmOcOmAL5hYlDJ
         7/jw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790755133; x=1791359933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        b=XcPTCMi6Ee+u+MoSkrQyeeLTe5SgxGdMxZS94MjxqVwsTW1DRPtHhd3iHiV2Zc6SDN
         aWSJSvesgqL5vCF8B43IZXv4SA+8YV5Rcb5MKSYBPTt6LyK1AAj01vpCtg/3IsiLNGqx
         CGg6ZlFwRhqR+eTakGUWeMJDiNZh7ET0WXzid1kRTE0ksARcURKlWemGbjlfPTd5VPEc
         9ERRzX8BAjTF678SQlCso1un7GQxq42kfsL2NR4W9lA0OkIVhj9NgWFq+wAg/rlLO+rI
         V76ieN3YAr4OQvEpiORjRw1og1tso4Ml9I8G7p7hrnXICLjwO3uZidVlh4vz5d4awxVo
         JBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755133; x=1791359933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        b=SgvHZOT8DyviqVRM3nMyDmdJi29Fjp9oITW3QLA5heDkuUnEJEMzreV3u1EvtJzmfn
         VU9pFHbNJ1UcJS2THLtZJaBtobBlcDPGJvPnDBCHKnMcGLo9CT8NGmjQQLvDYEpmcVbm
         QXqBhlpUFcYlw70XG/1Vat/lU4cuV6tf/6Q5kLkthMPb98LaDnHItl92EfCmLXXuMoy6
         zLoxjeM27bvFM+/kkufzVbSyiT3VfionymZDTzhq2omFLO8SlnCyi96CPI0dFx3RgEh6
         mdOsVkfurvmF49QD5QNQY0aGeB3tZ+7yjBM75Cq7Fvi+lMxAW5VyhyIR+UzyMbILzvY5
         YP4g==
X-Forwarded-Encrypted: i=1; AKwUvBzXK91tAbpf2qPpeWx4p1One5aP2iLd+IVOdOBOv/QEanunmaVuCHWgtzdbtguGv3luX91q@lists.linux.dev
X-Gm-Message-State: AFuF++linZbOC503Ubj81yquoZJuuw+z7Iv1YUREQZhQ1V6K0bdm4YNn
	P5HoCAIo11QCtCHTt9pmbheOfPKHXu94SgnUMnp8T2oCMQKNTO0p1Lt5uxt1ExQIzvRt21fvmJs
	M1JwJD8CZeZ2Pm2KslhnD5Iji199Vx/w=
X-Gm-Gg: AYBFou3ZzmLpXYGJLzHpoIaq90+ZZwuMmqBcewrEYOhlb+NlqyGa8j9Kv4qt+XZkRsz
	UocaPFuEk7vZxe5n8DIWgwuqNzn7GppmG6Mw/JDCy5wTktMBM9+TM6PZTOTtr+cYFYHv8uR0UUy
	11tEraan3erjcQDTkzUb01p6JopJ/vAWgaRlCgSwYxyKv6gLINnwnsQU3Hygdm44hJYa9wRYvTP
	LBDc6X0M2U8R8rpwI1IG5SoJNG4tA6dLHpBQvOCQzpcJe6UEiWiSZaD5IcM1HT8iCwfG04EA4se
	ODnOsB3tYkFm8y4hbFYIKCMuXOL1jwLeKzu4hczv5Q0b9vD3Yx0XdMhfaPXV38G9m5TJDKha5ro
	M/rnOVVVpTZCvb+9BPs+BFyHA5UhY8C5B1Bz+BWqvlerNsgmsI5mb680URN1ltwc7Quz/LaBeIS
	VyDJJiIOODmrgDxAH7pEiXKyhieG7GH50Aro92+njNcfmxsA3aU+YTO407D3OSFVSbLTqLyiZNt
	dEhRQ0CBJGqTsE=
X-Received: by 2002:a05:620a:454b:b0:939:b099:d52f with SMTP id
 af79cd13be357-93ca9650a87mr80148785a.20.1790755132822; Wed, 30 Sep 2026
 00:58:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 00:58:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 00:58:52 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ting-Han Hou <ue081723@gmail.com>
In-Reply-To: <179071199261.2735405.15944114878466249879.b4-reply@b4>
References: <179017337986.52388.7943687183785012868@gmail.com>
 <179037565553.3985470.12035061965740287126.b4-reply@b4> <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
 <179071199261.2735405.15944114878466249879.b4-reply@b4>
Date: Wed, 30 Sep 2026 00:58:52 -0700
X-Gm-Features: AclHuK_l14BgBlQAEUqwBjjdsg8HswhmB8XtP7bRP6Z064JojK65_GlLOUveE00
Message-ID: <CA+NtrhQeOacYz+nGqevB778YW01sREPyndzh6QOsKxQR3ON6RA@mail.gmail.com>
Subject: Re: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Ting-Han Hou <ue081723@gmail.com>
Date: Sat, 26 Sep 2026 08:52:24 +0800
Subject: [PATCH] clang-tools: Import os for broken pipe handling

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Hi Nathan,

Sorry about the formatting issue. The diff header was wrapped in my
previous email. Here is the corrected patch; the code change is
unchanged.

Thanks,
Ting-Han

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
--=20
2.52.0.windows.1


On Tue, 29 Sep 2026 21:59:52 +0200, Nathan Chancellor <nathan@kernel.org> w=
rote:
> On 2026-09-26 08:52 +0800, 14=E4=BE=AF=E5=BB=B7=E7=BF=B0 wrote:
> > From: Ting-Han Hou <ue081723@gmail.com>
> >
> > The BrokenPipeError handler in run-clang-tools.py calls os.open() and
> > os.dup2() without importing os. If this handler is reached, it raises
> > NameError instead of redirecting stdout and exiting with status 1.
> >
> > Import os so the handler can work as intended.
> >
> > Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python script=
s")
> > Assisted-by: LLM
> > Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
> > ---
> >  scripts/clang-tools/run-clang-tools.py | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/clang-tools/run-clang-tools.py
> > b/scripts/clang-tools/run-clang-tools.py
>
> Your patch is mangled, so it cannot be applied (maybe you send it with a
> different client from your v1?). Please resend properly.
>
> --
> Cheers,
> Nathan
