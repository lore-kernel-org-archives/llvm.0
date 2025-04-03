Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2F024EF71
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690405; cv=none; b=V5854eAYIAF5ElPXmdgR0N6CGoRRmPYSe49HSG0nf/XazrqSy4GdT/VpGOUd0duI1It3mUJq5DP5MGw+oMjvysWXSohm4aoshbCfXnIhZkB9pBJ9hskKzyDUSJOXqdtu7z0gMHPwfxyqffx0pbuzS2mCpoxOS//lWebhzkQ82KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690405; c=relaxed/simple;
	bh=udWx3sXynBeCKyH2cn9MPdye1p1GgTvwWlCqpxIZr1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8y6/4YInZdFgSzPx9YCjjsms4S6UMO6XZF1hR4k6NV/aAogM45iEn9eVXmT/vsvd41Kddq05lO6u+mEPvudrpNnbHaVtol7Tu9G+Mn8QTdQnyn3UM3hxG6GmWZ7F7s384/227K8fZv/oQGgnpoHrqSeocLiuBW1uAR1Z6XiJQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTXhTuHD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTXhTuHD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-303a66af07eso761663a91.2
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 07:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743690403; x=1744295203; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAqtWD0ADgEG56estGUMwFFZOWZtTFqA2jD3PNCtf2o=;
        b=NTXhTuHDSoyEW8kBaZF9xqzMtWEkP7HRPk9BPTQtjvuSe4bGXg2BtXzfQMBEuxeUiQ
         Kx27wyxXri3icsYFY+bg//GS0pSVE0MdGwTyEig6q9U5N15PmrgBecdEh5ZRjFIuNkFo
         Gy2sUQyuMkcKOXT4DEWyTvrcPnX+3rLWOlHEbNOp2XX8h0Rmf2iP1LB6C6vrAIhcOSzs
         /3tCrw8A2YxSqRdwYN2Sz7I80HjrBsv+P4D/goIO6gnWgnLtuBRkLhR4ZLq3l8RjbaxM
         F1fclTR56KFkaObdnHXoX2ftC5KvtGxFINhb/wD0u7Mu/rUcleRlIpynDfovWxhdvEKe
         C45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743690403; x=1744295203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAqtWD0ADgEG56estGUMwFFZOWZtTFqA2jD3PNCtf2o=;
        b=IlAylN+A0vdxfAhMOsOISHDDqJtSiD+4L3HEHAJZCvZWmNWjvEum0axBX6CtT0UTwf
         66BLc1ZQek5YHSvhTuSKh/y/D3OWprJyPxX8i/GUtrG/p7eF59xqR7XFCj0k+cGY3jbJ
         SDyh4rbfC5d7IYMdKZF3psxBxkeVDC+db9R1B0XPEGL3Zszs+eQ9a0jgwvnBkUxFQEg9
         J9qzKbnPf0Q5OLKyH2oMB5shIRT7Y97odDmSTR0rs+iFTKzh6E/x5gkewv55sW96OtQ8
         yLnhf5iVNyso6i2SHQ9kM3wJ0IMVaOqH2pXGU/AjD7P5CQyNXet4S5pM3Qcv+nDV6OvJ
         kFIA==
X-Forwarded-Encrypted: i=1; AJvYcCV0uR+YrTuAs9aMWWOmfXQtYKPpCvzmCPrmCNLGbd9D2KzenzjWvIEb/QKnOoR6Ol7oaXUI@lists.linux.dev
X-Gm-Message-State: AOJu0YxwkpZN6FoQFG0L6T7R+d0bgpqglh2N/Qns6KAfaeMDtS5RWYVm
	C/mDC0pHg5024NJIv+ZwcGIroeP5Wx013D5cfSHEbHKEpoCVuF7B
X-Gm-Gg: ASbGncv20OKOKcKInmwQeD0fll5wbv71hIdViHZ+1USHLgzWvhGMQp6xKvmqS5l+Md2
	6fD3WADrQ/XKx2Q1wN1w8+Z1mUx1iFw6WUfd5m84Ws8YYbJuCQLTjmMSZkIJCgoiYnmgYdPQHiK
	fgdMwjnOXxD0esQk5zmpkO5H1t2r02Dx1JM317MGwpjvw6A498YEudJi6BPNHYFGDPDE01u/Mx4
	EwIKOm6o4sIthWYdZULA1QLFnBI0GtuoQvbjLzDVvlJvdyaMb+ZmpSamM5zRmrnR6wRKuD3Axck
	xgivKXl7Od2TPMvm/d2KZBaHHKMVGdGBDap05fazjMmCrRmmW4cFXlg=
X-Google-Smtp-Source: AGHT+IFj+34X21Ko9H2G+bwo7MdL+I8gIE9fAmN87oglS5pPqEZNB1wO4Hk8sbSK66cTHRHvmK8RIg==
X-Received: by 2002:a17:90a:d003:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-3056ee4868dmr9516913a91.15.1743690403134;
        Thu, 03 Apr 2025 07:26:43 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d70b1sm1548261a91.4.2025.04.03.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:26:42 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:26:40 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>,
	Ben Gainey <ben.gainey@arm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Kajol Jain <kjain@linux.ibm.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Eder Zulian <ezulian@redhat.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>,
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Howard Chu <howardchu95@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jann Horn <jannh@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yang Jihong <yangjihong@bytedance.com>,
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>,
	Graham Woodward <graham.woodward@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Hao Ge <gehao@kylinos.cn>,
	Tengda Wu <wutengda@huaweicloud.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Chun-Tse Shao <ctshao@google.com>,
	Casey Chen <cachen@purestorage.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Li Huafei <lihuafei1@huawei.com>,
	"Steinar H. Gunderson" <sesse@google.com>,
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Andrew Kreimer <algonell@gmail.com>,
	Krzysztof =?utf-8?Q?=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
	Junhao He <hejunhao3@huawei.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	Steve Clevenger <scclevenger@os.amperecomputing.com>,
	Zixian Cai <fzczx123@gmail.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Yujie Liu <yujie.liu@intel.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1 02/48] tools headers: Silence -Wshorten-64-to-32
 warnings
Message-ID: <Z-6aoJ3ohVHPsF0A@thinkpad>
References: <20250401182347.3422199-1-irogers@google.com>
 <20250401182347.3422199-3-irogers@google.com>
 <Z-6WY4a6RV1bEbNU@thinkpad>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6WY4a6RV1bEbNU@thinkpad>

On Thu, Apr 03, 2025 at 10:08:39AM -0400, Yury Norov wrote:
> On Tue, Apr 01, 2025 at 11:23:00AM -0700, Ian Rogers wrote:
> > The clang warning -Wshorten-64-to-32 can be useful to catch
> > inadvertent truncation. In some instances this truncation can lead to
> > changing the sign of a result, for example, truncation to return an
> > int to fit a sort routine. Silence the warning by making the implicit
> > truncation explicit.
> > 
> > Signed-off-by: Ian Rogers <irogers@google.com>

I'm the first person in the To list, but only a couple patches in the
series are related to my area. If you want to move it with me, can you
send bitmaps, bitfields etc. separately?

Thanks,
Yury
