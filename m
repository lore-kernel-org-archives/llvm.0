Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445127;
	b=CZrtu0bLEzWkbZJxPRTpKvUsTjZJFAVxhGdYj0MgFls5dgmgUWyESo+i21hbMcP2hP6D
	 CHddlHBUxv36ch5Cj+hUpdXGB3vyQUgaRFpxoBGYLvpPYMzp0UYMlXd53KaujUFK7NNqo
	 SSE1H1VRItfvB1yvE1XhLN5UJxac5j2b9xljRTImgBqCGZG7JD3avC12XThirCUFYpjp+
	 8Lis09TiIGNdUpsNqdSwCB4Au2qMnQPA+0pQwHoc+/QJAwOn8ry0l7+Ecs+e2NsJVbWhY
	 4pggMtg7lV8I7YjU5FRxXLUUYWnlA3gtkDEllfO2mH3bt9H6XtYEkt3zsIU9VLBBm1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
	b=iYpzgrvHAtaoOsBjfwPeHwYVVOdgekHeN3rEeIqT8sz3Rt/wdRdLF/CxJ74HFR21u+aw
	 PaPwI3LIyTOCNqe6cNI33HWq7Cc5K6euTTcJjJzx1NhYLBUs0Yv4fbFB11kPgCsdh5DRF
	 Aqpc/jhB5exW8qbZ6W1vDbZt/2tC28hI8y0lamiAwHViHXgGCRKxCKKhtqS9zUkmYVWwR
	 hMBni0fIhbd1uVdmdQ4qFyRUawtZjFKlnwPBXiEqv8BHoyQMrGdaBW9G3CwcbbD0jHeM8
	 00qO8zMFhxNj2EMVhgIqdpbc+An3BezwjPsFjCMgYSX83qxf4WR6LL6CtCdInanXBNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=itDUHLdI;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C66606A31B
	for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 21:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C66606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=itDUHLdI
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso16284885e9.2
        for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445126; x=1793049926; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=itDUHLdIepQVIvQlnig5A4A03myxzoFTGvol0IGglsjVpwNUiY8faImKzMUMs9FFm3
         RzYFr3AzNaGiHONTKV6lFlvhyC3VWKY59X9ICdrrVUNVm8HeJ7hikxC5zoRmg/CE9ntu
         qxhNrGGL/zsYaEc5UpDierf4O1UOrjX4h/BE4pFbWVlZ4yyy7i1sqKhft1kT2aWy0AvL
         pPUiSkAhFZmyfFfbSBOOII5q3ic+wWUemLyVyKvMFXbnvbMnkXv08wh+HUhRI690FEyK
         ZuKtzhzE6ln0jDQIr/m20t0xftepq6plPm6yv9LdQIl2wOJM/MxCe5YjDuAbP6aHxbFe
         aiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445126; x=1793049926;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=fMyVuq6QqJP6sc40N8iRiviLaLHLk0GLDpcT1o+MX/QIREzo6hLW+4nbnQuKFcGcTY
         JOAmoKObDDLbBVw8l2ddFGuRXcGMjBeTVg6OJnr8IYfZcGlL3ZO4l37GcWW71/V2c15q
         ZqeNjrll0Y33GOvX82OzvIl339xul7StFq++UiFeddx3ji+DtFMpwFNSSYJQhexIYJUu
         jW0gvylsjtpaMudrpjEst+k/ordgT2Phu9CeN/6Hm2NQgOZf+EVNYxn7encWO1cj23xG
         FN0HNn3qvXhr2yvlHPlC06boDq4g4GzUcofbCeUaJXluxeUeklXWd4ZP7ah28Ehz1jL+
         gIZw==
X-Forwarded-Encrypted: i=1; AKwUvBz8fkbOoVcLezF4/1Nv1lLHz0LU6DFVZsq0Ft3rii2iEujMQEFllImFiO69pN+CCwup7nbP@lists.linux.dev
X-Gm-Message-State: AFq9FYKSqY3FGQbJtzJ2kDunNzkaf4LvvzR4fLwGSdNVucG1cUv4SWOh
	Um+qIHRBAn92jhKJHgZITBYz5wYVXiNphigjWgVwS/OicuQNTJ8wKnEQ
X-Gm-Gg: AYBFou2/civzMEoLxTt2qx0/ImHGcO8+KYSgvSZDTX1FBGBxJ87j1ZO5lM0GG8g7ni4
	qWz7JJEpSdkim8gK7eWTHNolny2bnU8+MCN3AQ337NmBH0rhOmuR1m7AcA6O/9W/btbcE0VCAYQ
	JYQbQn/JgSpfqCexHTwZJdQW7HTKI4Oc5xWmQieFFKOepQQl5Z3T3QnsmiIBLkzn1WXK9MJmQVC
	aH6MSRH3Ydfk22y/VuIK92+hKNZw3LrIJF0tI3uQxlBlZhOYZFSb4txmf1cXQTBRq7wK6LLP0ql
	DWG5r/k4ygQs+9ev+o+81wm9lSA7AANLCXKn3dEHQkX0lxJLppQSiDvqPQuINCwM0VCf2AnoJ3s
	lwyPtRCZ5+s0ArjikMhKf+UDC/rqwF9jG1q+1C9VdZC+5FFUEGq8VYe7G5+RZGwksxSu4xFVQe3
	s6TD5DZ0N3vvOxzV6UMBtKlZAlpU4TDDN8hcv1koQ/JG8rVOYpWgqUlMO72UaOfCRsyaAW+Rtem
	Hu+COB7Z83G82+ebxz1cy99877vOyV9X3w=
X-Received: by 2002:a05:600c:c8c:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a1d7643dadmr171548545e9.34.1792445125587;
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm25118305e9.0.2026.10.19.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:25:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 next 03/15] kallsyms: Improve selftest
 test_perf_kallsyms_lookup_name() output
Message-ID: <20261019222524.695a4d31@pumpkin>
In-Reply-To: <202610200434.qSHPOyDo-lkp@intel.com>
References: <20261018155206.132411-4-david.laight.linux@gmail.com>
	<202610200434.qSHPOyDo-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 04:57:54 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-4-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 next 03/15] kallsyms: Improve selftest test_perf_kallsyms_lookup_name() output
> config: arm64-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/config)
> compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200434.qSHPOyDo-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/kallsyms_selftest.c:82:12: warning: unused variable 'The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun' [-Wunused-variable]  
>       82 | static int kallsyms_very_long_name = 1;
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kallsyms_selftest.c:69:33: note: expanded from macro 'kallsyms_very_long_name'
>       69 | #define kallsyms_very_long_name \
>          |                                 ^
>    1 warning generated.

Duplicate, depends on config options.

David

> 
> 
> vim +/The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun +82 kernel/kallsyms_selftest.c
> 
>     81	
>   > 82	static int kallsyms_very_long_name = 1;  
>     83	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

