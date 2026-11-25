Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587794;
	b=1uwBkpW+9sv6D8DdV4IMCkkLDKTTCFNZQ0KfrOX0CffadETUIJO4FMhzLRxbFTS+qm+0
	 RGHhFp3t7QL4stDE2ZBuc3DM7X6Gh0pudbOYKgnX+LAOYAIqTKtICFSonK/VZwIESwn1t
	 yV8I1Yc+ebZUfwfXJbBrCTZ8RtRvpvowSdCTjjn1wFPe2ROBxO5w1ei30hPb2o60DHMlk
	 TPoyaQtquzqxVLa4tnmRtWmHKoKWEDi/ViapZSzzovTO4IMc7xREx5kEyzKM07A1viDhu
	 BKDBf0ErRRe/Nr3RoKvRYHMDWI59zHx1YZvQh9jIk4WNc0sNLRqJWDBVfIGu9XShw/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587794;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r5R+OI5w6Wey7KShfjFB5dyA5yUeklrNOEuXPSSexSY=;
	b=vXMnRiCF2P9f2e2/coFvFuYiM88mUNQTgXp16PlNQnT5LHxXRUUXAlgcPM+sFau20/Lx
	 6b7JSZ4Gw9CryKgiuDAZvx79tq6jMdgMXvSQy+8aQK/f8FF/I/pymJCprMqRAA2jV/WSZ
	 MnHK0UTogBqoYrGEQIqbd0pesxlmFMNyYEDkKOsfROpxqECeLrRNlFa1/umwoxU+FOZPe
	 Cu+jZKe7jvjgM4MWQgo0d8PQB4jufBhKUuAzFZ+4a7tPunOy8YH2OG7dh7/nJaOEYc4bn
	 PWPDSzengTAlrrtJILPBUF2DCvcDvw3fpJDnUdYdwHfTy35CetM5ruYVGlCtFJcXMEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=Fukq2irA;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b="Gb/L/6UM";
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16F606A321
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 06:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA16F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=Fukq2irA;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=Gb/L/6UM
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795587791;
	bh=03p9BfUgLsUDUL9nX2wwVFpZWUlKJx5s1cP92PW09LI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fukq2irAvPlPUk9iF5jdmlYYc/gizjMWIJyCriNMbOtxmoKeQ8lQZiBE73k2KlPaP
	 ze5pTP1iswks0eCar3eU/+PueQpePQmK6EZCg3UgyjyvxSZckP3NjY/ElVgIojp3Bi
	 FmpcOySAqlCwGTFJzZvrIHJMjVekzR8jGrmpEeC1fTGk/IKE76hCrT+C1yJaN2IP3B
	 0hlmdfTwEFRZ7v3yXzgW8fOzEMoYnRi2JvWG/V4o++yJO0wwC3j0jbCqfDsByIV5xV
	 eHY4sjeWzNJ+IMUdY7HbRG4AlA4qf6oycgnXbEP61LkuOXW6LDokgKUP8nwroHeMIM
	 TZST/a0efMit0yEIFjV5bRwj8A0eJTWtmaMaRtVH++HY/I62deYXIoNgqcsMTMVXSD
	 Iva7o633lBkdd6JUpPbGbjIKL96SuwKqnWd77ZRbsjgfMJPTsB5wehK+IahSxWn0CZ
	 F0KLI5g1rktInC9bPmTn4D9YKr+eE/l/NCLSXvvn0/sHcRlQkrJFHm8MxSVehohIok
	 HYysaYSh86gwjsCZK/NX7VktsWt5d9fC72iyQSI7cp09OgMitHJJfdz5d/heJWZNxO
	 LOJzHjhw/BXcpCghvBe3xvWGfQwYRgZcE1On1+pzk9b1AxClkVZkirztHZNPFYnPmY
	 W+YSbBuSp8xWjTw3A6PBZA5c=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 6DC9C1EAD82; Wed, 25 Nov 2026 14:23:11 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795587789;
	bh=03p9BfUgLsUDUL9nX2wwVFpZWUlKJx5s1cP92PW09LI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gb/L/6UMoeVvp1v9O1slsag6QQOW4ZGNf8A6kpJn3fDB+GmJmwhuXogY4AL14xScg
	 6uBCRR+AqGwjQx3p4OE+21RQibWbq/89Jbxn88lqGDrksZltAm+XSGqehF+NSaHPNB
	 cS3e3SLdLHdto9Cv90S76peRUqWdeUTZyNSxb9ZyIc/oStTcaCbwUf3KDofennt4sl
	 mk8+6n8eQZHA7Lpu9f84oD3zdOD2rjiSesWp5n4M3NqRZ++yvRxX3/i22zCvUgDGZN
	 mE4Jh4myT9jv665qFiq96DPS46mmO0dgGZg5UaVqugrDx5Wzlc8BQ2mYJo+qfWVCuj
	 ryEaUvaJjvoKjiPKSm3+anjVfl6Qv2iRwcZQzLq+zUxRN0iNVilFVUOvxCKPXYh8dQ
	 NBcHz/lCOafDSCKCJSTenkBlGcfS54aWzcusenj94GBcoGk9P+iXEPkguu4ceUa0ZR
	 6Uq5C9B313CcvCpoZ8VxM7z/sRNWkzmi9XN61tI2juRuYY4ipSfmF+4gcbfYfMxu7G
	 KWGrTCWmDP0dlCSLvQRK7meqzhhE41dIdndTGbCXMvritl2rgUJQWTM4gSHS6IGD0D
	 x2gZY2fI/CpA/xVFCPymGnXQUtY7Df5gfvES+q4g/xwyLGrXmd1x5zU+508Jl/MKR4
	 WSfHr/hm8SLGVy3FHymUOeAY=
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 38C251EAD76;
	Wed, 25 Nov 2026 14:23:09 +0800 (AWST)
Message-ID: <f2271237-2998-4d21-9973-d0174da23389@davidgow.net>
Date: Wed, 25 Nov 2026 14:23:06 +0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: fix uninitialized err and static suite kfree()
 when disabled
To: Ian Rogers <irogers@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
References: <20261119170636.1520696-1-irogers@google.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261119170636.1520696-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 20/11/2026 à 01:06, 'Ian Rogers' via KUnit Development a écrit :
> Commit e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
> removed the zero-initialization of 'err' in kunit_run_all_tests(),
> overlooking two live consumers of 'err':
> 
> 1. When KUnit is disabled at runtime (kunit.enable=0) while any suite or
>     attribute filter is configured (via kunit.filter_glob, kunit.filter, or
>     CONFIG_KUNIT_DEFAULT_FILTER*), kunit_run_all_tests() sets suite_set to
>     normal_suite_set (pointing directly into the static .kunit_test_suites
>     linker section when init_num_suites == 0) and jumps to free_out before
>     kunit_filter_suites() runs. At free_out, 'if (err)' reads uninitialized
>     stack memory and either calls kunit_free_suite_set() on static linker
>     symbols (panicking at boot) or stores them in kunit_boot_suites.
> 2. When kunit.filter is set without kunit.filter_glob,
>     kunit_filter_suites() never initializes *err on the success path (or
>     on !copy OOM), so 'if (*err)' reads uninitialized stack memory and
>     aborts KUnit execution.
> 
> Check kunit_enabled() before merging or filtering suites and jump directly
> to 'out', initialize 'err' to 0 in both kunit_run_all_tests() and
> kunit_filter_suites(), and report -ENOMEM when suite pointer copy
> allocation fails.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
> -Wconditional-uninitialized; not boot-tested with KUnit kernel parameters.
> 
> Fixes: fb6988b83b4c ("kunit: fix use-after-free in debugfs when using kunit.filter")
> Fixes: e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---

Nice catch, thanks!

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   lib/kunit/executor.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> index c798a02470d8..5525f4da0bc9 100644
> --- a/lib/kunit/executor.c
> +++ b/lib/kunit/executor.c
> @@ -189,8 +189,11 @@ kunit_filter_suites(const struct kunit_suite_set *suite_set,
>   
>   	const size_t max = suite_set->end - suite_set->start;
>   
> +	*err = 0;
> +
>   	copy = kzalloc_objs(*copy, max);
>   	if (!copy) { /* won't be able to run anything, return an empty set */
> +		*err = -ENOMEM;
>   		return filtered;
>   	}
>   	copy_start = copy;
> @@ -382,7 +385,12 @@ void kunit_run_all_tests(void)
>   		__kunit_suites_start, __kunit_suites_end,
>   	};
>   	size_t init_num_suites = init_suite_set.end - init_suite_set.start;
> -	int err;
> +	int err = 0;
> +
> +	if (!kunit_enabled()) {
> +		pr_info("kunit: disabled\n");
> +		goto out;
> +	}
>   
>   	if (init_num_suites > 0) {
>   		suite_set = kunit_merge_suite_sets(init_suite_set, normal_suite_set);
> @@ -391,11 +399,6 @@ void kunit_run_all_tests(void)
>   	} else
>   		suite_set = normal_suite_set;
>   
> -	if (!kunit_enabled()) {
> -		pr_info("kunit: disabled\n");
> -		goto free_out;
> -	}
> -
>   	if (filter_glob_param || filter_param) {
>   		filtered_suite_set = kunit_filter_suites(&suite_set, filter_glob_param,
>   				filter_param, filter_action_param, &err);

