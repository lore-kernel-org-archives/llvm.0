Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6642BDC2A
	for <llvm@lists.linux.dev>; Thu,  6 Aug 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040710; cv=none; b=r5vVj/bXak+Nis3EmN46Ou/X/nlz0wSfXRw9Cxns+lIQv98xLPHAfPPl1Z6GFJy92A8wQau2EzSpUAVmtDLW46P3sKy9fnLNSDxxfKTKttZHmu1F0QuCAkJKdzUQOf0GoycoQkfJTcXwzJC3VIEyyoDYU5aHPkytL7mE31vqljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040710; c=relaxed/simple;
	bh=OAnGXhoMWN0VX4aRXp3qSN6EwUoruIJ70j69kxghWfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GreeK/jo8q5119S9SnG68FUldJ02FnQ0wBGw7bVS+n4zn3oSCVjxFQstCZK3X42pULMdjaTLwqwhctElVknGIoF9ARq0aWy7kftMoPpA2r18apnL0fQxitk0Q/OrqnvBUVwWK2bWi1WgMcxUCWOno7PhT1sHB5cKB/zsc3wTP38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VidZnLnF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VidZnLnF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1873284a91.0
        for <llvm@lists.linux.dev>; Thu, 06 Aug 2026 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040708; x=1786645508; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRxIpMxQf2eH73MswyccHSNChNNfT/J5n/NCnkKxEHE=;
        b=VidZnLnFrbxlqpZD1gGqU8QPPGNglGM7Z3d4wamTD9N9lEVNJ4ZdvTk85xXbKj+m9X
         C3GUJx9wEbD1A18sHNxKcsRNU5DRRiSmma04EsAcXBxyFNdSKI0/h7el4ctizQMevkqJ
         4eAAn5iRdbep1wJFCceY3lnHI72qYJLhDotToJ84/DmJ6NhNwFjkCfrO+QqgJGpDiWqZ
         bSE1aP7LtkfCpVy47KB8aT7URJAUcvLU0RyCCr9S/2/VhwPCCZ7ZMVW8KiRskEgrqey3
         Oe4rEoZ2UQuFFJJYFNz60ygyCLcov48bClNyHv9F4unDDzvajp4nERnUfHD6uwJqB3kR
         D+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040708; x=1786645508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRxIpMxQf2eH73MswyccHSNChNNfT/J5n/NCnkKxEHE=;
        b=RX4A2QPXvORhMVbL3q1CcJo6fHVDIZku1puYzzeayzGlWKso14i4U98VzrkMR82FAR
         EDDOUZ9PjjdnOUclzHTgs2XHaFs9BXhJYQJp+lbyUGgrChxCUpCq7Xi3th/V1Qoah2/m
         7Qpnq9xH2Vu2dkHOEC7bU+lxGHIKeiZqyCfUneFJjwTaEICdxnbYICsOj/7m6P6MeYKW
         uw2tzXtv7Lc2Alz7YYZplyj68Wij5xDeJgq/qbAEQL6iEoDVzcvNN/BhLvJ/CUU7yzYr
         y+EIJVRLJIK5o+CXhdDjroPj0cMQf0CEMjc4cDW723Q0QXtl9CDsiFw594S/S9xocqsm
         LBBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFv8+uPfEHDRzLwA3X8r4I7vEBuheUQ0skkNa3xembldV4+WAtDGfunEBXvuXWTTjZ6BQz@lists.linux.dev
X-Gm-Message-State: AOJu0YwsaXHRvQtk2/w6TpteKyvRi4RGbvHLcyzuSBzqRG2rBntqj0uT
	S4560lxCS87ynCxYFiBBwhfs1wW1V/v2/aMN6IikTVUusGDjUNRfNLBX
X-Gm-Gg: AR+sD11zcFbzYxpWSRXMf7wM/voq7RtV4TJfAvEYUiBLDqdR07hK/MbjosLXcQnS0uh
	wPRqMj5DtZXAp5KhnlQ6G64wQUn/ouKwxbWZrxm4ENk+y9J/rUn3Mx3vjy8WOmDx3LIbUZ/44pu
	Lv8jAEljKXwDZH9TxjFG5ELz9JanrNazTNBka54SSnJUTDqdTRCEMSp5XDJr3pt1uuuneeQA9ek
	pN9L03WYWJcTUDTT15ImQ5KMlKcfKsloZx1qR372XY6obiDX5dKGjACm7qqaI9+jTCb2bS0QHK1
	lPc//5NGrfUEX4gUJ4J29NCEFYEFBBsACzswXsO9bjSnJ1c1d2kCww9UpRpk2JR0xmO+dy4sh6p
	U8a4ZxYFEF6vUbbPw7i1MSzmjuU2K/3DSHyRs6ZZPeTLGGbt/5wO9Q/rm6EUu/h/nUjxwHNRfE/
	y+bicpQfewYGmEx4si1dye30qkxfjfAFEol36KA9ZCAQ+D+x+DFy4FiE5+/2dspTwYKVkTdroHN
	Nx5SocN
X-Received: by 2002:a17:90b:3889:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-3903c5cfba2mr14353244a91.18.1786040708017;
        Thu, 06 Aug 2026 11:25:08 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:6e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc261sm29668669eec.28.2026.08.06.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:25:07 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:25:04 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: JP Kobryn <jp.kobryn@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	David Vernet <void@manifault.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mykola Lysenko <mykolal@meta.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kselftest@vger.kernel.org, cgroups@vger.kernel.org,
	linux-input@vger.kernel.org, sched-ext@lists.linux.dev,
	linux-mm@kvack.org, kernel-team@meta.com, bpf@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] selftests/cgroup: add memcg_stat_cross_cpu
 correctness test for flush
Message-ID: <anTRgIZe5wgAsdCU@devvm16600.scu0.facebook.com>
References: <20260721174833.1232771-1-ziyang.meme@gmail.com>
 <20260721174833.1232771-3-ziyang.meme@gmail.com>
 <f83b6c93-b32e-434a-94b7-68628a2e8527@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f83b6c93-b32e-434a-94b7-68628a2e8527@linux.dev>

On Wed, Jul 22, 2026 at 11:42:58AM -0700, JP Kobryn wrote:
>On 7/21/26 10:48 AM, Ziyang Men wrote:
>>Add a test_progs selftest that verifies the memory-cgroup BPF kfuncs
>>return values that agree with what userspace reads from cgroupfs, across
>>a whole cgroup subtree that has been charged on many CPUs.
>>
>>It complements the existing cgroup_iter_memcg test.  cgroup_iter_memcg
>>calls the memcg kfuncs on a single cgroup (BPF_CGROUP_ITER_SELF_ONLY) and
>>only asserts each value is greater than zero, so it never checks that a
>>value is actually correct.  This test compares the kfunc values against
>>what userspace reads from memory.stat, and checks every node in the
>>cgroup tree.
>>
>Can you extend the existing test instead of adding a new one?

Hi JP,

Good suggestion. Actually extending the exisiting one was the plan in the v1.
However, existing selftests with similar purpose is the cgroup_iter_memcg, which
is in the bpf/. After discussed with the bpf reviewer in v1, we think this
selftest may suit better in the cgroup/ rather than the bpf/, since 1) it tests
the cgroup functionalities (bpf is a tool), and 2) together with the selftest,
this patch serials also ships a common Makefile lib.bpf.mk for easily compiling
selftests for other subsystems using bpf. Currently there is no other selftests
in cgroup/ relies on BPF and we think it is good to put this selftest here as
the first consumer.

We appreciate any possible suggestions. Thanks very much!

Best,
Ziyang
