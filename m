Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F52724BC06
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689959; cv=none; b=NleIvV8nhmMk9Ire6vfn2F9g2U7h+D95S84fB/AenRG2AKXGNVjqn9xHzW9S4EvmnwahdvNK50Fqf7Wc1EJHPy3YROYUBDzlO3dmWvSn9h239UVNv6iH61oHzZlto32t+yUXhaw/pDfWkb/2HHCgHWe3/CEyQUm84gtvrmrYAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689959; c=relaxed/simple;
	bh=2r3U8ewcuEhS2Jqw1TNGNFLFh3bbW+ULJZIAPbc7h8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqW2latxvvemyHoD7QaN7ke2RqsSbzXQOiicPBDKOVYTlqEKYiH79i9tHyNTlNyAzl7j9nQ4VEGRBZ46+HpZaZDTocV5HBSLy7ogA4707hS3dt0eo5WsD21Z1k5WriBuzH0QNf6FBn/fIUkqhQxBbSwkmjrk2kjO4srVccz7VFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egU/1Ba4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egU/1Ba4"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af579e46b5dso674884a12.3
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743689957; x=1744294757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khXp6kOEsTlpiucdkkgdxNh1P5TojGz8UwRxJaqxnCw=;
        b=egU/1Ba41bLKZazB5MNkNfRefZ73QjMCpxbN1d+tqk1rXREnicCd5qkichn0W7d4r0
         EdxQhS5bMNxAHn24LlwuG/pOCiRuHbBGde1lUAOuJumeu+I+LeiNdNpJi390bAcZA7la
         6ctigscqj89ckqyf7+yYUF1Qo6uaRr71xDeBa+YYyFdGjlUdjruUAx7SsY60J5Ge81yP
         TvolGnRdNJfCLiqLkYmAy1nbBydbDgnrBqUzDSU1SCQBMTP4eoxM6KGTwvOvg2kWMUNh
         TbdiUzlUygcwacTDWJjYbxF1WRGGVQ5uPqXyvoAO9wjB1gWtUHPOuG8NUc8miLehNmQI
         oswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689957; x=1744294757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khXp6kOEsTlpiucdkkgdxNh1P5TojGz8UwRxJaqxnCw=;
        b=EZ9SflznY+rOPaMzoSyp9EmBoa4SsqjQA0wCaMxs80ad37upz2jz1KiirEKxWI5bBU
         QQ5niwFS4NCvp2mtQCLRCl+7d9av16AkHxGoYlcQmA7kQPSeACxHItCEqArFcjU93kyZ
         9X9h/UR6s1qkifYj8r4B6wx2/BwR5FuHpgqse54VCn3oMsju+2aas56Mn7VYki+BYil1
         I3bClTJowkyMi2Xo8yFFtT9o3echqRKFtnSZyqeZB8cvcSCTEIjlQqgGIbh2+CG9NJrd
         afoe0QhECnjUqBEeVzCmHGcMudchWLVJoOQ4eNykBiuwvSybPFrPfG8oUKG3kry3xnQ/
         9aRg==
X-Forwarded-Encrypted: i=1; AJvYcCXF+uBbYJyeily/gcbwuFyFK7LICO9uTlFXlZ376VEIF+8S71Ui77qIpEQdrHENndYJFjmW@lists.linux.dev
X-Gm-Message-State: AOJu0YziEfhFaU6/25+BwfOXqR3Be7MnXKNrwzgo88eJ0dISBYW+vPd+
	YnWbJz8wdL1jxwE/HWe7Kq2nYY/UnT6U3t7+hQ/CE1MMRty1TFKh
X-Gm-Gg: ASbGncteF02HEwtD0MeTDqYXyDssZDydfpRvKZPn14AwCDz5Pv4IvSlQ4i9OiZjOjuP
	EnFZMmD88dRcbrKSEPG1Eztqn95dEPY2CxOPm+gksZfBS0SYjGMGkGG55/j2hU5449vxVxWnLz9
	O4ipWsczKYyK5k6lgkwl2XoP0LHiXdwHrBsO+A/xYiDTntiawUqh6Fahgjbl7iCWp3mdP6Zq0OT
	X2oiEGAu1SHj0RvB5SCBZWquRAVNuVWGXxXXS1gKMNvomiaOnkxUS2FGyMqim3jKOJ/s9haxomC
	i++COtwZ7oLfqokBFrMqFisMNg7I4o4AXS17HyBAUIAx
X-Google-Smtp-Source: AGHT+IFsE/53OqOyMfyP3T9KIucSDYD9e9PKK/5G+B7y8ncBc+uPWVYiOMM6K5nKTFIC+KJNWKGDsg==
X-Received: by 2002:a05:6a20:9f4e:b0:1f5:8126:8a5d with SMTP id adf61e73a8af0-2009f5fdf88mr29869754637.17.1743689956462;
        Thu, 03 Apr 2025 07:19:16 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2d331csm1252459a12.12.2025.04.03.07.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:19:15 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:19:13 -0400
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
Subject: Re: [PATCH v1 05/48] tools lib: Silence -Wshorten-64-to-32 warnings
Message-ID: <Z-6Y4dH0bhs6VXmj@thinkpad>
References: <20250401182347.3422199-1-irogers@google.com>
 <20250401182347.3422199-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401182347.3422199-6-irogers@google.com>

On Tue, Apr 01, 2025 at 11:23:03AM -0700, Ian Rogers wrote:
> The clang warning -Wshorten-64-to-32 can be useful to catch
> inadvertent truncation. In some instances this truncation can lead to
> changing the sign of a result, for example, truncation to return an
> int to fit a sort routine. Silence the warning by making the implicit
> truncation explicit.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---

...

> diff --git a/tools/lib/bitmap.c b/tools/lib/bitmap.c
> index 2178862bb114..87bd15e3968e 100644
> --- a/tools/lib/bitmap.c
> +++ b/tools/lib/bitmap.c
> @@ -32,7 +32,7 @@ size_t bitmap_scnprintf(unsigned long *bitmap, unsigned int nbits,
>  			char *buf, size_t size)
>  {
>  	/* current bit is 'cur', most recently seen range is [rbot, rtop] */
> -	unsigned int cur, rbot, rtop;
> +	size_t cur, rbot, rtop;
>  	bool first = true;
>  	size_t ret = 0;

Maybe instead typecast find_next_bit()? We don't expect any of those
to overflow the 'unsigned int'.

Thanks,
Yury
