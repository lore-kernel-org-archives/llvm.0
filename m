Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8334D916
	for <llvm@lists.linux.dev>; Tue,  3 Mar 2026 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580559; cv=pass; b=L8918/B+GDVk45AwfO19OI7vc4Ip/xzEw30383Sf03MyenE5MY6bJKMjlfJeLhR+6g/jVqtz/FUv+9wki/WGYJgno1MZKj+lox7lloxT3YphaXm9MAAldhi56LXRGHiDcVFnPlyjl4UvnHITs0WuRRcXwpih/Wrdr3nksEY2S2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580559; c=relaxed/simple;
	bh=H4/0f0Vkf3bAK0NHlAPK9oM/fReivGRtPyF0jOwe00I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7CRjNBV030McV6/Ic2HBsxcRzGdXSLq7v6gWE1RJ/tlBdLxr2jmtSgbtuVVUJDmRbunOL8kIrU8B1/r5CxuQq+jl6cWAvGVW66V51By7tQ9HZ4nrqdqFOT2o9T0v/qc3FlSJ304UQa1sOB+6F65lE9wHhZGgvYHnBRQq2j68So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FEMWEyLt; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FEMWEyLt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae49120e97so116835ad.0
        for <llvm@lists.linux.dev>; Tue, 03 Mar 2026 15:29:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772580558; cv=none;
        d=google.com; s=arc-20240605;
        b=PrY86wAqbUnkDaF9PD35XwTBVi+f73o3E5gUXun+tkNUB76yQUxu0R4KH42J5IJjVZ
         ILCBkqLHKzsyy/qSfiQo/oaPaCHeH4q8iVQjMeoBLCmF2YcicTY7LbMCObPFIJK2Pwdm
         XLWsK2SS3BAPHgStRe8lg3xzIOsYpl7Nr25uvgf4Rsqqa5e9nBCM2q5dIvspzIGg0ERd
         GsH37rNCqiAav9X+4+r1rnuvOf2maXHZe/k+5Zi1n04EGKB0gLDjMgKdBD22upkU8aq3
         ekuoZ36gWvPxcH23/jhSly2ENj9yM7ETTwGYyiKAnT5OtPnaLrY0Fwft1Nog7TfgAFkI
         GKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiE7foD495KYiSbYPuQi/APgrwKk9G8yzIGB/jUm9ik=;
        fh=ke4PrGstxw2+w76Y/kg+2POlgz7Tc074OdkzyqLogho=;
        b=ZQApP/b3s5EjtQsR7npbqyOMLjAKFzr7/oy31tpDzg8UmLLD88WUfHCIu9ANN51LtM
         duMemMCmGDmd4PGbygzFSS+rsJBnE5DFdRyh3Yljln/bZPpUvmWwYKDGx4XIYdye8nb8
         B2nsh+CRKfOdFSrXKYKHTg+x8dl80GLMckAjvMgTmV9dObL4rDHOCVM9uGhS9mAouulK
         eMwI2dAay4t+yk1UPlkRi5A4UyENxJJSlTsPBo/iHC+aeAUcS5bl+H0kv5UpTgjRApRJ
         aKCB9Wjal+khVLWuaFizAqElLACb4VEwiw6Et3zCmsCWoWBdPS/xN9AcWIZ2V3JWFPVQ
         Vdhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772580558; x=1773185358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiE7foD495KYiSbYPuQi/APgrwKk9G8yzIGB/jUm9ik=;
        b=FEMWEyLtD+qAOn3IiR+wVquRljZL46q7OS2Wr2jLKPZYLAVoNnSHsDxizhFG/rJZmU
         2uIRbJsk3lf8nFxnqKmEmPodI0cNtPt+G64XoQ7/BbRZMeom+BsIPYaulK3oH8QAos2O
         QPLsN5sCm6G5UTlJAb6bSi8PZI+CJuq+eYmuiSV06O4J+U4pD9ESZdbxDCv5YB4RGJM1
         8cyaEnC5CVT5xMQ1qSSlShaLP3Rsjo3kV/qjpGUMbrEymICqpKVsr1+oD/iLG4D4Ll9x
         mTFX50bT8/sDmPUpDvAEHqsEfrCMak0R4BM+xDJ6TA88e9ck88dRs3YJ1clMXOE783rv
         1LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580558; x=1773185358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FiE7foD495KYiSbYPuQi/APgrwKk9G8yzIGB/jUm9ik=;
        b=Jhf+9ahZ2x95SP4AZCNjKPpUBkPeAMd1oGDpB/kVnB1D/zLSPq1t6iKm6sOr0jORmu
         LBsj2jepcRuuJF81V7/PwJ3FCi310EgFmwp1lMc+f7uWvc6c4/cjQvBcZROcgUtryZjt
         Nd19v9V+vANB62l9qrUpKb+dgO9208enKJ7XQCUIXX8UlEqDoMgd1B4s25niFf48OwaY
         ABTdoOeLakAh5a2mcEWvmkLylNXbib//H24hx1ZjBbRdqMTNA0V8/0BIZmCrTX/QaTCS
         0zF/VFKXlGgY+AsiJAZgfXvOslG1wUgKH5pt0J7AM0Pi0kfDIE/fED7T9gtynbZgzZrC
         yR7w==
X-Forwarded-Encrypted: i=1; AJvYcCXwFHJuqXnJjSqQ+SYCcKj/QbmeGVxqfDfilgBu+lOcIsECiFptWRCF6SXb4DidK3GkZjR1@lists.linux.dev
X-Gm-Message-State: AOJu0YyED9yRnNne6QDhHVD/LRATdxb6dQAr8ljEwYOw/RyoX5ejcPMw
	9Bcuavi/3NvMVHee3m1B4e+sD/MBU6EGVixJhEVAzljJphuBRAMeLGHxmvJ8Sjj7VkTvqtwDn+u
	ipJ+7s0SSnl/td5PBJkJPqVGlX6fgiJU0HybZrFba
X-Gm-Gg: ATEYQzxZmvFUDX7Ct3vbZDcdpkn2wze76GzbMUxPU0rxbY7b16vFYPkrSOq3uVerkLy
	Rg+tZhYXZKp1WR5lYdeDSlkdNqV+WuwitHu7tf8/pHnaD+jGHUKCHhSmamUz6wSHuhy9xmAr0Y3
	6rUWNXPndVjXENznUo0fnSuR3MUqLyPs9E5xiAmzTknQ9Trm0utBTQjOVPhldLIQDs7luO2Hon1
	RXeq3+ZUu8BzV5ZIL0aSFCceiOx6tm57vk+MBCxrKk6b1X0rm5IDFCAVHg5q4IlBqcc+6OeVJ5q
	ucQ1TzjjyyFzGPMfNdhg8V0ugN5V6puFbDd7Zw==
X-Received: by 2002:a17:902:e54b:b0:2ad:e574:7a7 with SMTP id
 d9443c01a7336-2ae3b5138b9mr7707075ad.11.1772580557297; Tue, 03 Mar 2026
 15:29:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303230043.2074593-1-pcc@google.com>
In-Reply-To: <20260303230043.2074593-1-pcc@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Mar 2026 15:29:03 -0800
X-Gm-Features: AaiRm51WL95oMqDVkWli8eBGOixYK0T7oHldhYsC3oIhV7q_LwP7pOQfUinyzQo
Message-ID: <CAP-5=fWL0jKGQuqBzP0xMWVkzu48c6JzgwWQ1+NkAxgbpSPpcg@mail.gmail.com>
Subject: Re: [PATCH] perf llvm: Clean up after a failed disassembly
To: Peter Collingbourne <pcc@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:00=E2=80=AFPM Peter Collingbourne <pcc@google.com>=
 wrote:
>
> An error returned from a failed backend will cause perf to call the next
> backend. If the error happens mid-function, e.g. due to an unrecognized
> instruction, we will end up with duplicated instructions in the output
> unless the backend that failed deletes any instructions that it created
> before failing. The capstone backend was already doing this but the LLVM
> backend was not; fix it.
>
> Link: https://linux-review.googlesource.com/id/I377eef3cd662ab98fbcd69e50=
04a259fa3d7aa06
> Signed-off-by: Peter Collingbourne <pcc@google.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/llvm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
> index 0d126d233c019..87fceae8488a7 100644
> --- a/tools/perf/util/llvm.c
> +++ b/tools/perf/util/llvm.c
> @@ -261,6 +261,15 @@ int symbol__disassemble_llvm(const char *filename, s=
truct symbol *sym,
>         ret =3D 0;
>
>  err:
> +       if (ret !=3D 0) {
> +               struct disasm_line *tmp;
> +
> +               list_for_each_entry_safe(dl, tmp, &notes->src->source,
> +                                        al.node) {
> +                       list_del(&dl->al.node);
> +                       disasm_line__free(dl);
> +               }
> +       }
>         LLVMDisasmDispose(disasm);
>         free(code_buf);
>         free(line_storage);
> --
> 2.53.0.473.g4a7958ca14-goog
>
