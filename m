Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D8A1E0E14
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221227; cv=none; b=kCt76ArkiKvoVMunHccZXvKO0OXqHmpXxAEvUTAnRfaPc48l8BQ7f19zi5lLCEwMoOtMLiIfSL1CdW410flhPGWCw3IDwvXqRqJlalIfu1WabbaAle3CHRHcYzC154pHf6qZ+c9g8m9JQI1oQ5T0gezsbdtDb400BlevIzZa0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221227; c=relaxed/simple;
	bh=b84z4sLj6OipiU/LDADQxD4tH4RaTd5fv3amUZ6N038=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O6uJYTqppOn8iBiIPacnmhFr9HGZiOQnHoypEG1yCkxWn4WsdPFfcJ4xwnXl5EGJlg67curNp/rReNRnOKI1rS/58Uen2G61y162CyBNxWT/nMtb6JwUjHrkCaJ11Gj77qDkdh4uCq/t1ynJHxjrLxCcUXXLeQcRPtoj5FX6pC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwD2aXl4; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwD2aXl4"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-633b45fad1aso4356370d50.3
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759221223; x=1759826023; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBOPU6N+QlAarzu9LlqnD6xE/6f1CWCmb96507SlQ5Q=;
        b=iwD2aXl4reZn+tc3v7pbj2TtW6ZXPK4qmYjb+NsQ/VQfVSHHFTQ5kDsJWtBilasiDj
         lmOtmR2YV/Vk9DQ522m4dSv9stgJlNwRmIzIisEAxCGSJnxBSlM0LaiX1iUaHf36z5kk
         AhMG4Td12fPwPFjm/XD5C10THy6V/WQUAvwLo+f2ah3FUSwE6i4R79u/o+jEscbfLdTq
         8CrF8P4EXAfcBI6SXwT5c5dETLNB8/LUXtsVhCRGO3DMK0oNB8CXTeWMo2EU4MFp8BN0
         crwiHP9tszgsAKXxeeC2iNvpSXG/aXrzL9BajA36+Pg2VIgoboHi9amQDYRtvBTxRq+4
         hVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759221223; x=1759826023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBOPU6N+QlAarzu9LlqnD6xE/6f1CWCmb96507SlQ5Q=;
        b=mbM+ZX/VqvHc1GnDys1lBP7SwAVdkSAZpkhKLeOkAw30PSLkJIpYH99HIv7M2sLzTY
         xo1lDger3vf9QVmE5NEQaeZCd4TJ7MNEBMa429QHkiIvfhopeEVK7qqBbxbE6VCtlH7M
         LzJvwLobbowfAkWr/qPKXX31druaOuer1svdJzsQsuRBxRfgMolcCHhxlx2jZ2kZlv6N
         tYaflkyqjyRv0KmVOgwwhab3OgurcKRQn0EiD48sL+VWgrbTvsvtf8zeGOGT3Am4sY9f
         P33d1z1UmEjZuF5cwSzXnHVNGB4Hvkfk7j00Z6fUwRGKiIfsHGqTH7VeO87FQ5wa666v
         yIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCuNDSPYNndFffJ5/WQ5xI/NobuPC9Ng4YokO/n2LYq9pcTs3A9p0D8fTI1iFbsNIsEXxL@lists.linux.dev
X-Gm-Message-State: AOJu0YzJSOvQ+XIl46harneCC+xUw0LlgB6DTdX+hrpsd7MJLBZFkTP+
	3KTryz/UgtP1LHFvIbVoOi0n5Pnz60DAHMNLjbAhwaMyCRiUYhuxOlEA
X-Gm-Gg: ASbGncvDO5Ukop87om76AQ6xsy/TbASKRD1O+6ALMmJejzA6XDDjI8+yDiLqzdLFwB0
	o6HpP/W11vBWPKzcdkGslXtgWTGRTGKbN52kpiKHI8HFvyvO1V+tMtYPn6+Ktd/uIbVLpazcUsa
	w7rTGELvdO2H4vg3Q1D22ig1hlQfBs3+ArF4ClJXBGFGauczv2SKFfqUMgdWr28qfH3sTJu4U7T
	vNphHRYqlTmcUHqpX4DP9DIEjPF5GCbudQpLYlgf8oLtZlQyjDO4ltuXHYL6v0mhObkTuKIm9QW
	1RaqhmQC7GTSPsotv08JC7SesOBOKsnlK4R9c1mxwcinCpc67uwTqTONullg62d94cbGGd6Elsl
	7lXVXkFg5UsMdjgpFuayvJlQ7VCuouPq5GDtflrMOtGvJ7s72fdlJBwrK7QdDa10xUSQt
X-Google-Smtp-Source: AGHT+IGdR0AHEeCd0GI8ArsMTXFyr2HmyKLRFM1XYpy12MOYMkBlzY/X5jDZtYeuuUkt/8DMB9hqmQ==
X-Received: by 2002:a53:d015:0:b0:635:4ecf:bdd1 with SMTP id 956f58d0204a3-6361a8d4824mr21581008d50.51.1759221222864;
        Tue, 30 Sep 2025 01:33:42 -0700 (PDT)
Received: from [127.0.0.1] ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d875sm3280311d50.10.2025.09.30.01.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:33:42 -0700 (PDT)
Message-ID: <7530d25c-f4ef-40bc-9ac8-40de4abe3960@gmail.com>
Date: Tue, 30 Sep 2025 16:33:14 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/23] tools/ksw: add test script
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Alexander Potapenko <glider@google.com>, Randy Dunlap
 <rdunlap@infradead.org>, Marco Elver <elver@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>,
 Naveen N Rao <naveen@kernel.org>, David Kaplan <david.kaplan@amd.com>,
 Andrii Nakryiko <andrii@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Nam Cao <namcao@linutronix.de>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com,
 "David S. Miller" <davem@davemloft.net>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
 <20250930024402.1043776-22-wangjinchao600@gmail.com>
 <3ed8a6a5-9983-4b9e-bae1-4c433568de16@redhat.com>
Content-Language: en-CA
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <3ed8a6a5-9983-4b9e-bae1-4c433568de16@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 14:49, David Hildenbrand wrote:
> On 30.09.25 04:43, Jinchao Wang wrote:
>> Provide a shell script to trigger test cases.
>>
>> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
>> ---
> 
> Do you think there could be a way to convert this into an automated 
> selftests, living in tool/testing/selftests/TBD ?
> 
kstackwatch_test includes 6 cases. Because KStackWatch is aimed at
debugging stack corruption, several of the cases intentionally trigger
kernel panic. kselftest is designed for tests that exit cleanly with a
status code, so these panic cases do not map well to it.

-- 
Jinchao
