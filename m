Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809801428E7
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631292; cv=none; b=E3dU6CHQSK3XQwijEme7/1luYxz+T8iKYL83X9p2MV3hJsrhM2BqtD7VbcmsgcXsGYpnVM1B3xmTF6DTXt4A3NfP1yil2EgbDfvGY4K2/6oUzc+8ebEeXQpIkx/+jwSyOsAa7BVtXoS2I6XkV3zOiNmCP0BliBcRMUq3Oq58xg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631292; c=relaxed/simple;
	bh=WOtLby7/0KpcOTXXocSjRYixrYudxhDFIGf8Uhp+Pko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iqMlqLURmcZQnm05JmfAkiwh/uozR4foaG5ncMpeLT8BgNZI7Il6/dnxw1Nc6GdBhgaG5TzHHtWufvf4oTEu4YkgfQouLCrO9TnSO2s1vc75XAT9OkEbSbTNa6117Ezkk5y4JiTgfhV24/OcqTGMWuC4ufPirsDtAn3/J2zRgJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ifp2pFJj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ifp2pFJj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so1958055e9.3
        for <llvm@lists.linux.dev>; Wed, 02 Apr 2025 15:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743631289; x=1744236089; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2d9p8TmHTFDW1xkjkAgnA/OHEpDuewqKrjh2EFW0AU=;
        b=Ifp2pFJjVpSG/HVtqsXASUrzzspSU5yeD9AWTzSPE6DmEORl7pHOlgL/BFqeT24RDD
         G20J71zUBGZo0Js4hUx6urTxbiE25ejAmb59mirBFW4aS13wWAlB317iJEnHo7tRkWMR
         qtzQ1VkMsr5Ncn/Vlv5gvehVVM0JhPWJBnJEMaxZtCGl8bRYemBmnpYZ7CHUCEQZAsO0
         k+2kFka4xExcO4iq6EBm6Qy35+DP8JPV53FL1pCL2AiJWuh0/TlXN612yXENlymm7ld5
         MbtZ+xtm+TcP5x5Cda874QcuOiQcVpNTYGYOsQqT7k9IJD4yXfutpcUpjJW8cwNeqYl8
         EshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743631289; x=1744236089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2d9p8TmHTFDW1xkjkAgnA/OHEpDuewqKrjh2EFW0AU=;
        b=diq1V88GBOw2PifRTQruhpeRNQ92kFGnI52Rh8y8dEFNkP8zZXmI6Oh4bhpdtSVaoZ
         V8HLOY8KELn/3nOkq/4YdqHw6Ztv/qs1cKFi54h1vG7FdqoGwMCErfPdmA1eq7qNfeUu
         INCDnD8T9adTqNnlpMjijhAdyTI88eUEpcAcEO+geJ9BxyVry4p+8gkgWbHFxWimOzOp
         PkYUzhlDsGQwtSUFFLbPLTJXhuY9zfsDotnpdsEuuokwLbfOlnxfG0gmizuhd7rCmCfX
         vFdBLBvZgsyqtn65c93ZrXz31FLiQ9Bs6/0BY1oNlgfrm502bnCywo1oYOeRo9gvOK/T
         6TZA==
X-Forwarded-Encrypted: i=1; AJvYcCXddg0ZQAPVpcORPbGs2aPebA/fny4MFzcKXmieQ1hx8gmIIJV6kLH5BGmBRYYzP+nZb0Bt@lists.linux.dev
X-Gm-Message-State: AOJu0YxAw4mzic/EYUoVx5ji4r19LmXMZ8wXu4vcQEDa/DJK7zGcb5kR
	RLJx4eZ7o7ys/p96Yf1J6LdXeptQQ1Wfr1jrRykdYfJskPgsV6xl
X-Gm-Gg: ASbGncu7aHMq89fOkq29Lnpd17WCpf47FaynMn5J3tPMabM10XO+S+7B9SgpD+XBgWp
	dFrmbBrW5CBwcIm+rc1rbvIcygdRFEFybIq8HNL7F8zJ/DVSz5/7DSoCqEH4kSsu2h2fhB/dOCi
	EQmia2t5720R8S8JH3BG9XSsP5Vr8NoaKr9eCk3aqiGx6njbxM6DseEsrx+ywZderdmB6eVy9/L
	mUCRexqgyUBX5vcoaTq3pnH251/DRallgjwhTefJwr0RO24rlhO+RqqykvsEkE8umuLzTmO5WOG
	T3S8eBjL6OUHbIHwtm2X9baNoT9yJCJA2uEuFTg/Ovf64X6V7rkBJMAYV0UzY2rfT9vzVHifYPq
	jhjwp0OA=
X-Google-Smtp-Source: AGHT+IHim74YUhwq7aJoj2Bp94g/AZnNqG2PAR/hat8/zzSMlzgzuyOk8Fl93D8rT825Pg/QH5VZNg==
X-Received: by 2002:a05:6000:4313:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39c2f85ef42mr237800f8f.0.1743631288586;
        Wed, 02 Apr 2025 15:01:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d2bc7fsm32322305e9.0.2025.04.02.15.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 15:01:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 23:01:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Ian Rogers <irogers@google.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de
 Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Adrian
 Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, Will Deacon
 <will@kernel.org>, James Clark <james.clark@linaro.org>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Yicong Yang
 <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer
 <kyle.meyer@hpe.com>, Ben Gainey <ben.gainey@arm.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Aditya
 Gupta <adityag@linux.ibm.com>, Eder Zulian <ezulian@redhat.com>, Dapeng Mi
 <dapeng1.mi@linux.intel.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe
 <zhe.he@windriver.com>, Dirk Gouders <dirk@gouders.net>, Brian Geffon
 <bgeffon@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu
 <howardchu95@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, Colin Ian
 King <colin.i.king@gmail.com>, Dominique Martinet <asmadeus@codewreck.org>,
 Jann Horn <jannh@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Yang Jihong <yangjihong@bytedance.com>, Dmitry
 Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, Graham
 Woodward <graham.woodward@arm.com>, Ilkka Koskinen
 <ilkka@os.amperecomputing.com>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, Hao
 Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, Gabriele
 Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, Casey Chen
 <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Li
 Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>,
 Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, Thomas
 Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>,
 Andrew Kreimer <algonell@gmail.com>, Krzysztof =?UTF-8?B?xYFvcGF0b3dza2k=?=
 <krzysztof.m.lopatowski@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Jean-Philippe Romain
 <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang
 <xu.yang_2@nxp.com>, Steve Clevenger <scclevenger@os.amperecomputing.com>,
 Zixian Cai <fzczx123@gmail.com>, Stephen Brennan
 <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1 09/48] perf tests: Silence -Wshorten-64-to-32
 warnings
Message-ID: <20250402230125.366ac21c@pumpkin>
In-Reply-To: <20250402163807.GP115840@e132581.arm.com>
References: <20250401182347.3422199-1-irogers@google.com>
	<20250401182347.3422199-10-irogers@google.com>
	<20250402143541.GM115840@e132581.arm.com>
	<CAP-5=fVqax8cxdZ4HLBP4AMxL6jADfYNrORC97T6F23mjf3N1w@mail.gmail.com>
	<20250402163807.GP115840@e132581.arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Apr 2025 17:38:07 +0100
Leo Yan <leo.yan@arm.com> wrote:

> Hi Ian,
...
> If we use casts just to silence warnings, we also lose the opportunity
> to improve code quality.  The changes in this series that fix type
> mismatches are good, but I think the use of casts is not particularly
> helpful - we're simply switching from implicit compiler casts to
> explicit ones.

It is certainly my experience (a lot of years) that casts between
integers of different sizes just make code harder to read and possibly
even more buggy.

If the compiler really knew the valid range of the value (rather than
just the type) then perhaps a warning that significant bits were being
discarded might be more reasonable.
But even then you don't want anything for code like:
	hi_32 = val_64 >> 32;
	lo_32 = val_64;

    David
