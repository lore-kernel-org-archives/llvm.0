Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D359B692
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 18:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890926; cv=pass; b=M/U9HclHGFBrGTZWis0UsJ2mUkiQMftr7VLOmx86EWxfO3KINIVldEZiEUNthbUUpIuk+f5Xb+IsF0MZNqN3f2E/NRv3Flmgch/ma9WK53LffG09O7hmJ+/D3YHyUQ/4S/dLQStTLUJj9sJ0frxNbQh+EorcU9ElmdBRZXGb880=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890926; c=relaxed/simple;
	bh=z6uNhq7h7RLEB1t0y5S59Hj6nrmwj5oAdNgHqjEJ8MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnIuebXaRCW/EyStNZY/XuxDBlklujN3flAs82SS2Qg80P3p32Y7ePHANfHF6r2CCOCJBBvizUmXm2QW8K8IUXM8WufwrFGZsvzKsEOOtwSRPHuTFRuffhHsacEuNV4MItzGvusnlUQK4y13EubYpE+5/YZhWhEzfm5qhXlTpA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sCX3umH5; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sCX3umH5"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso781921cf.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 11:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788890923; cv=none;
        d=google.com; s=arc-20260327;
        b=Cre4K2cOM4Fo4TmcV55C/BlINpAvZ9WXZ0yZug6B8mbYPfRH93c4+F+FYGAziFO6uA
         uk5iy1V+tIbCSfgAiBanurSuQqaTpYqlvsNQzw4vM0JLxWfZ5S01ghUxnCDzqsAcBaqv
         60xawu3oKvmRR2eGMYjbYQkjl99rO5c32O4ElK8ErIqU4sMyNbdvstEKWCZ3NWG0IOmH
         vy5j7ljwC8cfNDVhXDw1szR+D7RDgDnLlJjck3S6Gn8V+ImjLIZBt1t2os6jHyGNRSC9
         V8mHhNLsiRLfIncuBxvY7uxzaDQpQErIzM5hQi5T4ExqkvbIwMw1GUwr0/EfgKqHksi8
         MVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v56+UIFhP0Dq/iJfc/yfofNPasIIeHeXBkQoDrcfwzc=;
        fh=8Iro6ZRhB/l0RfxA7jSqIYeHDiZeeyN3e79y5bbCy+c=;
        b=fA6G1eGhM2319AQNOdYJokp4oUbb7qGVlPaXkR5UV/L3H+tGRidhOhiD6Tblapif00
         oQhcr17Gb6sy9OVkFPundez2jejZgYYNZmnbh6wnFzKav+DYp3LSWYwbiMpMaDLHNMRv
         wWcptOaq6yPxKDRQnV0Gd8hNCTCku3MXgIaaY/2lc1hlYcr7CFt1XPdeoAP9/7wRbJH/
         j8WmGS+mmJ/8GYSN/TCbJ9jo+4OixVSGsO04Qj5wCgAzKZHvCRaqJ1NTuNqRk4rOesWB
         5ffjozXk7HdtnGqvg16iZB9QFlU+G9TVggVsWFfF7OH8IQKeyHUtWnX7cHlt74DIEBJW
         GR4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788890923; x=1789495723; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v56+UIFhP0Dq/iJfc/yfofNPasIIeHeXBkQoDrcfwzc=;
        b=sCX3umH5nRwlAr2Q1A0N94s55E82P5pPBlYgXxdZqlz3DurqRTQ33DRa17VJ68Qb4E
         fPNbIb/RXAcUwQMc31bqtWlY5vh8iuuA4jpAV0fxwHwVZVf63XoUtvXS0pMFxJKeqK4h
         G8n6AWTZMIKmp5Sdj3WSYBRFnhUeAUE1HKx/VLy1jfDGRCCANWwzZE0OWKIDorcJdVu5
         aF67ehjiY/Q8zDHJmLX0lBXSppZkSTcHYzKyilRQFnL4O53NWpSfZWZ1CH+5PfBBFBDw
         m4exuh2+c319UYSbgWAPcxC+eLCK6RmUgfxps7Jwu6Z0/Xmj/BR5PBVReLO+abqyRy96
         OtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890923; x=1789495723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v56+UIFhP0Dq/iJfc/yfofNPasIIeHeXBkQoDrcfwzc=;
        b=bD/ww7wdqsitjGwMZDTeeZCIpf2Yz1kq0I8zfPxx0SdfdmVVO4VqdwdkWvs4STyBeL
         lxn6cVNMQw7JTYZmfuBzAa0bo8KEwleA5R7i59aEb40LHlDL5BN0CgTuh6UMYe9GToO2
         iZDwW8rAqI0OkradS3josCrQ77GqudnATiruOq7Qd+zlzEKiPGMV/SkHvf+Te6KdSihP
         UqDenbEdLQnmfji/aJihdkTLMR3xBdALZjI7zVpKzF+9GFIaWcT0sqO2lRhHVyfL5sTR
         DqFNPgThuwdoOPZUrG35vCdRTKKtM6vhvbNuI9BMYuKvbeFzI4XcHDYP+3Ce3+CJs1wA
         iHLg==
X-Forwarded-Encrypted: i=1; AKwUvBw8JKhYdPtH3XSJXB6UdjFjdUjwHmTQqHOuobx8ki3pzKIRkhKTmVogs1T1BCnQlpKDRcro@lists.linux.dev
X-Gm-Message-State: AFuF++kR5tiOp22S+lH0zuEHSE3V0EpWkNkSg77CLvgj9HSSLAHXQ86Z
	oznF7kzUAZryxShtTSxSPcoAbCf9Wrolit9PSgPf9e1sF6Owwrt8yICNsM4XKuc/DH80vyVhxqV
	AWiu4EwEDoXVk82f3Rq2qG1nEmxrUVizkky8jnZzc
X-Gm-Gg: AYBFou3HkxRtYZejj9SwXv0YW7c29Y+wt9r+YOd6m2roupjrC7Pmr2EXndXk3dLMVPt
	yFieVC30UyiR5IUQWfBDfpXsXhGYmk4WZ0LvHdle2e2AjqwpXxY7kykj6dlduysdzB7lO8w5xCU
	UfWuqXBRLfvTvSMpwVxMyC+s33E7wUeDlLla/OKD9hjriyEkqxPMTSPjt9AuQD87TfAZX4zhzcw
	jZIF7OXUNHRO/AkmIc7T1PkDryxXqAWB07rHtFRhuYflZWYeMv6dPaykmUI5IBv+vb1iYktupgS
	yWbsSMYUCBorMcqO8QCIL7ivnRjC1WmMj76iw6OZ/+wyOy0b4owpmWpyfOxdC26XDplTIQqJUaw
	=
X-Received: by 2002:a05:622a:4185:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-530a4871371mr675561cf.4.1788890922686; Tue, 08 Sep 2026
 11:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908130122.633500-1-wutengda@huaweicloud.com> <20260908130122.633500-8-wutengda@huaweicloud.com>
In-Reply-To: <20260908130122.633500-8-wutengda@huaweicloud.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 11:08:31 -0700
X-Gm-Features: AcwNN1VTV6_LLWyJv25dfFMSu7d8R8mTo5r822djiUuUpu_caviCx94Qd19XsIY
Message-ID: <CAP-5=fUAtw6-waqmF4RJFGZ__J=DSzbNLNsOfWekj378_PnrdQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/26] perf dwarf-regs: Adapt get_dwarf_regnum() for arm64
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org, xueshuai@linux.alibaba.com, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, leo.yan@linux.dev, 
	Li Huafei <lihuafei1@huawei.com>, Kim Phillips <kim.phillips@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Bill Wendling <morbo@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Zecheng Li <zli94@ncsu.edu>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 6:01=E2=80=AFAM Tengda Wu <wutengda@huaweicloud.com>=
 wrote:
>
> The current arm64 DWARF register lookup relies on 'aarch64_regstr_tbl',
> a static string table. While this works for kprobe-tracer where register
> names start with '%', it is insufficient for parsing register numbers
> directly from raw instructions (e.g., extracting '6' from 'x6' or 'w6')
> during annotation.
>
> Since get_dwarf_regnum() is currently used only by 'perf annotate' and
> does not affect kprobe-tracer, replace the limited table-based lookup
> with a programmatic implementation in __get_dwarf_regnum_arm64(). This
> allows resolving arm64 register names (x0-x30, w0-w30, sp, etc.) directly
> into their corresponding DWARF register numbers.
>
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
> ---
>  .../util/dwarf-regs-arch/dwarf-regs-arm64.c   | 22 +++++++++++++++++++
>  tools/perf/util/dwarf-regs.c                  |  2 +-
>  tools/perf/util/include/dwarf-regs.h          |  1 +
>  3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c b/tools/p=
erf/util/dwarf-regs-arch/dwarf-regs-arm64.c
> index 593ca7d4fccc..720c863d1869 100644
> --- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
> +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
> @@ -1,5 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <errno.h>
> +#include <ctype.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include <dwarf-regs.h>
>  #include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
>
> @@ -10,3 +13,22 @@ int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_=
regnum)
>
>         return perf_regnum;
>  }
> +
> +int __get_dwarf_regnum_arm64(const char *name)
> +{
> +       int reg;
> +
> +       if (!strcmp(name, "sp"))
> +               return 31;
> +
> +       if (*name !=3D 'x' && *name !=3D 'w')
> +               return -ENOENT;
> +
> +       name++;
> +       if (!isdigit(*name))
> +               return -ENOENT;
> +
> +       reg =3D strtol(name, NULL, 10);

Nit: perhaps this can be a little faster and ensure correct string terminat=
ion?
```
if (!isdigit(name[0])) {
    return -ENOENT;
} else if (isdigit(name[1]) && name[2] =3D=3D '\0') {
     reg =3D (name[1] - ' 0') * 10 + name[2] - '0';
} else if (name[1] =3D=3D '\0) {
   reg =3D name[1] - '0';
} else {
   return -ENOENT;
}
```
Everything else looks good to me.

Thanks,
Ian

> +
> +       reg =3D strtol(name, NULL, 10);
> +
> +       return reg >=3D 0 && reg <=3D 30 ? reg : -ENOENT;
> +}
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index 797f455eba0d..bacf5c13c3bc 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -114,7 +114,7 @@ int get_dwarf_regnum(const char *name, unsigned int m=
achine, unsigned int flags)
>                 reg =3D _get_dwarf_regnum(arm_regstr_tbl, name);
>                 break;
>         case EM_AARCH64:
> -               reg =3D _get_dwarf_regnum(aarch64_regstr_tbl, name);
> +               reg =3D __get_dwarf_regnum_arm64(name);
>                 break;
>         case EM_CSKY:
>                 reg =3D __get_csky_regnum(name, flags);
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/inclu=
de/dwarf-regs.h
> index 46a764cf322f..a25f038bbff2 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -105,6 +105,7 @@ int __get_dwarf_regnum_x86_64(const char *name);
>  int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
>  int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum);
>
> +int __get_dwarf_regnum_arm64(const char *name);
>  int __get_dwarf_regnum_for_perf_regnum_arm(int perf_regnum);
>  int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum);
>
> --
> 2.34.1
>
