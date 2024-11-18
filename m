Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C322907
	for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731920664; cv=none; b=YA6eNw8knLSiWDZl2fMWdBpW0tDa06eTu4An2g1uRb6hGgy09aQcI4HVxC75VV3vNJraOXi5QeGsO0ZZe/ndVZ/KcSTj/zjd54LKVpDtPWvvpEecceAPd1X3ZTDVpdHJ098IN4HNf7wrtJK9U/iH/Zgyt/Gs84P7ZsCYfn/CuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731920664; c=relaxed/simple;
	bh=4BQxpIeuu0nVwUe5p6hnFcoQh6vfzVx7Oksv1WzT3M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWy1A/j01U/7THwdhwJUqukt2NdjJ8aPDoAJ+GueXRq1EekALiDNy9+tbQfKLAgB7UCdYZ+LODNFKjtCaHrfQZa//LLgYSFqbu94IF/fl9kVslbzCfZMY+DheWcuB5OfRN2xtA/S9x7JAcEqGI7yOjnMoS++qzhfl9tQMrq6dlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NZXdC+9Z; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NZXdC+9Z"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ed0ec0e92so262234266b.0
        for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 01:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731920660; x=1732525460; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ws/rbfiwFMNWy8k0tnCWfMeaJzWW6S4EceX0n9OoukE=;
        b=NZXdC+9ZrlEysQeQZRp1D19To/cuxTbqSabgb0FzjJ/w2S3AP+06w1fVS77gLuB+m0
         vNaT1KmZzU0eyJqT81WjixVdZyEsJYW6O8iQHgLIMcMguXa0OL8kWjIogAxP/aLoqH7q
         zO0Md6zh0K+DvtWCNNA/JLiS8s1cyfPeZaYF2I+gJ4d0wfkPRYbx0H32aIUiCqNUBH/F
         rv1592sx+woDWG06D8T4pEYJEVcf4M3OC51jH4MnXzoksY0ADacxxq13J6rcxAVUcuBx
         jTC9oHKbfkbW/s/jzHFnbFoi1TR+WBW0MxalS5MlmW0QSk38P54kULhx8nljQu93J0/h
         kTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731920660; x=1732525460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws/rbfiwFMNWy8k0tnCWfMeaJzWW6S4EceX0n9OoukE=;
        b=BM1+9f0jG465BN5UJdPCFZh/IIUPCYNIHw2bnFGzyfytRGW1qfHPbZYCvqh8eFy/MA
         9+9yXefLq5oqAgHBmA+0YGEHWqVfNMcUX2ARdeu+hs6n6khl/XdKQnVwIuRfiU+Oj2pc
         PGk5312AK36BodMXH4wLqeN7HlTz+UY6OpIaIw75nERGayM4g9vP8S7Y4NBiVm4Q0h5w
         NOGFY8JgQ6jjyfCk6AVN02aDOmgdSqQn1c1lbAHj4Bz/LcjKduptAnz1xWzs3B/momiK
         vWmsYoqYR0KG3WBshCg7ZM2c8Ch35OSvruIoC6Lf4heNEhDhNiPtR7VqQqFca5hHSWB2
         oRJA==
X-Forwarded-Encrypted: i=1; AJvYcCW1RzJAmtIK0Qz8JZad58Sm/+LrSTpPxvChip+B7KBugoCmBIwy6mRuL1lNt9Dm6IZKBDHN@lists.linux.dev
X-Gm-Message-State: AOJu0YxP7tMpX7sVAemjBOWExlk6PTBgqNkZRaOt/lOMKWBeNWkpov60
	vfFNUUFmZbt7KPUQj/CsxbnFZktjOkXiRsbOQ89c/Eul//ieFfdpxWOL9OciYBI=
X-Google-Smtp-Source: AGHT+IHiDm/bz3WEh1enyRl0N1th54dk8RHN4GA3K1qzcDnriUz2+DDQ+dD96pBdIfYZ9dcNHYkGjA==
X-Received: by 2002:a17:907:7284:b0:a9e:c263:29a7 with SMTP id a640c23a62f3a-aa483420a9amr1096106266b.23.1731920659889;
        Mon, 18 Nov 2024 01:04:19 -0800 (PST)
Received: from localhost (109-81-88-120.rct.o2.cz. [109.81.88.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df50defsm513526566b.50.2024.11.18.01.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:04:19 -0800 (PST)
Date: Mon, 18 Nov 2024 10:04:18 +0100
From: Michal Hocko <mhocko@suse.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Peter Zijlstra <peterz@infradead.org>,
	linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
Message-ID: <ZzsDEvJn-vauz9gE@tiehlicka>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029055133.121418-1-nysal@linux.ibm.com>

I do not see this patch staged in any tree (e.g. linux-next). Is this on
its way to be merged?

Thanks!

On Tue 29-10-24 11:21:28, Nysal Jan K.A. wrote:
> On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> is not selected, sync_core_before_usermode() is a no-op.
> In membarrier_mm_sync_core_before_usermode() the compiler does not
> eliminate redundant branches and load of mm->membarrier_state
> for this case as the atomic_read() cannot be optimized away.
> 
> Here's a snippet of the code generated for finish_task_switch() on powerpc
> prior to this change:
> 
> 1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
> .......
> 1b78c8:   cmpdi   cr7,r26,0
> 1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
> 1b78d0:   ld      r9,2312(r13)    # current
> 1b78d4:   ld      r9,1888(r9)     # current->mm
> 1b78d8:   cmpd    cr7,r26,r9
> 1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
> 1b78e0:   hwsync
> 1b78e4:   cmplwi  cr7,r27,128
> .......
> 1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
> 1b7a74:   b       1b78e0 <finish_task_switch+0xcc>
> 
> This was found while analyzing "perf c2c" reports on kernels prior
> to commit c1753fd02a00 ("mm: move mm_count into its own cache line")
> where mm_count was false sharing with membarrier_state.
> 
> There is a minor improvement in the size of finish_task_switch().
> The following are results from bloat-o-meter for ppc64le:
> 
> GCC 7.5.0
> ---------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch                           884     852     -32
> 
> GCC 12.2.1
> ----------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch.isra                      852     820     -32
> 
> LLVM 17.0.6
> -----------
> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-36 (-36)
> Function                                     old     new   delta
> rt_mutex_schedule                            120     104     -16
> finish_task_switch                           792     772     -20
> 
> Results on aarch64:
> 
> GCC 14.1.1
> ----------
> add/remove: 0/2 grow/shrink: 1/1 up/down: 4/-60 (-56)
> Function                                     old     new   delta
> get_nohz_timer_target                        352     356      +4
> e843419@0b02_0000d7e7_408                      8       -      -8
> e843419@01bb_000021d2_868                      8       -      -8
> finish_task_switch.isra                      592     548     -44
> 
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
> V1 -> V2:
> - Add results for aarch64
> - Add a comment describing the changes
> ---
>  include/linux/sched/mm.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 928a626725e6..b13474825130 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -531,6 +531,13 @@ enum {
>  
>  static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>  {
> +	/*
> +	 * The atomic_read() below prevents CSE. The following should
> +	 * help the compiler generate more efficient code on architectures
> +	 * where sync_core_before_usermode() is a no-op.
> +	 */
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
> +		return;
>  	if (current->mm != mm)
>  		return;
>  	if (likely(!(atomic_read(&mm->membarrier_state) &
> -- 
> 2.47.0
> 

-- 
Michal Hocko
SUSE Labs
