Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2220F3
	for <llvm@lists.linux.dev>; Mon, 23 Oct 2023 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="OhfjizvA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-313e742a787so1674235f8f.1
        for <llvm@lists.linux.dev>; Mon, 23 Oct 2023 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1698051696; x=1698656496; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mf+nKan86pP9YxvqNtFB3ioqbhRgtPm5GTm7s8KJe0I=;
        b=OhfjizvACsNVitD0NN/HeoavCktzDLbTwqCjnWeLdr30LAh4hfx+3dSilEC8Z30nC5
         OpiTSQWYXaddPGItUETpfmTt6Ci/+DYvBdsSqEPef52HUGOuLRFSg1KDO8gAe9tNu5lL
         vX0y044x79u3P0q1q6SRwLnmsK2MZqOzioj3HkmEkY+nWmcPhQutXNm1vL5IV3oD7Lx1
         yMu6h+mvpA2FpFDpTR/Ma887Hup06m5iO4V1apcLXZvOZ9qq4xDmbFayY2bC/oY4eGJo
         EyiQA/o6bVIiFkcUvy0CQgAZYD3KidYTT2Mx8S3Fk8ZvUGmv8Ykpe8iYjiCZixMUfn6M
         Sw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698051696; x=1698656496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf+nKan86pP9YxvqNtFB3ioqbhRgtPm5GTm7s8KJe0I=;
        b=PzWNCGKEPrjJdxw1Pe9bRZXpAhmm/M7mKMo6vpi2xAB6t/qKP9Ydr6YY6ttECN7LTD
         QIjkjHvgB3WlwNqxoENNfNsnoOmcbgrXxWawJfsKPIuqlInvYcyjyAYlGMVd2wv1W8Dn
         fihedRJtG8iJjsY101PVK214zTgA7OWeTfRbSHulOR0piQW+oTmv2N9EGCOo6r5R8rnp
         Xo9lf+xs/UfLEIwqCQmpE9IAObnv0Elvpci7jYYkATrLCJ9v4Lls2wp4hcNuJSS3M+fC
         MTXNhmonex8aPAD5V0SDTuVURp9bGwfqbiawkiqIxfVrzAoACJRNfRUYoL6vLZhsNKs2
         WF0g==
X-Gm-Message-State: AOJu0YzVlJwzjATVsojRMYNTKfWZPVvnFL3ecZwpviOd+KU485t/GBhN
	15ZAk/PjHyiKwenW0ce3wPs0uw==
X-Google-Smtp-Source: AGHT+IGpWjcofGaS/GHzmAITo9rLeiMobJbEAZDzaHpa22JV7SGE2SfbIE4YVP8+tHl7DnA+Q7wPRA==
X-Received: by 2002:adf:e487:0:b0:32d:84a5:bf5f with SMTP id i7-20020adfe487000000b0032d84a5bf5fmr7402288wrm.28.1698051695873;
        Mon, 23 Oct 2023 02:01:35 -0700 (PDT)
Received: from ?IPV6:2a02:8011:e80c:0:68fb:b41e:9c58:360c? ([2a02:8011:e80c:0:68fb:b41e:9c58:360c])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d66d1000000b00327cd5e5ac1sm7371699wrw.1.2023.10.23.02.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 02:01:35 -0700 (PDT)
Message-ID: <435424a7-efba-4438-917c-61823c374770@isovalent.com>
Date: Mon, 23 Oct 2023 10:01:33 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] perf parse-events: Remove BPF event support
Content-Language: en-GB
To: Manu Bretelle <chantr4@gmail.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Fangrui Song <maskray@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andi Kleen <ak@linux.intel.com>, Leo Yan <leo.yan@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Carsten Haitzler <carsten.haitzler@arm.com>,
 Ravi Bangoria <ravi.bangoria@amd.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>,
 James Clark <james.clark@arm.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Eduard Zingerman <eddyz87@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Yonghong Song <yhs@fb.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev, Wang Nan <wangnan0@huawei.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>, YueHaibing
 <yuehaibing@huawei.com>, He Kuang <hekuang@huawei.com>,
 Brendan Gregg <brendan.d.gregg@gmail.com>
References: <20230810184853.2860737-1-irogers@google.com>
 <20230810184853.2860737-2-irogers@google.com> <ZNZJCWi9MT/HZdQ/@kernel.org>
 <ZNZWsAXg2px1sm2h@kernel.org> <ZTGHRAlQtF7Fq8vn@surya>
 <ZTGa0Ukt7QyxWcVy@kernel.org> <ZTGyWHTOE8OEhQWq@surya>
 <ZTLlfXM4MhW1GEIJ@kernel.org> <ZTMBLllcYRoIF8E1@surya>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <ZTMBLllcYRoIF8E1@surya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/10/2023 23:37, Manu Bretelle wrote:
> On Fri, Oct 20, 2023 at 05:39:25PM -0300, Arnaldo Carvalho de Melo wrote:
>> Em Thu, Oct 19, 2023 at 03:48:56PM -0700, Manu Bretelle escreveu:
>>> On Thu, Oct 19, 2023 at 06:08:33PM -0300, Arnaldo Carvalho de Melo wrote:
>>>> I wonder how to improve the current situation to detect these kinds of
>>>> problems in the future, i.e. how to notice that some file needed by some
>>>> Makefile, etc got removed or that some feature test fails because some
>>>> change in the test .c files makes them fail and thus activates fallbacks
>>>> like the one above :-\
>>  
>>> I think it is tricky. Specifically to this situation, some CI could try to build
>>> the different combinaison of bpftool and check the features through the build
>>> `bpftool --version`.
>>
>> Right, if the right packages are installed, we expect to get some
>> bpftool build output, if that changes after some patch, flag it.

Correct, this is what we do on the CI on the GitHub mirror (checking
that the mirrored version builds correctly, with the expected features).

>>
>> Does bpftool have something like:
>>
>> ⬢[acme@toolbox perf-tools-next]$ perf version --build-options
>> perf version 6.6.rc1.ga8dd62d05e56
>>                  dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
>>     dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
>>          syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
>>                 libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT
>>             debuginfod: [ on  ]  # HAVE_DEBUGINFOD_SUPPORT
>>                 libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
>>                libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
>> numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
>>                libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
>>              libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
>>               libslang: [ on  ]  # HAVE_SLANG_SUPPORT
>>              libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
>>              libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
>>     libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
>>                   zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
>>                   lzma: [ on  ]  # HAVE_LZMA_SUPPORT
>>              get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
>>                    bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
>>                    aio: [ on  ]  # HAVE_AIO_SUPPORT
>>                   zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
>>                libpfm4: [ on  ]  # HAVE_LIBPFM
>>          libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
>>          bpf_skeletons: [ on  ]  # HAVE_BPF_SKEL
>> ⬢[acme@toolbox perf-tools-next]$
>>
>> ?
>>
> 
> It has
> 
>     $ ./tools/bpf/bpftool/bpftool --version -j | jq .features
>     {
>       "libbfd": false,
>       "llvm": true,
>       "skeletons": true,
>       "bootstrap": false
>     }
> 
> 
> Maybe Quentin knows of something else.

This, or ldd on the binary (unless it was a static build). But "bpftool
version" should be enough to tell whether the LLVM disassembler is built
in or not, so we haven't needed something else so far.

Quentin

