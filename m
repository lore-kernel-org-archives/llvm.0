Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792773383;
	b=VJP2K2OXsOLdQqA0hSIQ4MbD16Zc5dteZfSRAhbcdfOcWdMV7yzac26Xq8IMUDbdwko/
	 M9QCL48lid6r8O9I5w8NM6SP5EG+B4r4DOYguOweKPNAs/Zescyv7tkaOIXNfU4eu+zpv
	 fETDS6TBDQ0jGizR0OAg5G8l8dXHkZ6hoAHK8BzRCWPaJ4NXaW8opfAmqyaqAhbqBr3vw
	 9JZFcF6RkLyXb9ckXSdSluXcYYPDdYPgADXgDlUVseuyIcD/l11sFzW+hcsbEHnhXP0MK
	 /L+B96jLt/oZQ+04TA5HwBoZrdR43tEVehPURQE+LxpmcUWwR7XByTEL4/r+vICvCDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
	b=GpG/OqZjmtpUB8K+dmp6T/blfuQrlXgdBUwEAnN6VeE5Ge7K2v4ihG4s28npICmsDH68
	 Z1EQySwe5MMPwyemEHT5SYczdU22cOoJnwKMNlq/OOALKqA3AEHs9eBuT41+CQ1D0QctT
	 +7k9YgTa1385E8p2H5iLzTdWwUj9L+LQ9/pSb4WMEt78Lb2X6hv/9gC6G+smyTv5ZJpsC
	 Vj7r6xL5mYp3KmDwMy1EYy71fXX0RghM33hHCvsJ6coDGRwYHNvlZK62NsanD3La5MUGe
	 1+p2A2PrubLksUylS1+OIxUl3T15wXvMhnijr5rL97NURXFMvOG4SE8Jo4g7RMa+CPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JLKUDZ0D;
	arc=fail smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0726606A31D
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 16:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0726606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JLKUDZ0D
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5337c7b9937so373621cf.0
        for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 09:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792773382; cv=none;
        d=google.com; s=arc-20260327;
        b=kGTDJ10vt9h1zERAjubU/8kzhLEao7LZ3OlXS2g4E2iciAB90HW5mA+MvOpxhZjBog
         qBAx/njjSD0Yb6Zx56DJhriv5JJm+27N2TvTxSowR4Eca6Bqd/QCM0L07g5CSe1wi4gB
         vzgjQlcieCeEtQY1MmivluVByN/2woyWV5ano7a1JKxeHg1x5RY6wpxWY2cm8safU1kt
         PtdPVasz72aS6pnOy+NQBDtywfz5hlxmbA+ZLxSCpJ0dFsqqYn+lIdoKM3cy3/+9dID3
         5pYBXIZEmHIMJFJ5HqRKBax7bRLFa0JSM2RMQLQ1b0+49hhB1dW3eTZTE+xwrMQYVDSv
         rjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
        fh=XTdwepik2LuoYYhI/8RZwg5YXVGNKq9llD7ex4EYRmY=;
        b=URGwpyh7z/grAh0AoiV2fywrjSTlhKjIzxbRoJbr0Dqq39hYX7hRPpdbetsCiZRagk
         oGzv4wQyCiXooolNFtZ+ntrw0olzIceeGYs7fBW7f4CYQ32kzTWFep76OkL+UYZrq/jC
         eJzU1wxS+85+cc91ZdwhshVlBqKSxjXW64ylHKsgxtpF3UfJpND8nB4zlHdWkTMxFmLc
         8qujcQtCSgYPEU0zKp7i5OAjRJmOrWsHGXfQ0M/OsEqAUE8L7W2q5/reOAIjhbE3+kk1
         BkKBxcx3mzt3DP9awxx7Nw+lVVyjgqt2LNy4zKZTs+EvzGcgEfTZgGJ6vNMBkpbRNCBo
         J3qg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792773382; x=1793378182; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
        b=JLKUDZ0Dba9CMW3ZeH7DH4xygsk4uCPfmZ87GekCRQx6ok72CTZkJmWRDOjZQbnLVf
         3Rp1quXTTO3SdPovjbL9U36LB84HLlfSp+aDetiCHyG3bxQ+EATwTcKeLaj4aukxTsXw
         FDdFEBilJFI7O5T9qheXqAmXzQInaO8dkeAHeqKIwlce/d4ESR2YTs0JottuOazgb4oU
         BhAqF9/h6Z8OsQiRB2p9Vh/4KgeCXZIa/xglEmdrUhIzrQevUG/J3GGjtfssXv9W66lx
         bKJZ2bRfzAKXwWQuEjpDOuxUH8J+GposjZdWUPzq9sCBavY7jWUkNjHrwLombSXfW8KQ
         mOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773382; x=1793378182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
        b=PtY6ZVEw7swN0zFhfX1Tf4BP/64w0MODZyg5iZjGyPdPJRJ1mHsg1/ri4mLs4Fkhe0
         3+6C9LlRLU892ts9TyJYnL0lsCl6Ipe1te4LOZWs495AkfmY3xX5HuzVGfFRaSkvN+Av
         I/QmbrfcYbEI+FzMRl364SH5KgJ1FcTDCT6hTdFibQLOs+FFCbMOJ8otGPR4z0pfVl+P
         SzGlAlS+VJSfsLsNzGi5NFSLJLiSpG4ufsYRfEaRvDYfEmxA1XGlI2ZbRVDoAdJMYhv0
         uC8s+fipziBpBSbCNKCz3ESZxVe106Hqdxv25BIOh8PY0w1MsviYMVcZTOIUUiYtet+k
         fisQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6IJjaOwt+a/DQ3pr00PIIspvRw07ne9e0GAS1Bz+rpvCwSfFr6oyT16TvvoWoPdFSuuqp@lists.linux.dev
X-Gm-Message-State: AFq9FYLEWtL2cis1FOuYW1meyAemjbDqywwKOSNs2nvKty+2WyHycvw0
	gMdf0r7G1ivOhWYe8aMo/YY+MxS/upb6Md0xXoWQHC20/XJUjuel/fLl8OcGqDLEJ/GtcuJkKy7
	lGzllKRXGOfCKpnyhZg/YLCzWQwA3QGHjvhzLvGy4
X-Gm-Gg: AYBFou2lTWytuoX2aMq7sTSEGbeQ4wJErHLsWos0DEyeQhAGOT5I322P1r4uB3NyZ7U
	+TGUh339IxthwDsp93sUtHRzI6dQ3CwGFC1tQRe/FQOAHp3aPHfd/+pfj4TOTTNbH8PHePPd9xx
	5/4ln870dI1g+9oArXsgIbjPwX5t/q1ZeBQIgLK+1Sk5QIPgPhD2rT9Vu38afuRUzXI0bTx7uuJ
	YPbVhDsTrXJvN0RWV+IH2bMpbxegUpw/lLo2VNVnl2AKeyWcwwL/RbYRRx8KfPHx1HxB3y7Eq7U
	waDBB6DJsRADSr8zpFEzR0amorxixmpQDhMcy5EYxRXsUYA1WtNQklCkA/vZ/ThFIJDuT5r/guO
	IbadYQSWHQuBEj1g3MYL7Vvo3Itk0/Zi/EBeet8POVlETV9e2da1qxvhkFKeaftWAQw==
X-Received: by 2002:a05:622a:5984:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-536c204fccdmr19376021cf.0.1792773380998; Fri, 23 Oct 2026
 09:36:20 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
 <att_boYgsUyMVBQQ@gremlin>
In-Reply-To: <att_boYgsUyMVBQQ@gremlin>
From: Ian Rogers <irogers@google.com>
Date: Fri, 23 Oct 2026 09:36:09 -0700
X-Gm-Features: AclHuK8WDiSB5DLq7nz-VotGGBIQIYDZRwbhaBSVewZSiH6-vm_k_QRci59FMgE
Message-ID: <CAP-5=fX2+o1CCV7pEx9=CbAftRse1m5uTLmrTxQ4NWrxd_SnTQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/19] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 8:48=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> It doesn't seem clear to me why you are constantly respinning this series
> without feedback since v2 (AFAICT)?

There is a minor build issue that appears in the tools/perf build with
kernel header code we try to keep in sync between the kernel and
tools. There was discussion on resolving this, and I believe this
settles it (the tag was carried forward to the newer versions):
https://lore.kernel.org/linux-perf-users/CANpmjNP=3D4T4pRpoiW_Y442KQbWyVtEC=
UD3_SYs5ZYrdwkWh2rQ@mail.gmail.com/

> Also not sure if in-reply-to is perf style, but neomutt is struggling wit=
h
> this thread at this stage :)
>
> Anyway, it's no comment on the series, but my workload dictates I won't b=
e
> able to review this unfortunately, so could you take me off cc- moving
> forwards? Thanks!

get_maintainers added you presumably due to the kernel header change,
I'm happy to drop you and stop the noise - sorry for this. Fwiw, the
different versions are addressing locking issues the annotations are
throwing up when adopted more widely in the perf tool. Whilst I'm
using clang and internal AI to minimize this, the stochastic nature of
AI means that new things pop up from Sashiko.

Thanks,
Ian

> --
> Cheers, Lorenzo
